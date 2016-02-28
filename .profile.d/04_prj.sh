_log_info() {
  echo "$(tput setaf 4) $1 $(tput sgr 0)"
}

_log_success() {
  echo "$(tput setaf 2) $1 $(tput sgr 0)"
}

_log_warn() {
  echo "$(tput setab 1)$(tput setaf 3) $1 $(tput sgr 0)"
}

prj-edit() {
  $EDITOR --servername PRJ
}

prj-set() {
  pwd > $PRJ/current; echo "`date`\t`pwd`" >> $PRJ/history
}

prj-get() {
  cd `cat $PRJ/current`
}

prj-ls() {
  echo "current:"
  cat $PRJ/current
  echo "history:"
  cat $PRJ/history
}

prj-add() {
  $EDITOR --servername PRJ --remote-tab $1
}
prj-notes() {
  cd $NOTES;$EDITOR --servername NOTES
}

prj-journo() {
  cd $JOURNO/bootstrap/posts;
  $EDITOR --servername JOURNO
}

prj-jekyll-edit() {
  cd $JEKYLL/src/_posts
  $EDITOR --servername JEKYLL
}

prj-jekyll-new() {
  FILENAME="`date +%Y-%m-%d-untiteld_%s`.md"
  FILEPATH="${JEKYLL}/src/_posts"
  cd $FILEPATH
  VIM_SERVER_NAME="JEKYLL"
  if [ -t 1 ]; then
    if [ "`$EDITOR --serverlist | grep -i $VIM_SERVER_NAME`" = "" ]; then
      $VIM_CMD --servername $VIM_SERVER_NAME "${FILEPATH}/${FILENAME}"
    else
      $VIM_CMD --servername $VIM_SERVER_NAME --remote-tab "${FILEPATH}/${FILENAME}"
    fi
  else
    $TERMCMD -e $EDITOR "${FILEPATH}/${FILENAME}"
  fi
}

prj-jekyll() {
  case "$1" in
      new) prj-jekyll-new ;;
      *) prj-jekyll-edit;;
  esac
}

prj-boiler() {
  case "$1" in
      ls) prj-boiler-ls ;;
      info) prj-boiler-info ;;
      *) prj-boiler-new;;
  esac
}

prj-boiler-info() {
  find -L $PRJ -type l
}

prj-boiler-ls() {
  if [ -L "_boiler" ]; then
    _log_info "Has boiler"
  else
    _log_warn "Has no boiler"
  fi
}

prj-boiler-new() {
  _log_info "Set boiler"  
  BOILER_PATH="${PRJ}/prj.boiler/links"
  PRJ_PATH=`pwd`
  BOILER_PRJ_PATH="${BOILER_PATH}/`date +%Y-%m-%d-`$RANDOM"

  if [ -d "_boiler" ]; then
    _log_warn "Boiler already exists"
    return 
  fi

  if [ ! -d "${BOILER_PRJ_PATH}" ]; then
    mkdir -p ${BOILER_PRJ_PATH}
    ln -s ${BOILER_PRJ_PATH} "_boiler"
    _log_success "Boiler path set to ${BOILER_PRJ_PATH}" 
  fi

}

prj-hooks() {
  case "$1" in
    new) prj-hooks-new ;;
    ls) prj-hooks-ls ;;
    *) prj-hooks-ls ;;
  esac
}

prj-hooks-new() {
  HOOKS_DIR=".git/hooks"
  BOILER_HOOKS_DIR="$PRJ/prj.boiler/hooks"

  if [ ! -d  "$HOOKS_DIR" ]; then
    _log_warn "No git hooks directory found"
    return
  fi

  _log_info "Symlink git hooks from $BOILER_HOOKS_DIR"

  for f in $BOILER_HOOKS_DIR/* ; do

    HOOK_FILE=`basename $f`

    if [ -L "$HOOKS_DIR/$HOOK_FILE" ]; then
      _log_info "Hook $HOOK_FILE already exists"
    else
      ln -s $f "$HOOKS_DIR"
      _log_info "Hook $HOOK_FILE added"
    fi

  done
}

prj-hooks-ls() {
  HOOKS_DIR=".git/hooks"

  if [ ! -d  "$HOOKS_DIR" ]; then
    _log_warn "No git hooks directory found"
    return
  fi

  HOOKS=`find $HOOKS_DIR -type l`

  if [ -n "$HOOKS" ]; then
    _log_info $HOOKS
  else
    _log_warn "No symlink hooks found" 
  fi
}

prj-usage() {
  echo "Usage: prj {edit|set|get|ls|add|notes|journo|jekyll|jekyll new|jekyll edit|boiler|hooks}"
}

prj() {
  case "$1" in
      edit) prj-edit ;;
      set) prj-set ;;
      get) prj-get ;;
      ls) prj-ls ;;
      add) prj-add $2;;
      notes) prj-notes ;;
      journo) prj-journo ;;
      jekyll) prj-jekyll $2 ;;
      boiler) prj-boiler $2 ;;
      hooks) prj-hooks $2 ;;
      *) prj-usage;;
  esac
}

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
  cd `cat $PRJ/current`
  $EDITOR 
}

prj-set() {
  pwd > $PRJ/current; echo "`date`\t`pwd`" >> $PRJ/history
}

prj-get() {
  cd `cat $PRJ/current`
}

prj-ls() {
  _log_info "LIST"
  awk 'BEGIN { FS = "\t" } ; { print $2 }' $PRJ/history | sort | uniq
  _log_info "HISTORY"
  tail -n 10 $PRJ/history
}

prj-notes-edit() {
  FILEPATH="${NOTES}/src/_posts"
  $EDITOR "${FILEPATH}"
}

prj-notes-new() {
  FILENAME="`date +%Y-%m-%d-untiteld_%s`.md"
  FILEPATH="${NOTES}/src/_posts"
  cd $FILEPATH
  if [ -t 1 ]; then
      $EDITOR "${FILEPATH}/${FILENAME}"
  else
    $TERMCMD -e $EDITOR "${FILEPATH}/${FILENAME}"
  fi
}

prj-notes() {
  case "$1" in
      new) prj-notes-new ;;
      *) prj-notes-edit ;;
  esac
}

prj-boiler() {
  case "$1" in
      ls) prj-boiler-ls ;;
      info) prj-boiler-info ;;
      *) prj-boiler-add ;;
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

prj-boiler-add() {
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
    add) prj-hooks-add ;;
    ls) prj-hooks-ls ;;
    *) prj-hooks-ls ;;
  esac
}

prj-hooks-add() {
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
  echo "Usage: prj {edit|set|get|ls|add|notes|notes new|notes edit|boiler|hooks}"
}

prj-task() {
  echo $2
  case "$2" in
    add) prj-task-add $3 ;;
    ls) prj-task-list $2 ;;
    *) echo "nope" ;;
  esac
}

prj-task-add() {
  #task add project:"$(basename $(cat $PRJ/current))" 
  echo "Add $(basename $(cat $PRJ/current))"
  echo $1
}

prj-task-ls() {
}

prj() {
  case "$1" in
      edit) prj-edit ;;
      set) prj-set ;;
      get) prj-get ;;
      ls) prj-ls ;;
      add) prj-add $2;;
      notes) prj-notes $2;;
      boiler) prj-boiler $2 ;;
      hooks) prj-hooks $2 ;;
      task) prj-task $@ ;;
      *) prj-usage;;
  esac
}

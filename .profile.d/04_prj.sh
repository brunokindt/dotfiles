_log_info() {
  echo "$(tput setaf 4) $1 $(tput sgr 0)"
}

_log_success() {
  echo "$(tput setaf 2) $1 $(tput sgr 0)"
}

_log_warn() {
  echo "$(tput setab 1)$(tput setaf 3) $1 $(tput sgr 0)"
}

prj-set() {
  PRJ_PATH=$(pwd)
  echo $PRJ_PATH > $PRJ/current  
  LOG_LINE="$(date)\t${PRJ_PATH}"
  echo $LOG_LINE >> $PRJ/history
  prj-task-dir "$PRJ_PATH"
}

prj-get() {
  PRJ_PATH=$(cat $PRJ/current)
  cd "$PRJ_PATH"
  prj-task-dir "$PRJ_PATH"
}

prj-task-dir() {
  TASKS_DIR=$(realpath "${1}/tasks")
  HAS_TASKS_IN_PATH=`echo $PATH | grep "${TASKS_DIR}"`
  if [ ! -d "$TASKS_DIR" ]; then
    return
  fi
  if [[ -z ${HAS_TASKS_IN_PATH} ]]; then
    export PATH="${TASKS_DIR}":$PATH
  fi
  unset HAS_TASKS_IN_PATH
}

prj-n() {
  FPATH_N="$(($1+1))"
  FPATH=`tail -n "$FPATH_N" $PRJ/history | head -n 1 | awk 'BEGIN { FS = "\t" } ; { print $2 }'`
  if [ -z $FPATH ]; then
    _log_warn "No directory found" 
  else
    _log_success "Using $FPATH" 
    cd $FPATH 
  fi
}

prj-ls() {
  _log_info "LIST"
  awk 'BEGIN { FS = "\t" } ; { print $2 }' $PRJ/history | sort | uniq
  _log_info "HISTORY"
  tail -n 10 $PRJ/history
}

prj-boiler() {
  case "$1" in
      add) prj-boiler-add ;;
      ls) prj-boiler-ls ;;
      *) prj-boiler-ls ;;
  esac
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

prj-ue() {
  case "$1" in
    ls) prj-ue-ls ;;
    *) prj-ue-dir ;;
  esac
}

prj-ue-ls() {
  local BASE_DIR=$PRJ
  if [ -d $BASE_DIR ]; then
    for d in $(find $BASE_DIR -maxdepth 2 -type d -path "*/UE__*/tasks" -exec dirname {} \;) ; do
      echo "----"
      local git_status=$(git -C ${d} status --short)
      local git_branch=$(git -C ${d} symbolic-ref HEAD 2>/dev/null)
      local git_size=$(du ${d}/.git -h --max-depth 1 --total | tail -n 1)
      local project_size=$(du ${d} -h --exclude .git --max-depth 1 --total | tail -n 1)
      _log_info "Project $(basename ${d})\n"
      _log_info "  project size: $project_size"
      _log_info "      git size: $git_size\n"
      _log_info "    git branch: $git_branch"
      _log_info "git status:\n"
      echo $git_status
    done
  else
    echo "Could not find path ${BASE_DIR}" 
  fi
}

prj() {
  case "$1" in
      set) prj-set ;;
      get) prj-get ;;
      n) prj-n $2 ;;
      ls) prj-ls ;;
      boiler) prj-boiler $2 ;;
      hooks) prj-hooks $2 ;;
      ue) prj-ue $2 ;;
      *q) prj-usage;;
  esac
}

prj-usage() {
  echo "Usage: prj {set|get|ls|boiler|hooks|ue}"
}


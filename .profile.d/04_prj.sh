prj-edit() {
  vimx --servername PRJ
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
  vimx --servername PRJ --remote-tab $1
}
prj-notes() {
  cd $NOTES;vimx --servername NOTES
}

prj-journo() {
  cd $JOURNO/bootstrap/posts;vimx --servername JOURNO
}

prj-usage() {
  echo "Usage: prj {edit|set|get|ls|add|notes|journo}"
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
      *) prj-usage;;
  esac
}

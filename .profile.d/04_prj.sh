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
  cd $JOURNO/bootstrap/posts;
  vimx --servername JOURNO
}

prj-jekyll-edit() {
  cd $JEKYLL/src/_posts
  vimx --servername JEKYLL
}

prj-jekyll-new() {
  FILENAME="`date +%Y-%m-%d-untiteld_%s`.md"
  FILEPATH="${JEKYLL}/src/_posts"
  cd $FILEPATH
  VIM_SERVER_NAME="JEKYLL"
  if [ -t 1 ]; then
    if [ "`vimx --serverlist | grep -i $VIM_SERVER_NAME`" = "" ]; then
      $VIM_CMD --servername $VIM_SERVER_NAME "${FILEPATH}/${FILENAME}"
    else
      $VIM_CMD --servername $VIM_SERVER_NAME --remote-tab "${FILEPATH}/${FILENAME}"
    fi
  else
    $TERMCMD -e vim "${FILEPATH}/${FILENAME}"
  fi
}

prj-jekyll() {
  case "$1" in
      new) prj-jekyll-new ;;
      *) prj-jekyll-edit;;
  esac
}

prj-usage() {
  echo "Usage: prj {edit|set|get|ls|add|notes|journo|jekyll|jekyll new|jekyll edit}"
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
      *) prj-usage;;
  esac
}

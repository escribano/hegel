

opengitconfig () {
	mate ~/.gitconfig
}

gitlistbranch () {
	git branch -r
}

gitdev () {
	git checkout develop
}

gitdev () {
	git checkout -b fix develop
}

gitremovebranch () {
	git branch -d fix
}
gitmergedev () {
  git checkout develop # muda para o branch develop
  git pull # sincroniza o seu branch develop local com o develop remoto
  git merge --no-ff fix # aplica os commits do seu branch no develop
  git push # sincroniza o branch develop remoto com o seu local
}
gitdev () {
	git checkout -b develop master # && git checkout master
}
gitrev () {
	git checkout -b develop master # && git checkout master
}

gitpushdev () {
	git push origin develop
}

gitgeoadmin () {
	git checkout -b geoadmin develop
}

gitaddremotegeoadmin () {
	git remote add up git@github.com:escribano/mf-geoadmin3.git
}

fetchup () {
	#echo fetching...
	#echo "Parameter #1 is $1"
	#cd upstream/$1
	#pwd
	git fetch up
	#git checkout master
	#git merge upstream/master
	#git push origin master
}

gitpull () {
	git pull
}

gitdifk () {
	git difftool -t Kaleidoscope
	git difftool -y -t Kaleidoscope
}

gitdifflocalremote () {
	git difftool geoadmin up/master
	git difftool geoadmin:src up/master:src
	#Difference between the latest version of path/to/file.txt committed the remote branch and the (possibly uncommitted) version in my workspace:
	git diff origin/master:path/to/file.txt path/to/file.txt
	#Difference between the version of path/to/file.txt committed the remote branch three commits ago and the (possibly uncommitted) version in my workspace:
	git diff origin/master~3:path/to/file.txt path/to/file.txt
	#Difference between the latest version of path/to/file.txt committed the remote branch and the latest version committed to my-branch:
	git diff origin/master:path/to/file.txt my-branch:path/to/file.txt

	git fetch;  #this will attach the remote branch commits to your local tree
	git diff FETCH_HEAD    #diff your working dir version of my_file vs the remote tip

	#same as
	git diff remotes/origin/branch 
	
	#If you're talking about a remote branch, say, origin/master, you can use ~ and ^ to refer to ancestor commits relative to a branch the same way you can with local branches:

	# what change was introduced to origin/master in the last 4 commits?
	git diff origin/master origin/master~3
	#If you want to diff your current working directory against the 5th most recent commit on origin/master, you would omit the first argument:
	git diff origin/master~4
	#difference. ^ is for navigating merge commits and choosing a parent, for navigating horizontally. ~ always proceeds backwards along the first parent path, for navigating vertically. You would be just as likely to use a number with ^ as with ~, except where ~2 says "two commits ago", ^2 says "the second parent of the given commit"
	
	git diff --dirstat=files
	git diff --dir-diff
	git diff --cached
	
	git branch -a
	git diff --stat --color remotes/up/master..origin/master
	git diff --stat --color remotes/main/master..origin/master
	git diff remotes/up/master..origin/master
	
	git fetch
	git log -p HEAD..FETCH_HEAD
	
	git difftool -t Kaleidoscope
	git difftool
	git mergetool
	ksdiff
	
	git difftool src/index*
	#git difftool [<filename>*]
	
	#git difftool --start=HEAD^ --end=HEAD [-- <filename>*]
	git difftool --start=HEAD^ --end=HEAD -- src/index*
	
	git difftool -t
	
	# It just passes the 2 files to the command you specify, so you probably don't need a wrapper either.
	git difftool --extcmd=/usr/bin/chdiff
	
}

installksreview () {
	#git config --global alias.ksreview '!f() { local SHA=${1:-HEAD}; local BRANCH=${2:-master}; if [ $SHA == $BRANCH ]; then SHA=HEAD; fi; git difftool -y -t Kaleidoscope $BRANCH...$SHA; }; f'
	git config --global alias.ksreview '!f() { local SHA=${1:-HEAD}; local BRANCH=${2:-master}; if [ $SHA == $BRANCH ]; then SHA=HEAD; fi; git difftool -y -t Kaleidoscope $BRANCH...$SHA; }; f'
}

useksreview () {
	git ksreview
	git ksreview feature-branch-name-or-sha mainline-branch-name
}

gitmergeremote () {
	git merge up/master
	git push origin master
}


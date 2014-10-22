function setup.mux () {
  MUX_MYREPO=git@github.com:escribano/mux.git
  MUX_TARGETDIR=~/code/habitatione/fork/mux
  MUX_THEIRREPO=git@github.com:gorilla/mux.git
  git clone $MUX_MYREPO $MUX_TARGETDIR
  cd $MUX_TARGETDIR
  git remote add upstream $MUX_THEIRREPO
  cd $MUX_TARGETDIR
	git remote -v
}

function update.mux () {
  MUX_MYREPO=git@github.com:escribano/mux.git
  MUX_TARGETDIR=~/code/habitatione/fork/mux
  MUX_THEIRREPO=git@github.com:gorilla/mux.git
  # Change the current working directory to your local project.
  cd $MUX_TARGETDIR
  # Fetch the branches and their respective commits from the upstream repository. Commits to master will be stored in a local branch, upstream/master.
  git fetch upstream
  #Check out your fork's local master branch.
  git checkout master
  # Merge the changes from upstream/master into your local master branch. This brings your fork's master branch into sync with the upstream repository, without losing your local changes.
  git merge upstream/master
  git push origin master
  git push  origin --tags
  #git push --all origin
  #git push --tags origin
  git push --all origin -u
  git push --all --follow-tags origin
}

function setup.geoadmin () {
  GA_MYREPO=git@github.com:escribano/mf-geoadmin3.git
  GA_TARGETDIR=~/code/habitatione/go/src/github.com/escribano/habitatione/ng/geoadmin
  GA_THEIRREPO=git@github.com:geoadmin/mf-geoadmin3.git
  git clone $GA_MYREPO $GA_TARGETDIR
  cd $GA_TARGETDIR
  git remote add upstream $GA_THEIRREPO
  cd $GA_TARGETDIR
	git remote -v
}

function update.geoadmin () {
  GA_MYREPO=git@github.com:escribano/mf-geoadmin3.git
  GA_TARGETDIR=~/code/habitatione/go/src/github.com/escribano/habitatione/ng/geoadmin
  GA_THEIRREPO=git@github.com:geoadmin/mf-geoadmin3.git
  # Change the current working directory to your local project.
  cd $GA_TARGETDIR
  # Fetch the branches and their respective commits from the upstream repository. Commits to master will be stored in a local branch, upstream/master.
  git fetch upstream
  #Check out your fork's local master branch.
  git checkout master
  # Merge the changes from upstream/master into your local master branch. This brings your fork's master branch into sync with the upstream repository, without losing your local changes.
  git merge upstream/master
  git push origin master
  git push  origin --tags
  #git push --all origin
  #git push --tags origin
  git push --all origin -u
  git push --all --follow-tags origin
}

function setup.old.geoadmin () {
  MYREPO=git@github.com:escribano/mf-geoadmin3.git
  TARGETDIR=~/code/habitatione/fork/geoadmin
  THEIRREPO=git@github.com:geoadmin/mf-geoadmin3.git
}

function clone.geoadmin () {
  git clone $MYREPO $TARGETDIR
}

function add.geoadmin.upstream () {
  cd $TARGETDIR
  git remote add upstream $THEIRREPO
  #git remote add upstream $MYREPO
  #pwd
  #listremote 
}

function listremote () {
	# List the current remotes
  cd $TARGETDIR
	git remote -v
}

function showgeoadmin () {
  echo ""
  echo "geoadmin:"
  echo "> location: upstream/geoadmin"
  echo "> origin:   git@github.com:escribano/mf-geoadmin3.git"
  echo "> upstream: git@github.com:geoadmin/mf-geoadmin3.git"
  echo ""
}

function upd () {
  # Change the current working directory to your local project.
  cd $TARGETDIR
  # Fetch the branches and their respective commits from the upstream repository. Commits to master will be stored in a local branch, upstream/master.
  git fetch upstream
  #Check out your fork's local master branch.
  git checkout master
  # Merge the changes from upstream/master into your local master branch. This brings your fork's master branch into sync with the upstream repository, without losing your local changes.
  git merge upstream/master
  git push origin master
  git push  origin --tags
  git push --all origin
  git push --tags origin
  git push --all origin -u
  git push --all --follow-tags origin
}

function listremotev () {
	# see much more information about just that remote
	git remote show origin
}

function fetchup () {
	echo fetching...
	echo "Parameter #1 is $1"
	cd upstream/$1
	pwd
	git fetch upstream
	git checkout master
	#git merge upstream/master
	#git push origin master
}

function removeremote () {
	git remote rm upstream
}

function mergeup () {
	echo merging...
	echo "Parameter #1 is $1"
	#cd upstream/$1
	pwd
	#git fetch upstream
	#git checkout master
	git merge upstream/master
	git push origin master
}

function update.upstream () {
	fetchup $1
	mergeup $1
	#fetch $1
	#merge $1
}

function updateold.geoadmin () {
	fetchup geoadmin
	mergeup geoadmin
	#fetch $1
	#merge $1
}



showbase () {
	# this is quick bash command that you're probably search for
	# will print only a basename of the remote repository
	# where you fetch from:
	# especially -n option make the command much quicker
	basename $(git remote show -n origin | grep Fetch | cut -d: -f2-)
}


showbase2 () {
	#Well, if, for the repository name you mean the git root directory name (the one that contains the .git directory) you can run this
	#The git rev-parse --show-toplevel part gives you the path to that directory and the basename strips the first part of the path.
	basename `git rev-parse --show-toplevel`
}

fetch () {
	# Grab the upstream remote's branches
	# Pulls in changes not present in your local repository, without modifying your files
	# Fetches any new changes from the original repository
	# Fetch all the branches of that remote into remote-tracking branches, such as upstream/master
	git fetch upstream
}

listallbranches () {
	# List all local and remote-tracking branches
	git branch -va
}

mergemaster () {
	## If your local branch didn't have any unique commits, git will instead perform
	## a "fast-forward":
	## Merges any changes fetched into your working files
	git merge upstream/master
}

rebase () {
	# If you don't want to rewrite the history of your master branch, (for example because other people may have cloned it) then you should replace the last command with git merge upstream/master. However, for making further pull requests that are as clean as possible, it's probably better to rebase.
	# Rewrite your master branch so that any commits of yours that aren't already in upstream/master are replayed on top of that other branch
	git rebase upstream/master
}

push () {
	# Update: If you've rebased your branch onto upstream/master you may need to force the push in order to push it to your own forked repository on GitHub. You'd do that with:
	# You only need to use the -f the first time after you've rebased.
	git push -f origin master
}

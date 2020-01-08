parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[33;1m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# ~/.bashrc
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi

export LC_CTYPE=en_US.UTF-8

export DELPHI_DB=~/github/ml4ai/delphi/data/delphi.db
export DELPHI_DATA=~/github/ml4ai/delphi/scripts/data
export MODEL_FILES=~/github/ml4ai/delphi/data/model_files
export TEXINPUTS="$HOME/ivilab/texinputs:"
export TOMCAT=~/github/ml4ai/tomcat

# ls colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Eidos
export EIDOS=~/github/clulab/eidos
if [[ `hostname` == "qed.sista.arizona.edu" ]]; then
  export JAVA_OPTS=-Xmx62g
else
  export JAVA_OPTS=-Xmx16g
fi

export EIDOSPATH=$EIDOS/target/scala-2.12/eidos-assembly-0.2.3-SNAPSHOT.jar


export PATH=$HOME/ivilab/src/Make/scripts/:$PATH
export KJB_SRC_PATH=$HOME/ivilab/src/
export TEXINPUTS="$HOME/ivilab/doc/texinputs:"
#export LD_LIBRARY_PATH=`$HOME/ivilab/src/Make/scripts/echo_ld_path`:$LD_LIBRARY_PATH
#export KJB_WARN_LEVEL=0
#export FORCE_STOP=1
#export PYTHONPATH=~/indra:$PYTHONPATH
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk8/Contents/Home

##
# Your previous /Users/adarsh/.bash_profile file was backed up as /Users/adarsh/.bash_profile.macports-saved_2019-07-22_at_16:20:40
##

# MacPorts Installer addition on 2019-07-22_at_16:20:40: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your PATH environment variable for use with MacPorts.


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Create a new Python virtual environment
activate_py2() {
  port select --set python python27
  port select --set python2 python27
  port select --set pip pip27
}

# Usage example:
#
#     activate_py3 37
#
# will activate Python 3.7
activate_py3() {
  port select --set python python$1
  port select --set python3 python$1
  port select --set pip pip$1
}

create_new_venv() {
  python -m venv ~/.venvs/$1
}

# Activate a Python virtual environment
activate() {
  source ~/.venvs/$1/bin/activate
}

purge_macports() {
  sudo port -fp uninstall installed
  dscl -p . -delete /Users/macports
  dscl -p . -delete /Groups/macports
  sudo rm -rf \
    /opt/local \
    /Applications/DarwinPorts \
    /Applications/MacPorts \
    /Library/LaunchDaemons/org.macports.* \
    /Library/Receipts/DarwinPorts*.pkg \
    /Library/Receipts/MacPorts*.pkg \
    /Library/StartupItems/DarwinPortsStartup \
    /Library/Tcl/darwinports1.0 \
    /Library/Tcl/macports1.0 \
    ~/.macports
}

install_macports() {
  local version=2.6.2
  curl -O https://distfiles.macports.org/MacPorts/MacPorts-$version.tar.bz2
  tar xf MacPorts-$version.tar.bz2
  pushd MacPorts-$version
    ./configure
    make -j
    sudo make -j install
  popd
  rm -rf Macports-$version*
  port selfupdate
}

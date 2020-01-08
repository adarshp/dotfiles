export PS1="\[\033[33;1m\]\w\[\033[32m\]\[\033[00m\] $ "

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
export JAVA_OPTS=-Xmx16g
export EIDOSPATH=$EIDOS/target/scala-2.12/eidos-assembly-0.2.3-SNAPSHOT.jar


export PATH=$HOME/ivilab/src/Make/scripts/:$PATH
export KJB_SRC_PATH=$HOME/ivilab/src/
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
# Finished adapting your PATH environment variable for use with MacPorts.

#export PATH="~/homebrew/bin:$PATH"

function py37 () {
  sudo port select --set python python37;
  sudo port select --set python3 python37;
  sudo port select --set pip pip37;
  sudo port select --set pip3 pip37;
}

function py38 () {
   sudo port select --set python python38;
   sudo port select --set python3 python38;
   sudo port select --set pip pip38;
   sudo port select --set pip3 pip38;
}

function py27 () {
   sudo port select --set python python27;
   sudo port select --set pip pip27;
}

function set_gcc {
  export CC=`which gcc`
  export CXX=`which g++`
}

function set_mp_clang {
  export CC=/opt/local/bin/clang-mp-8.0
  export CXX=/opt/local/bin/clang++-mp-8.0
}

function set_apple_clang {
  export CC=/usr/bin/clang
  export CXX=/usr/bin/clang++
}

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Create a new Python virtual environment
function create_new_venv() {
  python -m venv ~/.venvs/$1 --system-site-packages
}

# Activate a Python virtual environment
function activate() {
  source ~/.venvs/$1/bin/activate
}
#export ROOTSYS=/opt/local/libexec/root6
#export PATH=$PATH:$ROOTSYS/bin
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$ROOTSYS/lib
#export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$ROOTSYS/lib

# Silence Bash deprecation warning on macOS
export BASH_SILENCE_DEPRECATION_WARNING=1

# Use vi mode in the shell
set -o vi

update_dotfiles() {
  pushd ~/dotfiles > /dev/null && git pull && popd > /dev/null
  echo "Dotfiles updated."
}

# Get the current git branch
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\[\033[33;1m\]\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

# ~/.bashrc
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then . ~/.bash_aliases; fi

export LC_CTYPE=en_US.UTF-8

export DELPHI_DB=~/git/ml4ai/delphi/data/delphi.db
export DELPHI_DATA=~/git/ml4ai/delphi/scripts/data
export MODEL_FILES=~/git/ml4ai/delphi/data/model_files
export TEXINPUTS="$HOME/ivilab/texinputs:$HOME/git/adarshp/src/texinputs:"
export OPENFACE_MODELS_DIR=~/git/ml4ai/tomcat/data/OpenFace_models

# ls colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Eidos
export EIDOS=~/git/clulab/eidos
if [[ `hostname` == "qed.sista.arizona.edu" ]]; then
  export JAVA_OPTS=-Xmx62g
else
  export JAVA_OPTS=-Xmx16g
fi

export EIDOSPATH=$EIDOS/target/scala-2.12/eidos-assembly-0.2.3-SNAPSHOT.jar


#export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk8/Contents/Home

activate_homebrew() {
  export PATH="~/homebrew/bin:$PATH"
}

# MacPorts Installer addition on 2019-07-22_at_16:20:40: adding an appropriate PATH variable for use with MacPorts.
activate_macports() {
  export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
  export MANPATH="/opt/local/share/man:$MANPATH"
}
# Finished adapting your PATH environment variable for use with MacPorts.


test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

activate_py2() {
  sudo port select --set python python27
  sudo port select --set python2 python27
  sudo port select --set pip pip27
}

# Usage example:
#
#     activate_py3 37
#
# will activate Python 3.7
activate_py3(){
  sudo port select --set python python$1
  sudo port select --set python3 python$1
  sudo port select --set pip pip$1
}

# Create a new Python virtual environment
create_new_venv(){
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

search_and_replace() {
  local filename_pattern=$1
  local pattern_to_find=$2
  local replacement=$3
  find . -name ${filename_pattern} -exec gsed -i "s/${pattern_to_find}/${replacement}/g" {} \;
}

export AUTOMATES_DATA=~/Google\ Drive\ UA/ASKE-AutoMATES/Data

# Get the latest file from the ~/Downloads directory, and if it is a .ris file,
# convert it to BibTeX format, normalize it with bibtool, copy it to the
# clipboard, and delete the original file. This is useful for when websites
# don't have BibTeX exports.
latest_citation_to_bibtex() {
    local file=$(ls -td ~/Downloads/* | head -n1)
    if [[ $file = *.ris || $file = *.bib || $file = *.bibtex ]]; then
        if [[ $file = *.ris ]]; then
            ris2xml $file | xml2bib | bibtool -f "%1p(author):%4d(year)" | pbcopy
        else
            cat $file | bibtool -f "%1p(author):%4d(year)" | pbcopy
        fi
        pbpaste | sed "s/{\^a}??/'/g" | pbcopy
        rm $file
    fi
}

activate_macports

source /Users/adarsh/.config/broot/launcher/bash/br
. "$HOME/.cargo/env"

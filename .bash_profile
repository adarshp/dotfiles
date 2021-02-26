# Silence Bash deprecation warning on macOS
export BASH_SILENCE_DEPRECATION_WARNING=1

# Source ~/.bashrc file. This way we can maintain a common ~/.bashrc file that
# will work on both Linux and macOS, and just call it from ~/.bash_profile
# (macOS's versin of ~/.bashrc).
source ~/.bashrc

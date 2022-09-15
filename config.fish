if status is-interactive
    # Commands to run in interactive sessions can go here

    # TEXINPUTS
    set -x TEXINPUTS "~/git/adarshp/src/texinputs:~/ivilab/texinputs:$TEXINPUTS"

    # MacPorts path
    set -x PATH "/opt/local/bin:/opt/local/sbin:$PATH"
    # Finished adapting your PATH environment variable for use with MacPorts.

    # Add path for Rust and Cargo installed by Rustup
    set -x PATH "$HOME/.cargo/bin:$PATH"

    set -x EDITOR vim

    # Make a nice one-letter alias for vim
    alias v 'vim'

    # Open the Vimwiki index
    alias vw 'vim -c VimwikiIndex'

    # Open today's Vimwiki diary entry
    alias vd 'vim -c VimwikiMakeDiaryNote'

    # Open ~/.vimrc in vim
    alias vimrc 'vim ~/.vimrc'

    # Aliases for faster git
    alias gst 'git status'
    alias gp 'git push'

    # Alias 'ls' to 'lsd'
    alias ls 'lsd'

    # Sync adarshp/dotfiles repo
    function sync_dotfiles
        pushd ~/git/adarshp/dotfiles
            git add .
            git commit -m "Adding latest dotfile changes"
            git pull
            git push
        popd
    end


    # Sync adarshp/src repo
    function sync_src
        pushd ~/git/adarshp/src
            git add .
            git commit -m "Syncing src repo"
            git pull
            git push
        popd
    end

    # Create a new Python 3 virtual environment
    #
    # Usage:
    #
    #    make_venv <project_name>
    #
    function make_venv
        mkdir -p ~/.venvs
        # We redirect the stderr to stdout for the command 'python --version' since
        # for Python 2.x, the version is output to stderr instead of stdout.
        set -l major_version (python --version 2>&1 | cut -c 8)
        if [ $major_version = "3" ]
            python -m venv ~/.venvs/$argv[1]
        else if [ $major_version = "2" ]
            python -m virtualenv ~/.venvs/$argv[1]
        else
            echo "Error: Python major version was not determined to be either 2 or 3."
            return 1
        end
    end

    # Usage: activate_py <major_version><minor_version>
    # Example:
    #
    #    activate_py 310
    #
    # will activate Python 3.10
    function activate_py
        set -l major_version (echo $argv[1] | cut -c 1)
        set -l minor_version (echo $argv[1] | cut -d "$major_version" -f2)
        sudo port select --set python python"$argv[1]"
        sudo port select --set python"$major_version" python"$argv[1]"
        sudo port select --set pip pip"$argv[1]"
        sudo port select --set pip"$major_version" pip"$argv[1]"
    end

    # Activate a Python virtual environment
    function activate
        source ~/.venvs/$argv[1]/bin/activate.fish
    end
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

if status is-interactive
    # Commands to run in interactive sessions can go here

    switch (uname)
        case Darwin
            # MacPorts path
            set -x PATH "/opt/local/bin:/opt/local/sbin:$PATH"

            echo "Operating system implementation: Darwin"
            # Enable fzf keybindings
            source /opt/local/share/fzf/shell/key-bindings.fish

            # Alias 'ls' to 'lsd'
            alias ls 'lsd'

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

        # Java config for CLULab software
        set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/openjdk8-zulu/Contents/Home"
        set -x JAVA_OPTS "-Xmx50g"

    end


    # TEXINPUTS
    set -x TEXINPUTS "~/git/adarshp/personal/texinputs:~/ivilab/texinputs:$TEXINPUTS"

    # Path to personal scripts
    set -x PATH "/Users/adarsh/git/adarshp/personal/scripts:$PATH"

    # Add path for Rust and Cargo installed by Rustup
    set -x PATH "$HOME/.cargo/bin:$PATH"

    # Set default editor to vim
    set -x EDITOR vim

    # Open the Vimwiki index
    alias vw 'vim -c VimwikiIndex'

    # Open today's Vimwiki diary entry
    alias vd 'vim -c VimwikiMakeDiaryNote'

    # Open ~/.vimrc in vim
    alias vimrc 'vim ~/.vimrc'

    # Open fish config file in vim
    alias fishrc 'vim ~/.config/fish/config.fish'

    # Aliases for faster git
    alias gst 'git status'
    alias gpush 'git push'
    alias gpull 'git pull'


    # Aliases for projects
    alias agent 'cd ~/git/aptima/adminless-testbed/Agents/AC_UAZ_TA1_DialogAgent'
    alias coord 'cd ~/git/ml4ai/papers; git checkout coordination; cd 2023-NeurIPS-ToMCAT-Coordination'
    alias dataset 'cd ~/git/ml4ai/papers; git checkout neurips-2023; cd 2023-NeurIPS-ToMCAT-Dataset'
    alias multicat 'cd ~/git/ml4ai/papers; git checkout multicat; cd 2023_EMNLP_MultiCAT'

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


    # Activate a Python virtual environment
    function activate
        source ~/.venvs/$argv[1]/bin/activate.fish
    end
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

#set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /Users/adarsh/.ghcup/bin $PATH # ghcup-env

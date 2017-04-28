source ~/terminal_settings/.colors
source ~/terminal_settings/.ps_settings
source ~/terminal_settings/.logs

alias reload="source ~/.bash_profile"

# History
export HISTIGNORE="h:history:pwd:exit:df:ls:ls -la:ll"
export HISTCONTROL="ignoreboth:erasedups"


# Move export GREP_OPTIONS="--color=auto" (which is deprecated) from .exports to .alias
# Always enable colored `grep` output`
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

#- System
alias mem="free -m"
alias a2l="sudo service apache2 reload"
alias a2r="sudo service apache2 restart"
alias chweb="sudo chgrp -R www-data"
alias chrx="sudo chmod -R 775"

#- backup file
bu() { cp $@ $@.backup-`date +%y%m%d`; echo "`date +%Y-%m-%d` backed up $PWD/$@" >> ~/.backups.log; }

#-- Navigation
alias up="cd ../"
alias upp="cd ../../"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ll="ls -lahG"
alias h="history"
alias last="history 10"
alias clean="sudo find . -name '*.DS_Store' -type f -delete"
function cc(){ mkdir -p "$1" && cd "$1"; }

mm(){
    DIR=$1
    shift
    for VAR in "${@}"; do
        mkdir -p "$DIR/$VAR"
        echo "$DIR/$VAR created"
    done
}

#-- Vagrant
alias vu="vagrant up"
alias vh="vagrant halt"
alias vs="vagrant status"
alias vssh="vagrant ssh"
alias vc="vagrant ssh"

#-- Git
alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gd="git diff"
alias go="git checkout"
alias gf="git fetch"
alias gl="git log"

#-- Composer
alias cda="composer dump-autoload -o"
alias cu="composer update"
alias ci="composer install"
alias cs="sudo composer self-update"

#-- Laravel
alias art="php artisan"
alias a:m="php artisan migrate"
alias a:r="php artisan migrate:rollback"

#-- Doctrine
alias dsv="php artisan doctrine:schema:validate"
alias dsc="php artisan doctrine:schema:create"
alias dsu="php artisan doctrine:schema:update"
alias dsd="php artisan doctrine:schema:drop"
alias dcm="php artisan doctrine:clear:metadata:cache"
alias dcq="php artisan doctrine:clear:query:cache"
alias dcr="php artisan doctrine:clear:result:cache"
alias dgp="php artisan doctrine:generate:proxies"

#-- MySQL
function mdb(){ mysql -uroot -p -e "create database $1;"; }
function ddb(){ mysql -uroot -p -e "drop database $1;"; }
function mdbu(){
    if (( "$#" != 3 ))
    then
        echo "Make MySQL User";
        echo "";
        echo "Expects 3 parameters: mdbu <username> <password> <database>";
        echo "";
    else
        mysql -uroot -p -e "CREATE USER '$1'@'localhost' IDENTIFIED BY '$2';";
        mysql -uroot -p -e "GRANT ALL PRIVILEGES ON $3 . * TO '$1'@'localhost';";
    fi
}

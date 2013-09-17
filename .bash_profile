#!/bin/sh
export CLICOLOR=1

export SVN=svn://localhost
export EDITOR='vim'

export TRAC=~/Library/Trac/Cal
export EC2=ec2-user@ec2-79-125-68-70.eu-west-1.compute.amazonaws.com
export LM_STAGING="/Users/andreas/Dropbox/working/gitlmwebsite"

function parse_git_branch {
    git rev-parse --git-dir > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        git_status="$(git status 2> /dev/null)"
        branch_pattern="^# On branch ([^${IFS}]*)"
        detached_branch_pattern="# Not currently on any branch"
        remote_pattern="# Your branch is (.*) of"
        diverge_pattern="# Your branch and (.*) have diverged"
        untracked_pattern="# Untracked files:"
        new_pattern="new file:"
        not_staged_pattern="Changes not staged for commit"

        #files not staged for commit
        if [[ ${git_status}} =~ ${not_staged_pattern} ]]; then
            state="✔"
        fi
        # add an else if or two here if you want to get more specific
        # show if we're ahead or behind HEAD
        if [[ ${git_status} =~ ${remote_pattern} ]]; then
            if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
                remote="↑"
            else
                remote="↓"
            fi
        fi
        #new files
        if [[ ${git_status} =~ ${new_pattern} ]]; then
            remote="+"
        fi
        #untracked files
        if [[ ${git_status} =~ ${untracked_pattern} ]]; then
            remote="✖"
        fi
        #diverged branch
        if [[ ${git_status} =~ ${diverge_pattern} ]]; then
            remote="↕"
        fi
        #branch name
        if [[ ${git_status} =~ ${branch_pattern} ]]; then
            branch=${BASH_REMATCH[1]}
        #detached branch
        elif [[ ${git_status} =~ ${detached_branch_pattern} ]]; then
            branch="NO BRANCH"
        fi

        echo "(${branch}${state}${remote})"
    fi
    return
}
export PS1="\h:\w\$(parse_git_branch)$ "

export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$PATH:~/bin

alias ci='git ci'
alias co='git co'
alias f='fg'
alias l='ls'
alias s='git s'
alias g='git'
alias a='git add'
alias w='pushd ~/wc'
alias ap='git add -p'
alias AMEND='git ci --amend -C HEAD'

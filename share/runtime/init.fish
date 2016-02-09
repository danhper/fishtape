set -g TAP_VERSION 13
set -g __fishtape_count 0
set -g __fishtape_fails 0

for scope in --global --universal
    for var  in (set $scope --name)
        switch $var
            case _\* version umask status history COLUMNS FISH_VERSION LINES PWD SHLVL PATH TMUX TERM
            case \*
                set $scope __fishtape_$var $$var
        end
    end
end

printf "TAP version %s\n" $TAP_VERSION
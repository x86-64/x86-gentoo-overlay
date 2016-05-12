#!/usr/bin/octo

job [% name %]
        role service
                set keepalive 1
                set features node-localhost
                set cmd /usr/bin/[% name %]
        exit
start
exit

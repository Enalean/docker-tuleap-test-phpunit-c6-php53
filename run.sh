#!/bin/bash

set -e

options=`getopt -o h -l ci -- "$@"`

eval set -- "$options"

ci=

while true
do
    case "$1" in
	--ci)
	    echo "true"
	    ci=1
	    shift 1;;
	--)
	    shift 1; break ;;
	*)
	    break ;;
    esac
done

if [ -z "$ci" ]; then
    exec make -C /tuleap PHPUNIT=/tmp/run/vendor/bin/phpunit phpunit
else
    exec make -C /tuleap PHPUNIT=/tmp/run/vendor/bin/phpunit BUILD_ENV=ci OUTPUT_DIR=/output phpunit
fi

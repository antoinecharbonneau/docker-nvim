#!/bin/bash

if [[ -d $(dirname $1) ]]; then
	current_dir=$(pwd)
	cd $(dirname $1)
	git rev-parse --is-inside-working-tree 2>&1> /dev/null
	if [[ $? == 0 ]]; then
		target_dir=$(pwd)
	else
		echo "Not in a git repository." > 2
		cd $current_dir
		exit 1
	fi
else
	echo "Not in a git repository." > 2
	cd $current_dir
	exit 1
fi

docker run --rm -it -v "$target_dir:$target_dir" dev-env:latest "$target_dir/$(basename $1)"

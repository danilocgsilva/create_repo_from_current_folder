#!/bin/bash

createrepofromcurrentfolder_util() {
	
	declare -a createrepofromcurrentfolder_util_errors
	
	if [ -z $1 ]; then
		createrepofromcurrentfolder_util_errors+=('You need the first argument to be the path to the php.');
	fi

	if [ -z $2 ]; then
		createrepofromcurrentfolder_util_errors+=('You need the second argument to be the registered user.')
	fi

	# Get current folder name to be the project name
	projectname=$(basename "$(pwd)")

	if [[ "$projectname" =~ " " ]]; then
		createrepofromcurrentfolder_util_errors+=('There are blank spaces in the current directory name. It is not allowed.')
	fi
	
	# If there's errors, skip, exiting the program
	if [ ${#createrepofromcurrentfolder_util_errors[@]} -gt 0 ]; then
		for i in `seq ${#createrepofromcurrentfolder_util_errors[@]}`; do
			realloop=`expr $i - 1`
			echo createrepofromcurrentfolder_util error: ${createrepofromcurrentfolder_util_errors[$realloop]}
		done
		return
	fi

	IFS=$'\n'
	content_response=($(curl "$1/createrepofromcurrentfolder.php?registereduser=$2&projname=$projectname"))

	github_user=${content_response[3]}

	createrepofromcurrentfolder_util_gitinit "$projectname"
}

createrepofromcurrentfolder_util_gitinit() {
	echo "# $1" >> README.md
	git init
	git add -A
	git commit -m "first commit"
	git remote add origin git@github.com:$github_user/$1.git
	git push -u origin master
}

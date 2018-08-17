if [[ "false" != "$TRAVIS_PULL_REQUEST" ]]; then
	commit_msg="$(git --no-pager log -2 --pretty=%B)"
else
	commit_msg=$TRAVIS_COMMIT_MESSAGE
fi

echo "Commit msg: $commit_msg"

echo "Starting test suite for other commands"

if [[ $commit_msg = *"[BREAKING CHANGES]"* ]]; then

	echo "[BREAKING CHANGES] found."
	pattern='\<REPO\>.*\b'

	declare -a repos

	for word in $commit_message; do
		[[ $word =~ $pattern ]]
		if [[ ${BASH_REMATCH[0]} ]]; then
			repos+=(${BASH_REMATCH[0]})
		fi
	done



	for repo in ${repos[@]}; do
		owner_name_unclean=${repo%%\/*}
		owner_name=${owner_name_unclean#*\=}
		repo_with_branch=${repo#*\/}
		repo_name=${repo_with_branch%\:*}
		repo_branch=${repo_with_branch#*\:}
		#sudo rm -rf "$repo_name"
		git clone https://github.com/"$owner_name"/"$repo_name".git -b "$repo_branch"
		pushd "$repo_name"
		echo "Updated to easyengine/$repo_name to $owner_name/$repo_name"
		git remote -v
		git branch
		popd
	done

fi

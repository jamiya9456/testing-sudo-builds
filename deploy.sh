git --no-pager log --graph
echo "Commit msg: $TRAVIS_COMMIT_MESSAGE"

if [[ "false" != "$TRAVIS_PULL_REQUEST" ]]; then
  commit_msg="$(git --no-pager log HEAD~1...HEAD~2 --pretty=%B)"
else
  commit_msg=$TRAVIS_COMMIT_MESSAGE
fi

if [[ $commit_msg = *"[BREAKING CHANGES]"* ]]; then
  echo "It's there!"
fi


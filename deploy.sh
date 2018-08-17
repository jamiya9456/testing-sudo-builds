

if [[ "false" != "$TRAVIS_PULL_REQUEST" ]]; then
  commit_msg="$(git --no-pager log HEAD~1...HEAD~2 --pretty=%B)"
else
  commit_msg=$TRAVIS_COMMIT_MESSAGE
fi

echo "Commit msg: $commit_msg"

if [[ $commit_msg = *"[BREAKING CHANGES]"* ]]; then
  echo "It's there!"
fi


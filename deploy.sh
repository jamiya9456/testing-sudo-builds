git --no-pager log --graph
echo "Commit msg: $TRAVIS_COMMIT_MESSAGE"

commit_msg="$(git --no-pager log HEAD~1...HEAD~2 --pretty=%B)"

if [[ $commit_msg = *"[BREAKING CHANGES]"* ]]; then
  echo "It's there!"
fi


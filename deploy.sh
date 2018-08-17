git --no-pager log --graph
echo "Commit msg: $TRAVIS_COMMIT_MESSAGE"
if [[ $TRAVIS_COMMIT_MESSAGE = *"[BREAKING CHANGES]"* ]]; then
  echo "It's there!"
fi


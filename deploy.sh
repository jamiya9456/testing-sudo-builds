if [[ $TRAVIS_COMMIT_MESSAGE = *"[BREAKING CHANGES]"* ]]; then
  echo "It's there!"
fi

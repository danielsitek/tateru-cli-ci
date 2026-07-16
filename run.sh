#!/bin/bash

echo "Stats:";
echo "------";
echo "node: $(node -v)";
echo "npm:  $(npm -v)";

echo "";

if [ $RUN_ENV == "production" ]; then
  echo "Running in production mode:"
  echo "---------------------------"
  echo "";
  npm i -g tateru-cli
  tateru-cli tateru.config.json --env prod
  sh ./compare.sh
elif [ $RUN_ENV == "development" ]; then
  echo "Running in development mode:"
  echo "----------------------------"
  echo "";
  npm i -g tateru-cli
  tateru-cli tateru.config.json --env dev
  sh ./compare.sh
else
  echo "RUN_ENV not set"
  exit 1
fi

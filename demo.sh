#! /bin/bash

npm run spec
./fp clean
./fp g --app --appName AwesomeApp --author YourName --ghUser GitHubUserName --email some@one.com
./fp g --view --test1 --route root
./fp g --view --test2 --route abc
./fp g --view --test3 --route def --componentFolder testingMore
./fp g --view --test4 --slim
./fp g --component --test5 --folder test4 --slim
./fp g --component --test6 --folder test4
./fp g --navigation
./fp test
./fp run

#!/bin/bash

rm -f /usr/src/app/tmp/pids/server.pid
bundle exec rake assets:precompile
echo $BENCH_PORT
rails s --binding 0.0.0.0 -p ${BENCH_PORT}
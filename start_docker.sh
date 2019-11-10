rm -f /usr/src/app/tmp/pids/server.pid
bundle exec rake assets:precompile RAILS_ENV=production
rails s --binding 0.0.0.0 -p ${BENCH_PORT}
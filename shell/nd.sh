export $(cat env/env-${HW_ENV})
source secret/secret
export SW_ENV=dev

# bundle exec rake assets:precompile RAILS_ENV=production
rails s --binding 0.0.0.0 -p ${BENCH_PORT}
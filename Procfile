web: bin/rails server -p ${PORT:-5000} -e production -b 0.0.0.0
worker: bundle exec sidekiq -e production -C config/sidekiq.yml

require 'sidekiq'
require 'sidekiq-scheduler'

puts "Sidekiq.server? is #{Sidekiq.server?.inspect}"
puts "defined?(Rails::Server) is #{defined?(Rails::Server).inspect}"

SidekiqScheduler::Scheduler.instance.enabled = true
Sidekiq.configure_server do |config|
  config.on(:startup) do
    Sidekiq.schedule = YAML.load_file(Rails.root.join('config/sidekiq_scheduler.yml'))
    SidekiqScheduler::Scheduler.instance.reload_schedule!
  end
end

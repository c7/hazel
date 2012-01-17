# Redis Configuration
redis_settings = YAML::load_file("config/redis.yml")
REDIS = Redis.new(redis_settings[ENV['RACK_ENV']])

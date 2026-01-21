Resque.redis = Redis.new(
  host:     ENV["REDIS_HOST"].presence || 'localhost',
  db:       ENV["REDIS_DB"].presence,
  port:     ENV["REDIS_PORT"].presence || 6379,
  password: ENV["REDIS_PASSWORD"].presence
)

if ENV["RESQUE_NAMESPACE"].present?
  Resque.redis.namespace = ENV["RESQUE_NAMESPACE"].to_sym
end

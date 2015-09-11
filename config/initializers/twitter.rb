TwitterClients = ConnectionPool.new(size: 2) { 
  Twitter::REST::Client.new do |config|
    config.consumer_key        = "kW3GjjPNYosLm9NZSe4o2LyEj"
    config.consumer_secret     = "dwTTllfKdhwmMw2jumHEbjJofphByM623pNnG4RLt2f64oMMLE"
    config.access_token        = "3241032356-TQsbVre9RMP0LxAAC80uO5DYFLwmyMrCagIVcFR"
    config.access_token_secret = "kpHNARVEoSK0McnJdY58IiQdeaxZYiDEWZMpmVyL64ajv"
  end
}
require 'sentry-ruby'

# Set up as early as possible, before the app (and Sinatra) loads.
Sentry.init do |config|
  config.dsn = ENV['SENTRY_DSN']

  # Never send request bodies: they hold the user's text. Headers are kept.
  # see https://docs.sentry.io/platforms/ruby/data-management/data-collected/ for more info
  config.data_collection.http_bodies = []
end

require_relative 'speller'

use Sentry::Rack::CaptureExceptions
run SpellerApp

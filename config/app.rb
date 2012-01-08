class App < Configurable # :nodoc:
  # Settings in config/app/* take precedence over those specified here.
  config.name = Rails.application.class.parent.name

  config.git_revision = `git rev-parse HEAD 2>/dev/null`.to_s.strip
end
require "thor"

module Gnar
  module Style
    module Cli
      class Application < Thor
        include Thor::Actions

        desc "copy_local", "Copy configuration files from the gem into your local directory"
        option :format, type: :string, default: "ruby", enum: %w[gem rails ruby]
        def copy_local
          copy_file "rubocop.yml", "gnar_style/rubocop.yml"

          case options[:format]
          when "rails"
            copy_file "rubocop_rails.yml", "gnar_style/rubocop_rails.yml"
          when "gem"
            copy_file "rubocop_gem.yml", "gnar_style/rubocop_gem.yml"
          end
        end

        def self.source_root
          "#{File.dirname(__FILE__)}/../../../../rubocop"
        end
      end
    end
  end
end

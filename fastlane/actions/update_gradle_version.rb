require "java-properties"
module Fastlane
  module Actions
    class UpdateGradleVersionAction < Action
      def self.run(params)
        properties = JavaProperties.load("mylibrary/gradle.properties")
        puts properties
        properties[:POM_VERSION] = params[:version]
        JavaProperties.write(properties, "mylibrary/gradle.properties")
      end

      def self.description
        "Update gradle aar version"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :version,
                                       description: "The value for VERSION_NAME in gradle.properties",
                                       is_string: true)
        ]
      end

      def self.authors
        # So no one will ever forget your contribution to fastlane :) You are awesome btw!
        ["fly"]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end

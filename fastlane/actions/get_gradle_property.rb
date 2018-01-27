require "java-properties"
module Fastlane
  module Actions
    class GetGradlePropertyAction < Action
      def self.run(params)
        properties = JavaProperties.load("gradle.properties")
        result = properties[:"#{params[:property]}"]
        return result
      end

      def self.description
        "Update gradle aar version"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :property,
                                       description: "the property name you want to get",
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

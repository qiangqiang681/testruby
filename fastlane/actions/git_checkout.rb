module Fastlane
  module Actions
    class GitCheckoutAction < Action
      def self.run(params)
        cmd = "git checkout "
        if params[:branch]
          cmd << " #{params[:branch]}"
        end
        result = Actions.sh(cmd.to_s)
        UI.success("Successfully pushed 💾.")
        return result
      end

      def self.description
        "Directly commit the given file with the given message"
      end

      def self.details
        ""
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :branch,
                                       description: "The branch you want to checkout",
                                       is_string: true,
                                       verify_block: proc do |value|
                                       end),
        ]
      end

      def self.output
      end

      def self.return_value
        nil
      end

      def self.authors
        ["fly"]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end

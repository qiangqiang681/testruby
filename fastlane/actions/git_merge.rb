module Fastlane
  module Actions
    class GitMergeAction < Action
      def self.run(params)
        cmd = "git merge "
        if params[:branch]
          cmd << " #{params[:branch]} --no-ff"
        end
        result = Actions.sh(cmd.to_s)
        UI.success("Successfully merge 💾.")
        return result
      end

      def self.description
        "Directly merge branch you want to merge"
      end

      def self.details
        ""
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :branch,
                                       description: "The branch you want to merge",
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

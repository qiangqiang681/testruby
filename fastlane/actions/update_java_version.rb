require "java-properties"
require 'tempfile'
require 'fileutils'
module Fastlane
  module Actions
    class UpdateJavaVersionAction < Action
      def self.run(params)
       path = GetGradlePropertyAction.run(property:"VERSION_PATH");
       increment_version(path, params[:version], "CODE")
      end

      def self.increment_version(path, new_version_code, constant_name)
          if !File.file?(path)
              puts(" -> No file exist at path: (#{path})!")
              return -1
          end
          begin
              foundVersionCode = "false"
              temp_file = Tempfile.new('fastlaneIncrementVersionCode')
              File.open(path, 'r') do |file|
                  file.each_line do |line|
                      if line.include? constant_name and foundVersionCode=="false"
                        line.replace line.sub(/[\d+\.]+/, new_version_code)
                        foundVersionCode = "true"
                        puts line
                        temp_file.puts line
                      else
                      temp_file.puts line
                   end
              end
              file.close
            end
            temp_file.rewind
            temp_file.close
            FileUtils.mv(temp_file.path, path)
            temp_file.unlink
          end
          if foundVersionCode == "true"
              return new_version_code
          end
          return -1
      end

      def self.description
        "Update Version.java version"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :version,
                                       description: "The value for VERSION_NAME in Version.java",
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

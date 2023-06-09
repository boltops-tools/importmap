require "active_support/core_ext/string/inflections"

module Importmap
  class Framework

    @@instance = nil
    def self.instance
      @@instance ||= new
    end

    def initialize
      require framework_name
      Importmap::Framework.send(:include, include_framework)
    end

    def framework_name
      ENV['IMPORTMAP_FRAMEWORK'] || infer_from_gemfile || "jets"
    end

    # define at bottom so methods take precedence
    def include_framework
      if supported_frameworks.include?(framework_name)
        "Importmap::Framework::#{framework_name.camelize}Framework".constantize
      else
        raise "Need to use a supported framework: #{supported_frameworks.join(', ')}"
      end
    end

    def infer_from_gemfile
      return unless File.exist?("Gemfile")
      lines = IO.readlines("Gemfile")
      lines.each do |line|
        next if line =~ /^\s*#/ # skip comments
        gem_name = line.match(/gem ['"](\w+)['"]/)&.captures&.first
        if supported_frameworks.include?(gem_name)
          return gem_name
        end
      end
      nil
    end

    # To add another framework:
    # 1. add to this list
    # 2. define a module in importmap/framework/#{framework_name}_framework.rb
    def supported_frameworks
      %w[jets rails]
    end
  end
end

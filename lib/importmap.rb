$stdout.sync = true unless ENV["IMPORTMAP_STDOUT_SYNC"] == "0"

$:.unshift(File.expand_path("../", __FILE__))

require "importmap/autoloader"
Importmap::Autoloader.setup

require "memoist"
require "pathname"
require "rainbow/ext/string"

module Importmap
  class Error < StandardError; end

  def framework
    Framework.instance.framework_class
  end

  def framework_boot
    Framework.instance.boot
  end

  extend self
end

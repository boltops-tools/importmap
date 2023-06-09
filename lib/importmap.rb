$stdout.sync = true unless ENV["IMPORTMAP_STDOUT_SYNC"] == "0"

$:.unshift(File.expand_path("../", __FILE__))

require "importmap/autoloader"
Importmap::Autoloader.setup

require "memoist"
require "rainbow/ext/string"

module Importmap
  class Error < StandardError; end
end

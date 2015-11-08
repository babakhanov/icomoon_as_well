require "icomoon_as_well/version"
require "icomoon_as_well/unzip"
require "icomoon_as_well/file_helper"

module IcomoonAsWell
  class Icomoon 
    include FileHelper
    def say_hello
      puts @path
    end

    def initialize(path, target_folder)
      @archive = Unzip.new(path)
      put_files(@archive.files, @archive.files.keys.map{|name| $1 if name =~ /^fonts\/(.+)$/}.compact, "#{target_folder}/fonts")
      parse_css(@archive.files["style.css"])
    end
  end
end

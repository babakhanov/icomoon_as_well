require 'erb'
require "icomoon_as_well/version"
require "icomoon_as_well/unzip"
require "icomoon_as_well/file_helper"

module IcomoonAsWell
  class Icomoon 
    include FileHelper
    def initialize(path, target_dir)
      @archive = Unzip.new(path)
      put_files(@archive.files, @archive.files.keys.map{|name| $1 if name =~ /^fonts\/(.+)$/}.compact, "#{target_dir}/fonts")
      @icomoon_variables = parse_css(@archive.files["style.css"])
      @icon_prefix = "icon"
      ["variables", "icons", "core", "mixins"].each do |tpl|
        renderer = ::ERB.new File.read("#{File.dirname(__FILE__)}/icomoon_as_well/templates/#{tpl}.scss.erb")
        File.open(File.join(icomoon_dir(target_dir), "#{tpl}.scss"), "w"){|f| f.write(renderer.result(binding)) }
      end
    end
  end
end

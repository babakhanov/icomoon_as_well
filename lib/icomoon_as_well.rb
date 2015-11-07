require "icomoon_as_well/version"
require "byebug"
require 'zip'
module IcomoonAsWell
  include Byebug
  class Icomoon 
    def say_hello
      puts @path
    end

    def initialize(path)
			@files = {}
      if File.exist?(path.to_s)
        if path.to_s !~ /^.+\.zip$/
          raise "It's not a zip file"
        else
          @path = path
					Zip::File.open(@path) do |zip|
						zip.each do |entry|
              if  entry.file?
                @files[entry.name] = entry.get_input_stream.read
              end
						end
					end
          byebug
        end
      else
        raise "It's not a file there '#{path}'"
      end
    end

  end
end

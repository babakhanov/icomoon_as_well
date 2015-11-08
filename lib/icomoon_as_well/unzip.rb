require 'zip'

module IcomoonAsWell
  class Unzip
    attr_reader :files
    def initialize(path)
      @files = {}
      Zip::File.open(path) do |zip|
        zip.each do |entry|
          if  entry.file?
            @files[entry.name] = entry.get_input_stream.read
          end
        end
      end
    end
  end
end

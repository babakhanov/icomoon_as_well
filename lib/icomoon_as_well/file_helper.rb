module IcomoonAsWell
  module FileHelper
    def put_files(entry, names, target_dir)
      unless Dir.exist?(target_dir)
        Dir.mkdir(target_dir)
      end
      names.each do |name|
        File.open(File.join(target_dir, name), "w"){ |file| file.write(entry[name]) }
      end
    end
  end
end

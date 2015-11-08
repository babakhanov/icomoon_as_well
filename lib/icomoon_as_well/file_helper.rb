require 'fileutils'

module IcomoonAsWell
  module FileHelper
    def parse_css(file)
      icons = {}
      c = 0
      lines = file.split("\n")
      while c <= lines.count
        line = lines[c]
        c += 1
        if line.to_s =~ /^\.icon-(\S+):before\s*{\s*$/
          icon_name = $1
          value = lines[c]
          c += 1
          icon_name.gsub!(/\s+/, '')
          value.gsub!(/^\s+/, '').gsub!(/content:/, '').gsub!(/["'\\\s\;]+/, '')
          icons[icon_name] = value
        end
      end
      icons
    end
    def put_files(entry, names, target_dir)
      unless Dir.exist?(target_dir)
        FileUtils.mkpath(target_dir)
      end
      names.each do |name|
        File.open(File.join(target_dir, name), "w"){ |file| file.write(entry[name]) }
      end
    end

    def icomoon_dir(target_dir)
      unless Dir.exists?("#{target_dir}/stylesheets")
        FileUtils.mkpath(File.join(target_dir, "stylesheets"))
      end
      unless Dir.exists?("#{target_dir}/stylesheets/icomoon")
        FileUtils.mkpath(File.join(target_dir, "stylesheets", "icomoon"))
      end
      "#{target_dir}/stylesheets/icomoon"
    end

  end
end

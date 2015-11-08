module IcomoonAsWell
  module FileHelper
    def parse_css(file)
      text = ""
			c = 0
			lines = file.split("\n")
			while c <= lines.count
				line = lines[c]
				c += 1
				if line.to_s =~ /^\.icon-(\S+):before\s*{\s*$/
					icon_name = "\$icon-#{$1}: "
					value = lines[c]
					c += 1
					icon_name.gsub!(/\s+/, '')
          value.gsub!(/^\s+/, '').gsub!(/content:/, '').gsub!(/["'\\\s\;]+/, '')
					text << "#{icon_name} '\\#{value}';\n"
				end
      end
			puts text
    end
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

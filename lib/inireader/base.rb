class IniReader
  def initialize( string = '')
    @section_hash = {}
    parse(StringIO.new(string))
  end

  def self.parse(filename)
    reader = IniReader.new
    reader.send(:parse, File.open(filename, "r"))
    return reader
  end

  #returns the hash for a section of the inifile
  def []( section_name )
    return @section_hash[section_name]
  end

  private
  def parse(io)
    current_section = nil
    io.each do |line|
      line = line.strip
      if line[0] == ';'
        next
      elsif ( matchdata = line.match(/^\[(.+)\]$/) ) != nil
        current_section = @section_hash[matchdata[1].to_sym] || {}
        @section_hash[matchdata[1].to_sym] = current_section
      elsif ( matchdata = line.match(/^([^=]*)=(.*)$/) )
        current_section[matchdata[1].to_sym] = matchdata[2].to_s
      elsif line.strip == ""
        next
      else
        raise Exception.new("Could not parse line: #{line}")
      end
    end
  end
end
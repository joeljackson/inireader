module IniReader
  class Base
    def initialize( string = '')
      @section_hash = {}
      parse(string)
    end

    #returns the hash for a section of the inifile
    def []( section_name )
      return @section_hash[section_name]
    end

    private
    def parse(string)
      io = StringIO.new(string)
      io.each do |line|
        if ( matchdata = line.match(/\[(.*)\]/) ) != nil
          @section_hash[matchdata[1].to_sym] = {}
        end
      end
    end

  end
end
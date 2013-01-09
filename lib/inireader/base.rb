module IniReader
  class Base
    def initialize( string = '')
      @section_hash = {}
    end

    #returns the hash for a section of the inifile
    def []( section_name )
      return @section_hash[section_name]
    end

    
  end
end
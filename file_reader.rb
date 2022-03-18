require 'json'

#Generic Filereader class to read all files paths passed to it
class FileReader
    def initialize(file, path: './data')
        @path = path
        @file = file + '.json'
        @datafile = @path +  @file 
    end

    def read
        file_content = [];
        if File.exists?(@datafile)
            JSON.parse(File.read(@datafile)).each do |line|
            file_content << line
        end
        
        return file_content;
    end
end
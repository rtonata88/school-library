require 'json'

#Generic Filereader class to read all files paths passed to it
class FileReader
    def initialize(filename, path: './data/')
        @datafile = path +  filename 
    end

    def read
        file_content = [];
        if File.exists?(@datafile)
            JSON.parse(File.read(@datafile)).each do |line|
            file_content << line
        end
    end
        return file_content;
    end
end
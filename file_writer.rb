require 'json'

#Generic FileWriter class which receives json content to write to a file
class FileWriter
    def initialize(file_content, filename, path: './data/')
        @file_content = file_content
        @datafile = path +  filename
    end

    def write
        File.open(@datafile, 'w') {|f| f.write(JSON.generate(@file_content))}
    end
end
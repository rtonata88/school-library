require 'json'

#Generic FileWriter class which receives json content to write to a file
class FileWriter
    def initialize(content_object, path: './data')
        @path = path
        @content_object = content_object
        @datafile = @path +  @file
    end

    def write
        File.open(@datafile + '.json', 'w') {|f| f.write(JSON.generate(@content_object))}
    end
end
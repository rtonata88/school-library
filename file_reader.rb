require 'json'

# Generic Filereader class to read all files paths passed to it
class FileReader
  def initialize(filename, path: './data/')
    @datafile = path + filename
  end

  def read
    file_content = []
    if File.exist?(@datafile)
      JSON.parse(File.read(@datafile)).each do |line|
        file_content << line
      end
    end
    file_content
  end
end

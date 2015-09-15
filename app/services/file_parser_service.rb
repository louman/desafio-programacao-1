require 'csv'

class FileParserService

  def initialize(file:)
    @file = file
  end

  def parse
    CSV.read(@file.path, { col_sep: "\t" })
  end

end
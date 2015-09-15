class FileDataFormatterService

  def initialize(data:)
    @data           = data
    @header         = @data.shift
    @formatted_data = []
  end

  def format
    @data.each do |data|
      line_hash = {}
      @header.each_with_index do |header, header_index|
        header_key = header.parameterize
        line_hash[header_key] = data[header_index]
      end
      @formatted_data << line_hash
    end
    @formatted_data
  end

end
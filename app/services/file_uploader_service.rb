class FileUploaderService

  include Loser

  attr_reader :upload

  def initialize(upload_params:, user:)
    @upload_params = upload_params.permit(:attachment).merge(user: user)
  end

  def upload_file
    Upload.transaction do
      @upload = Upload.new(@upload_params)
      @upload.save!
      import_data!(parse_file)
      true
    end
  rescue ActiveRecord::RecordInvalid
    lose 'Não foi possível realizar a importação, verifique o formato do arquivo.'
  end

  private

  def parse_file
    raw_data = FileParserService.new(file: File.open(@upload.attachment.path)).parse
    format_raw_data(raw_data)
  end

  def format_raw_data(raw_data)
    FileDataFormatterService.new(data: raw_data).format
  end

  def import_data!(data)
    FileDataImporterService.new(data: data, upload: @upload).import!
  end

end
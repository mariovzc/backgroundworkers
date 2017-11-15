class FileAnalyzerJob < ApplicationJob
  queue_as :default

  def perform(file_path, file_analysis)
    puts 'Iniciando job.....'
    file_analysis.update(status: :processing)
    # perform the file analysis
    csv = CSV.new(file.tempfile)
    csv.each do |row|
      sleep 5 # simulate heavy processing
      file_analysis.update(analyzed_rows: file_analysis.analyzed_rows + 1)
    end
    file_analysis.update(status: :finished)    
  end
end

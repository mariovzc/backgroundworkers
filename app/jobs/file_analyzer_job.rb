class FileAnalyzerJob < ApplicationJob
  queue_as :default

  def perform(file_path, file_analysis)
    puts 'Iniciando job.....'
    file_analysis.update(status: :processing)
    # perform the file analysis
    csv = CSV.read(file_path)
    csv.each do |row|
      sleep 5 # simulate heavy processing
      file_analysis.update(analyzed_rows: file_analysis.analyzed_rows + 1)
      Pusher.trigger("file-analysis-#{file_analysis.id}", 'update', file_analysis.as_json)      
    end
    file_analysis.update(status: :finished)    
  end
end

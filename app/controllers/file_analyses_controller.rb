require 'csv'

class FileAnalysesController < ApplicationController
  def create
    file = params[:file]

    file_analysis = FileAnalysis.create(filename: file.original_filename)

    # perform the file analysis
    csv = CSV.new(file.tempfile)
    file_analysis.update(status: :processing)
    csv.each do |row|
      sleep 5 # simulate heavy processing
      file_analysis.update(analyzed_rows: file_analysis.analyzed_rows + 1)
    end
    file_analysis.update(status: :finished)

    redirect_to file_analysis
  end

  def show
    @file_analysis = FileAnalysis.find(params[:id])
  end
end

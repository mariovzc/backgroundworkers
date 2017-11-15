require 'csv'

class FileAnalysesController < ApplicationController
  def create
    file = params[:file]

    file_analysis = FileAnalysis.create(filename: file.original_filename)
    FileAnalyzerjob.perform_later(file.temp_file.path, file_analysis)
    redirect_to file_analysis
  end

  def show
    @file_analysis = FileAnalysis.find(params[:id])
  end
end

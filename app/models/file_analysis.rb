class FileAnalysis < ApplicationRecord
  enum status: [:pending, :processing, :finished]  
end

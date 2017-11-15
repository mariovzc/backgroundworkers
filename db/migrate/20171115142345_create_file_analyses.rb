class CreateFileAnalyses < ActiveRecord::Migration[5.1]
  def change
    create_table :file_analyses do |t|
      t.string :filename
      t.integer :status, default: 0
      t.integer :analyzed_rows, default: 0
      t.timestamps
    end
  end
end

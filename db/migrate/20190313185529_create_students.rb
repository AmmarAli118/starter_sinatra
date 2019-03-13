class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |s|
      s.string :name
      s.integer :teacher_id
    end
  end
end

class CreatePrescriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :prescriptions do |t|
      t.belongs_to :appointment, foreign_key: true
      t.text :prescript  

      t.timestamps
    end
  end
end

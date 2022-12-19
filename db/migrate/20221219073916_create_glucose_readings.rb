class CreateGlucoseReadings < ActiveRecord::Migration[6.1]
  def change
    create_table :glucose_readings do |t|
      t.integer :level, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end

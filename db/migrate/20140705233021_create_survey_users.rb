class CreateSurveyUsers < ActiveRecord::Migration
  def change
    create_table :survey_users do |t|
		t.string :email_digest
		t.string :participant_type
		t.string :gender
		t.string :age
		t.string :education
		t.string :ms_type
		t.string :length_of_time
		t.string :care_for
		
      t.timestamps
    end
  end
end

class Survey < ActiveRecord::Base
	validates :marital_status, :employment, :pil1, :pil2, :pil3, :pil4, :pil5, :pil6, :pil7, :pil8, :pil9, :pil10, :pil11, :pil12, :pil13, :pil14, :pil15, :pil16, :pil17, :pil18, :pil19, :pil20, presence: true
	
	belongs_to :survey_user

	
	def self.PILqs
		[{stem: "I am usually", l: "completely bored", r: 		"exuberantly enthusiastic" },
		{stem: "Life to me seems", l: "completely routine", r: "always exciting" }, 
		{stem: "In life I have", l: "no goals or aims at all", r: "very clear goals and aims" },
		{stem: "My personal experience is", l: "utterly meaningless, without purpose", r: "very purposeful and meaningful"},
		{stem: "Every day is", l: "exactly the same", r: "completely new and different"},
		{stem: "If I could choose, I would", l: "prefer never to have been born", r: "want nine lives just like this one" },
		{stem: "After retiring, I would", l: "loaf completely for the rest of my life", r: "do some of the exciting things I've always wanted to do" },
		{stem: "In achieving life goals I have", l: "made no progress whatsoever", r: "progressed to complete fulfillment"},
		{stem: "My life is", l: "empty, filled only with despair", r: "running over with exciting good things" },
		{stem: "If I should die today, I'd feel that my life has been", l: "completely worthless", r: "very worthwhile"},
		{stem: "In thinking of my life, I", l: "often wonder why I exist", r: "always see reasons for being here"},
		{stem: "As I view the world in relation to my life, the world", l: "completely confuses me", r: "fits meaningfully with my life"},
		{stem: "I am a", l: "very responsible person", r: "very irresponsible person"},
		{stem: "Concerning freedom to choose, I believe humans are", l: "completely bound by limitations of heredity and environment", r: "totally free to make all life choices"},
		{stem: "With regard to death, I am", l: "unprepared and frightened", r: "prepared and unafraid"},
		{stem: "Regarding suicide, I have", l: "thought of it seriously as a way out", r: "never given it a second thought"},
		{stem: "I regard my ability to find a purpose or mission in life as", l: "practically none", r: "very great"},
		{stem: "My life is", l: "out of my hands and controlled by external factors", r: "in my hands and I'm in control of it"},
		{stem: "Facing my daily tasks is", l: "a painful and boring experience", r: "a source of pleasure and satisfaction"},
		{stem: "I have discovered", l: "no mission or purpose in life", r: "a satisfying life purpose"}]
	end

end

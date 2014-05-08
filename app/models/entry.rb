class Entry < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :weight, presence: true, :numericality => { :less_than_or_equal_to => 400 }
	validates :user_id, presence: true

	def self.from_users_followed_by(user)
      followed_user_ids = user.followed_user_ids
      where("user_id IN (?) OR user_id = ?", followed_user_ids, user)
    end

    #def self.chart_data
    #	total_weight = weight_by_day(3.weeks.ago)
    #	(3.weeks.ago.to_date..Date.today).map do |date|
    #		{
    #			created_at: date,
    #			weight: total_weight[date] || 0
    #		}
    #	end
    #end

    def self.weight_by_day
    	entries = Entry.select("created_at, weight").where(created_at: 3.weeks.ago.beginning_of_day..Time.zone.now).where( user_id: 1)
    end
end

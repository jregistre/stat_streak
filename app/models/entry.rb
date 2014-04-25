class Entry < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :weight, presence: true, :numericality => { :less_than_or_equal_to => 400 }
	validates :user_id, presence: true

	def self.from_users_followed_by(user)
      followed_user_ids = user.followed_user_ids
      where("user_id IN (?) OR user_id = ?", followed_user_ids, user)
    end
end

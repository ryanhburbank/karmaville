class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value
  belongs_to :user

  after_save :total_karma_update

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true

  private

  def total_karma_update
    user = User.find(self.user_id)
    user.update_attribute(:total_karma_points, user.sum_karma)
  end
end

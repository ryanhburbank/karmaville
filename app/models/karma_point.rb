class KarmaPoint < ActiveRecord::Base
  attr_accessible :user_id, :label, :value, :user
  belongs_to :user

  after_create :total_karma_update

  validates :user, :presence => true
  validates :value, :numericality => {:only_integer => true, :greater_than_or_equal_to => 0}
  validates :label, :presence => true

  def total_karma_update
    user = User.find(self.user_id)
    user.update_attributes(:total_karma => user.sum_karma)
  end
end

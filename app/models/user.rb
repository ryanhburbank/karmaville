class User < ActiveRecord::Base
  has_many :karma_points

  attr_accessible :first_name, :last_name, :email, :username, :total_karma

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :username,
            :presence => true,
            :length => {:minimum => 2, :maximum => 32},
            :format => {:with => /^\w+$/},
            :uniqueness => {:case_sensitive => false}

  validates :email,
            :presence => true,
            :format => {:with => /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/i},
            :uniqueness => {:case_sensitive => false}

  def self.by_karma
   self.order(:total_karma).reverse_order
  end

  def total_karma_points
   self.total_karma
  end

  def sum_karma
    karma_points.sum(:value)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.page(page)
    self.limit(10).offset(page.to_i*10)
  end
end

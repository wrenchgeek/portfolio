class Post <ActiveRecord::Base
  has_many :comments

  validates :name, :presence => true
  validates :content, :presence => true
end

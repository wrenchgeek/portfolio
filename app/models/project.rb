class Project < ActiveRecord::Base
  belongs_to :skill

  validates :title, :presence => true
  validates :description, :presence => true
  validates :url, :presence => true
end

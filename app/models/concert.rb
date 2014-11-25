class Concert < ActiveRecord::Base

  validates :date, :town, :country, :description, presence: true

end

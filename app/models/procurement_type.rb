class ProcurementType < ActiveRecord::Base
  has_many :announcements
end

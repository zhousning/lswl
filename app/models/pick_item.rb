class PickItem < ActiveRecord::Base
  validates_numericality_of :count, :only_integer => true, :greater_than_or_equal_to => 0 

  belongs_to :pick


  belongs_to :stock

  def add_count(count)
    update_attributes!(:count => count)
  end

end

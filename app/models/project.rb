class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :retrieval

  has_many :picks, :dependent => :destroy
  accepts_nested_attributes_for :picks, reject_if: :all_blank, allow_destroy: true

  STATE = %w(ongoing outbound)
  validates_inclusion_of :state, :in => STATE

  STATE.each do |state|
    define_method "#{state}?" do
      self.state == state
    end
  end

  def ongoing 
    update_attribute :state, Setting.projects.ongoing 
  end

  def outbound 
    if ongoing?
      update_attribute :state, Setting.projects.outbound
    end
  end

end

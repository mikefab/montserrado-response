class Person < ActiveRecord::Base
  has_and_belongs_to_many   :teams, :join_table => "people_teams"
  has_many :orgs, :through => :teams
  validates_email_format_of :email, :message => 'is not looking good'
  validates_presence_of :teams

  def full_name
  	"#{self.first_name} #{self.middle_name} #{self.last_name}"
  end

  def org
  	self.orgs.first
  end

end

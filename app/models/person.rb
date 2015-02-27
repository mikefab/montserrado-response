class Person < ActiveRecord::Base
  has_and_belongs_to_many     :teams,     :join_table => "people_teams"
  has_and_belongs_to_many     :positions, :join_table => "people_positions"
  has_many :orgs, :through => :teams

  #validates_email_format_of :email, :message => 'is not looking good'
  validates_presence_of :teams

  def full_name
  	"#{self.first_name} #{self.middle_name} #{self.last_name}"
  end

  def org
    # If a team is removed, a person still needs an org object
    self.orgs.first ? self.orgs.first : Struct.new(:name)
  end

  def org_name
    self.org.name.nil? ? 'none' : self.org.name.downcase
  end
end

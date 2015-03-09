class Team < ActiveRecord::Base
  belongs_to :org
  has_and_belongs_to_many :zones,  :join_table => "teams_zones"
  has_and_belongs_to_many :tasks,  :join_table => "tasks_teams"
  has_and_belongs_to_many :people, :join_table => "people_teams"
  has_and_belongs_to_many :orgs,   :join_table => "orgs_teams"
  validates_presence_of :name
  # validates_presence_of :org


  def ordered_people
	  self.people.all.order(last_name: :desc)
  end

  def people_positions

    #self.people.all.map{|p| {person_id: p.id, positions: p.positions.map(&:name).join(',')}}
    #self.people.all.map{|p| {p.id => p.positions.map(&:name).join(',')}}
    self.people.all.map.inject({}){|h, p| h[p.id] = p.positions.map(&:name).join(','); h}
  end

  def supporting_partners
    self.orgs.map{|o| {org: o, people: o.people}}
  end


  def ordered_people_no_contact
    self.people.all.each{|p| p.phone = nil, p.email = nil}
  end

  def supporting_partners_no_contact
    self.orgs.map{|o| {org: o, people: o.people.all.each{|p| p.phone = nil, p.email = nil}}}
  end

  def epi_codes
  	self.zones.map(&:epi_code)
  end
end

class Org < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :nick
  validates :nick, :uniqueness => true
  validates :name, :uniqueness => true
  has_and_belongs_to_many :teams,   :join_table => "orgs_teams"
  has_and_belongs_to_many :people,  :join_table => "orgs_people"

  def self.db_seed
    [
      ['Global Communities', 'GC', ''], 
      ['Medical Teams International', 'MTI', ''],
      ['iLab Liberia', 'iLab', ''],
      ['International Rescue Committee', 'IRC', ''],
      ['Action Contre La Faim', 'ACF', '']
   ].each do |a|
      Org.create!(name: a[0], nick: a[1], description: a[2])
    end
  end
end

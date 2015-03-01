class Org < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :nick
  validates :nick, :uniqueness => true
  validates :name, :uniqueness => true

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

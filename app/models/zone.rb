require 'rake'  
class Zone < ActiveRecord::Base
  has_and_belongs_to_many :teams, :join_table => "teams_zones"
  

  def self.zone_table
    [
      {'1100A2'   => 'Rehab/Borbor Town'},
      {'1100A1'   => 'Kemah Town/Omega'},
      {'1100B1'   => '72nd Community'},
      {'1100B2'   => 'Rock Hill'},
      {'1000' => 'Congo Town'},
      {'900'  => 'Old Road'},
      {'800'  => 'Lakpazee'},
      {'700'  => 'Sinkor'},
      {'600'  => 'Central Monrovia B'},
      {'500'  => 'Central Monrovia A'},
      {'400'  => 'West Point'},
      {'300'  => 'Clara Town'},
      {'200'  => 'Logan Town'},
      {'100'  => 'New Kru Town'},
      {'1200' => 'Gardnersville'},
      {'1300' => 'New Georgia'},
      {'1400' => 'Barnesville'},
      {'1600' => 'Caldwell'},
      {'1700' => 'St. Paul'},
      {'1800' => 'Common Wealth'},
      {'1900' => 'Careyburg'},
      {'2000' => 'Todee'}
    ]

  end

  def self.seed_data
    Zone.zone_table.each do |e|
      Zone.create!(epi_code: e.keys[0], cnam: e.values[0]) 
    end
  end

  def self.zone_hash
    Zone.zone_table.inject({}){|h, z| h[z.keys[0]] = z.values[0]; h}
  end
end

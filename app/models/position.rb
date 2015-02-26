class Position < ActiveRecord::Base
  has_and_belongs_to_many :people
  validates :name, :uniqueness => true
  def self.db_seed
    [
      'Com Liaison',
      'Monitor',
      'Program staff',
      'Psycho Officer',
      'Supervisor',
      'Zone manager'
    ].each do |task|
      Position.create!(name: task)
    end
  end

end

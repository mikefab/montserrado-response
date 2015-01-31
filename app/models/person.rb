class Person < ActiveRecord::Base
  has_and_belongs_to_many   :teams, :join_table => "people_teams"
  validates_email_format_of :email, :message => 'is not looking good'

end

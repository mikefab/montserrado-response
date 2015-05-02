require 'rails_helper'
require 'requests_helper'
require 'spec_helper'



describe 'Users' do
  it "allows admin user into rails admin" do
    user = User.create!(:email => 'a@a.com', :password => 'password!', role: 'admin')
    login(user)
    get '/admin'
    expect(response).to have_http_status(200)
  end

  it "does not allow viewer  user into rails admin" do
    user = User.create!(:email => 'a@a.com', :password => 'password!', role: 'viewer')
    login(user)
    get '/admin'
	  expect(response).to have_http_status(302)
  end  
end  

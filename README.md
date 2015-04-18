***Montserrado Response*** is a map of ebola response teams throughout Montserrado county in Liberia. Logged in users see contact information.

This app runs live at: http://montserrado-response.herokuapp.com.

***Install***

You must install Postgres (http://postgresapp.com/) 

    git clone https://github.com/mikefab/montserrado-response.git
    cd montserrado-response

Install gems
    bundle

Run migrations
    bundle exec rake db:migrate

Create user
    rails c
    User.create!(email: 'admin@example.com', password: 'your_own_password', role: 'admin')
RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.authorize_with :cancan
  config.current_user_method { current_user } 
  config.included_models = ['User', 'Task', 'Position', 'Org', 'Team', 'Person', 'Facility']

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'User' do
    list do
      field :first_name
      field :middle_name
      field :last_name
      field :phone
      field :email
      field :role
    end

    edit do
      field :first_name,  :string
      field :middle_name, :string
      field :last_name,   :string
      field :phone,       :string
      field :email,       :string
      field :role do
        partial 'roles_partial'
      end
    end
  end

end

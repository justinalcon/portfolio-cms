RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    bulk_delete
    edit 
    delete
    show
    show_in_app
    export

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'User' do
    edit do
      configure :sign_in_count do
        hide
      end
      configure :current_sign_in_at do
        hide
      end
      configure :current_sign_in_ip do
        hide
      end
      configure :last_sign_in_ip do
        hide
      end
      configure :remember_created_at do
        hide
      end
      configure :reset_password_sent_at do
        hide
      end
      configure :last_sign_in_at do
        hide
      end
      configure :current_sign_in_ip do
        hide
      end
      configure :sparks do
        hide
      end
      configure :session_token do
        hide
      end
      configure :password do
        hide
      end
      configure :password_confirmation do
        hide
      end
    end

    show do
      configure :sign_in_count do
        hide
      end
      configure :current_sign_in_at do
        hide
      end
      configure :current_sign_in_ip do
        hide
      end
      configure :last_sign_in_ip do
        hide
      end
      configure :remember_created_at do
        hide
      end
      configure :reset_password_sent_at do
        hide
      end
      configure :last_sign_in_at do
        hide
      end
      configure :current_sign_in_ip do
        hide
      end
      configure :sparks do
        hide
      end
      configure :session_token do
        hide
      end
    end

  end
end

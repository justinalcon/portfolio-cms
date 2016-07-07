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

  config.model 'ExpertiseOrganization' do
    visible false
  end

  config.model 'ExpertiseSpecialty' do
    visible false
  end

  config.model 'ExpertiseTechnology' do
    visible false
  end

  config.model 'OrganizationSpecialty' do
    visible false
  end

  config.model 'OrganizationTechnology' do
    visible false
  end

  config.model 'SpecialtyTechnology' do
    visible false
  end

  config.model 'ExpertiseProject' do
    visible false
  end

  config.model 'OrganizationProject' do
    visible false
  end

  config.model 'ProjectTechnology' do
    visible false
  end

  config.model 'ProjectSpecialty' do
    visible false
  end

  config.model 'Image' do
    visible false
  end

  config.model 'Technology' do
    configure :organization_technologies do
      hide
    end
    configure :expertise_technologies do
      hide
    end
    configure :specialty_technologies do
      hide
    end
    configure :project_technologies do
      hide
    end
  end

  config.model 'Specialty' do
    configure :specialty_technologies do
      hide
    end
    configure :organization_specialties do
      hide
    end
    configure :expertise_specialties do
      hide
    end
    configure :project_specialties do
      hide
    end
  end

  config.model 'Project' do
    configure :project_specialties do
      hide
    end
    configure :organization_projects do
      hide
    end
    configure :expertise_projects do
      hide
    end
    configure :project_technologies do
      hide
    end
  end

  config.model 'Organization' do
    configure :expertise_organizations do
      hide
    end
    configure :organization_technologies do
      hide
    end
    configure :organization_specialties do
      hide
    end
    configure :organization_projects do
      hide
    end
  end

  config.model 'Expertise' do
    configure :expertise_organizations do
      hide
    end
    configure :expertise_technologies do
      hide
    end
    configure :expertise_specialties do
      hide
    end
    configure :expertise_projects do
      hide
    end
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

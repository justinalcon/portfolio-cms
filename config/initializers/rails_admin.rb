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
    show_in_app do
      except ['Spark']
    end
    export do
      except ['Spark']
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.model 'Announcement' do
      visible false
  end
  
  config.model 'Image' do
    visible false
  end

  config.model 'SparkTag' do
    visible false
  end

  config.model 'Tag' do
    visible do
      bindings[:controller].current_user.role == User::ROLE_ADMIN 
    end
    edit do
      configure :sparks do
        hide
      end
      configure :spark_tags do
        hide
      end
    end

    list do
      configure :spark_tags do
        hide
      end 
    end
  
  end

  config.model 'Spark' do
    edit do
      field :title do
        label "Title*"
        help 'This displays in bold at the top of every Spark card. It should identify the content of the Spark at a glance. <ul><li><em>Good example:</em> Tilt Brush: 3D Painting in VR</li><li><em>Bad example:</em> Keep Earthquakes Weird</li></ul>Limit 50 characters.'.html_safe
        html_attributes do
          {:maxlength => 50}
        end
      end
      field :summary do
        label "Summary*"
        help 'This displays when the user mouses over the Spark card. It should provide the user enough information so that they can quickly make the decision whether or not clicking into the Spark detail will return information relevant to their current search.<ul><li><em>Good Example:</em> Use VR hand controllers to paint in 3D space.</li><li><em>Bad Example:</em> A campaign with Lucky Jeans</li></ul>Limit 100 characters.'.html_safe
        html_attributes do
          {:maxlength => 100, :rows => 3, :cols => 48}
        end
      end
      field :dev_notes do 
        help 'This field only displays if the logged in user is designated as a member of the tech team. Comments here should be exclusively tech or dev notes.<ul><li><em>Good Example:</em> "Upon inspecting  main.js, they\'re using EaselJS for canvas, and Greensock Timelines."</li></ul>'.html_safe
      end
      field :direct_link do 
        help 'The URL pointing to the web-hosted experience. If there\'s concern that the content may be temporary (i.e. ad campaigns), it\'s recommended to take time to record the experience and upload those images/video.'.html_safe
      end
      field :canned_video do
        help 'Here you can upload a canned video that will be visible to the app user. The canned video should capture the relevant portions of the experience (e.g. - animations, interactive elements, etc.).<br/><br/>Required video specs: <ul><li>.mp4 file-extension</li><li>h264 encoding</li><li>file-size 1-50MB.</li></ul>'.html_safe
      end
      field :video_url do
        help 'A URL for a Vimeo- or YouTube-hosted video.<ul><li><em>Good Example:</em> http://www.youtube.com/watch?v=-wtIMTCHWuI</li><li><em>Good Example:</em> https://vimeo.com/62092214</li></ul>'.html_safe
      end
      field :images do
        help 'We recommend that you upload at least one image for each Spark.<br/><br/>The image could be a screen capture of the experience, a hero image from the experience or some image that would otherwise be a good graphical representation of what makes this Spark interesting. The image will be displayed as the background of the Spark card.<br/><br/>Additional images can be uploaded if you think it will help give context to the Spark. These will be displayed in a carousel within the Spark.'.html_safe
      end
      field :longform, :ck_editor do 
        help 'Use this area to elaborate on why this content is relevant to 23 Stories, any potential concerns or adjustments that should be considered, etc. Feel free to include links to other relevant/supporting documentation, but don’t copy and paste published content here without citing and linking to the source.<br/><br/>(This field should not <u>only</u> be content pulled from other sources. It should be subjective and editorial.)'.html_safe
      end
      field :tags do
        inline_add false
        help '<br/>In order to optimize filtered views, use as many relevant tags as possible. Creating new tags is currently restricted. If a new tag needs to be created, please email the <a href="mailto:CNStudioTech@condenast.com">23 Stories Tech Team</a>.'.html_safe
      end 
      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
      field :published
    end

    list do
      configure :spark_images do
        hide
      end
      configure :spark_tags do
        hide
      end
      configure :users do
        hide
      end
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

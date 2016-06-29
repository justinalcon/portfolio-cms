¸.·´¯`·.´¯`·.¸¸.·´¯`·.¸><(((º>

  This is a place to store and view sparks (ideas)
        
# Deploying to the 23 Stories shared server (Ubuntu 14.04) - because the server is shared many if not all of these dependencies are likely already installed - these instructions are for starting from scratch
  
### rbenv / ruby
  
    $ sudo apt-get update
    $ sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
    $ cd
    $ git clone git://github.com/sstephenson/rbenv.git .rbenv
    $ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
    $ echo 'eval "$(rbenv init -)"' >> ~/.bashrc
    $ exec $SHELL
  
    $ git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    $ echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
    $ exec $SHELL
  
    $ git clone https://github.com/sstephenson/rbenv-gem-rehash.git ~/.rbenv/plugins/rbenv-gem-rehash
  
    $ rbenv install 2.2.3
    $ rbenv global 2.2.3
    $ ruby -vecho "gem: --no-ri --no-rdoc" > ~/.gemrc
    $ gem install bundler
  
### node
    $ sudo add-apt-repository ppa:chris-lea/node.js
    $ sudo apt-get update
    $ sudo apt-get install nodejs
  
### mysql
    $ sudo apt-get install mysql-server mysql-client libmysqlclient-dev
  
### memcached
    $ sudo apt-get install memcached
    
### imagemagick
    $ sudo apt-get install imagemagick
  
### get the code
    $ ssh-keygen -t rsa -b 4096 -C "developer@23stories.com"
    $ git clone REPO
    $ cd REPO
    $ bundle install
    $ RAILS_ENV=production rake assets:precompile
    $ RAILS_ENV=production rake db:create 
    $ RAILS_ENV=production rake db:migrate
    $ RAILS_ENV=production rake db:seed
  
### Apache
    $ sudo apt-get install apache2
  
### Passenger
    $ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
  
    $ sudo vi /etc/apt/sources.list.d/passenger.list
    $ i
    $ deb https://oss-binaries.phusionpassenger.com/apt/passenger trusty main
    $ :wq
  
    $ sudo chown root: /etc/apt/sources.list.d/passenger.list
    $ sudo chmod 600 /etc/apt/sources.list.d/passenger.list
    $ sudo apt-get update
    $ sudo apt-get install libapache2-mod-passenger
    $ sudo a2enmod passenger
    $ sudo service apache2 restart
  
  Edit /etc/apache2/mods-available/passenger.conf`:
  
    <IfModule mod_passenger.c>
        PassengerRoot /usr/lib/ruby/vendor_ruby/phusion_passenger/locations.ini
        PassengerDefaultRuby /home/$YOUR_HOME_DIRECTORY/.rbenv/shims/ruby
    </IfModule>
  
### configure apache
  
    $ sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/discovery.conf
    $ sudo vi /etc/apache2/sites-available/discovery.conf
   
    <VirtualHost *:80>
        ServerName cnstudiodev.com
        ServerAlias cms.discovery.cnstudiodev.com
        ServerAdmin CN_Studio_Infrastructure@condenast.com
        DocumentRoot /home/ubuntu/discovery/public
        RailsEnv production
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
        <Directory "/home/ubuntu/discovery/public">
            Options FollowSymLinks
            Require all granted
        </Directory>
    </VirtualHost>
  
    $ sudo a2dissite 000-default
    $ sudo a2ensite discovery
  
    $ sudo service apache2 restart            
          
# Develop on Mac OS X Yosemite
 
## Yosemite Dependencies
 
 1. Xcode
 2. git
 3. Homebrew
 4. rvm
 5. Ruby
 6. MySQL
 7. Node
 8. Imagemagick
 9. The Code
 
### Xcode
 
 You only need the Xcode Command Line Tools.
 
 The command line tools are `gcc`, `git` and `make`. Check if the full Xcode package is already installed:
 
 ```
 $ xcode-select -p
 ```
 
 If you see:
 
 ```
 /Applications/Xcode.app/Contents/Developer
 ```
 
 the full Xcode package is already installed. If this not the case, refer to http://railsapps.github.io/installrubyonrails-mac.html
 for more information on upgrading XCode.
 Use the Mac App Store application to find and install Xcode.  Immediately upgrade to the latest version using the
 updates section of the App Store.
 
 Get Xcode command line tools.  Open terminal and execute the command `xcode-select --install`
 
### Git
 
 Check that git is installed:
 
 `$ git version`
 
 should produce:
 
 ```
 git version 2.2.1 (Apple Git-55)
 ```
 higher versions are ok, git is backward compatible.
 
 Configure Git if you haven’t used it before. First, list the current settings with the `$ git config -l --global` command. Then set `user.name` and user.email if necessary:
 
 ```
 $ git config -l --global
 ```
 
 ```
 fatal: unable to read config file '/Users/.../.gitconfig': No such file or directory
 ```
 
 ```
 $ git config --global user.name "Your Real Name"
 ```
 
 ```
 $ git config --global user.email me@example.com
 ```
 
 ```
 $ git config -l --global
 ```
 
 ```
 user.name=Your Real Name
 ```
 
 ```
 user.email=me@example.com
 ```
 
 Now you should be ready to collaborate with peers through GIT
 
### Homebrew
 
 `$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
 
 Then you should see:
 
 ```
 ===> Installation successful!
 You should run 'brew doctor' *before* you install anything.
 ```
 
 Do what it says, run `$ brew doctor`
 
 Then you should see:
 
 ```
 Your system is ready to brew
 ```
 
### RVM
 
 If you already have a ruby version manager, you can use it at your own risk, rbenv is supported
 
 Install rvm:
 
 `$ \curl -sSL https://get.rvm.io | bash -s stable --ruby`
 
 
### Ruby 2.1.6
 
 Use rbenv to install ruby and set this version to global
 
 `$ rvm install 2.1.6`
 
 `$ rvm use 2.1.6`
 
 `$ ruby -v` should produce
 
 `ruby 2.1.6`
 
### Ruby Bundler

 Install if necessary

 `$ gem install bundler`

 Run bundler to download gem dependencies

 `$ bundle install`

### MySQL
 
 `$ brew install mysql`
 
### Node
 To install node.js on OSX 10.10 Yosemite  you can download a pre-compiled binary package which makes a nice and easy installation.
 
 Head over to [http://nodejs.org/](http://nodejs.org/) and click the install button to download the latest package
 
### Imagemagick

    $ brew install imagemagick
 
 
### The Code
 
 1. Fork https://bitbucket.org/cnstudiotech/discovery.git to your personal BitBucket account
 2. Clone your forked repo to your local computer (`$ git clone git@bitbucket.org:<YOUR_USERNAME>/discovery.git`)
 3. Add a remote for fetching upstream changes (`$ git remote add 23Stories git@bitbucket.org:cnstudiotech/discovery.git`)
 4. Install gem dependencies with bundler (`$ bundle install`)
 
##Running the code
 
 `$ mysql.server start`
 `$ rake db:create`
 `$ rake db:migrate`
 `$ rails s`
 
 To have the tests running, in a separate terminal:
 
 `$ bundle exec guard`
 
 You should now have the site up and running at [http://localhost:3000](http://localhost:3000)

### API

Always start by logging in the user with the POST /api/login endpoint, you will need the token from its response in subsequent calls

#### POST /api/login.json?email=USER_EMAIL&password=USER_PASSWORD

parameter `email` string - the email of the user to log in

parameter `password` string - the password of the user to log in


    STATUS `401` means that the username and password provided are not a match.

    STATUS `422` means that the request is not well formed please check your parameters.

    STATUS `200` means that you are good to go and has this response:

    `**/callback([{"message":"d995b6b901342d93f7460706fde5e8b3","user_role":"nontech"}])` (this is a session token, keep track of it in your app)

    possible values of user roles are `admin`, `tech`, or `nontech`

#### GET /tags.json?jsoncallback=callback&token=TOKEN_FROM_LOGIN

parameter `jsoncallback` string - name of method used as callback

parameter `token` string - this is the session token supplied by POST /api/login

    STATUS 200

    /**/callback(
      [
        {
          id: 1,
          tag: "billy"
        },
        {
          id: 2,
          tag: "justin"
        }
      ]
    )

#### GET /sparks.json?start=OFFSET&limit=LIMIT&tags=COMMA_SEPARATED_TAGS&jsoncallback=callback&token=TOKEN_FROM_LOGIN

parameter `start` integer - offset or records to skip default is 0 (optional)

parameter `limit` integer - number of records to return defualt is 10 (optional)

parameter `tags` string - comma separated list of tags to filter on defualt is all or * (optional)

parameter `jsoncallback` string - name of method used as callback

parameter `token` string - this is the session token supplied by POST /api/login


    STATUS 200

    /**/callback(
    [
    {
      id: 7,
      title: "jsutin 5",
      summary: "",
      dev_notes: "",
      direct_link: "",
      canned_video: {
        url: null
      },
      created_at: "2016-02-18T17:57:08.000Z",
      updated_at: "2016-02-18T17:57:08.000Z",
      user_id: 2,
      published: false,
      longform: "",
      video_url: "",
      tags: [
      {
        id: 2,
        tag: "justin"
      },
      {
        id: 1,
        tag: "billy"
      }
      ],
      images: [
              {
                id: 1,
                location: {
                  url: "/uploads/image/location/1/20142126-600.jpg",
                  four_hundred_by_three_hundred: {
                    url: "/uploads/image/location/3/four_hundred_by_three_hundred_awesome.jpg"
                  }
                }
              }
           ]
      }],
      user: {
        id: 1,
        email: "lddewis@email.com",
        created_at: "2016-02-11T21:27:12.000Z",
        updated_at: "2016-02-29T19:27:07.000Z",
        role: "admin",
        username: "Lewis",
        session_token: "ragrqgregeqrgqe"
      }
    )

#### GET /sparks/{id}.json?&jsoncallback=callback&token=TOKEN_FROM_LOGIN

parameter `id` integer - the id of the spark that you would like to get

parameter `jsoncallback` string - name of method used as callback

parameter `token` string - this is the session token supplied by POST /api/login

    STATUS 404 means that a spark with the passed id does not exist

    STATUS 200 returns:

    /**/ callback({
      id: 1,
      title: "wefwef",
      summary: "efwfewf",
      dev_notes: "ewfewfwfe",
      direct_link: "http://direct-link.com",
      canned_video: {
        url: "/uploads/spark/canned_video/1/toystory.mp4"
      },
      created_at: "2016-02-12T17:11:03.000Z",
      updated_at: "2016-02-16T16:58:51.000Z",
      user_id: 1,
      published: true,
      longform: "<p><strong>&nbsp;wefqfwefwe &nbsp;<em><u>wefwefwfwf</u></em></strong></p> ",
      video_url: "http://green.com/video.mp4",
      tags: [{
        id: 1,
        tag: "Lewis"
      }],
      images: [{
        id: 2,
        location: {
          url: "/uploads/image/location/2/Lincoln_Email_rsvep.png",
          four_hundred_by_three_hundred: {
            url: "/uploads/image/location/3/four_hundred_by_three_hundred_awesome.jpg"
          }
        }
      }, {
        id: 1,
        location: {
          url: "/uploads/image/location/1/20142126-600.jpg",
          four_hundred_by_three_hundred: {
            url: "/uploads/image/location/3/four_hundred_by_three_hundred_awesome.jpg"
          }
        }
      }],
      user: {
        id: 1,
        email: "lddewis@email.com",
        created_at: "2016-02-11T21:27:12.000Z",
        updated_at: "2016-02-29T19:27:07.000Z",
        role: "admin",
        username: "Lewis",
        session_token: "ragrqgregeqrgqe"
      }
    }
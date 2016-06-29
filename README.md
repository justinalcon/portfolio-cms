¸.·´¯`·.´¯`·.¸¸.·´¯`·.¸><(((º>

  This is the CMS that controls the portfolio front end
        
# Deploying to Ubuntu 14.04
  
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
    FORK THIS REPOSITORY
    $ ssh-keygen -t rsa -b 4096 -C "justin@justinalcon.com"
    $ git clone YOUR FORK
    $ cd portfolio-cms
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
  
    $ sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/portfolio-cms.conf
    $ sudo vi /etc/apache2/sites-available/portfolio-cms.conf
   
    <VirtualHost *:80>
        ServerName yourportfolio.com
        ServerAlias yourportfolio.com
        ServerAdmin justin@justinalcon.com
        DocumentRoot /home/ubuntu/portfolio-cms/public
        RailsEnv production
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
        <Directory "/home/ubuntu/portfolio-cms/public">
            Options FollowSymLinks
            Require all granted
        </Directory>
    </VirtualHost>
  
    $ sudo a2dissite 000-default
    $ sudo a2ensite portfolio-cms
  
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
 
 1. Fork this repository
 2. Clone your forked repo to your local computer
 4. Install gem dependencies with bundler (`$ bundle install`)
 
##Running the code
 
 `$ mysql.server start`
 `$ rake db:create`
 `$ rake db:migrate`
 `$ rails s`
 
 To have the tests running, in a separate terminal:
 
 `$ bundle exec guard`
 
 You should now have the site up and running at [http://localhost:3000](http://localhost:3000)


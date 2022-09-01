# README

gem install faker

Add
$ rails new example-project -T -d=postgresql --api
$ bundle add active_model_serializers
gem 'jwt', '~> 2.2'

Uncomment
gem "rack-cors"
gem "bcrypt", "~> 3.1.7"

Create User Model
rails g resource user username password_digest --no-test-framework
rails db:migrate

Error Handling
In config/environments/development.rb
config.hosts.clear

Authorization and Authentication setup with JWT
https://github.com/Dane-Dawson/logintemp-backend
https://github.com/marcmajcher/ffv-backend

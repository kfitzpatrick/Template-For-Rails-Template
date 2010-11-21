ENV["RAILS_ENV"] ||= 'test'
require File.expand_path(File.join(File.dirname(__FILE__),'..','config','environment'))
require 'spec/autorun'
require 'spec/rails'
require 'remarkable_rails'
require 'contextually'

Dir[File.expand_path(File.join(File.dirname(__FILE__),'support','**','*.rb'))].each {|f| require f}

Spec::Runner.configure do |config|
  config.use_transactional_fixtures = true
  config.use_instantiated_fixtures  = false
  config.fixture_path = RAILS_ROOT + '/spec/fixtures/'
  config.include Devise::TestHelpers, :type => :controller
end

Contextually.define do
  roles :guest, :user
  
  before :user do
    @user = mock_user
    User.stub!(:find).and_return(@user)
    sign_in @user
  end
    
  deny_access do
    should_redirect_to { new_user_session_path :unauthenticated => true } 
  end
  
  before :guest do
    sign_out :user
  end
end
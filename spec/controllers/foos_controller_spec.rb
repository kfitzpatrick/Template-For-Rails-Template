require File.dirname(__FILE__) + '/../spec_helper'

describe FoosController do
  mock_models :foo, :user
  
  context "user is logged in" do

    only_as :user, :get => :index do
      should_render_template :index
    end

    only_as :user, :get => :show, :id => "foo" do 
      expects :find, :on => Foo, :with => "foo", :returns => mock_foo 
      should_render_template :show
    end

    only_as :user, :get => :new do
      should_render_template :new
    end

    only_as :user, :post => :create do
      expects :new, :on => Foo, :returns => mock_foo 
      expects :save, :on => mock_foo, :returns => false  
      should_render_template :new
    end

    only_as :user, :post => :create, :foo => "bar" do
      expects :new, :on => Foo, :with => "bar", :returns => mock_foo 
      expects :save, :on => mock_foo, :returns => true  
      should_redirect_to { foo_path(mock_foo) }
      should_assign_to :foo, :with => mock_foo
    end

     only_as :user, :get => :edit, :id => "foo"  do
       expects :find, :on => Foo, :returns => mock_foo
       should_render_template :edit
     end

    only_as :user, :put => :update, :id => "foo" do
      expects :find, :on => Foo, :returns => mock_foo
      expects :update_attributes, :on => mock_foo, :returns => false  
      should_render_template :edit 
    end

     only_as :user, :put => :update, :id => "foo", :foo => "bar" do
       expects :find, :on => Foo, :returns => mock_foo
       expects :update_attributes, :on => mock_foo, :with => "bar", :returns => true
       should_redirect_to { foo_path(mock_foo) } 
     end

     only_as :user, :delete => :destroy, :id => "foo" do
       expects :find, :on => Foo, :returns => mock_foo
       expects :destroy, :on => mock_foo
       should_redirect_to { foos_path }
     end
  end
end
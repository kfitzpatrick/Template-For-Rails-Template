  require File.dirname(__FILE__) + '/../spec_helper'

describe FoosController do
  mock_models :foo

  describe :get => :index do
    should_render_template :index
  end

  describe :get => :show, :id => "foo" do 
    expects :find, :on => Foo, :with => "foo", :returns => mock_foo 
    should_render_template :show
  end

  describe :get => :new do
    should_render_template :new
  end

  describe :post => :create do
    expects :new, :on => Foo, :returns => mock_foo 
    expects :save, :on => mock_foo, :returns => false  
    should_render_template :new
  end

  describe :post => :create, :foo => "bar" do
    expects :new, :on => Foo, :with => "bar", :returns => mock_foo 
    expects :save, :on => mock_foo, :returns => true  
    should_redirect_to { foo_path(mock_foo) }
    should_assign_to :foo, :with => mock_foo
  end

   describe :get => :edit, :id => "foo"  do
     expects :find, :on => Foo, :returns => mock_foo
     should_render_template :edit
   end

  describe :put => :update, :id => "foo" do
    expects :find, :on => Foo, :returns => mock_foo
    expects :update_attributes, :on => mock_foo, :returns => false  
    should_render_template :edit 
  end

   describe :put => :update, :id => "foo", :foo => "bar" do
     expects :find, :on => Foo, :returns => mock_foo
     expects :update_attributes, :on => mock_foo, :with => "bar", :returns => true
     should_redirect_to { foo_path(mock_foo) } 
   end

   describe :delete => :destroy, :id => "foo" do
     expects :find, :on => Foo, :returns => mock_foo
     expects :destroy, :on => mock_foo
     should_redirect_to { foos_path }
   end
end

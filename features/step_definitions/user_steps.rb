Given /^a user with the email address "([^"]*)"$/ do |email_address|
  Factory :user, :email => email_address
end
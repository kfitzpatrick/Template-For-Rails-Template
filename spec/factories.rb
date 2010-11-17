Factory.define :user do |u|
  u.email "person@example.com"
  u.password "test123"
  u.password_confirmation {|user| user.password }
end
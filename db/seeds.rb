user = User.new(
  :email                 => "test@test.com",
  :password              => "test123",
  :password_confirmation => "test123"
)
user.skip_confirmation!
user.save!
user.profile = Profile.new(
  candidate: 'Jill Stein',
  state: 'Ohio',
  completed: true
)
user.profile.save!

user2 = User.new(
  :email                 => "test2@test.com",
  :password              => "test123",
  :password_confirmation => "test123"
)
user2.skip_confirmation!
user2.save!
user2.profile = Profile.new(
  candidate: 'Gary Johnson',
  state: 'Florida',
  completed: true
)
user2.profile.save!

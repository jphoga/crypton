namespace :user_seed do
  desc "TODO"
  task update: :environment do

    10.times do User.create!(
        password: '123456',
        email: Faker::Name.first_name + '@coinspread.org',
        username: Faker::Name.first_name,
        photo: 'https://kitt.lewagon.com/placeholder/users/random'
      )
    end
  end
end

namespace :new_seed do
  desc "TODO"
  task update: :environment do
    posts = Post.all
    u = User.all

    10.times do
      posts.each do |post|
        p post.upvote_by u.sample
      end
    end
  end
end

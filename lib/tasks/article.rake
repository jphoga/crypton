namespace :article do
  desc "Create articles from News APIs"
  task create_from_api: :environment do
    NewsApiJob.perform_later
  end
end

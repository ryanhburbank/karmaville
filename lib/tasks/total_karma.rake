namespace :seed do
  desc 'Sum total karma points for each user'
    task :total_karma => :environment do
      User.find_each do |user|
        user.update_attribute(:total_karma, user.sum_karma)
      end
    end
end

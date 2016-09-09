# lib/tasks/add_cas_user.rake
namespace :db do
  desc 'Add a casuser'
  task :add_cas_user, [:cas_directory_id, :full_name] => :environment do |_t, args|
    cas_directory_id = args[:cas_directory_id]

    if !CasUser.find_by_cas_directory_id(cas_directory_id)
      CasUser.create!(cas_directory_id: args[:cas_directory_id], name: args[:full_name])
      puts "CasUser '#{cas_directory_id}' created!"
    else
      puts "CasUser '#{cas_directory_id}' already exists!"
    end
  end
end
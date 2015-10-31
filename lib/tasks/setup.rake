desc "Setup GameButler"
setup_task :setup do 
	puts "Hope you like this app as much as I do!"

	section "Database" do 
		silence do 
			Rake::Task["db:migrate"].invoke
			Rake::Task["db:the_role:admin"].invoke
			Rake::Task["db:seed"].invoke
		end
		done "Database"
	end
end
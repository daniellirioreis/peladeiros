namespace :cancan do
  desc 'Create admin profile'
  task :create_admin_profile => :create_roles do
    Profile.transaction do
      profile = Profile.find_or_create_by_name('Administrador')
      profile.roles = Role.all
    end
  end

  desc 'Purge roles'
  task :purge_roles => :environment do
    Role.transaction do
      Role.all.each do |role|
        begin
          "#{role.controller.camelize}Controller".constantize
        rescue NameError
          role.profiles.clear
          role.destroy
        end
      end
    end
  end

  desc 'Create roles'
  task :create_roles => :purge_roles do
    Role.transaction do
      yaml = YAML.load(File.open("#{Rails.root}/config/roles.yml"))

      yaml['actions'].each do |action|
        yaml['controllers'].each do |controller|
          if action == "create" || action == "read" || action == "update" || action == "destroy"
             if controller == 'linking_company'
               if action == "read"
                 Role.create(:controller => controller, :action => action)
                end
              else
                Role.create(:controller => controller, :action => action)                
              end
          else              
            if action == 'paid' and controller == 'accounts'
              Role.create(:controller => controller, :action => action)
            end

            if action == 'closed' and controller == 'games'
              Role.create(:controller => controller, :action => action)
            end

            if action == 'switch_to_company' and controller == 'linking_company'
              Role.create(:controller => controller, :action => action)
            end
          end
        end
      end
    end
  end
end

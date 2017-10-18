#Install AAR Application



# Get latest updates
apt_update 'update the apt cache daily' do
	frequency 86_400
	action :periodic
end

# install required applications

# Install unzip

	package 'unzip'

#Install curl

	package 'curl'

#Install apache2

	package 'apache2'

#Install mysql-server
   package 'mysql-server' 

execute 'change-pw' do
  command 'mysqladmin -u root password root'
end


#Install libacpache2-mod-wsgi

	package 'libapache2-mod-wsgi'

#TODO - combine above installs into one operation
#TODO - continue to refactoring into Ruby
#TODO - configure Guards
#TODO - variabilize
#TODO - break into recipes and create cookbook
#TODO - pass mysql password to install script

#Prepare for and download,install AAR Application

execute 'download_aar' do
  command 'wget -P /home/dbeers/chef-repo/aar https://github.com/colincam/Awesome-Appliance-Repair/archive/master.zip'
end

execute 'unzip_file' do
  command 'unzip /home/dbeers/chef-repo/aar/master.zip'
end

directory '/var/www/AAR' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'move_dir' do
  command 'cd /Awesome-Appliance-Repair-master/AAR;find . -print|cpio -pdumv /var/www/AAR'
end

#Move my hacked file

execute 'move_file' do
  command 'cp /home/dbeers/AARinstall_save_working.py /Awesome-Appliance-Repair-master/AARinstall.py'
end

filename = "AARinstall.py"
  execute 'run_aar_script' do
  cwd '/Awesome-Appliance-Repair-master'
  command "python #{filename}"
end

execute 'apachectl' do
  command 'apachectl graceful'
end

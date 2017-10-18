#Install mysql-server

package 'mysql-server' 


execute 'change-pw' do
  command 'mysqladmin -u root password root'
end

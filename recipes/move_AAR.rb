execute 'move_dir' do
  command 'cd /Awesome-Appliance-Repair-master/AAR;find . -print|cpio -pdumv /var/www/AAR'
end


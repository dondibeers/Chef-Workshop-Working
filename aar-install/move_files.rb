#execute "mv /home.dbeers/test" do
#  only_if { ::File.exist?("/home/dbeers/test") }
#  not_if { ::File.exist?("/tmp/dbeers") }
#end
execute 'move_dir' do
	command 'cd /home/dbeers/test;find . -print |cpio -pdumv /tmp/dbeers'
end

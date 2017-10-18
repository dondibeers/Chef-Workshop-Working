apt_update 'update the apt cache daily' do
	frequency 86_400
	action :periodic
end


package 'mongodb-org'

filename = "AARinstall.py"
 
execute 'run_aar_script' do
 cwd '/Awesome-Appliance-Repair-master'
 command "python #{filename}"
end

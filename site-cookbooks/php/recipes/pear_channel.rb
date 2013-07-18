include_recipe "php"
# discover the horde channel
php_pear_channel "pear.horde.org" do
  action :discover
end

# download xml then add the symfony channel
remote_file "#{Chef::Config[:file_cache_path]}/symfony-channel.xml" do
  source "http://pear.symfony-project.com/channel.xml"
  mode 0644
end
php_pear_channel "symfony" do
  channel_xml "#{Chef::Config[:file_cache_path]}/symfony-channel.xml"
  action :add
end

# update the main pear channel
php_pear_channel 'pear.php.net' do
  action :update
end

# update the main pecl channel
php_pear_channel 'pecl.php.net' do
  action :update
end

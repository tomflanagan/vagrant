include_recipe "php"
# upgrade a pear
php_pear "XML_RPC" do
  action :upgrade
end


# install a specific version
php_pear "XML_RPC" do
  version "1.5.4"
  action :install
end


# install the mongodb pecl
php_pear "mongo" do
  action :install
end

# install the xdebug pecl
php_pear "xdebug" do
  # Specify that xdebug.so must be loaded as a zend extension
  zend_extensions ['xdebug.so']
  action :install
end


# install apc pecl with directives
php_pear "apc" do
  action :install
  directives(:shm_size => 128, :enable_cli => 1)
end


# install the beta version of Horde_Url 
# from the horde channel
hc = php_pear_channel "pear.horde.org" do
  action :discover
end
php_pear "Horde_Url" do
  preferred_state "beta"
  channel hc.channel_name
  action :install
end


# install the YAML pear from the symfony project
sc = php_pear_channel "pear.symfony-project.com" do
  action :discover
end
php_pear "YAML" do
  channel sc.channel_name
  action :install
end


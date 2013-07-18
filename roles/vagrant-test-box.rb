# Name of the role should match the name of the file
name "vagrant-test-box"
override_attributes(
    "mysql" => {
        "server_root_password" => 'iloverandompasswordsbutthiswilldo',
        "server_repl_password" => 'iloverandompasswordsbutthiswilldo',
        "server_debian_password" => 'iloverandompasswordsbutthiswilldo'
    }
)
# Run list function we mentioned earlier
run_list(
    "recipe[build-essential]",
    "recipe[openssl]",
    "recipe[apache2]",
    "recipe[apache2::mod_php5]",
    "recipe[mysql]",
    "recipe[mysql::server]",
    "recipe[apache2::vhosts]",
    "recipe[php]",
#    "recipe[php::module_memcache]",
#    "recipe[php::module_apc]",
    "recipe[php::module_mysql]",
    "recipe[memcached]",
    "recipe[apache2::vhosts]"
    #"recipe[drush::make]"
)

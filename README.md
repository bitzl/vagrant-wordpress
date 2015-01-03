vagrant-wordpress
=================

A vagrant base box for Wordpress development.

Recommended use
---------------

To use import the base box, use

```
vagrant box add bitzl/wordpress
```

For plugin development, link the plugin directory into the wordpress installation. Add to your Vagrant file:

```ruby
config.vm.synced_folder "<myplugin>", "/var/www/wordpress/wp-content/plugins/<myplugin>"
```

For theme development, link the theme directory into the wordpress installation. Add to your Vagrant file:

```ruby
config.vm.synced_folder "<mytheme>", "/var/www/wordpress/wp-content/themes/<mytheme>"
```

The development system uses the following credentials:

 - Wordpress: admin/admin
 - MySQL: wordpress/wordpress, Database `wordpress`
 - MySQL-Root: root/root


Build yourself
--------------

Just clone this repository and run `vagrant up`.

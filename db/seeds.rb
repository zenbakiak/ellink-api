# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

%w[
  https://www.digitalocean.com/community/articles/how-to-install-rails-and-nginx-with-passenger-on-ubuntu
  https://www.digitalocean.com/community/articles/initial-server-setup-with-ubuntu-12-04
  https://www.digitalocean.com/community/articles/how-to-install-git-on-ubuntu-12-04
  https://www.digitalocean.com/community/articles/how-to-install-and-use-redis
  http://stackoverflow.com/questions/16028028/nokogiri-will-not-install-error-failed-to-build-gem-native-extension
  https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager
  http://www.modrails.com/documentation/Users%20guide%20Nginx.html
  http://codetheory.in/fixing-locale-warnings-notices-issues-on-linux-server-or-desktop/
  http://www.ubuntugeek.com/how-to-install-postgresql-9-2-on-ubuntu-server-using-ppa.html
  http://www.thegeekstuff.com/2011/07/install-nginx-from-source/
  https://www.digitalocean.com/community/articles/how-to-set-up-nginx-load-balancing
  https://www.digitalocean.com/community/articles/how-to-use-memcached-with-ruby-on-rails-on-ubuntu-12-04-lts
  https://www.digitalocean.com/community/articles/how-to-set-up-zero-downtime-rails-deploys-using-puma-and-foreman
  http://www.postgresql.org/docs/9.1/static/app-createuser.html
  http://customer.docushare.xerox.com/s.nl/ctype.KB/it.I/id.29969/KB.187/.f
  http://ruby-journal.com/how-to-setup-rails-app-with-puma-and-nginx/
  https://www.digitalocean.com/community/articles/how-to-set-up-multiple-ssl-certificates-on-one-ip-with-nginx-on-ubuntu-12-04
  https://www.digitalocean.com/community/tutorials/how-to-update-a-digitalocean-server-s-kernel-using-the-control-panel
].map do |url|
  Link.create(url: url)
end

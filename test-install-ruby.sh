#!/bin/sh

echo "Setting up testuser rbenv environment."
(echo 'export PATH="$HOME/.rbenv/bin:$PATH"'
 echo 'eval "$(rbenv init -)"') | sudo tee -a  /Users/testuser/.bash_profile >/dev/null

echo "Logging in as testuser."
sudo -i -u testuser /bin/bash <<- EOF
  # install ruby using rbenv
  echo "Installing and setting up Ruby 2.2.3. This will take a long while."
  rbenv install 2.2.3
  # make the ruby we use the rbenv ruby (not system ruby)
  rbenv global 2.2.3
  # make absolute sure our shell is up to date and using the right ruby
  # this is almost certainly redundant
  rbenv rehash

  echo 'gem: --no-ri --no-rdoc' > ~/.gemrc

  echo "Installing Bundler."
  gem install bundler

  echo "Installing Jekyll."
  # install jekyll (it will install with current ruby)
  gem install jekyll

  # be sure the shell is up to date
  source ~/.bash_profile

  # make sure these work the way they're supposed to
  echo "Checking installation of Ruby and Jekyll."
  echo "Ruby should be 2.2.3 (not 2.0.0!)."
  ruby -v
  echo "Jekyll should be installed at all."
  jekyll -v

  echo "If everything has gone according to plan, you now have a working Ruby and Jekyll installation."

EOF

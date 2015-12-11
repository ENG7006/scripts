#!/bin/sh

sudo -i -u testuser <<- EOF
  echo "Home is:"
  echo $HOME
  echo "Tilde is:"
  echo ~
  echo 'gem: --no-ri --no-rdoc' >> ~/.gemrc
EOF

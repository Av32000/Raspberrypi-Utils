#!/bin/bash
verbose=false
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
if [[ "$1" == "-v" ]]
  then echo "Verbose mode enabled"
  verbose=true
elif [[ -n "$1" ]]
  then echo "Invalid argument : $1"
  exit
fi
echo "Added node sources to package repositories..."
if [ $verbose = true ]
  then curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
else
  nolog=$(curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -)
fi
echo "Installing nodejs..."
if [ $verbose = true ]
  then apt-get install -y nodejs
else
  nolog=$(apt-get install -y nodejs)
fi
echo "Updating npm..."
if [ $verbose = true ]
  then npm install -g npm@latest
else
  nolog=$(npm install -g npm@latest)
fi
echo "Installation completed !"
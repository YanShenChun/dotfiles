if [ "$1" = "" ]; then
  echo "Please specify the [g++/gcc] version number."
  exit 1
fi

echo "The switched version is $1"

sudo rm -f /usr/bin/gcc
sudo ln -s /usr/bin/gcc-$1 /usr/bin/gcc
sudo rm -f /usr/bin/g++
sudo ln -s /usr/bin/g++-$1 /usr/bin/g++

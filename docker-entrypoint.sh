#!/bin/sh

# Checks for USER variable
if [ -z "$USER" ]; then
  echo >&2 'Please set an USER variable (ie.: -e USER=marcelo).'
  exit 1
fi

# Checks for PASSWORD variable
if [ -z "$PASSWORD" ]; then
  echo >&2 'Please set a PASSWORD variable (ie.: -e PASSWORD=str0ngPass12345*&!).'
  exit 1
fi

echo "Creating user ${USER}"
adduser -D --no-create-home ${USER}

echo "Setting password"
echo "${USER}:${PASSWORD}" | chpasswd

chown ${USER}:${USER} /mnt
chmod 550 /mnt

exec "$@"

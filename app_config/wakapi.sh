git clone https://github.com/muety/wakapi.git

#!/bin/bash

# Prompt user for the secret value
read -p "Enter value for WAKAPI secrets (e.g., changeme): " secret

# Create or overwrite the .env file
cat <<EOF >.env
WAKAPI_PASSWORD_SALT=$secret
WAKAPI_DB_PASSWORD=$secret
WAKAPI_MAIL_SMTP_PASS=$secret
EOF

echo ".env file created with provided secret."

docker compose up -d

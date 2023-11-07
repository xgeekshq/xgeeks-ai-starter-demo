#! /bin/sh

# include github.com/gabtec/shell-h
source /dev/stdin  <<< "$(curl -s https://raw.githubusercontent.com/gabtec/shell-h/main/lib/helpers.sh)"

# --- Banner ---
print_banner "Geekathon 2023" 86

## NODE
NODE_V=$(node --version | cut -d "v" -f 2)
if [ $? -eq 0 ]; then 
  log ok "NodeJS found in version v$NODE_V "
fi

PYTHON_V=$(python3 --version | cut -d " " -f 2)
if [ $? -eq 0 ]; then 
  log ok "Python found in version v$PYTHON_V "
fi

# ---- install ----
log info "Installing dependencies..."
npm install

# bypass auth for local dev
sed -i "" "s#<UserProvider>#{/* <UserProvider> */}#" src/app/layout.tsx
sed -i "" "s#</UserProvider>#{/* </UserProvider> */}#" src/app/layout.tsx

sed -i "" "s#const { user, error, isLoading } = useUser();#// const { user, error, isLoading } = useUser();\nlet user = { name: \"Guest\" };#" src/app/page.tsx
sed -i "" "s#if (isLoading) return <div>Loading...</div>;#// if (isLoading) return <div>Loading...</div>;#"  src/app/page.tsx
sed -i "" "s#if (error) return <div>{error.message}</div>;#// if (error) return <div>{error.message}</div>;#"  src/app/page.tsx

# create .env.local if not already existent
if ! [ -f /.env.local ]; then
  log info "Creating local .env file..."
  cp .env.local.example .env.local
  # generate a random secret
  # AUTH0_SECRET=$(openssl rand -hex 32)
  # echo "\nAUTH0_SECRET=\"${AUTH0_SECRET}\"" >> ./.env.local
fi

log warn "Please edit \".env.local\" file with your own data values."
code .env.local

exit 0
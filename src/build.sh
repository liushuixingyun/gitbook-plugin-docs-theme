#! /bin/bash

# Cleanup folder
rm -rf _assets

# Recreate folder
mkdir -p _assets/website/
mkdir -p _assets/ebook/

# Compile Website CSS
./node_modules/.bin/lessc -clean-css --include-path=$(node -e "console.log(require('gitbook-styleguide').less.paths.join(':'))") src/less/website.less _assets/website/style.css

# Compile eBook CSS
./node_modules/.bin/lessc -clean-css src/less/ebook.less _assets/ebook/ebook.css

# Copy styleguide
cp -R node_modules/gitbook-styleguide/assets/ _assets/website/

echo 'end'

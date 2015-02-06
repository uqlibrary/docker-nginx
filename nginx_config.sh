#!/bin/bash

# Temporary test
mkdir -p /data/www/public

cat > /data/www/public/test.php << EOF
<?php
phpinfo();

EOF

cat > /data/www/public/test.txt << EOF
Test

EOF
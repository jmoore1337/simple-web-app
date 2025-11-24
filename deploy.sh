#!/bin/bash
echo "Deploying application..."
sudo systemctl start httpd || sudo yum install httpd -y && sudo systemctl start httpd
sudo systemctl enable httpd
sudo cp index.html /var/www/html/
echo "Deployment complete!"
#!/bin/bash

# Initialize Terraform
echo "Initializing Terraform..."
terraform init

# Define a list of customers
customers=("apple" "google" "twitter")

 # Loop through customers
for c in "${customers[@]}"; do
    echo "Selecting workspace: $c"
    #Uncomment the following line to select the Terraform workspace
     terraform workspace select $c

    echo "Destroying resources for $c"
    # Uncomment the following line to destroy resources (use -auto-approve if you want to skip confirmation)
     terraform destroy -var-file="$c.tfvars" -auto-approve
done

echo "Script completed."

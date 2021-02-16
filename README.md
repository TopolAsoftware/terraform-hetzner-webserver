# TopolA MS application installed at Hetzner Cloud Server with Terraform

## Goal

My goal is to create a server for the TopolA MS software package. To get it, I get a Hetzner Cloud service.
I want to run a server running Linux like Debian10 with websoft Apache2 installed.
A standard default installation with minimal user settings will suffice.

At the end of the installation, I will install the software I need.
If you wish, you can install the software you need at the last step by replacing
the data in the user-data section of the cloud-init script. 

I will deploy the entire system using [Terraform CLI](https://www.terraform.io/downloads.html).

## PreRequest

- Pre-registered domain at Hetzner DNS service.

  First you need a registered domain zone added to the Hetzner DNS provider.
  You will have to configure your domain in the Hetzner DNS console
  and get an API Token there for automatic zone management.

- Hetzner Cloud Account

  You have to get Project API token from Hetzner Clous Console and API Token.

- Pair of SSH keys.

  We use the same ssh public key for both -  root and web-admin accounts.
  You can use registered at Hetzner ssh public key or just generate it
  locally. For this propose you can use [scripts/gen_ssh.sh](./scripts/).

- Terraform CLI

  Install Terraform CLI latest version from [Terraform CLI](https://www.terraform.io/downloads.html).
 

## Install Server

Clone this repository to your work directory.

`git clone https://github.com/TopolAsoftware/terraform-hetzner-webserver.git`
  
Edit file terraform.tfvars and add your values.

Take a look at userdata files at topola-userdata/user-data/ :
    topola.yaml
    70_webapp.sh

  if you want install your own software replace 70_webapp.sh to yuor content.

Run next commands

```sh
terraform init
terraform plan
terraform apply
```



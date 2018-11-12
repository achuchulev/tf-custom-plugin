# Terraform custom plugin installation

#### The purpose of the repo is to provide guidence on how to install custom plugins in Terraform. In this example the [terraform-provider-extip](https://github.com/petems/terraform-provider-extip) custom plugin is used to determine what external IP address we have.

### Requirements

* git
* vagrant
* virtualbox

## How to install

#### Download the repo and go to the repo directory

```
git clone https://github.com/achuchulev/tf-custom-plugin.git
cd tf-custom-plugin/
```

#### Run Vagrant VM

Run command: `vagrant up`

* `vagrant up` will execute script that provision *golang-1.10* and *terraform*

#### Compile a custom plugin, that 

```
vagrant ssh 
go get github.com/petems/terraform-provider-extip
cd ~/go/src/github.com/petems/terraform-provider-extip
make build
ls -al ~/go/bin/
```

#### Copy the custom plugin to the required path

```
mkdir -p /vagrant/terraform.d/plugins/linux_amd64
cp ~/go/bin/terraform-provider-extip /vagrant/terraform.d/plugins/linux_amd64/
```

#### Test plugin

```
cd /vagrant
terraform init
terraform apply
```

Result should be similar to the one below:

```
$ terraform apply
data.extip.external_ip: Refreshing state...

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

external_ip = xxx.xxx.xxx.xxx
```

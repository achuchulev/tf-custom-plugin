# Terraform custom plugin installation

#### The purpose of the repo is to provide guidence on how to install custom plugins in Terraform. In this example the [terraform-provider-extip](https://github.com/petems/terraform-provider-extip) custom plugin is used to determine what external IP address we have. A Kitchen test is included.

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

`vagrant up`

##### It will execute provisioning script that install *golang-1.10*, *terraform* and all required packages for the test

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

#### Use plugin

```
cd /vagrant
terraform init
terraform apply
```

##### Result should be similar to the one below:

```
$ terraform apply
data.extip.external_ip: Refreshing state...

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

external_ip = xxx.xxx.xxx.xxx
```

## How to test

#### Install bundler

```
sudo gem install bundler
cd /vagrant
bundle install
```

#### Run the test:

`bundle exec kitchen test`

##### Successful test should be similar to the one below:

```
Profile: tests from {:path=>"/vagrant/test/integration/default"} (tests from {:path=>".vagrant.test.integration.default"})
Version: (not specified)
Target:  local://

  ✔  check_output: xxx.xxx.xxx.xxx
     ✔  xxx.xxx.xxx.xxx should not eq "127.0.0.1"
     ✔  xxx.xxx.xxx.xxx should not eq ""
     ✔  xxx.xxx.xxx.xxx should not eq "nil"


Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
Test Summary: 3 successful, 0 failures, 0 skipped
```

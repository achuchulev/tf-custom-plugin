terraform_extip = attribute(
  "terraform_extip",
  description: "The Terraform configuration under test must define an " \
  "terraform_extip",
)

control "check_output" do
  describe terraform_extip do
    it { should not eq "127.0.0.1" }
  end
end

external_ip = attribute (
  "external_ip",
  description: "The Terraform configuration under test must define an " \
  "terraform output",
)

control "check_output" do
  describe external_ip do
    it { should not eq "127.0.0.1" }
  end
end

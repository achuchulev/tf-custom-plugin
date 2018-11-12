external_ip = attribute(
  "external_ip",
  description: "The Test Kitchen configuration must map this attribute to the " \
  "'external_ip' output",
)

control 'check_output' do
  describe external_ip do
    it { should not eq "127.0.0.1" }
    it { should not eq "" }
    it { should not eq "nil" }
  end
end

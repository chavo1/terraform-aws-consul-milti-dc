describe command('terraform state list') do
  its('stdout') { should include "module.consul_sofia.aws_instance.client" }
  its('stderr') { should include '' }
  its('exit_status') { should eq 0 }
end
describe command('terraform state list') do
  its('stdout') { should include "module.consul_sofia.aws_instance.server" }
  its('stderr') { should include '' }
  its('exit_status') { should eq 0 }
end
describe command('terraform state list') do
  its('stdout') { should include "module.consul_varna.aws_instance.client" }
  its('stderr') { should include '' }
  its('exit_status') { should eq 0 }
end
describe command('terraform state list') do
  its('stdout') { should include "module.consul_varna.aws_instance.server" }
  its('stderr') { should include '' }
  its('exit_status') { should eq 0 }
end

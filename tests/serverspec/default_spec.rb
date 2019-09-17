require "spec_helper"
require "serverspec"

package = "emulators/qemu-user-static"
service = "qemu_user_static"
interpreters = %w[aarch64 arm armv6 armv7]

describe package(package) do
  it { should be_installed }
end

describe file("/etc/rc.conf.d/qemu_user_static") do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by "root" }
  it { should be_grouped_into "wheel" }
  its(:content) { should match(/# Managed by ansible/) }
end

describe service(service) do
  it { should be_enabled }
end

interpreters.each do |i|
  describe command "binmiscctl lookup #{i}" do
    its(:exit_status) { should eq 0 }
    its(:stderr) { should eq "" }
    its(:stdout) { should match(/^name:\s+#{i}$/) }
  end
end

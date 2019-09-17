require "spec_helper"
require "serverspec"

package = "qemu_user_static"
service = "qemu_user_static"
config  = "/etc/qemu_user_static/qemu_user_static.conf"
user    = "qemu_user_static"
group   = "qemu_user_static"
ports   = [PORTS]
log_dir = "/var/log/qemu_user_static"
db_dir  = "/var/lib/qemu_user_static"

case os[:family]
when "freebsd"
  config = "/usr/local/etc/qemu_user_static.conf"
  db_dir = "/var/db/qemu_user_static"
end

describe package(package) do
  it { should be_installed }
end

describe file(config) do
  it { should be_file }
  its(:content) { should match Regexp.escape("qemu_user_static") }
end

describe file(log_dir) do
  it { should exist }
  it { should be_mode 755 }
  it { should be_owned_by user }
  it { should be_grouped_into group }
end

describe file(db_dir) do
  it { should exist }
  it { should be_mode 755 }
  it { should be_owned_by user }
  it { should be_grouped_into group }
end

case os[:family]
when "freebsd"
  describe file("/etc/rc.conf.d/qemu_user_static") do
    it { should be_file }
  end
end

describe service(service) do
  it { should be_running }
  it { should be_enabled }
end

ports.each do |p|
  describe port(p) do
    it { should be_listening }
  end
end
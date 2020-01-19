require "spec_helper"
require "serverspec"

package = nil
command = "bundler"
extra_packages = []

case os[:family]
when "openbsd"
  package = "ruby25-bundler"
  command = "bundler25"
when "freebsd"
  package = "sysutils/rubygem-bundler"
when "ubuntu"
  package = "ruby-bundler"
when "redhat"
  package = "rubygem-bundler"
end

extra_packages.each do |p|
  describe package p do
    it { should be_installed }
  end
end

describe package(package) do
  it { should be_installed }
end

describe command "#{command} --version" do
  its(:exit_status) { should eq 0 }
end

require 'serverspec'

USER = "vagrant"
PATH = "/opt/rbenv/bin:/opt/rbenv/shims:$PATH";

# Required by serverspec
set :backend, :exec
set :path, PATH

RSpec.configure do |c|
  user    = USER
end

# Java 7
describe command('which java') do
  its(:stdout) { should match 'usr/bin/java' }
end

describe command('java -version') do
  its(:stdout) { should match '1.7.0_75' }
end

# Postgres
describe service('postgresql') do
  it { should be_running }
end

# IntelliJ IDEA
describe command('ls | grep idea') do
  its(:stdout) { should match 'idea-IC-14.1.1' }
end

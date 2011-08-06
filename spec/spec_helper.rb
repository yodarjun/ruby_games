require 'rspec'
require 'benchmark'
require 'shoulda'
require 'shoulda/integrations/rspec'
Rspec.configure do |config|
  config.before(:all) do
    @reports = []
  end
  config.after(:all) do
    @reports.each do |report|
      puts ''
      puts report
    end
  end
end

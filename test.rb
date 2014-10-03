require 'rubygems'
require 'appium_lib'
require 'sauce_whisk'
require 'json'
require 'rest_client'


SAUCE_USERNAME   = ENV['SAUCE_USERNAME']
SAUCE_ACCESS_KEY = ENV['SAUCE_ACCESS_KEY']

# This is the test itself
describe 'Computation' do
  before(:each) do
    Appium::Driver.new(desired_caps).start_driver
    Appium.promote_appium_methods RSpec::Core::ExampleGroup
  end

  after(:each) do
    # Get the success by checking for assertion exceptions,
    # and log them against the job, which is exposed by the session_id
    job_id = send(:bridge).session_id
    update_job_success(job_id, example.exception.nil?)
    driver_quit
  end

  it 'just sample' do
    puts 'in description'
    # nothing
  end

end

def desired_caps
  { caps:
      {
        'appium-version' => '1.2.0',
        platformName:    'iOS',
        platformVersion: '7.1',
        deviceName:      'iPhone Simulator',
        app:             'build/Debug-iphonesimulator/sampleCaptureForIos.app',
        name:            'test for Appium'
      }
  }
end

def auth_details
  un = SAUCE_USERNAME
  pw = SAUCE_ACCESS_KEY

  unless un && pw
    STDERR.puts <<-EOF
      Your SAUCE_USERNAME or SAUCE_ACCESS_KEY environment variables 
      are empty or missing.
      
      You need to set these values to your Sauce Labs username and access
      key, respectively.

      If you don't have a Sauce Labs account, you can get one for free at
      http://www.saucelabs.com/signup
    EOF

    exit
  end

  return "#{un}:#{pw}"
end

def server_url
  "http://#{auth_details}@ondemand.saucelabs.com:80/wd/hub"
end

def rest_jobs_url
  "https://#{auth_details}@saucelabs.com/rest/v1/#{SAUCE_USERNAME}/jobs"
end

# Because WebDriver doesn't have the concept of test failure, use the Sauce
# Labs REST API to record job success or failure
def update_job_success(job_id, success)
  RestClient.put "#{rest_jobs_url}/#{job_id}", { 'passed' => success }.to_json, :content_type => :json
end

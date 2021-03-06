require "spec_helper"
require 'puppi'

describe "Puppi::Notification" do
  
  before(:each) do
    @loader = Puppi::Loader.new
  end

  it "should show raise exception when a unknown method is specified" do
    expect { Puppi::Notification.new(['unknown'], 'output') }.to raise_error(RuntimeError)
  end
  
  it "should use stdout notification method when no one is specified" do
    Puppi::Notification.new([], 'output').notify_methods.should include('stdout')
  end

  it "should use stdout notification method when specified" do
    Puppi::Notification.new(['stdout'], 'output').notify_methods.should include('stdout')
  end
    
  it "should use mail notification method when specified" do
    Puppi::Notification.new(['mail'], 'output').notify_methods.should include('mail')
  end
  
  it "should use mail and stdout notification methods when both are specified" do
    @notifications_used = Puppi::Notification.new(['mail', 'stdout'], 'output')
    @notifications_used.notify_methods.should include('mail')
    @notifications_used.notify_methods.should include('stdout')
  end
end
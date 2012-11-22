require "rack-request_time"
require "rack/lint"
require "rack/mock"
require "timecop"

describe Rack::RequestTime do
  let(:base_app) do
    lambda do |env|
      [200, {"Content-Type" => "text/plain"}, "HELLO"]
    end
  end
  let(:app) { Rack::Lint.new Rack::RequestTime.new(base_app) }

  def request
    app.call Rack::MockRequest.env_for
  end

  describe ".current" do
    before do
      @requested_at = Timecop.freeze(Time.current)
      request
    end
    subject { Rack::RequestTime.current }
    it { should == @requested_at }
  end

  context "called twice" do
    before do
      @first_requested_at = Timecop.freeze(Time.current)
      request
      @second_requested_at = Timecop.freeze(@first_requested_at + 1)
      request
    end
    subject { Rack::RequestTime.current }
    it { should == @second_requested_at }
  end

  context 'multithread' do
    before do
      @first_requested_at = Timecop.freeze(Time.current)
      request

      Thread.new {
        @second_requested_at = Timecop.freeze(@first_requested_at + 1)
        request
      }.join
    end
    subject { Rack::RequestTime.current }
    it { should == @first_requested_at }
  end
end


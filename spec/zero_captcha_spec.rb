require 'spec_helper'

describe ZeroCaptcha do
  it 'has a version number' do
    expect(ZeroCaptcha::VERSION).not_to be nil
  end

  it 'has a user agent' do
    expect(ZeroCaptcha::USER_AGENT).not_to be nil
  end

  describe '.new' do
    let(:client) { ZeroCaptcha.new('token-example') }
    it { expect(client).to be_a(ZeroCaptcha::Client) }
  end
end

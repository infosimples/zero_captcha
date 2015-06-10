require 'spec_helper'
require 'base64'

token       = CREDENTIALS['token']
captcha_url = CREDENTIALS['captcha_url']
solver      = CREDENTIALS['solver']
solution    = CREDENTIALS['solution']
image       = Net::HTTP.get(URI(captcha_url))
image64     = Base64.encode64(image)
file_path   = Dir.tmpdir + '/captcha-spec.jpg'
File.open(file_path, 'wb') { |f| f.write(image) }
file        = File.open(file_path, 'rb')
client      = ZeroCaptcha.new(token)

describe ZeroCaptcha::Client do
  subject(:client) { client }

  describe '#load_captcha' do
    it { expect(client.send(:load_captcha, url: captcha_url)).to eq(image64) }
    it { expect(client.send(:load_captcha, path: file_path)).to eq(image64) }
    it { expect(client.send(:load_captcha, file: file)).to eq(image64) }
    it { expect(client.send(:load_captcha, raw: image)).to eq(image64) }
    it { expect(client.send(:load_captcha, raw64: image64)).to eq(image64) }
    it { expect{client.send(:load_captcha, other: nil)}.to raise_error(ZeroCaptcha::ArgumentError) }
  end

  describe '#decode!' do
    before(:all) { @captcha = client.decode!(raw64: image64, solver: solver) }
    it { expect(@captcha).to be_a(ZeroCaptcha::Captcha) }
    it { expect(@captcha.text).to eq solution }
    it { expect(@captcha.correct?).to be true }
    it { expect(@captcha.id).to be > 0 }
    it { expect(@captcha.code).to eq(200) }
    it { expect(@captcha.duration).to be > 0 }
    it { expect(@captcha.created_at).to be_a(Time) }
  end

  describe '#report_incorrect' do
    before(:all) do
      captcha = client.decode!(raw64: image64, solver: solver)
      @captcha = client.report_incorrect(captcha.id)
    end
    it { expect(@captcha).to be_a(ZeroCaptcha::Captcha) }
    it { expect(@captcha.correct?).to be false }
  end

  describe '#report_correct' do
    before(:all) do
      captcha = client.decode!(raw64: image64, solver: solver)
      @captcha = client.report_correct(captcha.id)
    end
    it { expect(@captcha).to be_a(ZeroCaptcha::Captcha) }
    it { expect(@captcha.correct?).to be true }
  end
end

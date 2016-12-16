require 'spec_helper'

describe Gastly do
  let(:url) { 'http://google.com' }

  context '#screenshot' do
    it 'returns an instance of Gastly::Screenshot' do
      expect(Gastly.screenshot(url, timeout: 1000)).to be_instance_of Gastly::Screenshot
    end
  end

  context '#capture' do
    it 'creates a screenshot' do
      tmp = 'spec/support/tmp'
      path = "#{tmp}/output.png"
      expect { Gastly.capture(url, path) }.to change { Dir.glob("#{tmp}/*").length }.by(1)
      FileUtils.rm Dir.glob("#{tmp}/*")
    end
  end

  context '#capture stockcharts' do
    it 'creates a screenshot stockcharts' do
      tmp = 'spec/support/tmp'
      url = 'http://stockcharts.com/h-sc/ui?s=$USHL5&p=D&yr=8&mn=0&dy=0&id=p27747499092'
      5.times {|i|
        path = "#{tmp}/output#{i}.png"
        expect { Gastly.capture(url, path) }.to change { Dir.glob("#{tmp}/*").length }.by(1)
      }
      FileUtils.rm Dir.glob("#{tmp}/*")
    end
  end
end

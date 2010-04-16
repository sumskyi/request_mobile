require File.dirname(__FILE__) + '/test_helper'

require File.dirname(__FILE__) + '/../lib/request_mobile'

class RequestMobileTest < Test::Unit::TestCase
  def setup
    @request = Class.new do
      send :include, RequestMobile
      attr_accessor :headers
    end.new
    @request.headers = {}
  end

  def test_ipod_3_1_2
    set_agent 'Mozilla/5.0 (iPod; U; CPU iPhone OS 3_1_2 like Mac OS X; ru-ru) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7D11 Safari/528.16'
    assert_same :iphone, @request.mobile?
  end

  def test_ipod_2_1
    set_agent 'Mozilla/5.0 (iPod; U; CPU iPhone OS 2_1 like Mac OS X; en-us) AppleWebKit/525.18.1 (KHTML, like Gecko) Version/3.1.1 Mobile/5F137 Safari/525.20'
    assert_same :iphone, @request.mobile?
  end

  def test_iphone_2_0_2
    set_agent 'Mozilla/5.0 (iPod; U; CPU iPhone OS 2_1 like Mac OS X; en-us) AppleWebKit/525.18.1 (KHTML, like Gecko) Version/3.1.1 Mobile/5F137 Safari/525.20'
    assert_same :iphone, @request.mobile?
  end

  def test_ipad_3_2
    set_agent 'Mozilla/5.0 (iPad; U; CPU OS 3_2 like Mac OS X; en-us) AppleWebKit/531.21.10 (KHTML, like Gecko) Version/4.0.4 Mobile/7B348b Safari/531.21.10'
    assert_same :iphone, @request.mobile?
  end

  def test_android
    set_agent 'Mozilla/5.0 (Linux; U; Android 1.0; appLanguage; dream) AppleWebKit/525.10+ (KHTML, like Gecko) Version/3.0.4 Mobile Safari/523.12.2'
    assert_same :android, @request.mobile?
  end

  def test_blackberry
    set_agent 'BlackBerry7730/3.7.1 UP.Link/5.1.2.5'
    assert_same :blackberry, @request.mobile?
  end

  def test_symbian
    set_agent 'Mozilla/5.0 (SymbianOS/9.1; U; en-us) AppleWebKit/413 (KHTML, like Gecko) Safari/413 UP.Link/6.3.1.15.0'
    assert_same :symbian, @request.mobile?
  end



  def test_ff_07
    set_agent 'Mozilla/5.0 (Windows; U; Windows NT 5.1; fr; rv:1.5) Gecko/20031007 Firebird/0.7'
    assert ! @request.mobile?
  end

  def test_ff_36
    set_agent 'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; de; rv:1.9.2) Gecko/20100115 Firefox/3.6'
    assert ! @request.mobile?
  end

  def test_netscape_1_1
    set_agent 'Mozilla/1.1 (Windows 3.0; I)'
    assert ! @request.mobile?
  end

  def test_msie_301
    set_agent 'Mozilla/2.0 (compatible; MSIE 3.01; Windows 95)'
    assert ! @request.mobile?
  end

  def test_msie_70
    set_agent 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; OfficeLive'
    assert ! @request.mobile?
  end

  def test_msie_80
    set_agent 'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NETi CLR 3.0.30729; Media Center PC 6.0; MS-RTC LM 8; InfoPath.3; .NET4.0C) chromeframe/4.0'
    assert ! @request.mobile?
  end

  def test_aol
    set_agent 'Mozilla/2.0 (compatible; MSIE 3.0; AOL 3.0; Windows 95)'
    assert ! @request.mobile?
  end

  def test_icab
    set_agent 'iCab/Pre2.0 (Macintosh; I; PPC)'
    assert ! @request.mobile?
  end

  def test_chrome
    set_agent 'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/530.5 (KHTML, like Gecko) Chrome/2.0.172.31 Safari/530.5'
    assert ! @request.mobile?
  end

  def test_safari
    set_agent 'Mozilla/5.0 (Macintosh; U; PPC Mac OS X; en) AppleWebKit/124 (KHTML, like Gecko) Safari/125.1'
    assert ! @request.mobile?
  end

  def test_opera
    set_agent 'Mozilla/4.0 (compatible; Opera/3.0; Windows 4.10) 3.50'
    assert ! @request.mobile?
  end


  def set_agent(str)
    @request.headers['HTTP_USER_AGENT'] = str
  end

end

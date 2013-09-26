# coding: utf-8
 
require 'mechanize'
 
class MySBClient
 
  def initialize
    @agent = Mechanize.new
  end
  
  def usage_bill
    login()
    usage_page()
    p "今月のパケット残量 -> " + allowance()
    logout()
  end
  
  def allowance
    @agent.page.search('table.contract-info.mt_20').search('tr.first').search('td')[-2].text.strip
  end
  
  def top
    @agent.get('https://my.softbank.jp/msb/d/top')
  end
  
  def login
    top()
    @agent.page.forms[0].click_button
    f = @agent.page.forms[0]
    f.telnum = ENV["SB_TELNUM"]
    f.password = ENV["SB_PASSWORD"]
    f.submit
  end
 
  def usage_page
    top()
    @agent.page.link_with(:href=>/MRERE0000/).click
    @agent.page.forms[0].submit
  end
 
  def logout
    top()
    @agent.page.link_with(:href=>/doLogout/).click
  end
end
 
client = MySBClient.new
client.usage_bill()
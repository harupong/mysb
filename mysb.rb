# coding: utf-8
 
require 'mechanize'
 
class MySBClient
 
  def initialize
    @agent = Mechanize.new
    @agent.user_agent_alias = 'iPad'
  end
  
  def usage_bill
    login()
    usage_page()
    allowance()
    logout()
  end
  
  def allowance
    allowance = @agent.page.search('table.contract-info.mt_20 tr.first td').text.strip.gsub(/（.+）/,"")
    puts "今月のパケット残量 -> #{allowance}"

    @agent.page.link_with(:href=>/RES0300/).click
    usage = @agent.page.search('table.contract-info td').map{ |n| n.text.strip.gsub(/（.+）/,"") }
    puts "過去3日間のパケット使用量"
    puts "#{usage[0]} #{usage[1]}"
    puts "#{usage[2]} #{usage[3]}"
    puts "#{usage[4]} #{usage[5]}"
    puts "#{usage[6]} #{usage[7]}"
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

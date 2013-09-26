# My SoftBank fetcher

This script fetchs and returns following data from [My SoftBank（マイソフトバンク）](https://my.softbank.jp/msb/d/top).

- network usage
- more to come, maybe? (bills, points, etc) 

You must create/have the account for My SoftBank to use it.

## How to use

Set up environment variables:

- `SB_TELNUM`: ID, which is a mobile number for My SoftBank.
- `SB_PASSWORD`: password for above ID for My SoftBank.

Run `ruby mysb.rb` and the data gets returned.  Right now, the result looks like (sorry, it's in Japanese only):

    "今月のパケット残量 -> 48,827,582 パケット（5.83GB）"

Or, instead of setting up environment variables, you can pass them by running

    SB_TELNUM=<your-mobile-number> SB_PASSWORD=<your-password> ruby mysb.rb

## Requirements
Recommended to install the following.

- Ruby 1.9
- Mechanize

## Special Thanks

[MySoftBankのWeb明細をダウンロードする - xykの日記](http://d.hatena.ne.jp/xyk/20130318/1363569637)

## Author
Haruo Nakayama
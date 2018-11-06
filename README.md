# CAPM-Topix-Core-30

Introduction:
CAPM, Capital Asset Pricing Model, is one of the most widely used asset pricing model in financial industry. Although there are sme other asset pricing model like APT, CAPM is generally the go to model for most of the practitioners. The thory was first proposed by William Sharpe in the 60s. It is designed to try to find out whether the expected return of a security is equal to the risk-free rate plus beta times market risk premium. The result could also be used on calculating WACC, but i'll upload some Jpana expamles' WACC when i have the time.

Formula of CAPM
                                    E[Ri] = Rf + βi x (E[Rm] - Rf)
  
  E[Ri] : Expected return of Stock i
  Rf :    Risk free rate (usually 10-Year Government Bond)
  βi :    Beta of stock i 
  E[Rm] : Expected return of market
  (E[Rm] - Rf): Market risk premium
  
The goal of this project is try to find out the expected return of Topix Core 30 stocks under low risk free rate country like Japan. I used Topix Core 30 as a practice. For expected market return, i decided to use Nikkei 225. I'll try to use Topix in the future. 

I'll upload more markets and more stocks in the future once i confirm my assumption and calcuation are correct.

# List of Topix Core 30
2914 日本たばこ産業
3382 セブン&アイ・ホールディングス
4063 信越化学工業
4502 武田薬品工業
4503 アステラス製薬
6501 日立製作所
6752 パナソニック
6758 ソニー
6861 キーエンス
6902 デンソー
6954 ファナック
6981 村田製作所
7201 日産自動車
7203 トヨタ自動車
7267 本田技研工業
7751 キヤノン
7974 任天堂
8031 三井物産
8058 三菱商事
8306 三菱UFJフィナンシャル・グループ
8316 三井住友フィナンシャルグループ
8411 みずほフィナンシャルグループ
8766 東京海上ホールディングス
8802 三菱地所
9020 東日本旅客鉄道
9022 東海旅客鉄道
9432 日本電信電話
9433 KDDI
9437 NTTドコモ
9984 ソフトバンクグループ

# My Data Base
Data source is from Yahoo Finance. However, there seemed to be a huge error for Hitachi. The first result i got showed that Hitachi has a Beta of over 3.8, which is almost impossible. So i checked the data again in Yahoo Finance, and it turned out that maybe there were some input mistakes causing Hitachi's stock price jump from 800 to 3800 in one day. 

I decided to remove Hitachi from my analysis, so a total of 29 stocks.

# See Code.R for complete process and code

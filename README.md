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
  
The goal of this project is try to find out the expected return of Topix Core 30 stocks under low risk free rate country like Japan. 

I used Topix Core 30 as a practice. I'll upload more markets and more stocks in the future once i confirm my assumption and calcuation are correct.

# My Data Base
Data source is from Yahoo Finance. However, there seemed to be a huge error for Hitachi. The first result i got showed that Hitachi has a Beta of over 3.8, which is almost impossible. So i checked the data again in Yahoo Finance, and it turned out that maybe there were some input mistakes causing Hitachi's stock price jump from 800 to 3800 in one day. 

I decided to remove Hitachi from my analysis, so a total of 29 stocks.

# See Code.R for complete process and code

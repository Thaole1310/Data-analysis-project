#1. Project objective
   
The prediction of stock return has always been one of the most popular topics among investors. Many methods have been implemented to analyze stock performance and predict market trends to help investors invest in stocks which generate most profit.
When it comes to evaluating stocks, there are 3 main types of techniques which can be used by investors to predict stock return.
- Technical analysis: Stock return is forecasted based on historical price movement, trading volume, trend, and other aspects of past trading activities.
- Fundamental analysis: Fundamental analysis takes in account financial factors of the company such as size, company value, book to market,… to assess investment of stocks 
- Sentiment Analysis: By analyzing company financial reports or financial news of the overall market, analyst can understand the attitude or sentiment of investors toward stocks.
This project will focus on using technical analysis and fundamental analysis to predict stock trend and help investors make wise investment decisions

2. Data and Methodology
   
2.1 Data
Data used in this project is derived from Wharton Research Data Services’ database – “compustat” and Center for Research in Security Prices – “CRSP”. This dataset covers period from 31 Jan 2011 to 31 December 2020. 

2.2 Modeling
This project will build two machine learning models, logistics regression and random forest to predict stock return.

2.3 Variable
To predict the return of stock, we use original 11 variables 
- RET1: return in the past month
- RET2: return in the past 2 months
- Price1: price in the past month
- Price2: price in the past 2 months
- asset: total asset of company on the same month
- liability: total liability of company on the same month
- Cash: Total cash of company on the same month
- Revenue: Total revenue of company on the same month
- Earning: Total earning of company on the same month
- volume: volume in the past month
- EPS: earning per share of company on the same month
and create 7 new variables
- market_cap: total value share of company on the market
- book_value: book value of company on the same month
- book_to_market: book to market of company on the same month
- vol6: average volume over the past 6 months
- vol12: average volume over the past 12 months
- price6: average price over the past 6 months
- price12: average price over the past 12 months

2.4 Model evaluation
After building models and predicting return from each model, we will calculate RMSE, MAE, R-squared to select the best model to predict return

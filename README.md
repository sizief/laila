### Crypto stats
200M transaction per month
6.7M per day
280K per hour
4650 per minute
77 per second
https://blog.shrimpy.io/blog/how-many-trades-crypto-exchanges-process

### Write time by rake in rails using AR single thread
250 write in one table one row each time, 0.9 to 1.3  
250 write in two tables one row each time, 1.3 to 2.5  



# TODO
- Specs
- separate matching from rails
   -  remove after_commit hook on order models
Check below also
- FulfillOrder index on unique ActiveOrder request
- FulfillOrder index on unique ActiveOrder match
- FulfilledOrder db validation for uniquesness
- ActiveRecord db validation on Order uniqueness
- validation for FulfilledOrder to have unique ActiveOrder request  
- validation for FulfilledOrder to have unique ActiveOrder match
- do create and delete for Fulfilled in one transaction


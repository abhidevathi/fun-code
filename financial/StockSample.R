library(tidyquant)
data("FANG")
today <- Sys.Date()
start <- today - days(200)
AAPL <- tq_get("AAPL", get = "stock.prices", from = start, to = today)
AMZN <- tq_get("AMZN", get = "stock.prices", from = start, to = today)

# Candlestick Chart
AAPL %>% 
  ggplot(aes(x = date, y = close)) + 
  geom_candlestick(aes(open = open, high = high, low = low, close = close),
                   color_up = "darkgreen", color_down = "red",
                   fill_up = "darkgreen", fill_down = "red") + 
  geom_ma(ma_fun = SMA, n = 3, linetype = 5, size = .3) +
  geom_ma(ma_fun = SMA, n = 10, color = "red", size = .3) +
  labs(title = "AAPL Candlestick Chart", y = "Closing Price", x = "")

# Bar Chart
AAPL %>% 
  ggplot(aes(x = date, y = close)) + 
  geom_line(size = .7) + 
  geom_ma(ma_fun = SMA, n = 3, linetype = 5, size = .5) +
  geom_ma(ma_fun = SMA, n = 10, color = "red", size = .5) +
  labs(title = "AAPL Line Chart", y = "Closing Price", x = "")

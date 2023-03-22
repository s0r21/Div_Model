source("Packages.R")

# stocklist_div <- c("DGS.TO", "SPY")
stock_symb <- readline("What stock? ")
amountofmoney <- readline("How much to invest today? ")

numberofstocks <- function(stock) {
  stock_close <- getSymbols(stock,
                            auto.assign = FALSE)
  stock_close <- tail(stock_close[,4],1)
  numberofstocks <- floor((as.numeric(amountofmoney)/as.numeric(stock_close)))
  return(numberofstocks)
}

divendamount <- function(stock) {
  suppressWarnings({
  last_div <- tail(getDividends(stock,
                                auto.assign = FALSE),1)
  dividend_amount <- (as.numeric(numberofstocks(stock_symb)) * as.numeric(last_div))
  return(dividend_amount)
  })
} 

testing <- 40

divendfreq <- function(stock) {
  suppressWarnings({
  last_two_div <- data.frame(tail(getDividends(stock,
                                    auto.assign = FALSE),2))
  date_df <- data.frame(rownames(last_two_div))
  date_one <- as.Date(date_df[2,1])
  date_two <- as.Date(date_df[1,1])
  div_freq <- as.numeric(difftime(date_one, date_two, units = "weeks")) / 4
  return(div_freq)
  })
}

print(sprintf("You can purcahse %d number of stocks", numberofstocks(stock_symb)
              ))
print(sprintf("You will be getting %s per frequency", format(round(divendamount(
  stock_symb),2), nsmall=2)))
print(sprintf("Dividned frequency is every %s weeks", format(round(divendfreq(stock_symb)
                                                                  ,2), nsmall=2)))

source("Packages.R")

# stocklist_div <- c("DGS.TO", "SPY")
stock_symb <- readline("What stock? ")
amountofmoney <- readline("How much to invest today? ")

stock_close <- tail(getSymbols(stock_symb,
                auto.assign = TRUE),1)
last_div <- tail(getDividends(stock_symb,
                        auto.assign = TRUE),1)

stock_close <- tail(DGS.TO$DGS.TO.Close,1)

numberofstocks <- (as.numeric(amountofmoney)/as.numeric(stock_close))
dividend_amount <- (as.numeric(numberofstocks) * as.numeric(last_div))


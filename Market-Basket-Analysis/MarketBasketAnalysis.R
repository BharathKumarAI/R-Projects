source("req_ful_fillment.R")

market_basket <- read.transactions(
  file = 'data/market_basket.csv',
  sep = ',', 
  quote = "",
  format = 'basket', # each record in the file will be treated as transaction
  rm.duplicates = TRUE,
  skip=1
)

# computing the total number of items that were purchased
# number of rows * number of non-empty transactions * density

# inspecting first 5 transactions
market_basket %>% head(n=5) %>% inspect

# plot for 10 most frequently brought items
itemFrequencyPlot(x = market_basket,
                  topN = 10,
                  type = 'absolute',
                  horiz = TRUE,
                  col = brewer.pal(10,'Spectral'))


# set of association rules
rule1 <- market_basket %>% apriori(parameter = list(supp = 0.005, conf=0.8)) %>% sort(by = 'confidence')

summary(rule1)

rule1 %>% head(n=5)%>% inspect

rule1 %>% tail(n=5)%>% inspect

rule1 <- rule1 %>% sort(by='lift')
rule1 %>% head(n=5)%>% inspect


plot(rule1, engine='htmlwidget')
plot(rule1, method='two-key', engine='htmlwidget')
plot(rule1, method='graph', engine='htmlwidget', control = list(type = "items"))
plot(rule1[1:20], method = "paracoord", control = list(reorder = TRUE))
plot(rule1[1:20], method = "matrix", control = list(reorder = TRUE))


## Eclat

# actually returns set not the rules - so choosing minlen=2 to get atleast two items set 
# For simple results
rules_eclat <- eclat(data= market_basket, parameter = list(support=0.004, minlen=2)) 

inspect(sort(rules_eclat, by = 'support')[1:10])

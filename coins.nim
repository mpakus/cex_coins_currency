import strutils, httpclient, json

# https://cex.io/api/ticker/BTC/USD
proc fetchFromCEX(fromCurrency = "BTC", toCurrency = "USD"): JsonNode = 
  var url = "https://cex.io/api/ticker/$1/$2"
  parseJson(getContent(url % [fromCurrency, toCurrency]))

proc saveToDB(json: JsonNode): bool =
  true

var json = fetchFromCEX()

echo json
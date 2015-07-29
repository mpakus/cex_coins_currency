import httpclient, asyncnet, asyncdispatch, json

proc fetchCurrency(url: string) {.async.} =
  var client = newAsyncHttpClient()
  var resp   = await client.request(url)
  var coin   = parseJson(resp.body)
  echo url, " | last: ", coin["last"]

proc main() =
  var urls = ["https://cex.io/api/ticker/BTC/USD", "https://cex.io/api/ticker/LTC/USD"]
  for url in urls:
    waitFor fetchCurrency(url)

main()  

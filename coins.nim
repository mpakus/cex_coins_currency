import strutils, httpclient, json, db_mysql

proc fetchFromCEX(fromCurrency = "BTC", toCurrency = "USD"): JsonNode =   
  var url = "https://cex.io/api/ticker/$1/$2"
  parseJson(getContent(url % [fromCurrency.toUpper(), toCurrency.toUpper()]))

proc openDB(host = "localhost", user = "root", password = "", db = "btc_currency"): TDbConn =
  db_mysql.open(host, user, password, db)    

proc closeDB(connect: TDbConn) =
  db_mysql.close(connect)

proc fetchSave(db: TDbConn, currency: string = "BTC") =
  var cex : JsonNode = fetchFromCEX(fromCurrency = currency)  
  db_mysql.exec(db, sql"INSERT INTO currencies (created_on, currency, amount) VALUES (NOW(), ?, ?);", currency, cex["last"].str)

proc main =
  let 
    currencies  = ["BTC", "LTC"]
    db: TDbConn = openDB()  

  for currency in currencies: 
    fetchSave(db, currency)

  closeDB(db)

main()

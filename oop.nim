type
  Coin = ref object of RootObj
    name*:    string
    currency: float

method set_name(this: Coin, value: string) =
  this.name = value & "!"
  
var
  bitcoin:  Coin
  litecoin: Coin

bitcoin  = Coin(name: "BTC", currency: 290)
litecoin = Coin(name: "LXC", currency: 15)

echo bitcoin[]
echo litecoin[]

bitcoin.set_name("BXX")
echo bitcoin[]

bitcoin.currency = 100
echo bitcoin[]
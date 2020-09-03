window.addEventListener('load', function(){

  const Price = document.getElementById("item-price")

  Price.addEventListener('input', function(){
   let TaxPrice = Price.value * 0.1
   let ProfitPrice = Price.value - TaxPrice
   const Tax = document.getElementById("add-tax-price")
   Tax.innerHTML = TaxPrice
   const Profit = document.getElementById("profit")
   Profit.innerHTML = ProfitPrice
  })

})
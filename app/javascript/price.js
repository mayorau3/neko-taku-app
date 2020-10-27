function calc(){

  const priceInput = document.getElementById("price_input")
  const fee = document.getElementById("fee")
  const profit = document.getElementById("profit")

  if (priceInput.getAttribute("data-load") != null) {
    return null;
  }
  priceInput.setAttribute("data-load", "true");
  priceInput.addEventListener('input', function(){
    price = this.value
    feeCalc = Math.floor(price * 0.05)
    profitCalc = price - feeCalc
    fee.innerHTML = feeCalc
    profit.innerHTML = profitCalc
  });

  const priceInput2 = document.getElementById("price_input2")
  const fee2 = document.getElementById("fee2")
  const profit2 = document.getElementById("profit2")

  if (priceInput2.getAttribute("data-load") != null) {
    return null;
  }
  priceInput2.setAttribute("data-load", "true");
  priceInput2.addEventListener('input', function(){
    price2 = this.value
    feeCalc2 = Math.floor(price2 * 0.05)
    profitCalc2 = price - feeCalc2
    fee2.innerHTML = feeCalc2
    profit2.innerHTML = profitCalc2
  });
}
setInterval(calc, 1000);
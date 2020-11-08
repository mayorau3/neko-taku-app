function calc(){

  const oneDayPrice = document.getElementById('one_day_price')
  const oneDayHours = document.getElementById("one_day_hours")
  const priceOutput = document.getElementById("price_output")

  if (oneDayHours.getAttribute("data-load") != null) {
    return null;
  }

  const price = oneDayPrice.getAttribute("value")
  oneDayHours.setAttribute("data-load", "true");
  oneDayHours.addEventListener('input', function(){
    hours = this.value
    priceCalc = hours * price
    priceOutput.innerHTML = priceCalc
  });

  const stayPrice = document.getElementById('stay_price')
  const stayDays = document.getElementById("stay_days")
  const priceOutput2 = document.getElementById("price_output2")

  if (stayDays.getAttribute("data-load") != null) {
    return null;
  }

  const price2 = stayPrice.getAttribute("value")
  stayDays.setAttribute("data-load", "true");
  stayDays.addEventListener('input', function(){
    days = this.value
    priceCalc2 = days * price2
    priceOutput2.innerHTML = priceCalc2
  });

}
setInterval(calc, 1000);
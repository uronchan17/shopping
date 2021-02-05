function post (){
  let totalPrice = [];
  let totalPrices = [];
  let salesCommission = document.getElementById('add-tax-price');
  for ( let i = 1; document.getElementById(`Quantity${i}`) != null; i++ ) {
    let itemPrice = document.getElementById(`item-price${i}`).textContent;
    let itemFee = document.getElementById(`Quantity${i}`);
    totalPrice[i - 1] = itemPrice;
    totalPrices[i - 1] = itemFee;
  }
  let afterFee = 0
  let beforeFee = 0
  totalPrices.forEach(function(item, index){
    item.addEventListener("focus",() => {
      let fee = item.value * totalPrice[index];
      beforeFee += fee;
    })
    item.addEventListener("blur",() => {
      let fee = item.value * totalPrice[index];
      afterFee += fee;
      salesCommission.innerHTML = afterFee - beforeFee;
    })
  })
}
window.addEventListener('load', post);
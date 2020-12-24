window.addEventListener('load',() => {
  const price = document.getElementById("item-price");
  price.addEventListener("input", () => {
    const inputPrice = price.value;
    const fee = document.getElementById("add-tax-price");
    fee.innerHTML = Math.floor(inputPrice * 0.1);
    const profit = document.getElementById("profit")
    profit.innerHTML = inputPrice - fee.innerHTML
  });
});
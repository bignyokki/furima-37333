window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value; 
    tax.innerHTML = Math.floor(inputValue * 0.1);
    profit.innerHTML = Math.floor(inputValue * 0.9);
  })
});
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
function list (){
  var data = [
    ['', 'Ford', 'Tesla', 'Toyota', 'Honda'],
    ['2017', 10, 11, 12, 13],
    ['2018', 20, 11, 14, 13],
    ['2019', 30, 15, 12, 13]
  ];
  
  var container = document.getElementById('example');
  var hot = new Handsontable(container, {
    data: data,
    rowHeaders: true,
    colHeaders: true,
    filters: true,
    dropdownMenu: true,
    licenseKey: 'non-commercial-and-evaluation',
    contextMenu: {
      items: {
          row_above: {
              name: '上に行を挿入',
              callback: function (key, normalizedSelection) {
                  var latestSelection = normalizedSelection[Math.max(normalizedSelection.length - 1, 0)];
                  this.alter('insert_row', latestSelection.start.row);
                  var col = hot.propToCol(COL_PRODUCTCODE);
                  hot.selectCell(latestSelection.start.row, col);
              }
          },
          row_below: {
              name: '下に行を挿入',
              callback: function (key, normalizedSelection) {
                  var latestSelection = normalizedSelection[Math.max(normalizedSelection.length - 1, 0)];
                  this.alter('insert_row', latestSelection.end.row + 1);
                  var col = hot.propToCol(COL_PRODUCTCODE);
                  hot.selectCell(latestSelection.end.row + 1, col);
              }
          },
          col_left: {
              name: '右に一列挿入',
          },
          col_right: {
              name: '左に一列挿入',
          },
          remove_row: {
              name: '一行削除',
          },
          remove_col: {
              name: '一列削除',
          },
          undo: {
              name: '戻る',
          },
          redo: {
              name: 'やり直す',
          },
      }
  },
  });
  
}
window.addEventListener('load', list);
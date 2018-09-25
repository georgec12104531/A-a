Array.prototype.mergeSort = function (func) {
  if (this.length <= 1) return this;
  
  if (!func) {
    let func = (left, right) => {
      return left < right ? 1 : left > right ? -1 : 0;
    };
  }
  
  let mid = Math.floor(this.length / 2);
  let leftSort = this.slice(0, mid).mergeSort(func);
  let rightSort = this.slice(mid).mergeSort(func);
  
  return leftSort.merge(rightSort, func);
};

Array.prototype.merge = function(arr, func) {
  let merged = [];
  
  while (this.length && arr.length) {
    switch(func(this[0], arr[0])) {
      case 1:
        merged.push(this.shift());
        break;
      case 0:
        merged.push(this.shift());
        break;
      case -1:
        merged.push(arr.shift());
        break;
    }
  }
  
  merged = merged.concat(this);
  merged = merged.concat(arr);
  
  return merged;
};

function uniq() {
  let solution = [];
  for (let i = 0; i < this.length; i++) {
    if (solution.includes(this[i])) {
      
    } else {
      solution.push(this[i]);
    }
  }
  return solution;
}

function twoSum() {
  let resultArray = [];
  for(let i=0; i<this.length-1;i++) {
    for(let j=i+1; j<this.length;j++) {
      if(this[i] + this[j] === 0) {
        resultArray.push([i,j]);
      }
    }
  }
  return resultArray;
}

function transpose() {
  let solution = [];
  
  for (let i = 0; i < this.length; i++) {
    let tempArray = [];
    for (let j = 0; j < this.length; j++) {
      // console.log(this[i][j]);
      tempArray.push(this[j][i]);
    }
    solution.push(tempArray);
  }
  return solution;
}

function myPrint(el) {
  console.log(el);
}

function myEach(callback) {
  for(let i=0;i<this.length;i++) {
    callback(this[i]);
  }
}

function square(num) {
  return num * num;
}

function myMap(callback) {
  solution = [];
  for(let i=0;i<this.length;i++) {
    solution.push(callback(this[i]));
  }
  return solution;
}

function myReduce(callback, acc) {
  console.log(arguments);
}

Array.prototype.uniq = uniq;
Array.prototype.twoSum = twoSum;
Array.prototype.transpose = transpose;
Array.prototype.myEach = myEach;
Array.prototype.myMap = myMap;
Array.prototype.myReduce = myReduce;

function myReduce(callback, acc) {
  let startingValue = this[0];
  if (arguments.length > 1) {
    startingValue = arguments[1];
    for(let i=0;i<this.length;i++) {
      startingValue = callback(this[i], startingValue);
    }
  } else {
    for(let i=1;i<this.length;i++) {
      startingValue = callback(this[i], startingValue);
    }
  }
  return startingValue;
}

function square(x) {
  return x*x;
}

function add(num1, num2) {
  return num1 + num2;
}

function map3(callback) {
  let arr = [];
  
  function modMethod(num) {
    arr.push(callback(num));
  }
  
  for (let i=0; i < this.length; i++) {
    modMethod(this[i]);
  }
  
  return arr;
}

function map2(callback) {
  given_array = this;
  let arr = [];
  return function run() {
    for(let i=0;i<given_array.length;i++) {
    arr.push(callback(given_array[i]));
  }
  return arr;
};
}

function bubble() {
  for(let i=0;i<this.length-1;i++) {
    for(let j=i+1;j<this.length;j++) {
      if (this[i] > this[j]) {
        // swap values
        let temp = this[i];
        this[i] = this[j];
        this[j] = temp;
      }
    }
  }
  return this;
}

function bubble2() {

  let sorted = false; 
  while (sorted === false) {
    sorted = true;
    for(let i = 0; i < this.length; i++) {
      if (this[i] > this[i + 1]) {
        let temp = this[i];
        this[i] = this[i + 1];
        this[i + 1] = temp;
        sorted = false;
      }
    }
  }
  return this;
}

function substring() {
  let solution = [];
  let char_array = this.split('');
  while (char_array.length > 0) {
    solution.push(char_array.join(''));
    char_array.pop();
  }
  return solution;
}

Array.prototype.myReduce = myReduce;
Array.prototype.map2 = map2;
Array.prototype.map3 = map3;
Array.prototype.bubble = bubble;
Array.prototype.bubble2 = bubble2;
Array.prototype.substring = substring;
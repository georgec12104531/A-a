function sum() {
  const args = Array.from(arguments);
  let sum = 0;
  args.forEach((el) => {
    sum += el;
  });

  return sum;
}

function restSum(...args) {
  let sum = 0;
  args.forEach((el) => {
    sum += el;
  });

  return sum;
}

class Cat {
  constructor(name) {
    this.name = name;
  }

  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

Function.prototype.myBind = function (ctx, ...bindArgs) {
  return (...callArgs) => this.apply(ctx, callArgs.concat(bindArgs));
};


//
// const markov = new Cat("Markov");
// const breakfast = new Cat("Breakfast");
//
// console.log(markov.says.myBind(breakfast, "meow", "Kush", "Bob")());
// markov.says.myBind(breakfast);
// console.log(breakfast.says("Hello", "George"));
// let c = new Cat()
// let d = new Dog()
//
// c.says.myBind(d)
// console.log(restSum(1, 2, 3, 4));
// console.log(restSum(1, 2, 3, 4, 5));

function curriedSum(numArgs) {
  let numbers = [];

  return function _curriedSum(num) {
    numbers.push(num);
    if (numArgs === numbers.length) {
      const reducer = (accumulator, currentValue) => accumulator + currentValue;
      return numbers.reduce(reducer);
    } else {
      return _curriedSum;
    }
  };
}

// const summer = curriedSum(4);
//
// console.log(summer(5));
// console.log(summer(30));
// console.log(summer(20));
// console.log(summer(1));
// console.log(summer(30)(20)(1));

Function.prototype.curry = function (numArgs) {
  let args = [];
  let that = this;
  return function _curry(arg) {
    args.push(arg);
    if (args.length === numArgs){
      return that(...args);
    } else {
      return _curry;
    }
  };
};

let summer = sum.curry(3);
console.log(summer(1)(2)(3));

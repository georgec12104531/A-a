// add number

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  outout: process.stdout
});
//

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft > 0) {
    console.log("Number please");
    reader.question("Give me a number?", function(number) {
      console.log(sum += parseInt(number));
      addNumbers(sum, numsLeft - 1, completionCallback);
    });
  } else {
    completionCallback();
    reader.close();
  }
}

addNumbers(0, 3, running);


function running() {
  console.log("he's fast");
}



// const readline = require('readline');
//
// const reader = readline.createInterface({
//   // it's okay if this part is magic; it just says that we want to
//   // 1. output the prompt to the standard output (console)
//   // 2. read input from the standard input (again, console)
//
//   input: process.stdin,
//   output: process.stdout
// });
//
// reader.question("What is your name?", function (answer) {
//   console.log(`Hello ${answer}!`);
//   reader.close();
// });
//
// console.log("Last program line");

function range(start, end) {
  if(start===end) {
    return [start];
  } else {
    return [start].concat(range(start+1, end));
  }
}

function sumRec(arr) {
  if(arr.length === 1) {
    return arr[0];
  }  else {
    return arr[0] + sumRec(arr.slice(1,arr.length));
  }
}


function expOne(base, exp) {
  if (exp === 1) {
    return base;
  } else {
    return base * expOne(base, exp-1 );
  }
  
}

function expTwo(base, exp) {
  if (exp === 0) {
    return 1;
  } else if (exp === 1){
    return base;
  } else {
    if (exp % 2 === 0) {
      return expTwo(base, exp / 2) * expTwo(base, exp / 2);
    } else {
      return base * ((expTwo(base, (exp-1) / 2)) * (expTwo(base, (exp-1) / 2))); 
    }
  }
}

function fibonacci(num) {
  if (num === 1) {
    return [1];
  } else if (num === 2) {
    return [1, 1];
  } else {
    nums = fibonacci(num-1);
    return nums.concat(nums[num-2] + nums[num-3]);
  }
}

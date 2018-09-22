//timing is everything


class Clock {
  constructor() {

    const timeStamp = new Date();
    this.hours = timeStamp.getHours() % 12 ;
    this.minutes = timeStamp.getMinutes();
    this.seconds = timeStamp.getSeconds();
    this.printTime();

  }

 printTime(){
   console.log(this.hours + ":" + this.minutes + ":" + this.seconds );
 }

  _tick() {
    const ticker = window.setInterval(() => {
      this.seconds += 2000;
      this.printTime();
    }, 2000);

  }


}

// const clock = new Clock();


// Array.prototype.myForEach = function(callback) {
//   ...
// }

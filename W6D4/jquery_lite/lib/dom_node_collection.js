class domNodeCollection {
  
  constructor(nodes) {
    this.nodes = nodes;
  }
  
  html(html) {
    if (typeof html === 'string') {
      this.each( (node) => {
        this.innerHTML = html;
      });
    } else if (this.nodes.length > 0) {
      return this.nodes[0].innerHTML;
    }
  }
  
  empty() {
    this.html('');
  }
  
  append() {
    
  }
  
}

module.exports = domNodeCollection;



//   frontend 
// browser 
// dom 
// react index.html 
//   javascript 
//   jquery 
// 
//   backend
// rails 
//   ruby 
//     controller 
//       routes 
//     models 
//     db => sql 

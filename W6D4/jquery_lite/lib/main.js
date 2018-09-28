const domNodeCollection = require('./dom_node_collection');

window.$l = (arg) => {
  switch (typeof arg) {
    case 'string':
    return getNodesFromDom(arg);
    case 'object':
      if (arg instanceof HTMLelement) {
        return new domNodeCollection([arg]);
      }
  }
  
};

getNodesFromDom = (selector) => {
  const nodes = document.querySelectorAll(selector);
  const nodesArray = Array.from(nodes);
  return new domNodeCollection(nodesArray);
};
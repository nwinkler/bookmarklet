var div = document.createElement('div');
div.setAttribute('foo', 'bar');
var text = document.createTextNode("This was added using the 'Bookmarklet' & Atom.io?!");
div.appendChild(text);
document.body.appendChild(div);

var div = document.createElement('div');
div.setAttribute('foo', 'bar');
var text = document.createTextNode("This was added using the 'Bookmarklet' & Atom.io?!");
div.appendChild(text);
document.body.appendChild(div);

<a href="javascript:(function(){var%20div%3Ddocument.createElement(%22div%22)%3Bdiv.setAttribute(%22foo%22%2C%22bar%22)%3Bvar%20text%3Ddocument.createTextNode(%22This%20was%20added%20using%20the%20'Bookmarklet'!%22)%3Bdiv.appendChild(text)%2Cdocument.body.appendChild(div)%3B})();">Click Me</a>

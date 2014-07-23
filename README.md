# Bookmarklet

Creates a shortened bookmarklet from your JavaScript code.

Pressing `Ctrl-Alt-B` will create a _JavaScript Bookmarklet_ in the form of an HTML link from your current editor's content. The bookmarklet code will be copied to your system clipboard.

![Bookmarklet in Action!](https://raw.githubusercontent.com/nwinkler/bookmarklet/master/bookmarklet.gif)

In addition to the option of generating a link, the `Bookmarklet: Create JavaScript` option can be used to create just the JavaScript, without the HTML link tag.

## Example

Give this code in your current editor

```
var div = document.createElement('div');
div.setAttribute('foo', 'bar');
var text = document.createTextNode("This was added using the 'Bookmarklet' & Atom.io?!");
div.appendChild(text);
document.body.appendChild(div);
```

Pressing `Ctrl-Alt-B` will generate the following bookmarklet:

```
<a href="javascript:(function(){var%20div%3Ddocument.createElement(%22div%22)%3Bdiv.setAttribute(%22foo%22%2C%22bar%22)%3Bvar%20text%3Ddocument.createTextNode(%22This%20was%20added%20using%20the%20'Bookmarklet'%20%26%20Atom.io%3F!%22)%3Bdiv.appendChild(text)%2Cdocument.body.appendChild(div)%3B})();">Click Me</a>
```

## Install

Command Line:

```
apm install bookmarklet
```

# TODO

* Offer to include jQuery
* Unit tests

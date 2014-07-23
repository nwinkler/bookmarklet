# Bookmarklet

Creates a shortened bookmarklet from your JavaScript code.

Pressing `Ctrl-Alt-B` will create a _JavaScript Bookmarklet_ from your current editor's content. The bookmarklet code will be copied to your system clipboard.

![Bookmarklet in Action!](https://raw.githubusercontent.com/nwinkler/bookmarklet/master/bookmarklet.gif)

## Example

Give this code in your current editor

```
var div = document.createElement('div');
div.setAttribute('foo', 'bar');
document.body.appendChild(div);
```

Pressing `Ctrl-Alt-B` will generate the following bookmarklet:

```
javascript:(function(){var div=document.createElement("div");div.setAttribute("foo","bar"),document.body.appendChild(div);})();
```

## Install

Command Line:

```
apm install bookmarklet
```

# TODO

* Offer to include jQuery
* Create a clickable link with the bookmarklet code, ready for pasting into your HTML file
* Fix quoting issues when creating link
* Option to mangle code instead of just minifying it
* Unit tests

# Bookmarklet package

Creates a shortened bookmarklet from your JavaScript code.

Pressing `Ctrl-Alt-B` will create a _JavaScript Bookmarklet_ from your current editor's content. The bookmarklet code will be copied to your system clipboard.

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

# TODO

* Offer to include jQuery
* Avoid inserting strange character into the editor after pressing Ctrl-Alt-B

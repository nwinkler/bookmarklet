# Bookmarklet package

Creates a shortened bookmarklet from your JavaScript code.

Pressing `Ctrl-Alt-b` will create a _JavaScript Bookmarklet_ from your current editor's content. The bookmarklet code will be copied to your system clipboard.

## Example

Give this code in your current editor

```
var div = document.createElement('div');
div.setAttribute('foo', 'bar');
document.body.appendChild(div);
```

Pressing `Ctrl-Alt-b` will generate the following bookmarklet:



![A screenshot of your spankin' package](https://f.cloud.github.com/assets/69169/2290250/c35d867a-a017-11e3-86be-cd7c5bf3ff9b.gif)

# TODO

* Check for file type/grammar JavaScript
* Show a message after creating the bookmarklet
* Offer to include jQuery

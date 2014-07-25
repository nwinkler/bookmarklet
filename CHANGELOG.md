## 0.5.1
* Improved documentation, mainly formatting.

## 0.5.0
* Added commands to include/load jQuery in the generated bookmarklet. The code for including jQuery was reused from https://github.com/chriszarate/bookmarkleter.
* Added option to use minified or unminified jQuery library.

## 0.4.0
* Encoding the generated bookmarklet to avoid issues with special characters like quotes when using the bookmarklet from a link
* The `Ctrl-Alt-B` shortcut now creates an HTML link ('Click Me') with the bookmarklet code.
* The existing functionality (simply creating the JavaScript function) is still available from the menu or from the command palette (_Bookmarklet: Create JavaScript_).

## 0.3.0
* Showing a message after copying the bookmarklet to the clipboard.

## 0.2.1
* Temporarily disabling the alert, since it was causing a ∫ character to be inserted into the current editor (Mac OS X).

## 0.2.0
* Checking for file grammar - only enable for JavaScript files
* Showing alert after copying the bookmarklet to the clipboard

## 0.1.0
* Basic implementation

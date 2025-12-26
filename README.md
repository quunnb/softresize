# softresize

Acknowledgment: This package is a fork of [jdburgosr/softresize](https://github.com/jdburgosr/softresize)

softresize gives us four functions to handle the sizing of windows. The reference
in all windows (except for the windows in the borders down and right) are the
mode-line (the base bar) and the right column. So `enlarge-window` will move the
mode-line of the current buffer upwards, and `reduce-window` will move it
downwards. Similar behavior will occur for horizontal resize.

## Installation

Clone this repo add the load path to Emacs init fie.

### For newcomers

I'm doing this because I remember me, when I was just starting to use Emacs ;)

1. First you have to clone this repo in your local machine because it is not in
   MELPA or any other package archive.
1. Add load path to your init file `(add-to-list 'load-path
   "/path/to/cloned/repository/softresize")`.
1. Next, add the code in Optional configuration to your init file.

### If Doom Emacs

If you are using doom Emacs, you can paste this code to package.el file.

``` emacs-lisp
(package! softresize
 :recipe (:host github :repo "quunnb/softresize"))
```

And then paste the code in Configuration in your config.el file ☺.

## Configuration

``` emacs-lisp
;; Resize windows with Meta+Shift+(hjkl)
(require 'softresize)
(global-set-key (kbd "M-K") (lambda () (interactive) (softresize-enlarge-window 8)))
(global-set-key (kbd "M-J") (lambda () (interactive) (softresize-reduce-window 8)))
(global-set-key (kbd "M-L") (lambda () (interactive) (softresize-enlarge-window-horizontally 8)))
(global-set-key (kbd "M-H") (lambda () (interactive) (softresize-reduce-window-horizontally 8)))
```

Change the keybindings and delta as you please.

## Demonstration

![images](images/test.gif "Testing")

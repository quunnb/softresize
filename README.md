# softresize

Acknowledgment: This package is a fork of [jdburgosr/softresize](https://github.com/jdburgosr/softresize)

softresize gives us four functions to handle the sizing of windows. The reference
in all windows (except for the windows in the borders down and right) are the
mode-line (the base bar) and the right column. So `enlarge-window` will move the
mode-line of the current buffer upwards, and `reduce-window` will move it
downwards. Similar behavior will occur for horizontal resize.

## Installation

### Vanilla Emacs

1. Clone this repo.
1. Add load path to your init file `(add-to-list 'load-path
   "/path/to/cloned/repository/softresize")`.
1. Add bindings to your init file.

``` emacs-lisp
;; Resize windows with Meta-Shift-<h|j|k|l>
(require 'softresize)
(global-set-key (kbd "M-K") (lambda () (interactive) (softresize-enlarge-window 8)))
(global-set-key (kbd "M-J") (lambda () (interactive) (softresize-reduce-window 8)))
(global-set-key (kbd "M-L") (lambda () (interactive) (softresize-enlarge-window-horizontally 8)))
(global-set-key (kbd "M-H") (lambda () (interactive) (softresize-reduce-window-horizontally 8)))
```

### DOOM Emacs

package.el

```emacs-lisp
(package! softresize
 :recipe (:host github
          :repo "quunnb/softresize"))
```

config.el

```emacs-lisp
;; Resize windows with Meta-Shift-<h|j|k|l>
(use-package softresize
  :ensure t
  :bind (("M-H" . (lambda () (interactive) (softresize-reduce-window-horizontally 8)))
         ("M-J" . (lambda () (interactive) (softresize-reduce-window 8)))
         ("M-K" . (lambda () (interactive) (softresize-enlarge-window 8)))
         ("M-L" . (lambda () (interactive) (softresize-enlarge-window-horizontally 8)))))
```

Adjust the keybindings and delta to your liking.

## Demonstration

![images](images/test.gif "Testing")

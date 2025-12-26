;;; softresize.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2023 Gidiom Gates
;; Copyright (C) 2025 quunnb
;;
;; Author: Gidiom Gates <juandbrg@hotmail.com>
;; Maintainer: quunnb <quunnb@amideus.fi>
;; Created: enero 25, 2023
;; Modified: 26.12.2025 by quunnb
;; Version: 0.0.2
;; Keywords: abbrev bib c calendar comm convenience data docs emulations extensions faces files frames games hardware help hypermedia i18n internal languages lisp local maint mail matching mouse multimedia news outlines processes terminals tex tools unix vc wp
;; Homepage: https://github.com/gidiom/window_resize_improved
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;  This is my [Gidiom Gates] first package for GNU Emacs, are a simple set of functions to improve the beavior on resizingwindows.
;;
;;  Description:
;;
;;  softresize give us four functions to handle the sizing of windows. The reference in all windows (except for the windows in the borders down and rigth) are the down bar and the righ column. So enlargue window will move the base bar of current buffer to up, and reduce will move it to down. Similar behavior will occur for horizontal resize.
;;
;;  Changes:
;;  - Added 'delta' parameter to softresize functions to allow custom resizing steps.
;;
;;; Code:


(defun softresize-enlarge-window (&optional delta)
  "Move mode line upward by DELTA lines.
Except in the base."
  (interactive "P")
  (let ((delta (or delta 1)))
    (if (and (window-in-direction 'up) (window-in-direction 'down))
        (shrink-window delta)
      (if (window-in-direction 'up)
          (enlarge-window delta)
        (shrink-window delta)))))

(defun softresize-reduce-window (&optional delta)
  "Move mode line downward by DELTA lines.
Except in the base."
  (interactive "P")
  (let ((delta (or delta 1)))
    (if (and (window-in-direction 'up) (window-in-direction 'down))
        (enlarge-window delta)
      (if (window-in-direction 'up)
          (shrink-window delta)
        (enlarge-window delta)))))

(defun softresize-enlarge-window-horizontally (&optional delta)
  "Move right column to right direction by DELTA columns.
Except in the right side."
  (interactive "P")
  (let ((delta (or delta 1)))
    (if (and (window-in-direction 'left) (window-in-direction 'right))
        (enlarge-window delta t)
      (if (window-in-direction 'right)
          (enlarge-window delta t)
        (shrink-window delta t)))))

(defun softresize-reduce-window-horizontally (&optional delta)
  "Move right column to left direction by DELTA columns.
Except in the right side."
  (interactive "P")
  (let ((delta (or delta 1)))
    (if (and (window-in-direction 'left) (window-in-direction 'right))
        (shrink-window delta t)
      (if (window-in-direction 'right)
          (shrink-window delta t)
        (enlarge-window delta t)))))

(defun softresize-delete-window-right()
  "Delete window in right direction."
  (interactive)
  (if (window-in-direction 'right)
      (delete-window (window-in-direction 'right))))

(defun softresize-delete-window-left()
  "Delete window in left direction."
  (interactive)
  (if (window-in-direction 'left)
      (delete-window (window-in-direction 'left))))

(defun softresize-delete-window-down()
  "Delete window in down direction."
  (interactive)
  (if (window-in-direction 'down)
      (delete-window (window-in-direction 'down))))

(defun softresize-delete-window-up()
  "Delete window in up direction."
  (interactive)
  (if (window-in-direction 'up)
      (delete-window (window-in-direction 'up))))


(provide 'softresize)
;;; softresize.el ends here

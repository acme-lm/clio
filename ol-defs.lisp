;;; -*- Mode:Lisp; Package:CLIO-OPEN; Base:10; Lowercase:T; Syntax:Common-Lisp -*-

;;; Texas Instruments Incorporated
;;; PO Box 149149
;;; Austin, Texas 78714
;;;
;;; Copyright (c) 1989, 1990 Texas Instruments Incorporated.
;;;
;;; Permission is granted to any individual or institution to use,
;;; copy, modify, and distribute this software, provided that this
;;; complete copyright and permission notice is maintained, intact, in
;;; all copies and supporting documentation.
;;;
;;; texas instruments incorporated provides this software "as is"
;;; without express or implied warranty.

(in-package :clio-open)


(defstruct (scrollbar (:type vector))
  "Scrollbar geometry descriptor."
  anchor-height
  anchor-width
  arrow-height
  arrow-width
  cable-margin
  cable-width
  margin)

(defstruct (text-caret (:type vector))
  "Text-caret geometry descriptor."
  height
  width
  ;; Non-nil if not same as height.
  inactive-height
  baseline-offset)

;; Add in 1 for a margin.
(defconstant +slider-default-margin+ 1
  "The minimum margin gap for all 4 sides of a slider. See also slider-margin .")

(defstruct (slidebar (:type vector) (:conc-name :slidebar-))
  "Slider geometry descriptor. Referenced to origin of top,left
   corner, not including the label or typein field, of :horizontal
   slider."
  ;; Numbers in parentheses refer to dimensions tables in rel 1.0 OPEN LOOK spec
  drag-box-width   	;; (b) this is the BLT width for ANY orientation
  gap			;; (c),(n),(p) also 1/2 of tick-mark thickness
  bar-thickness		;; (f)
  bar-drag-offset	;; (i) distance between top of drag box and top of bar
  tick-mark-length	;; (a3) is also same as end-box-width
  tick-mark-offset	;; (d2) distance from bar-end to tick-mark centerline
  ;;  bar-text-offset : (x,y) First # is x-offset, second # is y-offset,
  ;;  for :horizontal slider = (0,a3), for :vertical slider = (a5,a4)
  ;;  (b5) is the same as GAP
  bar-text-offset)


;; Open Look menu & pushpin specifications

(defstruct ol-menu-spec
  scale
  ;; pushpin specification for this scale
  pushpin
  ;; horizontal distance from border to left of image
  pushpin-dx
  ;; vertical distance from border to pushpin baseline
  pushpin-dy
  ;; horizontal distance from border to title bar (left & right)
  title-bar-dx
  ;; vertical distance from title baseline to title bar
  title-bar-dy
  ;; horizontal (minimum) left & right title margins
  title-dx
  ;; vertical distance from menu border to title baseline
  title-dy
  drop-shadow-width
  drop-shadow-offset)

(defstruct pushpin-spec
  scale
  ;; actual bitmap width
  box-width
  ;; actual bitmap height
  box-height
  ;; image baseline (relative image top)
  baseline
  ;; bitmap image of pin in "in" state
  image-in
  ;; bitmap image of pin in "out" state
  image-out
  ;; bitmap image of pin in "out & highlighted" state
  default-ring-image
  ;; Tthe following (ring-x,ring-y) was intended to specify image
  ;; relative origin for drawing (superimposing) a ring over the
  ;; image-out bitmap.  if we implement default ring by storing a
  ;; complete default-ring-image then this pair won't be needed.
  ring-x
  ring-y
  ;;# pixel columns for left padding
  left-margin
  ;;# pixel columns for top padding
  top-margin
  ;;# pixel columns for bottom padding
  bottom-margin)

(defstruct more-text-arrow
  ;; Iimage of arrow.
  image
  ;; Symbol to use when calling contact-mask to create a pixmap from
  ;; this image.
  name
  ;; top edge of arrow goes here relative to the baseline of the
  ;; truncated text.
  offset-from-baseline
  ;; left edge of arrow usually goes here relative to the end of the
  ;; truncated text.
  offset-from-text)

;;;  Dialog spacing specifications ;;;;

(defparameter *dialog-point-spacing*
  '(:small 8 :medium 9 :large 10 :extra-large 14))

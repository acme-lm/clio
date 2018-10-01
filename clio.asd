;;; -*- Mode:Lisp; Package:USER; Syntax:COMMON-LISP; Base:10; Lowercase:T -*-


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
;;; Texas Iinstruments Incorporated provides this software "as is"
;;; without express or implied warranty.


(in-package :cl-user)

(asdf:defsystem clio
  :depends-on (clue)
  :description "Common Lisp Interactive Objects"
  :version "1.0.1"
  :components
  ((:file "package")
   (:module defs
  	    :depends-on ("package")
  	    :pathname ""
  	    :components
  	    ((:file "ol-defs")
  	     (:file "utility")))
   (:module core
  	    :depends-on ("defs")
  	    :pathname ""
  	    :components
  	    ((:file "core-mixins")
  	     (:file "gravity")
  	     (:file "ol-images")))
   (:module text-defs
   	    :pathname ""
   	    :depends-on ("package")
   	    :components
   	    ((:file "buffer")
   	     (:file "text-command")))
   (:module gadgets
   	    :pathname ""
   	    :depends-on ("text-defs" "core")
   	    :components
   	    ((:file "buttons")
	     (:file "form")
	     (:file "table")
	     (:file "choices" :depends-on ("table"))
	     (:file "scroller")
	     (:file "slider")
	     (:file "scroll-frame" :depends-on ("scroller"))
	     (:file "multiple-choices" :depends-on ("table"))
	     (:file "menu" :depends-on ("buttons"))
	     (:file "psheet")
	     (:file "command" :depends-on ("display-text"))
	     (:file "confirm")
	     (:file "display-text")
	     (:file "edit-text")
	     (:file "display-imag")
	     (:file "dlog-button")))
   (:module example
   	    :depends-on ("gadgets")
   	    :components
	    ((:file "cmd-frame")
	     (:file "sketch" :depends-on ("cmd-frame"))
	     (:file "sketchpad" :depends-on ("cmd-frame"))))))

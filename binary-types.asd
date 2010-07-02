;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-
;;;;------------------------------------------------------------------
;;;; 
;;;;    Copyright (C) 2008, Frode V. Fjeld
;;;; 
;;;;    For distribution policy, see the accompanying file COPYING.
;;;; 
;;;; Filename:      movitz.asd
;;;; Description:   Movitz ASDF system definition.
;;;; Author:        Frode Vatvedt Fjeld <ffjeld@common-lisp.net>
;;;; Created at:    Thu Jan 15 18:40:58 2004
;;;;                
;;;; $Id: binary-types.asd,v 1.2 2008/02/25 23:43:24 ffjeld Exp $
;;;;                
;;;;------------------------------------------------------------------

(defpackage binary-types-asd
  (:use :cl :asdf))

(in-package binary-types-asd)

(defsystem binary-types
  :name "Binary-types"
  :maintainer "ffjeld@common-lisp.net"
  :author "Frode V. Fjeld"
  :license "BSD-like, see accopanying file COPYING."
  :description "A library for reading and writing binary records."
  :perform (load-op :after (op c)
		    (provide 'binary-types))
  :components ((:file "binary-types")))

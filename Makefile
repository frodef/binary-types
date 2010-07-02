######################################################################
## 
##    Copyright (C) 2001,2000,1999, 2003
##    Department of Computer Science, University of Tromsø, Norway
## 
## Filename:      Makefile
## Author:        Frode Vatvedt Fjeld <frodef@acm.org>
## Created at:    Wed Sep 29 19:28:52 1999
##                
## $Id: Makefile,v 1.1.1.1 2004/01/13 11:13:13 ffjeld Exp $
##                
######################################################################

SCP = scp -oProtocol=1
SSH = ssh -1
DIST_EXTRAS = README README-bitfield ChangeLog COPYING type-hierarchy.ps type-hierarchy.png

dist: binary-types.lisp $(DIST_EXTRAS)
	@ if [ ! "${VER}" ]; then echo 'You must set $$VER!'; exit 5; fi
	mkdir binary-types-$(VER)
	cp *.lisp $(DIST_EXTRAS) binary-types-$(VER)
	tar czf binary-types-$(VER).tar.gz binary-types-$(VER)
	rm -rf binary-types-$(VER)

updist: dist
	- $(SSH) www.stud "mv www/sw/binary-types/*.tar.gz www/sw/binary-types/old"
	$(SCP) binary-types-$(VER).tar.gz www.stud:www/sw/binary-types/
	$(SCP) $(DIST_EXTRAS) www.stud:www/sw/binary-types/
	@ echo "Remember cvs TAG REL_x_xx"

repdist: dist
	- $(SSH) www.stud "rm www/sw/binary-types/*.tar.gz"
	$(SCP) binary-types-$(VER).tar.gz www.stud:www/sw/binary-types/
	$(SCP) $(DIST_EXTRAS) www.stud:www/sw/binary-types/
	@ echo "Remember cvs TAG REL_x_xx"

clean:
	rm -f *.fasl memdump *~

force:


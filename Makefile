
help:
	@echo "Run \`sudo make install\` to install system-wide."
	@echo "Run \`sudo make distclean\` to remove system-wide."

install:
	install -m 755 $(CURDIR)/ssh-askpass $(DESTDIR)/usr/libexec/ssh-askpass
	install -m 755 $(CURDIR)/ssh-add-confirm $(DESTDIR)/usr/local/bin/ssh-add-confirm

distclean:
	rm -f $(DESTDIR)/usr/libexec/ssh-askpass
	rm -f $(DESTDIR)/usr/local/bin/ssh-add-confirm

.PHONY: install clean

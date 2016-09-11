
help:
	@echo "Run \`\sudo make install\` to install system-wide."
	@echo "Run \`\sudo make uninstall\` to remove system-wide."

install:
	install -m 755 $(CURDIR)/ssh-askpass $(DESTDIR)/usr/X11R6/bin/ssh-askpass
	install -m 755 $(CURDIR)/ssh-add-confirm $(DESTDIR)/usr/local/bin/ssh-add-confirm

uninstall:
	rm -f $(DESTDIR)/usr/X11R6/bin/ssh-askpass
	rm -f $(DESTDIR)/usr/local/bin/ssh-add-confirm

.PHONY: install clean

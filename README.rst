Overview
========

One way to help protect against `SSH Agent Hijacking`_ is by confirming each
use of the of the decrypted identities managed by ``ssh-agent``.

These tools allow confirmation while (still) meeting the following objectives:

- Password protected SSH identities
- SSH identity passwords stored in Mac OS X Keychain
- Passwords do not need to be entered again and again.

- Absolute minimum install:
  - Do not overwrite or replace executables
  - Do not require compiling or Xcode

Additionally, configuring SSH to use ``ControlMaster`` connections, will
keep things unobtrusive (see `ControlMaster Controller`_ for a useful utility
that eases management of SSH ControlMaster connections).

This is a useful hack. More useful would be development by Apple to support
SSH Agent confirmations.

.. _SSH Agent Hijacking:
   http://www.clockwork.net/blog/2012/09/28/602/ssh_agent_hijacking
.. _`ControlMaster Controller`: https://github.com/ClockworkNet/cmc


Installation
============

1. OS X no longer comes with X11. Unless you have an old release, XQuartz_ is
   required (`#1`_).
2. Run ``make install`` to install two scripts on your system:
   ``/usr/libexec/ssh-askpass`` and ``/usr/libexec/ssh-add-confirm``
3. Add identities to your Mac OS X Keychain via ``ssh-add -K``

.. _XQuartz: https://xquartz.macosforge.org/landing/
.. _`#1`: https://github.com/TimZehta/mac-ssh-confirm/issues/1


Use
===

1. Prior to connecting to any hosts, execute ``ssh-add-confirm``

   - In the interest of security, do **not** Always Allow security access to
     your keychain

2. Repeat the step above each time you log into your Mac

To clear existing identities in the agent and load configured identies to
require confirmation:

- ``ssh-add -D; ssh-add-confirm``

To clear existing identities in the agent and load identities saved in your
keychain **without** the need to confirm access:

- ``ssh-add -D; ssh-add -k``


Inspiration
===========

- `Original version of these scripts`_ by TimZehta.
- `And now Chicken of the VNC tunneled through SSH on OS X`_ (includes
  ``macos-askpass``, a SSH_ASKPASS command for Mac OS X)
- `Making OpenSSH on Mac OS X More Secure`_
- `Get Current Application with AppleScript`_

.. _Original version of these scripts:
   https://github.com/TimZehta/mac-ssh-confirm
.. _And now Chicken of the VNC tunneled through SSH on OS X:
   https://blogs.oracle.com/mock/entry/and_now_chicken_of_the
.. _Making OpenSSH on Mac OS X More Secure:
   https://jcs.org/notaweblog/2011/04/19/making_openssh_on_mac_os_x_more_secure/
.. _Get Current Application with AppleScript:
   http://vanderbrew.com/blog/2010/02/15/get-current-application-with-applescript/


License
=======

- LICENSE_ (`MIT License`_)

.. _LICENSE: LICENSE
.. _`MIT License`: http://www.opensource.org/licenses/MIT

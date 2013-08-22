Summary:
========

This is a syslog package for OS/2 TCP/IP. This version is adapted for the
EMX compiler and uses local IPC sockets (PF_UNIX).

Legal Issues:
=============

 * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL
 * THE CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR 
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


Distribution:
=============

SYSLOG.C           the syslog library ported from BSD to OS/2.
SYSLOGD.C          alternative syslog deamon, ported BSD version.
LOGGER.C           command line interface to syslog, ported BSD version.
SYSLOG.CONF        sample configuration file
SYSLOG.H           <syslog.h>
SYS\SYSLOG.H	   <sys/syslog.h>
MAKEFILE           Makefile for native OS/2
MAKEFILE.EMX       Makefile for EMX
SYSLOG.A           compiled syslog library (EMX version)
SYSLOG.LIB         compiled syslog library (OMF version)
SYSLOGD.EXE        compiled syslog daemon with TCP/IP support
LOGGER.EXE         complied syslog command line interface
READ.ME            this file
SYSLOGD.MAN        docs for SYSLOGD.EXE
SYSLOGCF.MAN       docs for SYSLOG.CNF
LOGGER.MAN         docs for LOGGER.EXE


Requirements:
=============

This package require the following software to be installed:

- OS/2 Warp Connect 3.0 or OS/2 Warp 4.0.
- IBM TCP/IP 3.0 or later.
- EMX 0.9c runtime package.


Installation:
=============

- Copy all executables into some directory in your PATH.
- Copy the syslog.conf into the /etc directory
- Edit syslog.conf and setup your own log files

It's recommended to use TVFS to create a UNIX like directory structure and 
point to that with EMXOPT=-r. Alternative, you can use the command line
options to syslogd.exe to specify different locations of the config and pid
files.

To use the syslog facitility in your own programs:
- Make sure that your compiler can find syslog.h and sys/syslog.h.
- Make sure that your compiler can find syslog.a and/or syslog.lib.
- Be sure to link your programs with the socket library.

If you have applications that uses TCP/IP sockets (PF_INET) to access syslog,
you have to use syslogdi.exe instead of syslogd.exe. Note that this has
security implications since it will be possible to access your syslog daemon
from a TCP/IP network your computer is connected to, not very good if you
are directly connected to the Internet.


Recompile:
==========
You need the EMX development system version 0.9c and a make utility 
(such as GNU make). 


History:
========

Changes from version 1.0:

- syslogd now allows spaces and tab characters as separators and accepts
  exteded syntax.
  (thanks to Jochen.Hein@informatik.tu-clausthal.de who fixed this for Linux)

- missing man pages added.

- bound DDE4.MSG to executables to avoid the nasty "Message file not found".


Changes in version 3:

- changed the code to compile with the EMX compiler, also made it more 
  ANSI C complaint.

- new port of syslogd.c from UNIX source.

- syslog now uses PF_UNIX sockets.

- divided syslog.h into <syslog.h> and <sys/syslog.h> to be more UNIX 
  compatible.

- syslogd is responsible for adding timestamp, and it does so in a nice
  ISO format.

- Added a log file splitting function to syslogd.


Changes in version 3a:

- Small corrections of the previous port.

- Correct operation with native OS/2 TCP/IP daemons (FTPD, TELNETD, etc).

- Check on unprintable characters is removed. Support of national
  languages thus is provided.


Bug Reports:
============
Please send bug reports and suggestions to:
Mikael St†ldal <d96-mst@nada.kth.se>

Last update maker:
	Alexander Lapshin
	alex@agro2.dp.ua
	2:464/123.0@FidoNet.Org


Acknowledgments:
================
Jochen Friedrich <jochen@audio.pfalz.de> for the first IBM C port.

CC	= gcc
CFLAGS	= -s -O6 -mpentium -D__ST_MT_ERRNO__ -I.
LDFLAGS	= -Zomf -Zcrtdll	\
	-Zlinker /NOIGNORECASE	\
	-Zlinker /ALIGNMENT:1	\
	-Zlinker /PACKCODE	\
	-Zlinker /PACKDATA	\
	-Zlinker /EXEPACK:2	\
	-Zlinker /NOSECTORALIGNCODE

LIBS	= -L./LIB -lsocket.lib

all:	logger.exe	\
	syslogd.exe	\
	syslog.a	\
	syslog.lib

clean:
	del *.exe /n
	del *.obj /n
	del *.a /n
	del *.lib /n

logger.exe: logger.c syslog.lib
	$(CC) -o $@ $< Logger.Def $(CFLAGS) $(LDFLAGS) $(LIBS) -lsyslog.lib

syslogd.exe: syslogd.c
	$(CC) -o $@ $< getos2path.c SysLogd.Def $(CFLAGS) $(LDFLAGS) $(LIBS)

syslog.a: syslog.o
	ar cr $@ $<

syslog.lib: syslog.a
	emxomf -s $<

syslog.o: syslog.c syslog.h
	$(CC) $(CFLAGS) -o $@ -c $<

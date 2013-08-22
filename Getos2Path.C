/* bind for OS/2
 * bjorn@mork.no
 */

#include <limits.h>

char *getos2path(char *sysvar, char *filename)
{
	static char buf[_POSIX_PATH_MAX];
	char *p;

	if ((p = (char *)getenv(sysvar)) &&
		((strlen(p) + strlen(filename)) < sizeof(buf))) {
		strcpy(buf, p);
		switch(filename[0])
		{
			case '/':
			case '\\':
				break;
			default:
				strcat(buf, "\\");
		}
		strcat(buf, filename);
		return (char *) strdup(buf);
	}
	return filename;	
}

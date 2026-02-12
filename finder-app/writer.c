#include <fcntl.h>
#include <string.h>
#include <syslog.h>
#include <unistd.h>

int main (int argc, char *argv[]) {
    openlog("writer", LOG_PID | LOG_CONS, LOG_USER);

    if (argc != 3) {
        syslog(LOG_ERR, "Usage: %s <filename> <string>", argv[0]);
        return 1;
    }

    char *filename = argv[1];
    char *string   = argv[2];
    int fd;
    ssize_t bytes_written;

    fd = open(filename, O_WRONLY | O_CREAT | O_TRUNC, 0644);

    if (-1 == fd) {
        syslog(LOG_ERR, "Error: File %s could not be created", filename);
        return 1;
    }

    bytes_written = write(fd, string, strlen(string));

    if (-1 == bytes_written) {
        syslog(LOG_ERR, "Error: File %s could not be written", filename);
        close(fd);
        return 1;
    }

    syslog(LOG_DEBUG, "Writing %s to %s", string, filename);

    if (-1 == close(fd)) {
        syslog(LOG_ERR, "Error: File %s could not be closed", filename);
        return 1;
    }

    closelog();

    return 0;
}

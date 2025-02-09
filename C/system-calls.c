/*Write a C program that:
Prompts the user with "Enter a message: " using write().
Reads user input (max 100 characters) using read().
Creates a file named user_message.txt using creat().
Writes "Your message: [user input]" into the file using write().
Prints "Message saved!" to the terminal.
Exits with a status code equal to the length of the input (excluding newline).*/
#include <unistd.h>
#include <fcntl.h>

int main() {
    char user_input[101];
    write(1, "Enter message: ", 15); //write(int fd, const void *buffer, size_t count); 
    //Can check for arguments in man 2 <function-name> for system calls
    int bytes_read = read(0, user_input, 100); 

    // Check for newline and replace it
    if (bytes_read > 0 && user_input[bytes_read - 1] == '\n') {
        user_input[bytes_read - 1] = '\0';  // Replace newline with null terminator
        bytes_read--;  
    }

    // Create file
    int fd = creat("user_message.txt", 0644); //Write read and write perms for the user
    if (fd < 0) {
        write(1, "File creation failed\n", 21);
        _exit(1);
    }

    write(fd, "Your message:\n", 14);
    write(fd, user_input, bytes_read);
    write(fd, "\n", 1);
    close(fd);
    write(1, "Message saved!\n", 15);
    // Exit with status code equal to input length
    _exit(bytes_read);
}
//run: "echo $?" to check the exit status code
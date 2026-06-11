#include <stdlib.h>  // required for EXIT_FAILURE.
#include <errno.h>  // required for errno.
#include <stdio.h>
#include <string.h>  // required for strerror().
#include <unistd.h>
#include <sys/wait.h>  // requiured for waitpid().
#include <time.h> // required for 'tm'-struct.


int main(int argc, char **argv) { // the strict way of receiving no arguments in C:
    (void)argc;
    (void)argv;

    while (1) {
        int my_number;

        printf("Enter an integer: ");
        // The & operator provides the memory address where the value will be stored
        scanf("%d", &my_number); 

        printf("You entered: %d\n", my_number);
        
    }
    return 0;
}

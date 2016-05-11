# build testscript executable when user executes "make"
testscript: testscript.o
	$(CC) $(LDFLAGS) testscript.o -o testscript
testscript.o: testscript.c
	$(CC) $(CFLAGS) -c testscript.c

# remove object files and executable when user executes "make clean"
clean:
	rm *.o testscript

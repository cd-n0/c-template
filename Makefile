include config.mk

################################################################################

all: $(TARGET) compile_flags.txt

# Clean target to remove compiled files
clean:
	rm -rf $(OBJDIR)
	rm -f $(TARGET)
	rm -f $(TESTS)
	rm -f compile_flags.txt

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(LDLIBS)

$(OBJDIR)/%.o : $(SRCDIR)/%.c $(INCS)
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -o $@ -c $<

# Compile the test executables
$(TESTS): $(TESTSRCS)
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ $@.c $(LDLIBS)

# Run the tests
test: $(TESTS) $(TESTSRCS)
	for test in $(TESTS); do \
		./$$test && \
		echo "TEST $$test OK" || \
		echo "TEST $$test FAIL"; \
	done

compile_flags.txt: Makefile
	echo "$(CFLAGS)" | tr ' ' '\n'> compile_flags.txt

.PHONY: all clean

# Process with GNU make

all: test

CXXFLAGS = -g -Wall -std=c++1y
RUST_LIBS = -ldl -lpthread -lrt -lgcc_s -lpthread -lc -lm

lib%.a lib%.a.out : *.rs
	rustc --crate-type staticlib $^ 2> $(<:%.rs=lib%.a.out)

test: RUST_LIBS = $(shell awk '/^note: library: / {print "-l"$$3}' libtest.a.out)
test: TestRust.cpp libtest.a
	$(CXX) $(CXXFLAGS) -c TestRust.cpp
	$(CXX) $(CXXFLAGS) -o $@ TestRust.o libtest.a $(RUST_LIBS)

check: test
	@./test

clean:
	$(RM) test
	$(RM) *.o *.a

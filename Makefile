# Process with GNU make

CXXFLAGS = -g -Wall -std=c++1y
RUST_LIBS = -ldl -lpthread -lrt -lgcc_s -lpthread -lc -lm

test: TestRust.cpp test.rs
	$(CXX) $(CXXFLAGS) -c TestRust.cpp
	rustc --crate-type staticlib test.rs
	$(CXX) $(CXXFLAGS) -o $@ TestRust.o libtest.a $(RUST_LIBS)

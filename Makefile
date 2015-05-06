# Process with GNU make

CXXFLAGS = -g -Wall -std=c++1y

test: TestRust.cpp test.rs
	$(CXX) $(CXXFLAGS) -c TestRust.cpp
	rustc --crate-type staticlib test.rs
	$(CXX) $(CXXFLAGS) -o $@ TestRust.o libtest.a

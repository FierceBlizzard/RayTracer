SDIR := src
TDIR := test
IDIR := include
ODIR := obj

CXX := g++
CXXFLAGS := -std=c++20 -I$(IDIR)

SRCS := $(shell find $(SDIR) -name '*.cpp')
OBJS := $(SRCS:$(SDIR)/%.cpp=$(ODIR)/%.o)

TSRCS := $(shell find $(TDIR) -name '*.cpp'; find $(SDIR) -name '*.cpp' -a \! -name 'main.cpp')
TOBJS := $(TSRCS:$(TDIR)/%.cpp=$(ODIR)/%.o)
TOBJS := $(TOBJS:$(SDIR)/%.cpp=$(ODIR)/%.o)

HDRS := $(shell find $(IDIR) -name *.hpp)

.PHONY: clean

ray-tracer: $(OBJS)
	$(CXX) $(CXXFLAGS) $^ -o ray-tracer

testing: $(TOBJS)
	$(CXX) $(CXXFLAGS) $^ -o testing

$(ODIR)/%.o: $(SDIR)/%.cpp $(HDRS) | $(ODIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(ODIR)/%.o: $(TDIR)/%.cpp $(HDRS) | $(ODIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(ODIR):
	mkdir -p $@

clean:
	rm -rf $(ODIR) ray-tracer testing
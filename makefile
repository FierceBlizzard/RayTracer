SRC_DIR := src
TEST_DIR := test
INCLUDE_DIR := include
ODIR := obj

CXX := g++
CXXFLAGS := -std=c++17 -I$(INCLUDE_DIR)

SRCS := $(wildcard $(SRC_DIR)/*.cpp)
OBJS := $(patsubst $(SRC_DIR)/%.cpp,$(ODIR)/%.o,$(SRCS))

TSRCS := $(wildcard $(TEST_DIR)/*.cpp)
TOBJS := $(patsubst $(TEST_DIR)/%.cpp,$(ODIR)/%.o,$(TSRCS))

HDRS := $(wildcard $(INCLUDE_DIR)/*.hpp)

.PHONY: all clean

all: ray-tracer testing

ray-tracer: $(OBJS)
	$(CXX) $(CXXFLAGS) $^ -o $@

testing: $(TOBJS) $(filter-out $(ODIR)/main.o,$(OBJS))
	$(CXX) $(CXXFLAGS) $^ -o $@

$(ODIR)/%.o: $(SRC_DIR)/%.cpp $(HDRS) | $(ODIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(ODIR)/%.o: $(TEST_DIR)/%.cpp $(HDRS) | $(ODIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(ODIR):
	mkdir -p $@

clean:
	rm -rf $(ODIR) ray-tracer testing
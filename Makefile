# COMMENTS BEGIN WITH A HASH

# THE NAME OF YOUR PROJECT
PROJECT = Trojan
# ALL CPP COMPILABLE IMPLEMENTATION FILES THAT MAKE UP THE PROJECT
SRC_FILES = trojan.cpp
# YOUR USERNAME
USERNAME = gauge_caywood

# NO EDITS BELOW THIS LINE
CXX = g++
CPPVERSION = -std=c++17
CXXFLAGS = -Wall -Wextra $(CPPVERSION)
LDFLAGS = -mconsole

OBJECTS = $(SRC_FILES:.cpp=.o)

ifeq ($(shell echo "Windows"), "Windows")
	TARGET = $(PROJECT).exe
	DEL = del
	ZIPPER = tar -a -c -f
	ZIP_NAME = $(PROJECT)_$(USERNAME).zip
else
	TARGET = $(PROJECT)
	DEL = rm -f
	ZIPPER = tar -acf
	ZIP_NAME = $(PROJECT)_$(USERNAME).zip
endif

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CXX) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -o $@ -c $<

clean:
	$(DEL) $(TARGET) $(OBJECTS)

submission:
	@echo "Creating submission file $(ZIP_NAME) ..."
	@echo "...Zipping source files:   $(SRC_FILES)..."
	@echo "...Zipping Makefile..."
	$(ZIPPER) $(ZIP_NAME) $(SRC_FILES) Makefile
	@echo "...$(ZIP_NAME) done!"

.PHONY: all clean submission

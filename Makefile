cpp_source=sequence_batch.cc index.cc chromap.cc
src_dir=src
objs_dir=objs
objs+= $(patsubst %.cc, $(objs_dir)/%.o, $(cpp_source))

cxx=g++
cxxflags=-std=c++11 -Wall -O3 -funroll-all-loops -fopenmp -march=native
ldflags=-lm -lz

exec=chromap

all: dir $(exec) 
	
dir:
	mkdir -p $(objs_dir)

$(exec): $(objs)
	$(cxx) $(cxxflags) $(ldflags) $(objs) -o $(exec)
	
$(objs_dir)/%.o: $(src_dir)/%.cc
	$(cxx) $(cxxflags) $(ldflags) -c $< -o $@

.PHONY: clean
clean:
	-rm -r $(exec) $(objs_dir)

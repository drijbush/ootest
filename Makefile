PROG =	ootest

SRCS =	complex_data_module.f90 container.f90 data.f90 ks_array.f90 \
	ks_data_module.f90 main.f90 real_data_module.f90

OBJS =	complex_data_module.o container.o data.o ks_array.o ks_data_module.o \
	main.o real_data_module.o

LIBS =	

CC = cc
CFLAGS = -O
FC = f77
FFLAGS = -O
F90 = gfortran
F90FLAGS = -O -g -std=f2008 -Wall -Wextra -fcheck=all -finit-real=snan
LDFLAGS = 

all: $(PROG)

$(PROG): $(OBJS)
	$(F90) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

clean:
	rm -f $(PROG) $(OBJS) *.mod

.SUFFIXES: $(SUFFIXES) .f90

.f90.o:
	$(F90) $(F90FLAGS) -c $<

complex_data_module.o: data.o
data.o: container.o
ks_array.o: ks_data_module.o
ks_data_module.o: complex_data_module.o data.o real_data_module.o
main.o: ks_data_module.o
real_data_module.o: data.o

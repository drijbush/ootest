PROG =	ootest

SRCS =	container.f90 main.f90

OBJS =	container.o main.o

LIBS =	

CC = cc
CFLAGS = -O
FC = f77
FFLAGS = -O
F90 = gfortran
F90FLAGS = -O -g -Wall -Wextra -fcheck=all -finit-real=snan
LDFLAGS = 

all: $(PROG)

$(PROG): $(OBJS)
	$(F90) $(LDFLAGS) -o $@ $(OBJS) $(LIBS)

clean:
	rm -f $(PROG) $(OBJS) *.mod

.SUFFIXES: $(SUFFIXES) .f90

.f90.o:
	$(F90) $(F90FLAGS) -c $<

main.o: container.o

# File: Makefile
# Author: Matthew Lannom
# Date: 2023-09-22
# Description: A makefile to help with compiling the files in this repository

# The g++ compiler
CC = g++

# Name of the executable
TARGET = employee

# Compile with all errors and warnings
CFLAGS = -g -Wall -Wextra

# Default target entry
all: $(TARGET)

# Rule to create executable 
$(TARGET): Employee.o Officer.o Supervisor.o main.o
	$(CC) $(CFLAGS) -o $(TARGET) Employee.o Officer.o Supervisor.o main.o

# Rule to create Employee.o
Employee.o: Employee.cpp Employee.h
	$(CC) $(CFLAGS) -c Employee.cpp

# Rule to create Officer.o
Officer.o: Officer.cpp Employee.h Officer.h
	$(CC) $(CFLAGS) -c Officer.cpp

# Rule to create Supervisor.o
Supervisor.o: Supervisor.cpp Employee.h Supervisor.h
	$(CC) $(CFLAGS) -c Supervisor.cpp

# Rule to create main.o
main.o: main.cpp Employee.h Officer.h Supervisor.h
	$(CC) $(CFLAGS) -c main.cpp

# Removes all objects, Emacs backups, and the target
clean:
	$(RM) $(TARGET) *.o *~

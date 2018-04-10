# This is a Cython file and extracts the relevant classes
# from the C++ header file.

# distutils: language = c++
# distutils: sources = link.cpp

from libcpp cimport bool

cdef extern from "ableton/Link.hpp" namespace "ableton":
    cdef cppclass Link:
        Link(double)
        double bpm
        bool isEnabled() const
        void enable(bool bEnable)


cdef class PythonLink:
    cdef Link *thisptr
    def __cinit__(self, double bpm):
        self.thisptr = new Link(bpm)
    def __dealloc__(self):
        del self.thisptr
    def isEnabled(self):
        return self.thisptr.isEnabled()
    def enable(self, bEnable):
        return self.thisptr.enable(bEnable)

from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

setup(ext_modules=[Extension("link", 
                             ["link.pyx"],
                             include_dirs=["link/include",
                                 "modules/asio-standalone/asio/include"],
                             extra_compile_args=["-fpermissive",
                                 "-Wno-multichar"],
                             define_macros=[("LINK_PLATFORM_LINUX", 1)],
                             language="c++",)],
      cmdclass = {'build_ext': build_ext})

import ctypes
import os

DLL_PATH = os.getenv('DLL_PATH')
LIB = ctypes.CDLL(DLL_PATH)

LIB.hello()
LIB.echo(ctypes.c_char_p(b"hello from python!"))

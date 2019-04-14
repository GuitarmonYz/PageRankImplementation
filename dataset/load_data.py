import os, numpy as np, pickle
from bz2 import BZ2File
from datetime import datetime
from pprint import pprint
from time import time
from tqdm import tqdm_notebook
from scipy import sparse
def get_lines(filename): return (line.split() for line in BZ2File(filename))
import os, numpy as np, pickle
from bz2 import BZ2File
from datetime import datetime
from pprint import pprint
from time import time
from tqdm import tqdm_notebook
from scipy import sparse
import scipy.io
import scipy
def get_lines(filename): 
	return (line.split() for line in BZ2File(filename))

def get_redirect(targ, redirects):
    seen = set()
    while True:
        transitive_targ = targ
        targ = redirects.get(targ)
        if targ is None or targ in seen: break
        seen.add(targ)
    return transitive_targ

def get_redirects(redirects_filename):
    redirects={}
    lines = get_lines(redirects_filename)
    return {src[SLICE]:get_redirect(targ[SLICE], redirects) 
                for src,_,targ,_ in tqdm_notebook(lines, leave=False)}

def add_item(lst, redirects, index_map, item):
    k = item[SLICE]
    lst.append(index_map.setdefault(redirects.get(k, k), len(index_map)))

redirects_filename = './redirects_en.nt.bz2'
page_links_filename = './page_links_en.nt.bz2'
limit=119077682 #5000000
DBPEDIA_RESOURCE_PREFIX_LEN = len("http://dbpedia.org/resource/")
SLICE = slice(DBPEDIA_RESOURCE_PREFIX_LEN + 1, -1)
redirects = get_redirects(redirects_filename)

index_map = dict() # links->IDs
lines = get_lines(page_links_filename)
source, destination, data = [],[],[]
for l, split in tqdm_notebook(enumerate(lines), total=limit):
    if l >= limit: break
    add_item(source, redirects, index_map, split[0])
    add_item(destination, redirects, index_map, split[2])
    data.append(1)

n=len(data)
X = sparse.coo_matrix((data, (destination,source)), shape=(n,n), dtype=np.float32)
X = X.tocsr()

del(data,destination, source)
print(X.shape)
print('saving data')
scipy.io.savemat('./processed_data.mat', mdict={'data':X})
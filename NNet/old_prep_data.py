import numpy as np
import pandas as pd

## Rhulen database
file = pd.read_csv('../data/PNAS/pnas.1424033112.sd01.txt', skiprows = 17, sep = "\t", header = None)
language_name = file[1].values
language_continent = file[6].values

language_labels = [continent + "_" + language for language, continent in zip(language_name, language_continent)]

# Rhulen phoneme information
phonemes = file.iloc[:,9:737]

file = pd.read_csv('../data/PNAS/pnas.1424033112.sd02.txt', skiprows = 16, sep = "\t", header = None)
phonemes_labels = file[1].values

#Data_phonemes_rhulen = pd.DataFrame()

##

phonemes.index = language_labels
phonemes.columns = phonemes_labels

np.savetxt("phonemes_rhulen.txt", phonemes.values, fmt='%d', delimiter='\t')

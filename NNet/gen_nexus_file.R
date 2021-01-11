# In this script, we compute ...
library(data.table)

setwd("~/Box/2.\ Research/3.\ Language/Language-genes/language_genes/NNet")


# RUHLEN PHONEME DATABASE (FULL)

# Read data from .txt
df1 = read.table("../data/PNAS/pnas.1424033112.sd01.txt", sep = "\t", header = TRUE, skip = 17)

phonemes = df1[,10:737]
language_names = df1[,2]
language_isocode = df1[,3]
language_isoa3code = df1[,4]
language_continents = df1[,7]

# Create dataframe
language_labels = gsub(" ", "_", paste(language_continents, paste(language_names,paste(language_isocode, language_isoa3code))))
rownames(phonemes) = make.names(language_labels, unique=TRUE)

# Compute distance matrix
d <- dist(phonemes,method="manhattan",upper = FALSE,diag = TRUE)
d_m = as.matrix(d)

# Write distance matrix as nexus file
write.nexus.dist(d_m,file="nexus_files_inputs/phonemes_ruhlen_full.nex", append = FALSE, upper = FALSE,
                 diag = TRUE) 



# RHULEN DATABASE (REDUCED - 139)
df2 = read.table("../data/Ruhlen/Continents_139ruhlen.txt", sep = "\t", header = TRUE)
df3 = read.table("../data/Ruhlen/NamesRegions_139ruhlen.txt", sep = "\t", header = TRUE)
language_labels_139 = gsub(" ", "_", paste(df2[,1],paste(df3[,1], df3[,2])))

# PHONEMES
# Create dataframe
phonemes_139 = read.table("../data/Ruhlen/Phonemes_139ruhlen.txt", sep = "\t", header = FALSE)
phonemes_139 = transpose(phonemes_139[,1:139])
rownames(phonemes_139) = make.names(language_labels_139, unique=TRUE)
# Compute distance matrix
d <- dist(phonemes_139,method="manhattan",upper = FALSE,diag = TRUE)
d_m = as.matrix(d)
# Write distance matrix as nexus file
write.nexus.dist(d_m,file="nexus_files_inputs/phonemes_ruhlen_139.nex", append = FALSE, upper = FALSE,
                 diag = TRUE) 

# PRONOUNS
# Create dataframe
pronouns_139 = read.table("../data/Ruhlen/Pronouns_139ruhlen.txt", sep = "\t", header = FALSE)
pronouns_139 = transpose(pronouns_139)
rownames(pronouns_139) = make.names(language_labels_139, unique=TRUE)
# Compute distance matrix
d <- dist(pronouns_139,method="manhattan",upper = FALSE,diag = TRUE)
d_m = as.matrix(d)
# Write distance matrix as nexus file
write.nexus.dist(d_m,file="nexus_files_inputs/pronouns_ruhlen_139.nex", append = FALSE, upper = FALSE,
                 diag = TRUE) 

# SYNTAX
syntax_139 = read.table("../data/Ruhlen/Syntax_139ruhlen.txt", sep = "\t", header = FALSE)
syntax_139 = transpose(syntax_139)
rownames(syntax_139) = make.names(language_labels_139, unique=TRUE)
# Compute distance matrix
d <- dist(syntax_139,method="manhattan",upper = FALSE,diag = TRUE)
d_m = as.matrix(d)
# Write distance matrix as nexus file
write.nexus.dist(d_m,file="nexus_files_inputs/syntax_ruhlen_139.nex", append = FALSE, upper = FALSE,
                 diag = TRUE) 
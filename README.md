# Gender-Bias-Thesis
Analysis of gender bias in word embedding

The folder 5TasksGG contains code and data to perform the 5 tasks proposed by Gonen and Goldberg. 

For Gender-Biased Word Relation Task, please first put the original and the post-processed embeddings into the "Gender-Biased Word Relation Task/source" folder, then run ["save_embeds.py"](./5TakskGG/source/save_embdeds.py) to get the vocabulary and the word vectors. Then, put the vocabulary and the word vector files (txt.vocab and txt.wv.npy) into the folder "Gender-Biased Word Relation Task/data/embeddings", and run "remaining_bias.ipynb" to get the experimental results of Gender-Biased Word Relation Task.

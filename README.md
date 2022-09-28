# Comparing Methods for Mitigating Gender Bias in Word Embedding
This repository contains the source code for the paper [Comparing Methods for Mitigating Gender Bias in Word Embedding](), which will be presented at HICCS-56. 
Here is a more extensive version of the analysis, which includes everything described in my [thesis](). 

The aim of this work is to compare different methods for removing gender bias from non contextualized word embedding. 
[GloVe](https://nlp.stanford.edu/projects/glove/)(download pretrained word embedding [here](https://drive.google.com/file/d/1jrbQmpB5ZNH4w54yujeAvNFAfVEG0SuE/view)) is the word embedding considered for the analysis and 6 methods for reducing bias are compared:
 - [Hard Debiasing (HD GloVe)](https://arxiv.org/abs/1607.06520)
download [here]
 - [Gender Nautral GloVe (GN Glove)](https://arxiv.org/abs/1809.01496)
 download [here](https://drive.google.com/file/d/1v82WF43w-lE-vpZd0JC1K8WYZQkTy_ii/view)
 - [Half-Sibling regression (HSR GloVe)](https://arxiv.org/abs/1911.10787)
 download [here](https://drive.google.com/file/d/1w7tl3xSg69L1zURTpQ6qDg0uXab_XKFw/view)
 - [Gender-Preserving (GP gloVe)](https://arxiv.org/abs/1906.00742)
   download [here](https://drive.google.com/file/d/12VK2-BpLAg_-VPVl_wcLBZbzd9wcwyqN/view)
 - [Double-Hard Debias (DHD GloVe)](https://arxiv.org/abs/1906.00742)
 
 - [Repulsion-attraction-Neutralisation (RAN GloVe)](https://arxiv.org/abs/2006.01938)
 download [here](https://drive.google.com/drive/folders/14yebEnP4kXHsTisfbeWxzo0J42O54QtD)
 
Two different combinations of methods are also considered in the analysis:
 - GP-GN GloVe
 download [here](https://drive.google.com/file/d/1Rn--1pxjBhyp5os7zw75VB-YQUHXcfgF/view)
 - HSR-RAN GloVe, obtained by running 
 
To compare all the debiased versione of the GloVe the following measures are considered:
- Average direct bias
- 5 tasks presented by Gonen and Golbderg in [Lipstick on a pig_debiasing methods cover up systematic gender bias in word embedding](https://arxiv.org/abs/1903.03862)
- SemBias  data set, presented by [Zhao et al.](https://arxiv.org/abs/1809.01496), download [here](https://github.com/uclanlp/gn_glove/blob/master/SemBias/SemBias)
- word similarity tasks
- semantic textual similarity tasks 


## 5 tasks and average direct bias
The folder 5TasksGG contains code to perform the 5 tasks proposed by Gonen and Goldberg and to compute the average direct bias. The 5 tasks measure the bias that remains after the method to debias have been applied. 

I briefly recall here which are the tasks as they are presented in the [paper](https://arxiv.org/abs/1903.03862)
1. **Male- and female-biased words cluster together:** the 500 most biased words (both male and female) are taken and 2 clusters are created: the more the clusters align with gender, the more the bias is still present in the embedding
2. **Bias-by-Projection correlats to bias-by-neighbours:** the original measure of bias proposed by Bolukbasi et al. is compared to the percentage of male/female biased words among the k-nearest-neighbours: the higher the correlation, the more the bias is still present
3. **Profession:**  they take the list of professions creted by Bolukbasi et al. and plot them in a graph with the original bias on the X and the number of male neighbours on the Y, before and after debiasing. There should not be correlation between the 2 variables on the axis if the bias is not present. In this analysis a list of sports and a list of adjective are also considered.
4. **Association between female/male and female/male-stereotyped words:** it is a replication of the gender-related experiments from Caliskan et al. (2017). They evaluate the association between female/male names and family and career words, between female/male concept and arts and mathematic words and between female/male concept and art and science words.
5. **Classifying previously female- and male-biased words:** they take the 5000 most biased words according to the original bias and train a RBF-kernel SVM classifier on a random sample of 1000 of them to predict gender and evaluate its generalization on the remaining 4000 

The folder is structured as follows:

1. The [source folder](./Bias/source) contains the code used to perform the tasks, which is a replication of the original code by [Gonen and Goldberg](https://github.com/gonenhila/gender_bias_lipstick). It contains:

- "save_embeds.ipynb" produce the vocabulary and the words vectors from an embdedding.

- "remaining_bias.ipynb" uses vocabulary and embedding to perform the 5 tasks. The average gender bias is computed as well in here. 

2. [Results](./Bias/results) contains all the results, in plots and tables.

- Average_bias contains results for the average direct bias. It contains csv for each method with the bias for each word in the vocabulary and a csv file with the average and standard deviation of each method. It contains also plots with the results and the code for obtaining them ("biasMF.R" and "means.ipynb")
- Clustering contains results for the "Male- and female-biased words cluster together" task. It contains clusters for standard GloVe and for each method.
- Profession contains results for the "Profession" task. It contains results with the lists of professions, adjectives and sports for each method and for the standard GloVe.

3. The [data folder](./5TasksGG/data) contains the lists needed for the analysis.

## SemBias
To evaluate gender information in the word embedding.
The folder contains:
- "Sembias.ipynb" contains code for obtaining results with the SemBias dataset. 
- "SemBias.R" contains code for obtaining plots.
- "SemBias.txt" is the dataset.
- plots of the results of all debiasing methods

## Word Similarity (WS) and Semantic Textual Similarity (STS) tasks
To evaluate the quality of the word embeddings.
The folder contains:
- code for STS ("STS.ipynb") and WS ("word_similarity.ipynb")
- data to perform STS (stsbenchmark) and WS (wordSimData)
- plots of the results of all debiasing methods 





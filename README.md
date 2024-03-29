# Comparing Methods for Mitigating Gender Bias in Word Embedding
This repository contains the source code for the paper **Comparing Methods for Mitigating Gender Bias in Word Embedding**, which will be presented at [HICCS-56](https://hicss.hawaii.edu/) and it is now under publication. Other information can be found in my [thesis](https://github.com/clarabiagi/Thesis). 

Word embedding captures the semantic and syntactic meaning of words into dense vectors. It contains biases learning from data that include constructs, cultural stereotypes, and inequalities of the society. Many methods for removing bias in traditional word embedding have been proposed. In this study we use the original [GloVe](https://nlp.stanford.edu/projects/glove/) word embedding and perform a comparison among debiasing methods built on top of GloVe in order to determine which methods perform the best removing bias. We have defined half-sibling regression, repulsion attraction neutralization GloVe method and compared it with gender-preserving, gender-neutral GloVe method and other debiased methods. According to our results, no methods outperform in all the analyses and completely remove gender information from gender neutral words. Furthermore, all the debiasing methods perform better than the original GloVe.

The pretarained GloVe word embedding can be dowloaded [here](https://drive.google.com/file/d/1jrbQmpB5ZNH4w54yujeAvNFAfVEG0SuE/view).


6 methods for reducing bias have been compared:
 - [Hard Debiasing (HD GloVe)](https://arxiv.org/abs/1607.06520)
download [here](https://drive.google.com/file/d/1QY3ew_nZl3p6lNiYaWMau0-IfVpyIsLB/view?usp=sharing)
 - [Gender Nautral GloVe (GN Glove)](https://arxiv.org/abs/1809.01496)
 download [here](https://drive.google.com/file/d/1v82WF43w-lE-vpZd0JC1K8WYZQkTy_ii/view)
 - [Half-Sibling regression (HSR GloVe)](https://arxiv.org/abs/1911.10787)
 download [here](https://drive.google.com/file/d/1w7tl3xSg69L1zURTpQ6qDg0uXab_XKFw/view)
 - [Gender-Preserving (GP gloVe)](https://arxiv.org/abs/1906.00742)
   download [here](https://drive.google.com/file/d/12VK2-BpLAg_-VPVl_wcLBZbzd9wcwyqN/view)
 - [Double-Hard Debias (DHD GloVe)](https://arxiv.org/abs/1906.00742)
   download [here](https://drive.google.com/file/d/15OTHP-n-O669OjSX433H6Sh-XjdSpTsY/view?usp=sharing)
 - [Repulsion-attraction-Neutralisation (RAN GloVe)](https://arxiv.org/abs/2006.01938)
   download [here](https://drive.google.com/drive/folders/14yebEnP4kXHsTisfbeWxzo0J42O54QtD)
  - GP-GN GloVe
   download [here](https://drive.google.com/file/d/1Rn--1pxjBhyp5os7zw75VB-YQUHXcfgF/view)
   
Furthermore, we have combined different methods to define a new technique:
 - HSR-RAN GloVe
 download [here]()
 
The HSR-RAN GloVe has been obtained by running ['HSR-GloVe_Gender Direction Relation_&_Lexical- and Sentence-Level Evaluation'](https://github.com/KunkunYang/GenderBiasHSR), considering RAN GloVe as the input word embedding.

 
To compare all the methods, the following measures have been considered and are described later:

|Method|Folder|
|---|---|
|Average direct bias|Bias|
|5 tasks presented by Gonen and Golbderg in [Lipstick on a pig_debiasing methods cover up systematic gender bias in word embedding](https://arxiv.org/abs/1903.03862)|Bias|
|SemBias  data set, presented by [Zhao et al.](https://arxiv.org/abs/1809.01496), download [here](https://github.com/uclanlp/gn_glove/blob/master/SemBias/SemBias)|Sembias|
|word similarity tasks|WS_STS|
|semantic textual similarity tasks|WS_STS|


## Average direct bias and 5 Tasks 
The **Bias** folder contains code to perform the 5 tasks and to compute the average direct bias. It is structured as follows:

1. The [source](./Bias/source) folder contains the code used to perform the tasks, which is a replication of the original code by [Gonen and Goldberg](https://github.com/gonenhila/gender_bias_lipstick). It contains:

- [save_embeds.ipynb](./Bias/source/save_embeds.ipynb): produces the vocabulary and the words vectors from an embdedding.

- [remaining_bias.ipynb](./Bias/source/remaining_bias.ipynb): uses vocabulary and embedding to perform the 5 tasks. The average gender bias is computed as well. 

2. The [Results](./Bias/results) folder contains all the results, categorized in the following folders:

- [Average_bias](./Bias/results/Average_bias) contains results for the average direct bias. For each method, it contains a csv file that includes the bias for each word in the vocabulary and a csv file that reports the average and standard deviation. It also contains plots with the results and code for obtaining them (i.e. "biasMF.R" and "means.ipynb")
- [Clustering](./Bias/results/Clustering) contains results for the "Male- and female-biased words cluster together" task. It contains clusters for the standard GloVe and the other considered methods.
- [Profession](./Bias/results/Profession) contains results for the "Profession" task. It contains results with the lists of professions, adjectives and sports for the standard GloVe and the other methods.

3. The [data](./5TasksGG/data) folder contains the lists of professions, adjectives, sports and gendered words needed for the analysis. 

## SemBias task
The **SemBias** folder contains code to evaluate gender information in the word embedding:
- [Sembias.ipynb](./SemBias/Sembias.ipynb): contains code for obtaining results with the SemBias dataset. 
- [SemBias.R](./SemBias/SemBias.R): contains code for obtaining plots.
- [SemBias.txt](./SemBias/SemBias.txt): is the dataset.
- plots of the results of all debiasing methods

## Word Similarity (WS) and Semantic Textual Similarity (STS) tasks
The **WS_STS** folder contains code to evaluate the quality of the word embeddings:
- [STS.ipynb](./WS_STS/STS.ipynb): contains code to perform the STS task
- [word_similarity.ipynb](./WS_STS/word_similarity.ipynb): contains code to perform the WS task
- [stsbenchmark](./WS_STS/stsbenchmark): data for the STS task
- [wordSimData](./WS_STS/wordSimData): data for the WS task
- plots of the results of all debiasing methods 





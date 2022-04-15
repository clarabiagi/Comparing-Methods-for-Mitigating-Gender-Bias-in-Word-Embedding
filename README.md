# Gender-Bias-Thesis
Analysis of gender bias in word embedding

The folder 5TasksGG contains code and data to perform the 5 tasks proposed by Gonen and Goldberg. These tasks measure the bias that remains after the method to debias have been applied.

The [source folder](../5TasksGG/source) contains the code used to perform the tasks. 
"save_embeds.ipynb" produce the vocabulary and the words vectors from an embdedding.
"remaining_bias.ipynb" uses vocabulary and embedding to perferm the 5 tasks.
I briefly recall here which are the tasks as they are presented in the [paper](https://arxiv.org/abs/1903.03862)
1. **Male- and female-biased words cluster together:** the 500 most biased words (both male and female) are taken and 2 clusters are created: the more the clusters align with gender, the more the bias is still present in the embedding
2. **Bias-by-Projection correlats to bias-by-neighbours:** the original measure of bias proposed by Bolukbasi et al. is compared to the percentage of male/female biased words among the k-nearest-neighbours: the higher the correlation, the more the bias is still present
3. **Profession:**  they take the list of professions creted by Bolukbasi et al. and plot them in a graph with the original bias on the X and the number of male neighbours on the Y, before and after debiasing. There should not be correlation between the 2 variables on the axis if the bias is not present
4. **Association between female/male and female/male-stereotyped words:** it is a replication of the gender-related experiments from Caliskan et al. (2017). They evaluate the association between female/male names and family and career words, between female/male concept and arts and mathematic words and between female/male concept and art and science words.
5. **Classifying previously female- and male-biased words:** they take the 5000 most biased words according to the original bias and train a RBF-kernel SVM classifier on a random sample of 1000 of them to predict gender and evaluate its generalization on the remaining 4000 




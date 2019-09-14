%Loading and visualizing the dataset.
%Blue points stand for the survivors. 
data = csvread("iris.csv");
X = data(:, 1:4);
Y = data(:, 5);
plot2figures(X,Y,[],"Dataset");

% Classification: is this amount of data good to make predictions?
% Dividing the dataset in training set and test set
percTs = 0.1;
[Xtr,Ytr,Xts,Yts] = testSplit(X, Y, percTs);
plot2figures(Xtr, Ytr, [], "Training Set");
plot2figures(Xts, Yts, [], "Test Set");

% Performing classification: Decision Tree
[bounds, dims, species] = DecisionTreeTrain(Xtr, Ytr, 10);
[bounds, dims, species] = AddZeros(bounds, dims, species);
[Ypred] = DecisionTreeTest(Xts, bounds, dims, species, 1);
plot2figures(Xts, Ypred, [], "Decision Tree classification");

% % Clustering: is the pattern so recognizable?
% % Hard clustering: k-Medoids
[centers] = randomCenters(X, 3);
[idx, centers] = LloydMedoids(X, centers, 20);
plot2figures(X, idx, centers, "K-Medoids clustering");
 
% % Hard clustering: k-Means
[centers] = randomCenters(X, 3);
[idx, centers] = LloidMeans(X, centers, 20);
plot2figures(X, idx, centers, "K-Means clustering");
 
% % Soft clustering: fuzzy clustering (c-means).
[centers] = randomCenters(X, 3);
[idx, c] = fuzzyClustering(X, centers, 15, 20);
plot2figures(X, idx, c, "Fuzzy clustering, m = 15");
  
[idx, c] = fuzzyClustering(X, centers, 100, 20);
plot2figures(X, idx, c, "Fuzzy clustering, m = 100");
 
[idx, c] = fuzzyClustering(X, centers, 2, 20);
plot2figures(X, idx, c, "Fuzzy clustering, m = 20");

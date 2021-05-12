import numpy as np
import matplotlib.pyplot as plt

class k_means():

    def __init__(self):
        self.centr = []  # centr list
        self.dataClusters = [[] for temp in range(10)]  # dataClusters list of indexes of X

    def lossCal(self, X):  # loss calculation and plot
        numSamples, numFeatures = X.shape
        # initial centroids with random indexes
        randIndex = np.random.choice(numSamples, 10, replace=False)
        for idx in randIndex:
            self.centr.append(X[idx])
        # iterate until converge 
        loss = []
        numIter = []
        num = 1
        while num < 60:
            numIter.append(num)
            num += 1
            # assign trainning points to closest centroids
            self.dataClusters = self.creatClusters(self.centr, X)
            # update centroids after new clusters formed
            lastCentrs = self.centr
            tempCentroids = np.ones((10, numFeatures))
            for cluster_idx, cluster in enumerate(self.dataClusters):
                meanData = np.mean(X[cluster], axis=0)
                tempCentroids[cluster_idx] = meanData
            self.centr = tempCentroids
            # calculate the loss from data points to the centroid
            tempLoss = 0
            for index in range(10):
                for temp in range(len(self.dataClusters[index])):
                    tempIndic = self.dataClusters[index][temp];
                    tempLoss += np.sum((self.centr[index]-X[tempIndic])**2)
            loss.append(tempLoss)  
            # check if converged
            distList = []
            for i in range(10):
                tempDis = np.sum((lastCentrs[i] - self.centr[i])**2)
                distList.append(tempDis)
            if(sum(distList) == 0):
                break
        # plot loss curve
        plt.plot(numIter, loss, linewidth=1.0)
        plt.xlabel('number of iterations')
        plt.ylabel('loss') 
        plt.title('number of iterations vs loss')  
        plt.show()

    def creatClusters(self, centr, X):
        # Assign the samples to the closest centr to create dataClusters
        dataClusters = [[] for i in range(10)]
        for index, trainingSample in enumerate(X):
            losses = []
            for point in centr:
                tempLoss = np.sum((trainingSample-point)**2)
                losses.append(tempLoss)
            centroid_idx = np.argmin(losses)
            dataClusters[centroid_idx].append(index)
        return dataClusters

# read the file and convert to usable aray 
data = np.genfromtxt('mnist_train.csv', delimiter = ',',encoding = "utf8", dtype= None)
dataToArray = []
for e in data:
    dataToArray.append(list(e))
dataToArray = np.array(dataToArray)
y,X = np.split(dataToArray, [1], axis = 1)
kmeans = k_means()
kmeans.lossCal(X)
from __future__ import print_function
from __future__ import division  
import numpy as np
np.random.seed(1337)  # for reproducibility

from keras.datasets import mnist
from keras.models import Sequential
from keras.layers.core import Dense, Dropout, Activation
from keras.optimizers import SGD, Adam, RMSprop
from keras.utils import np_utils
from keras.models import load_model

nb_classes = 10

X_test = np.loadtxt("TestSamples1.csv", delimiter=",")
y_test = np.loadtxt("TestLabels1.csv", delimiter=",")
X_test = X_test.reshape(20000, 120)
X_test = X_test.astype('float32')
X_test /= 255
Y_test = np_utils.to_categorical(y_test, nb_classes)

model = load_model('my_model.h5')


result = model.predict_classes(X_test, batch_size=128, verbose=1)

np.savetxt('result.csv', result, fmt="%d", delimiter = ',') 

y_test_list = y_test.tolist()
result_list = result.tolist()

count = 0
i = 0

while i < len(y_test_list):
    if result_list[i] == y_test_list[i]:
      count = count + 1
    i = i + 1

print('\n')
print('The accuray is:')
print(count/len(y_test_list))

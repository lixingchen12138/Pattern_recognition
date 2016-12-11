'''Trains a simple deep NN on the MNIST dataset.

Gets to 98.40% test accuracy after 20 epochs
(there is *a lot* of margin for parameter tuning).
2 seconds per epoch on a K520 GPU.
'''

from __future__ import print_function
from __future__ import division  
import numpy as np
np.random.seed(1337)  # for reproducibility

from keras.datasets import mnist
from keras.models import Sequential
from keras.layers.core import Dense, Dropout, Activation
from keras.optimizers import SGD, Adam, RMSprop
from keras.utils import np_utils


batch_size = 128
nb_classes = 10
nb_epoch = 30

# input the data
X_train = np.loadtxt("TrainSamples.csv", delimiter=",")
y_train = np.loadtxt("TrainLabels.csv", delimiter=",")



X_train = X_train.reshape(20000, 120)

X_train = X_train.astype('float32')

X_train /= 255



# convert class vectors to binary class matrices
Y_train = np_utils.to_categorical(y_train, nb_classes)




model = Sequential()
model.add(Dense(512, input_shape=(120,)))
model.add(Activation('relu'))
model.add(Dropout(0.2))
model.add(Dense(512))
model.add(Activation('relu'))
model.add(Dropout(0.2))
model.add(Dense(10))
model.add(Activation('softmax'))

model.summary()

model.compile(loss='categorical_crossentropy',
              optimizer=RMSprop(),
              metrics=['accuracy'])

history = model.fit(X_train, Y_train,
                    batch_size=batch_size, nb_epoch=nb_epoch)

model.save('my_model.h5')



# compression_sparse
Compression Sparse Representation

# Create a virtual environment to install all packages in their specific versions, which ensures greater success in executing the algorithm.

# Install virtual enviroment
sudo apt-get install virtualenv

# Create virtual environment
virtualenv -p python3 virtualenv

# Ativate virtual environment
source virtualenv/bin/activate

# Install package and version specific
pip install -r requeriments.txt

# Create representation the texts, example  of the representation in file .sh
sh representations.py.sh

# Optimize hyper-parameter of classifier
sh classifier\_score.py.sh

# Train and predict the classes 
sh classifiers\_predict.py.sh

# Print statistics of results, save stats in stats folder
sh classifiers\_statistics.py.sh

# Expected result at the end of the process
debate\_word\_tfidf\_classifier\_svm & 76.49$\pm$2.68\\

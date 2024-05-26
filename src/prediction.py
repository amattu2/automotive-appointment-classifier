import pickle

# NOTE: Index of the labels must match the index of the labels in the model
whitelist = [
  "Mechanical",
  "Bodywork",
  "Diagnostic",
  "Suspension",
  "Engine",
  "Exhaust",
  "Brakes",
  "Tires"
]

with open("model.pkl", 'rb') as file:
    pickle_model = pickle.load(file)
    file.close()

with open("vectorizer.pkl", 'rb') as file:
    pickle_vectorizer = pickle.load(file)
    file.close()

def predict_labels(comment):
    prediction = pickle_model.predict(pickle_vectorizer.transform([comment]))

    result = {}
    for i, label in enumerate(whitelist):
        result[label] = int(prediction[0][i])

    return result

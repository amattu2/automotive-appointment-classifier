# Introduction

This is a sample project using Python3 and Flask to deploy a Machine Learning
model as a service. The model itself is not publicly available, but the code
and the API are.

See the provided [Notebook](Notebook.ipynb) for more information about building
the model.

# The Model

The model selected for the API is a RandomForestClassifier which is a multi-label
classifier that predicts the labels of a automotive service appointment based
on the description of the appointment.

The categories selected are:

- `Mechanical`
- `Bodywork`
- `Diagnostic`
- `Suspension`
- `Engine`
- `Exhaust`
- `Brakes`
- `Tires`

It's possible for an appointment to have more than one label, and usually very common.

An example prediction of the comment "Oil change, alignment, and rotors" would be:

```json
{
  "Mechanical": 1,
  "Bodywork": 0,
  "Diagnostic": 0,
  "Suspension": 0,
  "Engine": 1,
  "Exhaust": 0,
  "Brakes": 1,
  "Tires": 1
}
```

# Deploying the API

To deploy the local development server, run the following commands:

```bash
pip install flask flask_restful flask_cors pickle
```

```bash
PORT=5000 python src/app.py
```

Open your browser and go to [http://localhost:5000/predict](http://localhost:5000/predict?comment=Oil%20change,%20alignment,%20and%20rotors)

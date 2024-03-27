import runpod  # Required

#load model
model = SetFitModel.from_pretrained("/models/model name")
model.to("cuda") # just in case


def preprocess(data):
    print("working hard here")
    return data

def pred(job):
    job_input = job["input"]
    descriptions = job_input["descriptions"]
    preprocessed_list = list(map(preprocess, descriptions))
    ## your model inferencing goes here
    return preprocessed_list
  


# def get_job(job):
#     job_input = job["input"]
#     data = job_input["transactions"] 
#     return data  


# def predict_proba_list(data):
#     return








runpod.serverless.start({"handler": pred})  # Required
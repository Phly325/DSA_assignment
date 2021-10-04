import ballerina/http;
public type environmentapplicationClientConfig record {
    string serviceUrl;
    http:ClientConfiguration clientConfig;
};

public type environmentapplicationClient client object {
    public http:Client clientEp;
    public environmentapplicationClientConfig config;

    public function __init(environmentapplicationClientConfig config) {
        http:Client httpEp = new(config.serviceUrl, {auth: config.clientConfig.auth, cache: config.clientConfig.cache});
        self.clientEp = httpEp;
        self.config = config;
    }

    public remote function 'resource1(objectLearner 'resource1Body) returns http:Response | error {
        http:Client 'resource1Ep = self.clientEp;
        http:Request request = new;
        json 'resource1JsonBody = check json.constructFrom('resource1Body);
        request.setPayload('resource1JsonBody);

        return check 'resource1Ep->post("/Learner/add", request);
    }
    
    public remote function 'resource2(objectLearner 'resource2Body) returns http:Response | error {
        http:Client 'resource2Ep = self.clientEp;
        http:Request request = new;
        json 'resource2JsonBody = check json.constructFrom('resource2Body);
        request.setPayload('resource2JsonBody);

        return check 'resource2Ep->post("/Learner/update", request);
    }
    
    public remote function 'resource3(string Learner) returns http:Response | error {
        http:Client 'resource3Ep = self.clientEp;
        http:Request request = new;

        return check 'resource3Ep->get("/Studyingmaterials/{Learner}", message = request);
    }
    
};

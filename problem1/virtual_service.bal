import ballerina/http;
import ballerina/openapi;

listener http:Listener ep0 = new(3250, config = {host: "localhost"});

@openapi:ServiceInfo {
    //unable to create resource path
    contract: ""
}
@http:ServiceConfig {
    basePath: ""
}

service virtual_Service on ep0 {

    @http:ResourceConfig {
        methods:["POST"],
        path:"/Learner/add",
        body:"body"
    }
    resource function resource_post_Learner_add (http:Caller caller, http:Request req,  objectLearner  body) returns error? {

    }

    @http:ResourceConfig {
        methods:["POST"],
        path:"/Learner/update",
        body:"body"
    }
    resource function resource_post_Learner_update (http:Caller caller, http:Request req,  objectLearner  body) returns error? {

    }

    @http:ResourceConfig {
        methods:["GET"],
        path:"/Studyingmaterials/{Learner}"
    }
    resource function resource_get_studyingMaterials_Learner (http:Caller caller, http:Request req,  string learner) returns error? {

    }

}

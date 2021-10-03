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
        path:"/learner/add",
        body:"body"
    }
    resource function resource_post_learner_add (http:Caller caller, http:Request req,  objectLearner  body) returns error? {

    }

    @http:ResourceConfig {
        methods:["POST"],
        path:"/learner/update",
        body:"body"
    }
    resource function resource_post_learner_update (http:Caller caller, http:Request req,  objectLearner  body) returns error? {

    }

    @http:ResourceConfig {
        methods:["GET"],
        path:"/studyingMaterials/{learner}"
    }
    resource function resource_get_studyingMaterials_learner (http:Caller caller, http:Request req,  string learner) returns error? {

    }

}

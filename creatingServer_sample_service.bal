import ballerina/grpc;

listener grpc:Listener ep = new (9090);

map<functions> server = [];

@grpc:ServiceDescriptor {descriptor: ROOT_DESCRIPTOR, descMap: getDescriptorMap()}
service "creatingServer" on ep {

    remote function add_new_fn(grpc: Caller caller, functions value) returns string|error {
        server[value.funcName] = <@untainted>value;

        io:println("Add function: " + funcName);

        string payload = "Function added: " + value.funcName;
        error? result = caller->send(payload);
        result = caller->complete();

        if (result is error){
            error simpleError = error("SimpleErrorType", message = "Failed to connect");
        }
    }
    resource function add_fns(grpc: Caller caller, functions value) returns string|error {

        server.push(value);


         
        result = caller->complete();

        return "Function created: " + (value.funcName);

        if (result is error) {
            io:println("Error while connecting: " + result.reason());
            
        }
    }

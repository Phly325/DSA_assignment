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
 remote function delete_fn(grpc: Caller caller, functions value) returns string|error {
       

        if (server.hasKey(value)) {
            boolean black = server.hasKey(value);

            string payload = "Function deleted";

            error? result = caller->send(payload);
            result = caller->complete();

        }else{
            payload = "This function: " + value + " does not exist";
            return error(FUNCTION_NOT_FOUND, funcName = FuncName);
        }
    }
    remote function show_fn(grpc: Caller caller, functions value) returns function|error {
        server.forEach(function (Funcs retrieved)){
            
            if (retrieved.funcName == value.funcName) {
                    
                    result = caller->send("******Reord found ******\nFunction name: " 
                    + retrived.funcName + 
                    "\nFullname: "+ retrived.fullname + 
                    "\nEmail: "+retrieved.email + 
                    "\nAddress: " + retrieved.address + 
                    "\nLanguage: " + retrieved.language + 
                    "\nVersion: " + retrived.version);  
                    
            }
            var result = pr.close();
            if(result is error){
                log:printError("Error occured", err = result);
            }
        }
    }
    remote function show_all_fns(grpc: Caller caller, functions value) returns stream<string, error?>|error {

        error? result = caller->send("********Functions*********");


        server.forEach(function(Funcs retrived){
            
            result = caller->send("Function name:  " + restrived.funcName + 
                    "\nFullname: "+retrieved.fullname + 
                    "\nEmail: "+retrieved.email + 
                    "\nAddress: "+retrieved.address + 
                    "\nLanguage: "+retrieved.language + 
                    "\nVersion: "+retrieved.versionNum.toString());)
            }
        });
        result = caller->complete();
    }
    remote function show_all_with_criteria(grpc: Caller caller, functions value) returns stream<string, error?>|error {
        io:println("*********CHecking for all**********");

    }
}

public type criteria record{|
    string functionName = "";
    string version = "";
|};

public type addRequest record{|
    string functionName = "";
    int version = 0;
    string fullname = "";
    string email = "";
    string address = "";
    string langaue = "";
|};

const string ROOT_DESCRIPTOR = "0A1673747265616D696E675F6275666665722E70726F746F1207736572766963651A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F224E0A08637269746572696112220A0C66756E6374696F6E4E616D65180120012809520C66756E6374696F6E4E616D65121E0A0A76657273696F6E4E756D180220012809520A76657273696F6E4E756D22B2010A0466756E6312220A0C66756E6374696F6E4E616D65180120012809520C66756E6374696F6E4E616D65121E0A0A76657273696F6E4E756D180220012805520A76657273696F6E4E756D121A0A0866756C6C6E616D65180320012809520866756C6C6E616D6512140A05656D61696C1804200128095205656D61696C12180A0761646472657373180520012809520761646472657373121A0A086C616E677561676518062001280952086C616E677561676532A1030A10617373656D626C696E6753657276657212390A0A6164645F6E65775F666E120D2E736572766963652E66756E631A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512360A076164645F666E73120D2E736572766963652E66756E631A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512470A0964656C6574655F666E121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565122B0A0773686F775F666E12112E736572766963652E63726974657269611A0D2E736572766963652E66756E63124C0A0C73686F775F616C6C5F666E73121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565300112560A1673686F775F616C6C5F776974685F6372697465726961121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75653001620670726F746F33";
function getDescriptorMap() returns map<string> {
    return {
        "streaming_buffer.proto":"0A1673747265616D696E675F6275666665722E70726F746F1207736572766963651A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F224E0A08637269746572696112220A0C66756E6374696F6E4E616D65180120012809520C66756E6374696F6E4E616D65121E0A0A76657273696F6E4E756D180220012809520A76657273696F6E4E756D22B2010A0466756E6312220A0C66756E6374696F6E4E616D65180120012809520C66756E6374696F6E4E616D65121E0A0A76657273696F6E4E756D180220012805520A76657273696F6E4E756D121A0A0866756C6C6E616D65180320012809520866756C6C6E616D6512140A05656D61696C1804200128095205656D61696C12180A0761646472657373180520012809520761646472657373121A0A086C616E677561676518062001280952086C616E677561676532A1030A10617373656D626C696E6753657276657212390A0A6164645F6E65775F666E120D2E736572766963652E66756E631A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512360A076164645F666E73120D2E736572766963652E66756E631A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512470A0964656C6574655F666E121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565122B0A0773686F775F666E12112E736572766963652E63726974657269611A0D2E736572766963652E66756E63124C0A0C73686F775F616C6C5F666E73121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565300112560A1673686F775F616C6C5F776974685F6372697465726961121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75653001620670726F746F33",
        "google/protobuf/wrappers.proto":"0A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F120F676F6F676C652E70726F746F62756622230A0B446F75626C6556616C756512140A0576616C7565180120012801520576616C756522220A0A466C6F617456616C756512140A0576616C7565180120012802520576616C756522220A0A496E74363456616C756512140A0576616C7565180120012803520576616C756522230A0B55496E74363456616C756512140A0576616C7565180120012804520576616C756522220A0A496E74333256616C756512140A0576616C7565180120012805520576616C756522230A0B55496E74333256616C756512140A0576616C756518012001280D520576616C756522210A09426F6F6C56616C756512140A0576616C7565180120012808520576616C756522230A0B537472696E6756616C756512140A0576616C7565180120012809520576616C756522220A0A427974657356616C756512140A0576616C756518012001280C520576616C756542570A13636F6D2E676F6F676C652E70726F746F627566420D577261707065727350726F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573620670726F746F33"
        
    };
}

import ballerina/grpc;

public isolated client class creatingServerClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, ROOT_DESCRIPTOR, getDescriptorMap());
    }

    isolated remote function add_new_fn(function|ContextFunction req) returns (string|grpc:Error) {
        map<string|string[]> headers = {};
        function message;
        if (req is ContextFunction) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("service.creatingServer/add_new_fn", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }

    isolated remote function add_new_fnContext(function|ContextFunction req) returns (ContextString|grpc:Error) {
        map<string|string[]> headers = {};
        function message;
        if (req is ContextFunction) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("service.creatingServer/add_new_fn", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }

    isolated remote function add_fns(function|ContextFunction req) returns (string|grpc:Error) {
        map<string|string[]> headers = {};
        function message;
        if (req is ContextFunction) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("service.creatingServer/add_fns", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }

    isolated remote function add_fnsContext(function|ContextFunction req) returns (ContextString|grpc:Error) {
        map<string|string[]> headers = {};
        function message;
        if (req is ContextFunction) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("service.creatingServer/add_fns", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }

    isolated remote function delete_fn(string|ContextString req) returns (string|grpc:Error) {
        map<string|string[]> headers = {};
        string message;
        if (req is ContextString) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("service.creatingServer/delete_fn", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return result.toString();
    }

    isolated remote function delete_fnContext(string|ContextString req) returns (ContextString|grpc:Error) {
        map<string|string[]> headers = {};
        string message;
        if (req is ContextString) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("service.creatingServer/delete_fn", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: result.toString(), headers: respHeaders};
    }

    isolated remote function show_fn(criteria|ContextCriteria req) returns (function|grpc:Error) {
        map<string|string[]> headers = {};
        criteria message;
        if (req is ContextCriteria) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("service.creatingServer/show_fn", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <function>result;
    }

    isolated remote function show_fnContext(criteria|ContextCriteria req) returns (ContextFunction|grpc:Error) {
        map<string|string[]> headers = {};
        criteria message;
        if (req is ContextCriteria) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("service.creatingServer/show_fn", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <function>result, headers: respHeaders};
    }

    isolated remote function show_all_fns(string|ContextString req) returns stream<string, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if (req is ContextString) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("service.creatingServer/show_all_fns", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        StringStream outputStream = new StringStream(result);
        return new stream<string, grpc:Error?>(outputStream);
    }

    isolated remote function show_all_fnsContext(string|ContextString req) returns ContextStringStream|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if (req is ContextString) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("service.creatingServer/show_all_fns", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        StringStream outputStream = new StringStream(result);
        return {content: new stream<string, grpc:Error?>(outputStream), headers: respHeaders};
    }

    isolated remote function show_all_with_criteria(string|ContextString req) returns stream<string, grpc:Error?>|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if (req is ContextString) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("service.creatingServer/show_all_with_criteria", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        StringStream outputStream = new StringStream(result);
        return new stream<string, grpc:Error?>(outputStream);
    }

    isolated remote function show_all_with_criteriaContext(string|ContextString req) returns ContextStringStream|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if (req is ContextString) {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeServerStreaming("service.creatingServer/show_all_with_criteria", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        StringStream outputStream = new StringStream(result);
        return {content: new stream<string, grpc:Error?>(outputStream), headers: respHeaders};
    }
}

public class StringStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|string value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if (streamValue is ()) {
            return streamValue;
        } else if (streamValue is grpc:Error) {
            return streamValue;
        } else {
            record {|string value;|} nextRecord = {value: <string>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
    }
}

public client class CreatingServerStringCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendString(string response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextString(ContextString response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public client class CreatingServerFunctionCaller {
    private grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendFunction(function response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextFunction(ContextFunction response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextStringStream record {|
    stream<string, error?> content;
    map<string|string[]> headers;
|};

public type ContextString record {|
    string content;
    map<string|string[]> headers;
|};

public type ContextCriteria record {|
    criteria content;
    map<string|string[]> headers;
|};

public type ContextFunction record {|
    function content;
    map<string|string[]> headers;
|};

public type criteria record {|
    string functionName = "";
    string 'version = "";
|};

public type function
record {|string functionName = ""; int 'version = 0; string fullName = ""; string email = ""; string address = ""; string language = "";|} ;
const string ROOT_DESCRIPTOR = "0A1273747265616D4275666665722E70726F746F1207736572766963651A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F22480A08637269746572696112220A0C66756E6374696F6E4E616D65180120012809520C66756E6374696F6E4E616D6512180A0776657273696F6E180220012809520776657273696F6E22B0010A0866756E6374696F6E12220A0C66756E6374696F6E4E616D65180120012809520C66756E6374696F6E4E616D6512180A0776657273696F6E180220012805520776657273696F6E121A0A0866756C6C4E616D65180320012809520866756C6C4E616D6512140A05656D61696C1804200128095205656D61696C12180A0761646472657373180520012809520761646472657373121A0A086C616E677561676518062001280952086C616E677561676532AB030A0E6372656174696E67536572766572123D0A0A6164645F6E65775F666E12112E736572766963652E66756E6374696F6E1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565123A0A076164645F666E7312112E736572766963652E66756E6374696F6E1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512470A0964656C6574655F666E121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565122F0A0773686F775F666E12112E736572766963652E63726974657269611A112E736572766963652E66756E6374696F6E124C0A0C73686F775F616C6C5F666E73121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565300112560A1673686F775F616C6C5F776974685F6372697465726961121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75653001620670726F746F33";

isolated function getDescriptorMap() returns map<string> {
    return {"google/protobuf/wrappers.proto": "0A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F120F676F6F676C652E70726F746F62756622230A0B446F75626C6556616C756512140A0576616C7565180120012801520576616C756522220A0A466C6F617456616C756512140A0576616C7565180120012802520576616C756522220A0A496E74363456616C756512140A0576616C7565180120012803520576616C756522230A0B55496E74363456616C756512140A0576616C7565180120012804520576616C756522220A0A496E74333256616C756512140A0576616C7565180120012805520576616C756522230A0B55496E74333256616C756512140A0576616C756518012001280D520576616C756522210A09426F6F6C56616C756512140A0576616C7565180120012808520576616C756522230A0B537472696E6756616C756512140A0576616C7565180120012809520576616C756522220A0A427974657356616C756512140A0576616C756518012001280C520576616C756542570A13636F6D2E676F6F676C652E70726F746F627566420D577261707065727350726F746F50015A057479706573F80101A20203475042AA021E476F6F676C652E50726F746F6275662E57656C6C4B6E6F776E5479706573620670726F746F33", "streamBuffer.proto": "0A1273747265616D4275666665722E70726F746F1207736572766963651A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F22480A08637269746572696112220A0C66756E6374696F6E4E616D65180120012809520C66756E6374696F6E4E616D6512180A0776657273696F6E180220012809520776657273696F6E22B0010A0866756E6374696F6E12220A0C66756E6374696F6E4E616D65180120012809520C66756E6374696F6E4E616D6512180A0776657273696F6E180220012805520776657273696F6E121A0A0866756C6C4E616D65180320012809520866756C6C4E616D6512140A05656D61696C1804200128095205656D61696C12180A0761646472657373180520012809520761646472657373121A0A086C616E677561676518062001280952086C616E677561676532AB030A0E6372656174696E67536572766572123D0A0A6164645F6E65775F666E12112E736572766963652E66756E6374696F6E1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565123A0A076164645F666E7312112E736572766963652E66756E6374696F6E1A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C756512470A0964656C6574655F666E121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565122F0A0773686F775F666E12112E736572766963652E63726974657269611A112E736572766963652E66756E6374696F6E124C0A0C73686F775F616C6C5F666E73121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C7565300112560A1673686F775F616C6C5F776974685F6372697465726961121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A1C2E676F6F676C652E70726F746F6275662E537472696E6756616C75653001620670726F746F33"};
}



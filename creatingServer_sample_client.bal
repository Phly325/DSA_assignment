import ballerina/grpc;
import ballerina/io;


string bMode = choice;
public function main() {

    creatingServerBlockingClient ep = check new ("http://localhost:9090");

    function displayOptions(){
        io:println("Select what you would like to do below:");
        io:println("1. add_new_fn");
        io:println("2. add_fns");
        io:println("3. delete_fn");
        io:println("4. show_fn");
        io:println("5. show_all_fns");

        if(choice == "1"){
            add_new_fn();
        }
        else if(choice == "2"){
            add_fn();
        }
        else if(choice == "3"){
            delete_fn();
        }
        else if(choice == "4"){
            show_fn();
        }
        else if(choice == "5"){
            show_all_fns();
        }
        else if(choice == "6"){
            exit();
        }else{
            io:println("Try again, incorrect input");
            displayOptions();
        }
    }


    if (bMode = "add_new_fn") {
        
         functionName = io:readln("Adding new function: ");
         devName = io:readln("Enter the developer name: ");
         email = io:readln("Enter email: ");
         address = io:readln("Enter address: ");
         language = io:readln("Enter the programming language: ")

        function newFunction = {
            funcName: functionName,
            fullName: devName,
            devEmail: email,
            devAddress: address,
            imLanguage: langauge,
            version: 1 
        };
    var response = blockingEp->add_new_fn(newFunction);

    if(response is error){
        log:printError("Error while connecting");

    }else{
        string result;
    grpc:Headers resHeaders;
    [result, resHeaders] = response;
    io:println("Response " + result + " \n" );
    }
}else if(bMode =="add_fns"){
    foreach var i in bMode{
    io:println("*************************************************************************");
    functionName = io:readln(i.toString() + "Add function name: ");
    devName = io:readln(i.toString() + "Enter the developer name: ");
    email = io:readln(i.toString() + "Enter email: ");
    address = io:readln(i.toString() + "Enter address: ");
    language = io:readln(i.toString() + "Enter the programming language: ")
    
    var res = blockingEp->add_fns(new);
    }
    
}else if(bMode == "delete_fn"){
    
    functionName = io:readln("Deleting function: ");

    var response = blockingEp->delete_fn(functionName);

    if (response is error){

        
    }else{
    string result;
    grpc:Headers resHeaders;
    [result, resHeaders] = response;
    io:println("Response " + result + "\n");
    }
    
    }else if(bMode == "show_fn"){
        functionName = io:readln("Enter function name: ");
        vers = io:readln("Enter version:");

        criteria ccriteria = {
            funcName: functionName,
            version: vers
        };
        var response = blockingEp->show_fn(ccriteria);

        if (response is error){
            
        }else {
            function result;
            grpc: Headers resHeaders;
            [result, resHeaders] = response;
        }
    }else if(bMode == "show_all_fns"){
        creatingServerClient nonBlockingEp = new("http://localhost:9090");
        grpc:Error? response = nonBlockingEp->show_all_fns(creatingMessageListener);

        if(response is grpc:Error?){

        }else{
            io:println("Done")
        }
    }
}

function exit(){
    io:println("************Thank you, Good bye!***********")
}
service creatingMessageListener = service{
    resources function onMessage(string record){
        io:println(record);
    }
    resource function onError(error err){
        log:printError("Error while connecting", err = result);
    }
    resouces function onComplete(){
        io:println("!");
    }
}

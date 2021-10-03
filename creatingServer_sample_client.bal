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

import ballerina/http;
import ballerinax/mysql;
import ballerina/log;
import ballerina/io;

type CourseOutline record {
    int Id;
    json courseInformation;
    json LeactureInformation;
    json LearningOutcomes;
    json CourseContent;
    boolean IsSignedByLeavture;
    boolean IsApprovedByHoD;
};

type LeactureInformation record {|
    string Name;
    string Emai;
    string OfficePhone;
    string OfficeLocation;
    string OfficeHours;
    string ConsultationHours;
|};

service /courseOutline/Leacture on new http:Listener(9096) {

    resource function get viewCourseOutlines(http:Caller caller, int Id) returns error? {
        http:Response response = new ();
        mysql:Client mysqlClient = check new (user = "root", password = "@Thom-lax11", database = "computingandinformatics");

        if (Id == 0) {
            response.setJsonPayload({"Message": "Invalid payload - lectureName"});
            var result = caller->respond(response);
            if (result is error) {
                log:printError("Error sending response", result);
            }
        } else {
            stream<CourseOutline, error?> resultStream =
            mysqlClient->query(` SELECT * FROM computingandinformatics.courseoutline where Id=${Id}`);

            json[] courseOutlines = [];

            error? e = resultStream.forEach(function(CourseOutline result) {
                courseOutlines.push(result.toJson());
                io:println("\n");
            });

            response.setJsonPayload(courseOutlines);

            var result = caller->respond(response);
            if (result is error) {
                log:printError("Error sending response", result);
            }

        }
    }

    resource function put signCourseOutline(http:Caller caller, int Id) returns error? {
        http:Response response = new ();
        mysql:Client mysqlClient = check new (user = "root", password = "@Thom-lax11", database = "computingandinformatics");

        if (Id == 0) {
            response.setJsonPayload({
                "Message": "Invalid payload - Id or approave code"});
            var result = caller->respond(response);
            if (result is error) {
                log:printError("Error sending response", result);
            }
        } else {
            _ = check mysqlClient->execute(`UPDATE CourseOutline SET IsSignedByLeacture=${true}     WHERE Id =${Id}    ;`);

            check mysqlClient.close();

            json payload = {status: "Course Outline approaved by HoD"};
            response.setJsonPayload(payload);
            var result = caller->respond(response);
            if (result is error) {
                log:printError("Error sending response", result);
            }
        }
    }

    resource function post createCourseOutline(http:Caller caller, http:Request request) returns error? {
        http:Response response = new ();
        mysql:Client mysqlClient = check new (user = "root", password = "@Thom-lax11", database = "computingandinformatics");

        var courseOutlineReq = request.getJsonPayload();
        if (courseOutlineReq is error) {
            response.setJsonPayload({"Message": "Invalid payload - Not a valid JSON payload"});
            var result = caller->respond(response);
            if (result is error) {
                log:printError("Error sending response", result);
            }

        } else {

            json|error courseInformation = courseOutlineReq.courseInformation;
            json|error LeactureInformation = courseOutlineReq.LeactureInformation;
            json|error LearningOutcomes = courseOutlineReq.LearningOutcomes;
            json|error CourseContent = courseOutlineReq.CourseContent;
            json|error IsSignedByLeacture = courseOutlineReq.IsSignedByLeacture;
            json|error IsApprovedByHoD = courseOutlineReq.IsApprovedByHoD;

            if (courseInformation is error || LeactureInformation is error || LearningOutcomes is error || CourseContent is error || IsSignedByLeacture is error || IsApprovedByHoD is error) {

                response.setJsonPayload({"Message": "Bad Request: Invalid payload"});
                var responseResult = caller->respond(response);
                if (responseResult is error) {
                    log:printError("Error sending response", responseResult);
                }

            } else {
                _ = check mysqlClient->execute(`INSERT INTO CourseOutline(Id,courseInformation,LeactureInformation,LearningOutcomes,CourseContent,IsSignedByLeacture,IsApprovedByHoD)
                VALUES(0,${courseInformation.toString()},${LeactureInformation.toString()},${LearningOutcomes.toString()},${CourseContent.toString()},${<boolean>IsSignedByLeacture},${<boolean>IsApprovedByHoD})`);

                check mysqlClient.close();

                json payload = {status: "Course Outline successfully created"};
                response.setJsonPayload(payload);
                var result = caller->respond(response);
                if (result is error) {
                    log:printError("Error sending response", result);
                }
            }
        }
    }
}

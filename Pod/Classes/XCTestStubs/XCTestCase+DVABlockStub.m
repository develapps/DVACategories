//
//  XCTestCase+DVABlockStub.m
//  AquaService
//
//  Created by Pablo Romeu on 11/6/15.
//  Copyright (c) 2015 Develapps. All rights reserved.
//

#import "XCTestCase+DVABlockStub.h"

@implementation XCTestCase (DVABlockStub)

#pragma mark - UTILS

-(NSString*)httpOp:(DVAStubOp)operation{
    switch (operation) {
        case kDVAStubGET:
            return @"GET";
            break;
        case kDVAStubPOST:
            return @"POST";
            break;
        case kDVAStubPUT:
            return @"PUT";
            break;
            
        default:
            return nil;
            break;
    }
    return nil;
}

#pragma stubbing

-(id <OHHTTPStubsDescriptor>)stubEndpoint:(NSString*)endpoint
                                   withOp:(DVAStubOp)operation
                         withResponseJson:(id)responseJson
                            andStatusCode:(int)statusCode
                               andHeaders:(NSDictionary*)headers
                           andRequestTime:(NSTimeInterval)requestTime
                          andResponseTime:(NSTimeInterval)responseTime
{
    if ([endpoint length]>0) {
        NSURL*endpointUrl=[[[AFHTTPSessionManager manager] baseURL] URLByAppendingPathComponent:endpoint];
        NSString*stringEndPoint= [NSString stringWithFormat:@"%@",endpointUrl];
        
        if ([stringEndPoint  length]>0) {
            
            id <OHHTTPStubsDescriptor> stub=[OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
                
                if (![request.HTTPMethod isEqualToString:[self httpOp:operation]]) {
                    return NO;
                }
                NSString*queryString=[NSString stringWithFormat:@"%@",request.URL];
                return [queryString rangeOfString:endpoint].location!=NSNotFound;
                
            } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
                // Stub it with our "responseFile.json" stub file
                OHHTTPStubsResponse*response=[OHHTTPStubsResponse responseWithJSONObject:responseJson statusCode:statusCode headers:headers ];
                return [response requestTime:requestTime responseTime:responseTime];
            }];
            
            stub.name=endpoint;
            return stub;
        }
        
    }
    return nil;
}

#pragma convenience methods

-(void)dva_testBlock:(void (^)())testBlock
    stubbingEndpoint:(NSString*)endpoint
            withJson:(id)json
              opType:(DVAStubOp)type{
    
    [self dva_testBlock:testBlock
       stubbingEndpoint:endpoint
               withJson:json
                 opType:type
                andCode:kDVAStubCodeOk
             andHeaders:@{@"Content-Type":@"application/json"}];
}

-(void)dva_testBlock:(void (^)())testBlock
    stubbingEndpoint:(NSString*)endpoint
            withJson:(id)json
              opType:(DVAStubOp)type
             andCode:(DVAStubResponseHTTPCodes)statusCode{
    
    [self dva_testBlock:testBlock
       stubbingEndpoint:endpoint
               withJson:json
                 opType:type
                andCode:statusCode
             andHeaders:@{@"Content-Type":@"application/json"}];
}

-(void)dva_testBlock:(void (^)())testBlock
    stubbingEndpoint:(NSString*)endpoint
            withJson:(id)json
              opType:(DVAStubOp)type
             andCode:(DVAStubResponseHTTPCodes)statusCode
          andHeaders:(NSDictionary *)headers{
    
    [self dva_testBlock:testBlock
       stubbingEndpoint:endpoint
               withJson:json
                 opType:type
                andCode:statusCode
             andHeaders:headers
         andRequestTime:0
        andResponseTime:OHHTTPStubsDownloadSpeedWifi];
    
}

#pragma full stubbing block

-(void)dva_testBlock:(void (^)())testBlock
    stubbingEndpoint:(NSString*)endpoint
            withJson:(id)json
              opType:(DVAStubOp)type
             andCode:(DVAStubResponseHTTPCodes)statusCode
          andHeaders:(NSDictionary *)headers
      andRequestTime:(NSTimeInterval)requestTime
     andResponseTime:(NSTimeInterval)responseTime{
    
    [OHHTTPStubs onStubActivation:^(NSURLRequest *request, id<OHHTTPStubsDescriptor> stub) {
        NSLog(@"\n----\nTEST STUB:%@ stubbed by %@.\n----\n", request.URL, stub.name);
    }];
    
    id <OHHTTPStubsDescriptor>stub=[self stubEndpoint:endpoint
                                               withOp:type
                                     withResponseJson:json
                                        andStatusCode:statusCode
                                           andHeaders:headers
                                       andRequestTime:requestTime
                                      andResponseTime:responseTime];
    if (!stub) {
        XCTFail(@"TEST STUB: COULD NOT STUB OP %@ with %@",endpoint,json);
    }
    else{
        NSLog(@"\n----\nTEST STUB: Added stub %@ for \n -op %@:%@\n -json %@\n -code %lu:%@ \n -headers %@ \n----\n",stub.name,endpoint,[self httpOp:type],json,(unsigned long)statusCode,[NSHTTPURLResponse localizedStringForStatusCode:statusCode],headers);
        
        testBlock(^{
            NSLog(@"\n----\nTEST STUB:removing all stubs %@\n----\n",[OHHTTPStubs allStubs]);
            [OHHTTPStubs removeAllStubs];
        });
        [self waitForExpectationsWithTimeout:10 handler:^(NSError *error) {
            NSLog(@"\n----\nTEST STUB:removing stubs %@\n----\n",[OHHTTPStubs allStubs]);
            [OHHTTPStubs removeAllStubs];
        }];
    }
}

#pragma utils

-(id)dva_readJsonFile:(NSString*)json{
    NSString *filePath = [[NSBundle bundleForClass:[self class]] pathForResource:json ofType:@"json"];
    NSString *myJSON = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    NSError *error =  nil;
    XCTAssert(myJSON,@"ERROR: No JSON FILE %@.json",json);
    return [NSJSONSerialization JSONObjectWithData:[myJSON dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:&error];
}
@end

//
//  XCTestCase+DVABlockStub.h
//  AquaService
//
//  Created by Pablo Romeu on 11/6/15.
//  Copyright (c) 2015 Develapps. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OHHTTPStubs/OHHTTPStubs.h>
#import <AFNetworking/AFNetworking.h>

/**
 Stubbing op type
 */
typedef enum : NSUInteger {
    kDVAStubGET,
    kDVAStubPOST,
    kDVAStubPUT,
} DVAStubOp;


typedef enum : NSUInteger {
    kDVAStubCodeOk          =200,
    kDVAStubCodeNotFound    =404,
    kDVAStubCodeTimeout     =408,
} DVAStubResponseHTTPCodes;



/**
 @author Pablo Romeu, 15-06-11 11:06:31
 
 Extend test with block stubbing
 
 @since 1.0.4
 */
@interface XCTestCase (DVABlockStub)

#pragma mark convenience methods

/**
 @author Pablo Romeu, 15-06-11 14:06:00
 
 Stubs a test block with expectations. Shorthand to `dva_testBlock:stubEndpoint:withOp:withResponseFile:andStatusCode:andHeaders:`
 
 Defaults code to 200 and headers to @{@"Content-Type":@"application/json"}.
 
 @warning This will call `waitForExpectationsWithTimeout:handler:` by itself to discard stubbing. Do not do it yourself.
 
 @param testBlock the test block
 @param endpoint  the endpoint to test
 @param json      the json response
 @param type      the operation type
 
 @see `dva_testBlock:stubEndpoint:withOp:withResponseFile:andStatusCode:andHeaders:`
 
 @since 1.0.4
 */
-(void)dva_testBlock:(void (^)())testBlock
    stubbingEndpoint:(NSString*)endpoint
            withJson:(id)json
              opType:(DVAStubOp)type;

/**
 @author Pablo Romeu, 15-06-15 17:06:40
 
 Stubs a test block with expectations. Shorthand to `dva_testBlock:stubEndpoint:withOp:withResponseFile:andStatusCode:andHeaders:`
 
 Defaults code to 200 and headers to @{@"Content-Type":@"application/json"}.
 
 @warning This will call `waitForExpectationsWithTimeout:handler:` by itself to discard stubbing. Do not do it yourself.
 
 @param testBlock the test block
 @param endpoint  the endpoint to test
 @param json      the json response
 @param type      the operation type
 @param statusCode the returning HTTP status code

 @see `dva_testBlock:stubEndpoint:withOp:withResponseFile:andStatusCode:andHeaders:`
 
 @since 1.0.4

 */
-(void)dva_testBlock:(void (^)())testBlock
    stubbingEndpoint:(NSString*)endpoint
            withJson:(id)json
              opType:(DVAStubOp)type
             andCode:(DVAStubResponseHTTPCodes)statusCode;


/**
 @author Pablo Romeu, 15-06-15 16:06:38
 
 Stubs a test block with expectations.
 
 @warning This will call `waitForExpectationsWithTimeout:handler:` by itself to discard stubbing. Do not do it yourself.
 
 @param testBlock the test block
 @param endpoint  the endpoint to test
 @param json      the json response
 @param type      the operation type
 @param statusCode the returning HTTP status code
 @param headers    the returning headers
 
 @since 1.0.4
 */
-(void)dva_testBlock:(void (^)())testBlock
    stubbingEndpoint:(NSString*)endpoint
            withJson:(id)json
              opType:(DVAStubOp)type
             andCode:(DVAStubResponseHTTPCodes)statusCode
          andHeaders:(NSDictionary*)headers;

#pragma mark tester with link conditioner

/**
 @author Pablo Romeu, 15-06-22 15:06:33
 
 Stubs a test block with expectations.
 
 @warning This will call `waitForExpectationsWithTimeout:handler:` by itself to discard stubbing. Do not do it yourself.
 
 @param testBlock the test block
 @param endpoint  the endpoint to test
 @param json      the json response
 @param type      the operation type
 @param statusCode the returning HTTP status code
 @param headers    the returning headers
 @param requestTime  a request time. must be >=0
 @param responseTime response time. If >=0, a time response will be applied. If <0 then download speed will be applied. See `OHHTTPStubsDownloadSpeed` constants
 
 @since 1.0.4
 */

-(void)dva_testBlock:(void (^)())testBlock
    stubbingEndpoint:(NSString*)endpoint
            withJson:(id)json
              opType:(DVAStubOp)type
             andCode:(DVAStubResponseHTTPCodes)statusCode
          andHeaders:(NSDictionary*)headers
      andRequestTime:(NSTimeInterval)requestTime
     andResponseTime:(NSTimeInterval)responseTime;

#pragma mark utils

-(id)dva_readJsonFile:(NSString*)json;


@end

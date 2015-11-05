//
//  XCTestCase+DVANetworkStub.h
//  AquaService
//
//  Created by Pablo Romeu on 11/6/15.
//  Copyright (c) 2015 Develapps. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OHHTTPStubs/OHHTTPStubs.h>
#import <OHHTTPStubs/OHHTTPStubsResponse+JSON.h>
#import <OHHTTPStubs/OHPathHelpers.h>
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


typedef enum : NSUInteger {
    kDVANetworkStubConfiguratorValueEndpoint,
    kDVANetworkStubConfiguratorValueJson,
    kDVANetworkStubConfiguratorValueReadFile,
    kDVANetworkStubConfiguratorValueType,
    kDVANetworkStubConfiguratorValueStatuscode,
    kDVANetworkStubConfiguratorValueHeaders,
    kDVANetworkStubConfiguratorValueRequestTime,
    kDVANetworkStubConfiguratorValueResponseTime,
    kDVANetworkStubConfiguratorValueWaitTime,
} DVANetworkStubConfiguratorValue;

/**
 @author Pablo Romeu, 15-06-11 11:06:31
 
 Container object to configure a stub. If no values are set it uses default ones:
 
    _statusCode     =   kDVAStubCodeOk;
    _type           =   kDVAStubGET;
    _headers        =   @{@"Content-Type":@"application/json"};
    _requestTime    =   1;
    _responseTime   =   OHHTTPStubsDownloadSpeedWifi;
    _json           =   @"{}";
    _waitTime       =   10;
 
 @since 1.0.4
 */
@interface DVANetworkStubConfigurator : NSObject
@property (nonatomic,strong)    NSString                    *endpoint;
@property (nonatomic,strong)    id                          json;
@property (nonatomic)           DVAStubOp                   type;
@property (nonatomic)           DVAStubResponseHTTPCodes    statusCode;
@property (nonatomic,strong)    NSDictionary*               headers;
@property (nonatomic)           NSTimeInterval              requestTime;
@property (nonatomic)           NSTimeInterval              responseTime;
@property (nonatomic)           NSTimeInterval              waitTime;
+(instancetype)configuratorWithDictionary:(NSDictionary*)dictionary;
+(id)dva_readJsonFile:(NSString*)json;
@end



/**
 @author Pablo Romeu, 15-06-11 11:06:31
 
 Extend test with network stubbing. Sample:
 
    - (void)tearDown {
        // It is important to remove the stubs after each test
        if (kStubsEnabled) [OHHTTPStubs removeAllStubs];
        [super tearDown];
 
    }

    - (void)testWhatever{
         // If enabled, add the stub
        if (kStubsEnabled){
            DVANetworkStubConfigurator *configurator = [DVANetworkStubConfigurator new];
            configurator.endpoint       = kTagURLAquamigoGetAllInfo;
            configurator.json           = [DVANetworkStubConfigurator dva_readJsonFile:@"Rechability"];
            configurator.type           = kDVAStubPOST;
            [self dva_stubOperationWithOptions:configurator];
        }
 
        XCTestExpectation *registerExpect = [self expectationWithDescription:@"reachabilityOk"];
 
        [[AQSRequestManager shared] postOp:kTagURLAquamigoGetAllInfo withParameters:nil completion:^(NSURL *redirectURL, NSDictionary *json, BOOL success, NSError *error) {
            XCTAssertTrue(success, @"TEST %s FAILED: Error in call was %@",__PRETTY_FUNCTION__,error);
            [registerExpect fulfill];
        }];
 
        [self waitForExpectationsWithTimeout:5 handler:nil];
    }
 @warning You MUST be sure not to call NSURLSessionConfiguration shared instance before you stub a method. For example, at `ApplicationDidFinishLaunchingWithOptions:` method.
 
 
 @since 1.0.4
 */
@interface XCTestCase (DVANetworkStub)

#pragma mark convenience methods

/**
 @author Pablo Romeu, 15-06-11 14:06:00
 
 Stubs a test with expectations. If no configurator is passed default values are used
 
 @warning This will call `waitForExpectationsWithTimeout:handler:` by itself to discard stubbing. Do not do it yourself.
 
 @param configuration the test configurator
*/
-(void)dva_stubOperationWithOptions:(DVANetworkStubConfigurator*)configuration;

/**
 @author Pablo Romeu, 15-06-11 14:06:00
 
 Stubs a test with expectations. If no configurator is passed default values are used
 
 @warning This will call `waitForExpectationsWithTimeout:handler:` by itself to discard stubbing. Do not do it yourself.
 
 @param configurations an array of test configurators
 */
-(void)dva_stubOperationWithOptionsArray:(NSArray*)configurations;



@end

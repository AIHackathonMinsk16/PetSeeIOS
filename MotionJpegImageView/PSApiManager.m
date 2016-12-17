//
//  PSApiManager.m
//  MotionJpegImageView
//
//  Created by Anthony Marchenko on 12/17/16.
//  Copyright © 2016 ThinkFlood Inc. All rights reserved.
//

#import "PSApiManager.h"
#import <AFNetworking.h>

@interface PSApiManager()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@end

@implementation PSApiManager

static PSApiManager* _manager = NULL;


+ (instancetype) manager {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _manager = [[[self class] alloc] init];
  });
  return _manager;
}


- (id)init {
  self = [super init];
  if (self) {
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://URL HERE"] sessionConfiguration:config];
    _sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    _sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    _sessionManager.securityPolicy.allowInvalidCertificates = YES;
  }
  
  return self;
}

- (void)moveForward {
    [self.sessionManager POST:@"forward" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
  
     // completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
  
  
     // completion(nil, error);
    }];
  
}
- (void)moveReverse {
  
}

- (void)moveLeft {
  
}

- (void)moveRight {
  
}

- (void)stop {
  
}

- (void)forward {
}
 // NSDictionary *params = @{@"email": user.email,
             //              @"password": user.password,
               //            @"deviceId": @"234234234234234"
                //           };
 // self.sessionManager
//  [self.sessionManager POST:@"forward" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//    
//   // completion(responseObject, nil);
//  } failure:^(NSURLSessionDataTask *task, NSError *error) {
//    
//   // NSLog(@"%@", error);
//    
//   // completion(nil, error);
//  }];

@end

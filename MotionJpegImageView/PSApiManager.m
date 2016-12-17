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
    _sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://192.168.43.198:3000"] sessionConfiguration:config];
    _sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
    _sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    [_sessionManager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    _sessionManager.securityPolicy.allowInvalidCertificates = YES;
  }
  
  return self;
}

- (void)moveForward {
    [self.sessionManager GET:@"forward" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
     // completion(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
     // completion(nil, error);
    }];
  
}

- (void)moveReverse {
  [self.sessionManager GET:@"reverse" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
    // completion(responseObject, nil);
  } failure:^(NSURLSessionDataTask *task, NSError *error) {
    // completion(nil, error);
  }];
}

- (void)moveLeft {
  [self.sessionManager GET:@"left" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
    // completion(responseObject, nil);
  } failure:^(NSURLSessionDataTask *task, NSError *error) {
    // completion(nil, error);
  }];
  
}

- (void)moveRight {
  [self.sessionManager GET:@"right" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
    // completion(responseObject, nil);
  } failure:^(NSURLSessionDataTask *task, NSError *error) {
    // completion(nil, error);
  }];
}

- (void)stop {
  [self.sessionManager GET:@"stop" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
    // completion(responseObject, nil);
  } failure:^(NSURLSessionDataTask *task, NSError *error) {
    // completion(nil, error);
  }];
}

- (void)on {
  [self.sessionManager GET:@"on" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
    // completion(responseObject, nil);
  } failure:^(NSURLSessionDataTask *task, NSError *error) {
    // completion(nil, error);
  }];
}

- (void)off {
  [self.sessionManager GET:@"off" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
    // completion(responseObject, nil);
  } failure:^(NSURLSessionDataTask *task, NSError *error) {
    // completion(nil, error);
  }];
}



@end

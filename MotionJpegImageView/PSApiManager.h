//
//  PSApiManager.h
//  MotionJpegImageView
//
//  Created by Anthony Marchenko on 12/17/16.
//  Copyright © 2016 ThinkFlood Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CompletionBlock)(id response, NSError* error);

@interface PSApiManager : NSObject

+ (instancetype) manager;

- (void)moveForward;
- (void)moveReverse;
- (void)moveLeft;
- (void)moveRight;
- (void)stop;

- (void)on;
- (void)off;

@end

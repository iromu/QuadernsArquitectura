//
// Created by wantez on 26/01/14.
// Copyright (c) 2014 Ivan Rodriguez Murillo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Util : NSObject
+ (NSArray *)loadFilesFrom:(NSString *)path withExtension:(NSString *)extension;

+ (NSArray *)twoPageParser:(NSArray *)images;
@end
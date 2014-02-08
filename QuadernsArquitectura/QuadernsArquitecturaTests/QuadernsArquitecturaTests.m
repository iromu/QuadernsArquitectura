//
//  QuadernsArquitecturaTests.m
//  QuadernsArquitecturaTests
//
//  Created by wantez on 26/01/14.
//  Copyright (c) 2014 Ivan Rodriguez Murillo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Util.h"

@interface QuadernsArquitecturaTests : XCTestCase

@end

@implementation QuadernsArquitecturaTests

- (void)testLoadImages {

    NSArray *images = [Util loadFilesFrom:@"1080" withExtension:@"jpg"];

    XCTAssertNotNil(images);
    XCTAssertEqual(images.count, 541ul, @"Wrong array size.");

    NSArray *container = [Util twoPageParser:images];

    XCTAssertEqual(container.count, 321ul, @"Wrong array size.");

    for (NSString *file in container) {
        NSLog(@"File: %@", file);
    }

}

@end

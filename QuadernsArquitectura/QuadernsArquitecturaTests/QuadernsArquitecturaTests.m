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

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLoadImages {
    //XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);

    NSArray *images = [Util loadFilesFrom:@"1080" withExtension:@"jpg"];

    XCTAssertNotNil(images);
    XCTAssertTrue(images.count == 811, @"Wrong array size.");
    XCTAssertEqual(images.count, 811ul, @"Wrong array size.");

    for (NSString *file in images) {
        NSLog(@"%@", file);
    }
}

@end

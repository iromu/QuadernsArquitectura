//
// Created by wantez on 26/01/14.
// Copyright (c) 2014 Ivan Rodriguez Murillo. All rights reserved.
//

#import "Util.h"


@implementation Util {

}

+ (NSArray *)loadFilesFrom:(NSString *)path withExtension:(NSString *)extension {
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:path ofType:nil];

    NSDirectoryEnumerator *de = [[NSFileManager defaultManager] enumeratorAtPath:bundlePath];

    NSString *file;
    NSMutableArray *array = [NSMutableArray array];
    while ((file = [de nextObject])) {
        NSString *fullPath = [NSString stringWithFormat:@"%@/%@", path, file];
        if (extension != nil) {
            if ([file.pathExtension isEqualToString:extension]) {
                [array addObject:fullPath];
            }
        } else {
            [array addObject:fullPath];
        }
    }

    return array;
}
@end
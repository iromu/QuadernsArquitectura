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
        if ([file rangeOfString:@"EXCLUDE"].location == NSNotFound) {
            NSString *fullPath = [NSString stringWithFormat:@"%@/%@", path, file];
            if (extension != nil) {
                if ([file.pathExtension isEqualToString:extension]) {
                    [array addObject:fullPath];
                }
            } else {
                [array addObject:fullPath];
            }
        }
    }

    return array;
}

+ (NSArray *)twoPageParser:(NSArray *)images {
    NSMutableArray *twoPagesImages = [NSMutableArray array];

    for (int current = 0; current < images.count - 1; current++) {
        NSString *file = [images objectAtIndex:current];

        NSMutableArray *container = [NSMutableArray array];
        [container addObject:file];

        if (current < images.count - 1) {

            NSString *next = [images objectAtIndex:current + 1];
            BOOL notIsCover = ![file.lastPathComponent hasSuffix:@"cover.jpg"] && ![next.lastPathComponent hasSuffix:@"cover.jpg"];

            if (notIsCover) {
                [container addObject:next];
                current++;
            }
        }
        [twoPagesImages addObject:container];
    }

    return twoPagesImages;
}

@end
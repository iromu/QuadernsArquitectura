//
//  QuadernsShared.m
//  QuadernsShared
//
//  Created by wantez on 27/01/14.
//  Copyright (c) 2014 Ivan Rodriguez Murillo. All rights reserved.
//

#import "QuadernsShared.h"


NSMutableDictionary *defaults;

@implementation QuadernsShared


+ (NSDictionary *)getDefaults {

    if (defaults == nil) {
        defaults = [NSMutableDictionary dictionary];

        [defaults setObject:@"iromu.QuadernsArquitectura" forKey:@"domain"];

        NSColor *backgroundColor = [NSColor colorWithSRGBRed:(147 / 255.0f) green:(138 / 255.0f) blue:(129 / 255.0f) alpha:1.0];
        [defaults setObject:backgroundColor forKey:@"backGroundColor"];
    }

    return defaults;
}


@end

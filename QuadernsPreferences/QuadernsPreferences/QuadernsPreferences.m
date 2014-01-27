//
//  QuadernsPreferences.m
//  QuadernsPreferences
//
//  Created by wantez on 26/01/14.
//  Copyright (c) 2014 Ivan Rodriguez Murillo. All rights reserved.
//

#import "QuadernsPreferences.h"
#import "QuadernsShared.h"

@implementation QuadernsPreferences

@synthesize enableFullScreenCheckbox;
@synthesize enableTwoPagesModeCheckbox;
@synthesize colorWell;


- (void)mainViewDidLoad {
    NSString *persistenDomainName = [[QuadernsShared getDefaults] objectForKey:@"domain"];
    NSDictionary *preferences = [[NSUserDefaults standardUserDefaults] persistentDomainForName:persistenDomainName];

    self.enableFullScreenCheckbox.state = [[preferences objectForKey:@"isFSChecked"] boolValue];
    self.enableTwoPagesModeCheckbox.state = [[preferences objectForKey:@"isTwoPagesModeChecked"] boolValue];

    NSColor *backGroundColor;
    NSData *data = [preferences objectForKey:@"backGroundColor"];
    if (!data == nil) {
        backGroundColor = [NSUnarchiver unarchiveObjectWithData:data];
        if (backGroundColor == nil || ![backGroundColor isKindOfClass:[NSColor class]]) {
            backGroundColor = [[QuadernsShared getDefaults] objectForKey:@"backGroundColor"];
        }
    } else {
        backGroundColor = [[QuadernsShared getDefaults] objectForKey:@"backGroundColor"];
    }


    self.colorWell.color = backGroundColor;

}

- (void)didUnselect {
    NSString *persistenDomainName = [[QuadernsShared getDefaults] objectForKey:@"domain"];
    NSDictionary *preferences = [[NSUserDefaults standardUserDefaults] persistentDomainForName:persistenDomainName];

    NSMutableDictionary *mutablePreferences = [NSMutableDictionary dictionaryWithDictionary:preferences];

    [mutablePreferences setObject:[NSNumber numberWithBool:self.enableFullScreenCheckbox.state] forKey:@"isFSChecked"];
    [mutablePreferences setObject:[NSNumber numberWithBool:self.enableTwoPagesModeCheckbox.state] forKey:@"isTwoPagesModeChecked"];

    NSData *data = [NSArchiver archivedDataWithRootObject:self.colorWell.color];
    [mutablePreferences setObject:data forKey:@"backGroundColor"];

    [[NSUserDefaults standardUserDefaults] setPersistentDomain:mutablePreferences forName:persistenDomainName];
}


@end

//
//  QuadernsPreferences.m
//  QuadernsPreferences
//
//  Created by wantez on 26/01/14.
//  Copyright (c) 2014 Ivan Rodriguez Murillo. All rights reserved.
//

#import "QuadernsPreferences.h"

@implementation QuadernsPreferences

@synthesize enableFullScreenCheckbox;
@synthesize enableTwoPagesModeCheckbox;

- (void)mainViewDidLoad {
    NSDictionary *preferences = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"iromu.QuadernsArquitectura"];

    self.enableFullScreenCheckbox.state = [[preferences objectForKey:@"isFSChecked"] boolValue];
    self.enableTwoPagesModeCheckbox.state = [[preferences objectForKey:@"isTwoPagesModeChecked"] boolValue];

}

- (void)didUnselect {
    NSDictionary *preferences = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"iromu.QuadernsArquitectura"];

    NSMutableDictionary *mutablePreferences = [NSMutableDictionary dictionaryWithDictionary:preferences];

    [mutablePreferences setObject:[NSNumber numberWithBool:self.enableFullScreenCheckbox.state] forKey:@"isFSChecked"];
    [mutablePreferences setObject:[NSNumber numberWithBool:self.enableTwoPagesModeCheckbox.state] forKey:@"isTwoPagesModeChecked"];

    [[NSUserDefaults standardUserDefaults] setPersistentDomain:mutablePreferences forName:@"iromu.QuadernsArquitectura"];
}

@end

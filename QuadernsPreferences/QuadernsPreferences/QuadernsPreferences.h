//
//  QuadernsPreferences.h
//  QuadernsPreferences
//
//  Created by wantez on 26/01/14.
//  Copyright (c) 2014 Ivan Rodriguez Murillo. All rights reserved.
//

#import <PreferencePanes/PreferencePanes.h>

@interface QuadernsPreferences : NSPreferencePane

@property(assign) IBOutlet NSButton *enableFullScreenCheckbox;
@property(assign) IBOutlet NSButton *enableTwoPagesModeCheckbox;
@property(assign) IBOutlet NSColorWell *colorWell;

- (void)mainViewDidLoad;

@end

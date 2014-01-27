//
//  AppDelegate.m
//  QuadernsArquitectura
//
//  Created by wantez on 26/01/14.
//  Copyright (c) 2014 Ivan Rodriguez Murillo. All rights reserved.
//

#import "AppDelegate.h"
#import "Util.h"
#import "QuadernsShared.h"

@implementation AppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self.window setAcceptsMouseMovedEvents:YES];
    [self.window setCollectionBehavior:NSWindowCollectionBehaviorFullScreenPrimary];


    [[NSNotificationCenter defaultCenter] addObserver:imageViewerController
                                             selector:@selector(willEnterFull:)
                                                 name:NSWindowWillEnterFullScreenNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:imageViewerController
                                             selector:@selector(didExitFull:)
                                                 name:NSWindowDidExitFullScreenNotification
                                               object:nil];

    NSString *persistenDomainName = [[QuadernsShared getDefaults] objectForKey:@"domain"];
    NSDictionary *preferences = [[NSUserDefaults standardUserDefaults] persistentDomainForName:persistenDomainName];

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


    [self.window setBackgroundColor:backGroundColor];

    if ([[preferences objectForKey:@"isFSChecked"] boolValue])
        [self.window toggleFullScreen:self];

    imageViewerController.twoPagesModeChecked = [[preferences objectForKey:@"isTwoPagesModeChecked"] boolValue];

    imageViewerController.images = [Util loadFilesFrom:@"1080" withExtension:@"jpg"];

    [imageViewerController load:FIRST];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return TRUE;
}


@end

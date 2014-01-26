//
//  AppDelegate.m
//  QuadernsArquitectura
//
//  Created by wantez on 26/01/14.
//  Copyright (c) 2014 Ivan Rodriguez Murillo. All rights reserved.
//

#import "AppDelegate.h"
#import "Util.h"


@implementation AppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self.window setAcceptsMouseMovedEvents:YES];
    [self.window setCollectionBehavior:NSWindowCollectionBehaviorFullScreenPrimary];

    [self.window setBackgroundColor:[NSColor colorWithSRGBRed:(147 / 255.0f) green:(138 / 255.0f) blue:(129 / 255.0f) alpha:1.0]];


    [[NSNotificationCenter defaultCenter] addObserver:imageViewerController
                                             selector:@selector(willEnterFull:)
                                                 name:NSWindowWillEnterFullScreenNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:imageViewerController
                                             selector:@selector(didExitFull:)
                                                 name:NSWindowDidExitFullScreenNotification
                                               object:nil];

    NSDictionary *preferences = [[NSUserDefaults standardUserDefaults] persistentDomainForName:@"iromu.QuadernsArquitectura"];

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

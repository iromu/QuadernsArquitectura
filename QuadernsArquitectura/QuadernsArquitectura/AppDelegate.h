//
//  AppDelegate.h
//  QuadernsArquitectura
//
//  Created by wantez on 26/01/14.
//  Copyright (c) 2014 Ivan Rodriguez Murillo. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ImageViewerController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet ImageViewerController *imageViewerController;
}

@property(assign) IBOutlet NSWindow *window;

@end

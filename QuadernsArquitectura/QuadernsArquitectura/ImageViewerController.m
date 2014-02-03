//
//  ImageViewerController.m
//  QuadernsArquitectura
//
//  Created by wantez on 26/01/14.
//  Copyright (c) 2014 Ivan Rodriguez Murillo. All rights reserved.
//

#import "ImageViewerController.h"

#if !defined(MAX)
    #define MAX(a,b) ( ((a) > (b)) ? (a) : (b) )
#endif

@implementation ImageViewerController

@synthesize imageView;
@synthesize nextButton;
@synthesize prevButton;
@synthesize images;
@synthesize twoPagesModeChecked;

int current = 0;
int start = 0;
int end = 10;

- (IBAction)nextImage:(id)sender {
    current++;
    [self switchImage];
}

- (void)switchImage {

    NSString *imagePath = [NSString stringWithFormat:@"%@", [images objectAtIndex:current]];

    NSImage *newImage = [self loadImage:current];

    if (![imagePath.lastPathComponent isEqualToString:@"cover.jpg"] && twoPagesModeChecked == true) {

        NSImage *nextImage = [self loadImage:++current];
        NSBitmapImageRep *nextImageRep = [NSBitmapImageRep imageRepWithData:[nextImage TIFFRepresentation]];

        NSBitmapImageRep *newImageRep = [NSBitmapImageRep imageRepWithData:[newImage TIFFRepresentation]];
        CGFloat w = newImageRep.pixelsWide + nextImageRep.pixelsWide;
        NSSize canvasSize = NSMakeSize(w, MAX(newImageRep.pixelsHigh, nextImageRep.pixelsHigh));

        NSImage *resultImage = [[NSImage alloc] initWithSize:canvasSize];

        [resultImage lockFocus];

        [newImage drawInRect:NSMakeRect(0, 0, newImageRep.pixelsWide, canvasSize.height) fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
        [nextImage drawInRect:NSMakeRect(newImageRep.pixelsWide, 0, nextImageRep.pixelsWide, canvasSize.height) fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];

        [resultImage unlockFocus];
        [imageView setImage:resultImage];
    } else {
        [imageView setImage:newImage];
    }

    [self.nextButton setEnabled:true];
    [self.prevButton setEnabled:true];

    if (current == start) [self.prevButton setEnabled:false];
    if (current == end) [self.nextButton setEnabled:false];
}

- (NSImage *)loadImage:(int)index {
    NSString *imagePath = [NSString stringWithFormat:@"%@", [images objectAtIndex:index]];
    NSLog(@"%@", imagePath);
    NSImage *newImage = [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imagePath ofType:nil]];
    return newImage;
}

- (IBAction)prevImage:(id)sender {
    current--;
    if (twoPagesModeChecked)
        current--;
    [self switchImage];
}

- (void)didExitFull:(NSNotification *)notif {
    NSLog(@"ImageViewerController didExitFull");

}

- (void)willEnterFull:(NSNotification *)notif {
    NSLog(@"ImageViewerController willEnterFull");
}

- (void)setNextButton:(NSButton *)button {
    nextButton = button;
    [self.nextButton setEnabled:true];
}


- (void)load:(int)index {
    current = index;
    [self switchImage];
}


@end

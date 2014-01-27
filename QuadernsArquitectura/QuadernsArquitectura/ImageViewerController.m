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

        CGFloat w = newImage.size.width + nextImage.size.width;
        NSSize canvasSize = NSMakeSize(w, MAX(newImage.size.height, nextImage.size.height));

        NSImage *resultImage = [[NSImage alloc] initWithSize:canvasSize];
        [resultImage lockFocus];

        [newImage drawAtPoint:NSMakePoint(0, 0) fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];
        [nextImage drawAtPoint:NSMakePoint(newImage.size.width, 0) fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1.0];

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

}

- (void)willEnterFull:(NSNotification *)notif {

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

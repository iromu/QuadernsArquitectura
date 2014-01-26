//
//  ImageViewerController.m
//  QuadernsArquitectura
//
//  Created by wantez on 26/01/14.
//  Copyright (c) 2014 Ivan Rodriguez Murillo. All rights reserved.
//

#import "ImageViewerController.h"


@implementation ImageViewerController

@synthesize imageView;
@synthesize nextButton;
@synthesize prevButton;
@synthesize images;

int current = 1;
int start = 1;
int end = 10;

- (IBAction)nextImage:(id)sender {
    if (current == end) return;
    current++;
    [self switchImage];
}

- (void)switchImage {
    NSString *imagePath = [NSString stringWithFormat:@"%@", [images objectAtIndex:current]];
    NSLog(@"%@", imagePath);

    NSImage *newImage = [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:imagePath ofType:nil]];
    [imageView setImage:newImage];

    [self.nextButton setEnabled:true];
    [self.prevButton setEnabled:true];

    if (current == start) [self.prevButton setEnabled:false];
    if (current == end) [self.nextButton setEnabled:false];
}

- (IBAction)prevImage:(id)sender {
    if (current == start) return;
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


@end

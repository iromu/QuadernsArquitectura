//
//  ImageViewerController.h
//  QuadernsArquitectura
//
//  Created by wantez on 26/01/14.
//  Copyright (c) 2014 Ivan Rodriguez Murillo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#define FIRST_PAGE 0

@interface ImageViewerController : NSViewController

@property(strong, nonatomic) IBOutlet NSImageView *imageView;
@property(strong, nonatomic) IBOutlet NSButton *nextButton;
@property(strong, nonatomic) IBOutlet NSButton *prevButton;
@property(nonatomic) NSArray *images;
@property(nonatomic) BOOL twoPagesModeChecked;


- (IBAction)nextImage:(id)sender;

- (IBAction)prevImage:(id)sender;

- (void)load:(int)index;
@end

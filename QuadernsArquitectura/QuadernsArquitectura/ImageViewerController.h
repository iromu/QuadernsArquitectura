//
//  ImageViewerController.h
//  QuadernsArquitectura
//
//  Created by wantez on 26/01/14.
//  Copyright (c) 2014 Ivan Rodriguez Murillo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ImageViewerController : NSViewController

@property(strong, nonatomic) IBOutlet NSImageView *imageView;
@property(strong, nonatomic) IBOutlet NSButton *nextButton;
@property(strong, nonatomic) IBOutlet NSButton *prevButton;
@property(nonatomic) NSArray *images;


- (IBAction)nextImage:(id)sender;

- (IBAction)prevImage:(id)sender;

@end

//
//  AppDelegate.h
//  Pth
//
//  Created by Ontario on 7/5/14.
//  Copyright (c) 2014 PepperGum Games. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SGPaintingImageView;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (strong, nonatomic) UIWindow *window;

- (SGPaintingImageView*)getPaintingImageView;

@end

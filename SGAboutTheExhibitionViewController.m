//
//  SGAboutTheExhibitionViewController.m
//  SacredGifts
//
//  Created by Ontario on 9/21/13.
//  Copyright (c) 2013 Wells Fargo. All rights reserved.
//

#import "SGAboutTheExhibitionViewController.h"
#import "SGConstants.h"
#import "SGWebViewController.h"

const int kNavigationDestinationStoryOfTheExhibition = 9324;
const int kNavigationIntroMovie = 864;
const int kNavigationReservations = 456;

@implementation SGAboutTheExhibitionViewController

-(void)viewDidLoad
{
    _blurImageName = @"sg_home_bg-exhibition_blur.png";
    [super viewDidLoad];
//    self.screenName = @"about the exhibition";
}

- (IBAction)pressedBtn:(UIButton *)sender
{
    NSString* toControllerIDStr = (NSString*)kControllerIDHomeStr;
    
    switch (sender.tag) {
        case 1:
            toControllerIDStr = @"story";
            break;
        case 2:
            toControllerIDStr = @"moa";
            break;
        case 3:
            toControllerIDStr = @"bios";
            break;
            
        default:
            break;
    }
    
    [self.delegate transitionFromController:self toControllerID:toControllerIDStr fromButtonRect:sender.frame withAnimType:kAnimTypeZoomIn];
}

@end

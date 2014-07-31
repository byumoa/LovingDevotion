//
//  SGViewController.m
//  SacredGifts
//
//  Created by Ontario on 9/20/13.
//  Copyright (c) 2013 Wells Fargo. All rights reserved.
//

#import "SGViewController.h"
#import "SGHomeViewController.h"
#import "SGConstants.h"
//#import "GAI.h"
//#import "GAIFields.h"
#import "SGConvenienceFunctionsManager.h"
#import "SGPaintingContainerViewController.h"
#import "SGPaintingViewController.h"
#import "SGIntroMovieViewController.h"

const CGPoint kSplashLogoStartPoint = {384,840};

@interface SGViewController ()
{
    //2 timers as backing variables
    //waits untin a certain time has elapsed
    NSTimer* _donorsTimer;
    NSTimer* _splashTimer;
    BOOL donorsVisible;
}
    //fade splash that takes a timer as a argument
- (void)fadeSplash: (NSTimer*)timer;
    //Fade in donors, accepts a timer as an argument
- (void)fadeInDonors: (NSTimer*)timer;
@end

@implementation SGViewController

//view did load method
- (void)viewDidLoad
{
    [super viewDidLoad];
    // if the app in on an ipad
    if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {   //is this setting the default view controller
        SGHomeViewController* homeC = [self.storyboard instantiateViewControllerWithIdentifier:(NSString*)kControllerIDHomeStr];
        homeC.delegate = self;
    
        [self displayContentController:homeC];
        [self resetSplash];
    }
}

- (NSUInteger)supportedInterfaceOrientations{
    
    //if the active controller is SGPaintingContainerViewController the any orientation is allowed
    if( [self.currentContentController isKindOfClass:[SGPaintingContainerViewController class]] )
        return UIInterfaceOrientationMaskAll;
    //if the active controller is  a movie controller, any orientation is allowed
    if( [self.currentContentController isKindOfClass:[SGIntroMovieViewController class]])
        return UIInterfaceOrientationMaskAll;
    //if neither of the above, the orientation is portrait
    return UIInterfaceOrientationMaskPortrait;
}

-(void)pressedBack:(UIButton *)sender
{
    if( [self.currentContentController.restorationIdentifier isEqualToString:(NSString*)kControllerIDHomeStr] )
        [self resetSplash];
    else
        [super pressedBack:sender];
}

-(void)resetSplash
{
    // sets the spash's transparency to be visible
    _splash.alpha = 1;
    
    //switches the order of the subviews so the splash is in the the front
    [self.view bringSubviewToFront:self.splash];
    // brings the donors to the front
    self.titleDonorFlip.image = [UIImage imageNamed:@"ld_home_home_title.png"];
    self.titleDonorFlip.alpha = 1;
    donorsVisible = NO;
    [self.view bringSubviewToFront:self.titleDonorFlip];

    
    //starts the timers
    // QUESTION: is this how to pass a timer as an argument?
    _donorsTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(fadeInDonors:) userInfo:nil repeats:NO];
    _splashTimer = [NSTimer scheduledTimerWithTimeInterval:63 target:self selector:@selector(fadeSplash:) userInfo:nil repeats:NO];
    
    // removes the cookie that stored the user's facebook credentials for sharing media
    [SGConvenienceFunctionsManager facebookLogout];
    
//    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
//    [tracker set:kGAISessionControl
//           value:@"start"];
}

-(void)fadeInDonors:(NSTimer *)timer
{
    //Turns off the timer
    [_donorsTimer invalidate];
    
    //fades in donors
//    [UIView animateWithDuration:0.5 animations:^{
//        self.splashDonors.alpha = 1;
//    }];
    UIImage *secondImage = [UIImage imageNamed:@"ld_home_donor_title.png"];
    [UIView transitionWithView:_titleDonorFlip
                      duration:1
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations:^{_titleDonorFlip.image = secondImage;}
                    completion:nil];
    donorsVisible = YES;
}

-(void)fadeSplash:(NSTimer *)timer
{
    //turns off the timer
    [_splashTimer invalidate];
    
    //sets spash alpha to 0
    [UIView animateWithDuration:0.25 animations:^{
        self.splash.alpha = 0;
        self.titleDonorFlip.alpha = 0;
    }];

}

// when the user touches the screen
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // if the splash is visible and the donors is not
    if( self.splash.alpha == 1 && !donorsVisible)
        //show the donors
        [self fadeInDonors:nil];
    // if the splash is not transparent but match the prior settings
    else if(donorsVisible)
        [self fadeSplash:nil];
}
@end

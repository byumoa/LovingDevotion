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
    NSTimer* _donorsTimer;
    NSTimer* _splashTimer;
    BOOL donorsVisible;
}
- (void)fadeSplash: (NSTimer*)timer;
- (void)fadeInDonors: (NSTimer*)timer;
@end

@implementation SGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    if( [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
        SGHomeViewController* homeC = [self.storyboard instantiateViewControllerWithIdentifier:(NSString*)kControllerIDHomeStr];
        homeC.delegate = self;
    
        [self displayContentController:homeC];
        [self resetSplash];
    }
}

- (NSUInteger)supportedInterfaceOrientations{
    
    if( [self.currentContentController isKindOfClass:[SGPaintingContainerViewController class]] )
        return UIInterfaceOrientationMaskAll;
    if( [self.currentContentController isKindOfClass:[SGIntroMovieViewController class]])
        return UIInterfaceOrientationMaskAll;
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
    _splash.alpha = 1;

    [self.view bringSubviewToFront:self.splash];

    self.titleDonorFlip.image = [UIImage imageNamed:@"ld_home_home_title.png"];
    self.titleDonorFlip.alpha = 1;
    donorsVisible = NO;
    [self.view bringSubviewToFront:self.titleDonorFlip];

    _donorsTimer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(fadeInDonors:) userInfo:nil repeats:NO];
    _splashTimer = [NSTimer scheduledTimerWithTimeInterval:13 target:self selector:@selector(fadeSplash:) userInfo:nil repeats:NO];

    [SGConvenienceFunctionsManager facebookLogout];
    
//    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
//    [tracker set:kGAISessionControl
//           value:@"start"];
}

-(void)fadeInDonors:(NSTimer *)timer
{
    [_donorsTimer invalidate];
    
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
    [_splashTimer invalidate];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.splash.alpha = 0;
        self.titleDonorFlip.alpha = 0;
    }];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if( self.splash.alpha == 1 && !donorsVisible)
        [self fadeInDonors:nil];
    else if(donorsVisible)
        [self fadeSplash:nil];
}
@end

//
//  SGNavigationContainerViewController.h
//  SacredGifts
//
//  Created by Ontario on 9/20/13.
//  Copyright (c) 2013 Wells Fargo. All rights reserved.
//

#import "SGContainerViewController.h"

@interface SGNavigationContainerViewController : SGContainerViewController <UIWebViewDelegate, UIAlertViewDelegate>
{
    NSString* _backViewControllerIDStr, *_beforePaintingViewControllerIDStr;
    UIWebView* _webView;
    int _footerLastAlpha;
}

@property (weak, nonatomic) IBOutlet UIView *headerView;
@property (weak, nonatomic) IBOutlet UIView *footerView;
@property (weak, nonatomic) IBOutlet UIView *headerBlurDecoy;
@property (weak, nonatomic) IBOutlet UIImageView *headerBGImgView;
@property (strong, nonatomic) IBOutlet UIImageView *headerTitleImgView;

@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (strong, nonatomic) UIActivityIndicatorView* activityIndicator;
@property (nonatomic) BOOL hasSwiped;

- (IBAction)pressedBack:(UIButton*)sender;
- (IBAction)pressedDonate:(UIButton *)sender;
- (IBAction)pressedFeedback:(UIButton *)sender;
- (IBAction)pressedHome:(id)sender;

@end

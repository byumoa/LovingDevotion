//
//  SGContainerViewController.h
//  SacredGifts
//
//  Created by Ontario on 9/23/13.
//  Copyright (c) 2013 Wells Fargo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SGContentControllerDelegate.h"
#import "PaginationView.h"

@class SGContentViewController;

@interface SGContainerViewController : UIViewController<SGContentControllerDelegate>{
    void (^animTransitionBlock)(void);
    NSMutableArray* _allBlurredViews;
}
@property (weak, nonatomic) SGContentViewController* currentContentController;
@property (weak, nonatomic) IBOutlet PaginationView* paginate5View;
@property (weak, nonatomic) IBOutlet PaginationView *paginate3View;
@property (weak, nonatomic) IBOutlet PaginationView *paginate2View;

#pragma mark Navigation
- (void)displayContentController:(UIViewController *)content;
- (void)cycleFromViewController: (UIViewController*)oldC toViewController: (UIViewController*)newC fromButtonRect:(CGRect)frame falling:(const NSString *)animType;
- (void)stopAudio;
- (void)updatePagination: (NSString*)paintingName;

@end

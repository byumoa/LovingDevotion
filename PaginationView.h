//
//  PaginationView.h
//  LovingDevotion
//
//  Created by Ontario on 9/4/14.
//
//

#import <UIKit/UIKit.h>

@interface PaginationView : UIView

@property(weak, nonatomic) IBOutlet UIImageView* dot1;
@property(weak, nonatomic) IBOutlet UIImageView* dot2;
@property(weak, nonatomic) IBOutlet UIImageView* dot3;
@property(weak, nonatomic) IBOutlet UIImageView* dot4;
@property(weak, nonatomic) IBOutlet UIImageView* dot5;

- (void) setDotShowing: (int)dot;

@end

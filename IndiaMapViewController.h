//
//  IndiaMapViewController.h
//  LovingDevotion
//
//  Created by Ontario on 8/25/14.
//
//

#import "SGContentViewController.h"

@interface IndiaMapViewController : SGContentViewController
@property(nonatomic, weak) NSString* mapName;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
- (IBAction)pressedBack:(UIButton *)sender;

@end

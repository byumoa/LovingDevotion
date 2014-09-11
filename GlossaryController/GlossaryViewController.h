//
//  GlossaryViewController.h
//  LovingDevotion
//
//  Created by Ontario on 9/11/14.
//
//

#import <UIKit/UIKit.h>

@interface GlossaryViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *backgroundTop;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundBottom;

- (void) setHighlightWords: (NSArray*) highlightWords;
- (IBAction)pressedBack:(UIButton *)sender;

@end

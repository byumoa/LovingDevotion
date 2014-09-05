//
//  LearnMoreMovieSpawnerViewController.m
//  LovingDevotion
//
//  Created by Ontario on 9/5/14.
//
//

#import "LearnMoreMovieSpawnerViewController.h"
#import "LearnMoreMovieViewController.h"

@interface LearnMoreMovieSpawnerViewController ()

@end

@implementation LearnMoreMovieSpawnerViewController


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSString* segueID = segue.identifier;
    NSLog(@"segueID: %@", segueID);
    UIViewController* dest = segue.destinationViewController;
    if( [dest isKindOfClass:[LearnMoreMovieViewController class]] )
    {
        if( [segueID isEqualToString:@"bhakti" ])
        {
            ((LearnMoreMovieViewController*)dest).movieName = @"Bhakti";
        }
        else if( [segueID isEqualToString:@"byuandindia" ])
        {
            ((LearnMoreMovieViewController*)dest).movieName = @"BYUAndIndia";
        }
        else if( [segueID isEqualToString:@"directormsg" ])
        {
            ((LearnMoreMovieViewController*)dest).movieName = @"MessageFromTheDirector";
        }
        else if( [segueID isEqualToString:@"festivals" ])
        {
            ((LearnMoreMovieViewController*)dest).movieName = @"Hindu Festivals";
        }
        else if( [segueID isEqualToString:@"peopleof" ])
        {
            ((LearnMoreMovieViewController*)dest).movieName = @"Hindu PeopleOfHinduism";
        }
        else if( [segueID isEqualToString:@"india" ])
        {
            ((LearnMoreMovieViewController*)dest).movieName = @"India";
            NSLog(@"[segueID isEqualToString:@\"india\" ]");
        }
    }
}


@end

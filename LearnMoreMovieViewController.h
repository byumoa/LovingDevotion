//
//  LearnMoreMovieViewController.h
//  LovingDevotion
//
//  Created by Ontario on 9/5/14.
//
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface LearnMoreMovieViewController : UIViewController
@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;

@property(weak, nonatomic) NSString* movieName;

@end

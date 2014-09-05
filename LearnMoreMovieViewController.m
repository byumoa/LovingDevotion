//
//  LearnMoreMovieViewController.m
//  LovingDevotion
//
//  Created by Ontario on 9/5/14.
//
//

#import "LearnMoreMovieViewController.h"
CGRect const kMovieFramePortraitLM = {0, 45, 768, 432};
CGRect const kMovieFrameLandscapeLM = {0, 0, 1024, 768};

@interface LearnMoreMovieViewController ()

@end

@implementation LearnMoreMovieViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString* videoPath = [[NSBundle mainBundle] pathForResource:self.movieName ofType:@".mp4" inDirectory:@"PaintingResources/NavigationVideos"];
    if(!videoPath) return;
    NSURL *url = [NSURL fileURLWithPath:videoPath];
    self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    self.moviePlayer.view.frame = kMovieFramePortraitLM;
    self.moviePlayer.view.center = self.view.center;
    self.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
    self.moviePlayer.controlStyle = MPMovieControlStyleNone;
    [self.view addSubview:self.moviePlayer.view];
    self.moviePlayer.backgroundView.backgroundColor = [UIColor blackColor];
    [self.moviePlayer prepareToPlay];
    [self.moviePlayer play];
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if( UIInterfaceOrientationIsLandscape(toInterfaceOrientation))
    {
        self.moviePlayer.view.frame = kMovieFrameLandscapeLM;
//        ((SGNavigationContainerViewController*)self.delegate).headerView.alpha = 0;
    }
    else
    {
        self.moviePlayer.view.frame = kMovieFramePortraitLM;
        self.moviePlayer.view.center = self.view.center;
//        ((SGNavigationContainerViewController*)self.delegate).headerView.alpha = 1;
    }
}

@end

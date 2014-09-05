//
//  SGFacebookViewController.m
//  SacredGifts
//
//  Created by Ontario on 11/27/13.
//
//

#import "SGFacebookViewController.h"

@interface SGFacebookViewController ()
- (void)openSocialPage: (NSURL*)url;
@end

@implementation SGFacebookViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    
//    self.screenName = @"facebook";
}

- (NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

-(void)pressedClose:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)configureWebpageForURLStr:(NSString *)urlStr
{
    _currentFacebookPage = urlStr;
    NSURL *url = [NSURL URLWithString:_currentFacebookPage];
    
    [self openSocialPage:url];
}

-(void)openSocialPage:(NSURL *)url
{
    [self.webview loadRequest:[NSURLRequest requestWithURL:url]];
    
    self.webview.delegate = self;
//    self.webview.scrollView.scrollEnabled = NO;
    self.webview.scrollView.bounces = NO;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"webViewDidFinishLoad");
    UIImageView* blueOverlay = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BlueOverLay.png"]];
    [self.webview addSubview:blueOverlay];
    blueOverlay.userInteractionEnabled = YES;
    
    [self.activityIndicator stopAnimating];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString* urlStr = [request URL].description;
    
    if( !_hasLoaded ||
       [urlStr rangeOfString:@"m.facebook.com/story.php"].location != NSNotFound ||
       [urlStr rangeOfString:@"m.facebook.com/logout.php"].location != NSNotFound ||
       [urlStr rangeOfString:@"m.facebook.com/login.php"].location != NSNotFound ||
       [urlStr rangeOfString:@"https://m.facebook.com/?stype"].location != NSNotFound )
    {
//        NSLog(@"urlStr 1: %@", urlStr.description);
        _hasLoaded = YES;
        return YES;
    }
    
    if( [urlStr rangeOfString:@"https://m.facebook.com/BYUmoa?refsrc"].location != NSNotFound )
    {
//        NSLog(@"urlStr 2: %@", urlStr.description);
        NSURL* url = [NSURL URLWithString:_currentFacebookPage];
        [self.webview loadRequest:[NSURLRequest requestWithURL:url]];
        return NO;
    }
    
    if( [urlStr rangeOfString:@"m.facebook.com/messages/read"].location != NSNotFound )
    {
//        NSLog(@"urlStr 3: %@", urlStr.description);
        [self pressedClose:nil];
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Facebook" message:@"Message Successful" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return NO;
    }
    
    if( [urlStr rangeOfString:@"m.facebook.com/a/sharer.php"].location != NSNotFound )
    {
//        NSLog(@"urlStr 4: %@", urlStr.description);
        [self pressedClose:nil];
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Facebook" message:@"Post Successful" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        return NO;
    }
    else{
//        NSLog(@"urlStr 5: %@", urlStr.description);
    }
    
    return YES;
}

@end

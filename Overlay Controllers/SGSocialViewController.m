//
//  SGShareViewController.m
//  SacredGifts
//
//  Created by Ontario on 10/3/13.
//  Copyright (c) 2013 Wells Fargo. All rights reserved.
//

#import "SGSocialViewController.h"
#import <Social/Social.h>
#import "SGFacebookViewController.h"
#import "SGTwitterViewController.h"
//#import "GAI.h"
//#import "GAIDictionaryBuilder.h"
#import "SGConvenienceFunctionsManager.h"

#import "SGWebViewController.h"
#import "SGPaintingContainerViewController.h"
#import "SGPaintingViewController.h"

NSString* const kEmailAutofill = @"Enjoying this example of #lovingdevotion at the BYU Museum of Art.";
NSString* const kTwitterAutofill = @"Enjoying this example of #lovingdevotion at the BYU Museum of Art.";
NSString* const kFacebookAutofill = @"Enjoying this example of #lovingdevotion at the BYU Museum of Art.";

NSString* const kAppStoreURL = @"https://itunes.apple.com/us/app/sacred-gifts-brigham-young/id723165787?ls=1&mt=8";
NSString* const kTwitterPrefillTweet = @"https://twitter.com/intent/tweet?text=Enjoying this example of #lovingdevotion at the BYU Museum of Art. %@";

int const kOverlayHeight = 236;

@interface SGSocialViewController()

- (NSString*)calcArtistForPaintingStr: (NSString*)paintingName;
- (void)doInMuseumFBPostWithImage: (UIImage*)thumbnail;
- (void)doInMuseumTWPostWithImage: (UIImage*)thumbnail;
@end

@implementation SGSocialViewController

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if( self = [super initWithCoder:aDecoder]){
        _centerPos = CGPointMake(384, 720);
        self.moduleType = kModuleTypeSocial;
    }
    
    return self;
}

- (IBAction)pressedSocialBtn:(id)sender
{
//    UIImage* thumbnail = [UIImage imageNamed:self.paintingName];
    NSString *previewPath = [[NSBundle mainBundle] pathForResource:@"sharing" ofType:@"png" inDirectory:[NSString stringWithFormat: @"%@/%@/sharing", kPaintingResourcesStr, self.paintingName]];
    UIImage* thumbnail = [UIImage imageWithContentsOfFile:previewPath];
    
    NSString* mediaType;
    switch (((UIButton*)sender).tag)
    {
        case SocialMediaTypeFacebook:
        {
            /*
            NSString* autofillStr = kFacebookAutofill;
            
            SLComposeViewController *socialSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            [socialSheet setInitialText:autofillStr];
            [socialSheet addImage:thumbnail];
//            [socialSheet addURL:[NSURL URLWithString:[SGConvenienceFunctionsManager getFBURLStrForModule:self.paintingName]]];
//            [socialSheet addURL:[NSURL URLWithString:kAppStoreURL]];
            [self presentViewController:socialSheet animated:YES completion:^{}];
            
            mediaType = @"facebook";
             */
            [self doInMuseumFBPostWithImage:thumbnail];
        }
            break;
        case SocialMediaTypeTwitter:
        {
            /*
            SLComposeViewController *socialSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            [socialSheet setInitialText:(NSString*)kTwitterAutofill];
            [socialSheet addImage:thumbnail];
//            [socialSheet addURL:[NSURL URLWithString:[SGConvenienceFunctionsManager getFBURLStrForModule:self.paintingName]]];
//            [socialSheet addURL:[NSURL URLWithString:kAppStoreURL]];
            [self presentViewController:socialSheet animated:YES completion:^{}];
            
            mediaType = @"twitter";
             */
            [self doInMuseumTWPostWithImage:thumbnail];
        }
            break;
        case SocialMediaTypeEmail:
        {
            
//            NSString* artist = [self calcArtistForPaintingStr:self.paintingName];
//            NSString* autofillStr = [NSString stringWithFormat:kEmailAutofill, artist, kAppStoreURL];
            NSString* autofillStr = kEmailAutofill;
            
            MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
            [mailController setMailComposeDelegate:self];
            [mailController setSubject:@"Sacred Gifts"];
            [mailController setMessageBody:autofillStr isHTML:NO];
            [self presentViewController:mailController animated:YES completion:^{}];
            NSData *myData = UIImageJPEGRepresentation(thumbnail, 1.0);
            [mailController addAttachmentData:myData mimeType:@"image/png" fileName:@"Thumbnail.png"];
            
            mediaType = @"email";
        }
            break;
        case 4:
        {
            [((SGPaintingViewController*)self.delegate) removeCurrentOverlay];
            [((SGPaintingViewController*)self.delegate) deselectAllModuleBtns];
            self.webViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"web"];
            [((SGPaintingViewController*)self.delegate) presentViewController:self.webViewController animated:YES completion:nil];
            [self.webViewController configureWebpageFor:webPageTypeThanks];
        }
            break;
        default:
            break;
    }
    
//    if( ((UIButton*)sender).tag != 4)
//        [[[GAI sharedInstance] defaultTracker] send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action" action:@"button_press" label:mediaType value:nil] build]];
}

- (IBAction)pressedSignOut:(id)sender
{
    [SGConvenienceFunctionsManager facebookLogout];
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Social Media" message:@"You are signed out of facebook and twitter" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

-(void)doInMuseumFBPostWithImage:(UIImage *)thumbnail
{
    SGFacebookViewController* fbViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"facebook"];
    [self presentViewController:fbViewController animated:YES completion:nil];
    NSString* fbImgStr = [SGConvenienceFunctionsManager getFBURLStrForModule:self.paintingName];
    NSLog(@"self.paintingName: %@", self.paintingName);
    NSLog(@"fbImgStr: %@", fbImgStr);
    [fbViewController configureWebpageForURLStr:fbImgStr];
}

- (void)doInMuseumTWPostWithImage: (UIImage*)thumbnail
{
    SGTwitterViewController* twViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"twitter"];
    [self presentViewController:twViewController animated:YES completion:nil];
    NSString* fbImgStr = [SGConvenienceFunctionsManager getFBURLStrForModule:self.paintingName];
    NSString* urlStr = [NSString stringWithFormat:(NSString*)kTwitterPrefillTweet, fbImgStr];
    [twViewController configureWebpageForURLStr:urlStr];
}

-(NSString *)calcArtistForPaintingStr:(NSString *)paintingName
{
    return @"Carl Bloch";
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

-(void)addBackgroundImgWithImgName:(NSString *)bgImgName
{
    [super addBackgroundImgWithImgName:bgImgName];
    NSString *previewPath = [[NSBundle mainBundle] pathForResource:@"sharing_preview" ofType:@"png" inDirectory:[NSString stringWithFormat: @"%@/%@/sharing", kPaintingResourcesStr, self.paintingName]];
    self.paintingThumbnail.image = [UIImage imageWithContentsOfFile:previewPath];
    
    CGRect frame = self.view.frame;
    frame.size.height = kOverlayHeight;
}
@end

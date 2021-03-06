//
//  SGSummaryOverlayViewController.m
//  SacredGifts
//
//  Created by Ontario on 9/28/13.
//  Copyright (c) 2013 Wells Fargo. All rights reserved.
//

#import "SGSummaryOverlayViewController.h"
#import "SGNarrationManager.h"
#import "SGConvenienceFunctionsManager.h"
#import "GlossaryViewController.h"
#import "IndiaMapViewController.h"

const NSString* kSummarySpeakerBtnNrmStr = @"speaker_btns__narration_btn.png";
const NSString* kSummarySpeakerBtnHilStr = @"speaker_btns__narration_btn-on.png";
const NSString* kSummaryPlayBtnNrlStr = @"summary_play_btn.png";
const NSString* kSummaryPlayBtnHilStr = @"summary_play_btn.png";
const NSString* kSummaryPauseBtnNrmStr = @"summary_pause_btn.png";
const NSString* kSummaryPauseBtnHilStr = @"summary_pause_btn.png";

@interface SGSummaryOverlayViewController ()
{
    BOOL _narrationIsActive;
    NSDictionary* _mapGlossaryDict;
}

- (void)setupSpeakerBtnPlay;
- (void)setupSpeakerBtnPause;
- (void)setupSpeakerBtnInctive;

@end

@implementation SGSummaryOverlayViewController

- (IBAction)pressedMap:(UIButton *)sender {
}

- (IBAction)pressedGlossary:(UIButton *)sender {
    
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if( self = [super initWithCoder:aDecoder]){
        _centerPos = CGPointMake(384, 670);
        self.moduleType = kModuleTypeSummary;
    }
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    //BOOL isBlochPainting = [SGConvenienceFunctionsManager artistForPainting: abbreviated:<#(BOOL)#>]
}

- (IBAction)pressedNarration:(UIButton *)sender
{
    NSString *audioPath = [[NSBundle mainBundle] pathForResource:@"narration" ofType:@".mp3" inDirectory:self.rootFolderPath];
    sender.selected = !sender.selected;
    
    SGNarrationManager* narrationManager = [SGNarrationManager sharedManager];
    if( audioPath )
    {
        if( sender.selected )
            [narrationManager playAudioWithPath:audioPath];
        else
            [narrationManager pauseAudio];
    }
}

- (IBAction)pressedCastle:(id)sender
{
    // [self.delegate transitionFromController:self toPaintingNamed:@"castle" fromButtonRect:((UIButton*)sender).frame withAnimType:kAnimTypeZoomIn];
}

-(void)setupSpeakerBtnPlay
{
    
}

-(void)setupSpeakerBtnPause
{
    
}

-(void)setupSpeakerBtnInctive
{
    
}
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
     if( !_mapGlossaryDict ){
         NSString* path = [[NSBundle mainBundle] pathForResource:@"map_glossary" ofType:@"plist" inDirectory:self.rootFolderPath];
         _mapGlossaryDict = [NSDictionary dictionaryWithContentsOfFile:path];
     }
     
     if( [segue.identifier isEqualToString:@"glossary"] )
     {
         GlossaryViewController* glossary = [segue destinationViewController];
         NSArray* highlightedWordsArr = [_mapGlossaryDict objectForKey:@"glossary"];
         [glossary setHighlightWords:highlightedWordsArr];
     }
     
     else if( [segue.identifier isEqualToString:@"map"] ){
         IndiaMapViewController* map = [segue destinationViewController];
         NSArray* mapArr = [_mapGlossaryDict objectForKey:@"map"];
         map.mapName = [mapArr objectAtIndex:0];
     }
 }
@end

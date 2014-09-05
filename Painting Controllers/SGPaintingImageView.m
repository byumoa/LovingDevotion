//
//  SGPaintingImageView.m
//  SacredGifts
//
//  Created by Ontario on 9/24/13.
//  Copyright (c) 2013 Wells Fargo. All rights reserved.
//

#import "SGPaintingImageView.h"

const int inset = 20;

@interface SGPaintingImageView()
{
    CGPoint _startingPt;
    int _currentIndex;
    int _startingIndex;
    NSMutableArray* _followBtns;
    CGPoint _btnOffset;
    int _height;
    
    NSArray* _circlesInfo;
}
- (void)tapRecognized: (UITapGestureRecognizer*)recognizer;
- (void) addCircles;
- (void) delayedStopAnimating: (NSTimer*)timer;

@end

@implementation SGPaintingImageView

-(void)addCircles{
    NSString* dir = [NSString stringWithFormat: @"%@/%@/Spin", @"PaintingResources", self.paintingName];
    NSString* calloutPath = [[NSBundle mainBundle] pathForResource:@"Callouts" ofType:@"plist" inDirectory:dir];
    _circlesInfo = [NSArray arrayWithContentsOfFile:calloutPath];
    
    _followBtns = [NSMutableArray array];
    
    for (int i = 0; i < _circlesInfo.count; i++) {
        UIButton* followBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [followBtn setImage:[UIImage imageNamed:@"ld_highlight_lg"] forState:UIControlStateNormal];
        [followBtn setImage:[UIImage imageNamed:@"ld_highlight_lg_on"] forState:UIControlStateHighlighted];
        [self addSubview:followBtn];
        [_followBtns addObject:followBtn];
    }
    
    [self resetCirclePosForFrame:0];
}

- (void)resetCirclePosForFrame: (int)frame
{
    for( int i = 0; i < _circlesInfo.count; i++)
    {
        NSDictionary* circleInfo = _circlesInfo[i];
        UIButton* followButton = _followBtns[i];
        int fadeStartFrame = ((NSString*)[circleInfo objectForKey:@"FadeOut"]).intValue;
        int fadeEndFrame = ((NSString*)[circleInfo objectForKey:@"FadeIn"]).intValue;
        int ampX = ((NSString*)[circleInfo objectForKey:@"AmplitudeX"]).intValue;
        int ampY = ((NSString*)[circleInfo objectForKey:@"AmplitudeY"]).intValue;
        float ppX = ((NSString*)[circleInfo objectForKey:@"PartialPeriodX"]).floatValue;
        float ppY = ((NSString*)[circleInfo objectForKey:@"PartialPeriodY"]).floatValue;
        int vShift = ((NSString*)[circleInfo objectForKey:@"VerticalShift"]).intValue;
        int hShift = ((NSString*)[circleInfo objectForKey:@"HorizontalShift"]).intValue;
        
        float alpha = 1;
        if (frame > fadeStartFrame &&
            frame < fadeEndFrame ){
            alpha = 0;
        }
        if((frame == (fadeStartFrame + 1)) ||
           (frame == (fadeEndFrame - 1))){
            alpha = 0.66;
        }
        if((frame == (fadeStartFrame + 2)) ||
           (frame == (fadeEndFrame - 2))){
            alpha = 0.33;
        }
        followButton.alpha = alpha;
    
        
        _btnOffset.x = ampX * cos(frame/ppX) + hShift;
        _btnOffset.y = ampY * sin(frame/ppY) + vShift;
    
        followButton.frame = CGRectMake(self.frame.size.width/2 + _btnOffset.x, _btnOffset.y, 145, 145);
    }
}

-(void)setupAnimations:(NSString *)paintingName
{
    NSMutableArray *animationFrames = [NSMutableArray new];
    for( int i = 0; i < 35; i++ ){
//    for( int i = 26; i < 61; i++ ){
        int index = i % 35;
        NSString *fileName = [NSString stringWithFormat:@"PaintingResources/%@/Spin/35%i", paintingName, index];
        NSString* imagePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"png"];
        [animationFrames addObject: [UIImage imageWithContentsOfFile:imagePath]];
    }
    self.animationImages = animationFrames;
//    [self addCircles];
    self.animationDuration = 3;
//    [self startAnimating];
//    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(delayedStopAnimating:) userInfo:nil repeats:NO];
}

-(void)delayedStopAnimating:(NSTimer *)timer{
    [self stopAnimating];
    [self setImage:[self.animationImages objectAtIndex:10]];
    _currentIndex = 9;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if( self = [super initWithCoder:aDecoder])
    {
        UITapGestureRecognizer* recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRecognized:)];
        [self addGestureRecognizer:recognizer];
    }
    
    return self;
}

-(void)tapRecognized:(UITapGestureRecognizer *)recognizer
{
    [self.delegate paintingTapped:self];
}

-(void)animateDownWithDelay: (float)delay;
{
    [UIView animateWithDuration:0.25 delay:delay options:0 animations:^{
        CGRect f = self.frame;
        self.frame = CGRectMake(f.origin.x+inset, f.origin.y+inset, f.size.width-inset*2, f.size.height-inset*2);
        self.alpha = 1;
    } completion:nil];
    
    self.isDown = YES;
}

-(void)animateUpWithDelay: (float)delay;
{
    [UIView animateWithDuration:0.25 delay:delay options:0 animations:^{
        CGRect f = self.frame;
        self.frame = CGRectMake(f.origin.x-inset, f.origin.y-inset, f.size.width+inset*2, f.size.height+inset*2);
        self.alpha = 1;
    } completion:nil];
    
    self.isDown = NO;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if( !self.isTurnAround ) return;

    _startingPt = [(UITouch*)[touches anyObject] locationInView:self];
    _startingIndex = _currentIndex;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if( !self.isTurnAround ) return;
    int currentDelta = _startingPt.x - [(UITouch*)[touches anyObject] locationInView:self].x;
    _currentIndex = _startingIndex + currentDelta/10;
    
    while( _currentIndex < 0 ){
        _currentIndex += 35;
    }
    
    _currentIndex = _currentIndex % 35;
    [self resetCirclePosForFrame:_currentIndex];
    [self setImage:[self.animationImages objectAtIndex:_currentIndex]];
    
}

@end
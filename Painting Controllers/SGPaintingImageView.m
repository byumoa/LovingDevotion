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
    UIButton* _followBtn;
    UIButton* _blurredBtn;
    CGPoint _btnOffset;
    int _height;
}
- (void)tapRecognized: (UITapGestureRecognizer*)recognizer;
- (void) addCircles;
- (void) delayedStopAnimating: (NSTimer*)timer;

@end

@implementation SGPaintingImageView

-(void)addCircles{
   
    _blurredBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_blurredBtn setImage:[UIImage imageNamed:@"ld_highlight_lg_blur"] forState:UIControlStateNormal];
    [_blurredBtn setImage:[UIImage imageNamed:@"ld_highlight_lg_blur_on"] forState:UIControlStateHighlighted];
    [self insertSubview:_blurredBtn belowSubview:_followBtn];
    
    _followBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_followBtn setImage:[UIImage imageNamed:@"ld_highlight_lg"] forState:UIControlStateNormal];
    [_followBtn setImage:[UIImage imageNamed:@"ld_highlight_lg_on"] forState:UIControlStateHighlighted];
    [self addSubview:_followBtn];
    
    [self resetCirclePosForFrame:0];
}

- (void)resetCirclePosForFrame: (int)frame{
    
    float alpha = 1;
    switch (frame) {
        case 7:
            alpha = 0.66;
            break;
        case 8:
            alpha = 0.33;
            break;
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
            alpha = 0.0;
            break;
        case 14:
            alpha = 0.33;
            break;
        case 15:
            alpha = 0.66;
            break;
        default:
            alpha = 1;
            break;
    }

    _followBtn.alpha = alpha;
    
    _btnOffset.x = -312 * cos(frame/5.75) - 70;
    _btnOffset.y = -30 * sin(frame/6.0);
    
    _height = 75;
    _followBtn.frame = CGRectMake(self.frame.size.width/2 + _btnOffset.x, _height + _btnOffset.y, 145, 145);
    _blurredBtn.frame = _followBtn.frame;
    }

-(void)setupAnimations:(NSString *)paintingName
{
    NSMutableArray *animationFrames = [NSMutableArray new];
//    for( int i = 0; i < 35; i++ ){
    for( int i = 20; i < 55; i++ ){
        int index = i % 35;
        NSString *fileName = [NSString stringWithFormat:@"PaintingResources/%@/Spin/35%i", paintingName, index];
        NSString* imagePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"png"];
        [animationFrames addObject: [UIImage imageWithContentsOfFile:imagePath]];
    }
    self.animationImages = animationFrames;
//    [self addCircles];
    self.animationDuration = 3;
    [self startAnimating];
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(delayedStopAnimating:) userInfo:nil repeats:NO];
}

-(void)delayedStopAnimating:(NSTimer *)timer{
    [self stopAnimating];
    [self setImage:[self.animationImages objectAtIndex:15]];
    _currentIndex = 15;
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
//    [self resetCirclePosForFrame:_currentIndex];
    [self setImage:[self.animationImages objectAtIndex:_currentIndex]];
    
}

@end
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
}

- (void)tapRecognized: (UITapGestureRecognizer*)recognizer;

@end

@implementation SGPaintingImageView

-(id)initWithCoder:(NSCoder *)aDecoder
{
    if( self = [super initWithCoder:aDecoder])
    {
        UITapGestureRecognizer* recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRecognized:)];
        [self addGestureRecognizer:recognizer];
    }
    
    return self;
}

- (void)setupAnimations
{
    NSMutableArray *animationFrames = [NSMutableArray new];
    for( int i = 0; i < 35; i++ ){
        NSString *fileName = [NSString stringWithFormat:@"PaintingResources/radha1/Spin/35%i", i];
        NSString* imagePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"png"];
        [animationFrames addObject: [UIImage imageWithContentsOfFile:imagePath]];
    }
    self.animationImages = animationFrames;
    self.animationDuration = 2;
    [self startAnimating];
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
    _startingPt = [(UITouch*)[touches anyObject] locationInView:self];
    _startingIndex = _currentIndex;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    int currentDelta = _startingPt.x - [(UITouch*)[touches anyObject] locationInView:self].x;
    _currentIndex = _startingIndex + currentDelta/10;
    
    while( _currentIndex < 0 ){
        _currentIndex += 35;
    }
    
    _currentIndex = _currentIndex % 35;
    [self setImage:[self.animationImages objectAtIndex:_currentIndex]];
    
}

@end
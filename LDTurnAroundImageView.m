//
//  LDTurnAroundImageView.m
//  LovingDevotion
//
//  Created by Ontario on 7/29/14.
//
//

#import "LDTurnAroundImageView.h"

@interface LDTurnAroundImageView()
//{
//    CGPoint _startingPt;
//    int _currentIndex;
//    int _startingIndex;
//}

@end

@implementation LDTurnAroundImageView

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

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    _startingPt = [(UITouch*)[touches anyObject] locationInView:self];
//    _startingIndex = _currentIndex;
//}
//
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    int currentDelta = _startingPt.x - [(UITouch*)[touches anyObject] locationInView:self].x;
//    _currentIndex = _startingIndex + currentDelta/10;
//
//    while( _currentIndex < 0 ){
//        _currentIndex += 35;
//    }
//
//    _currentIndex = _currentIndex % 35;
//    [self setImage:[self.animationImages objectAtIndex:_currentIndex]];
//
//}

@end

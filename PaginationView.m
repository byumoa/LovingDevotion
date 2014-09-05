//
//  PaginationView.m
//  LovingDevotion
//
//  Created by Ontario on 9/4/14.
//
//

#import "PaginationView.h"

const NSString* kEmptyCircleName = @"ld_pagination";
const NSString* kFilledCircleName = @"ld_pagination_on";

@implementation PaginationView

-(void)setDotShowing:(int)dot{
    [self.dot1 setImage:[UIImage imageNamed:(NSString*)kEmptyCircleName]];
    [self.dot2 setImage:[UIImage imageNamed:(NSString*)kEmptyCircleName]];
    [self.dot3 setImage:[UIImage imageNamed:(NSString*)kEmptyCircleName]];
    [self.dot4 setImage:[UIImage imageNamed:(NSString*)kEmptyCircleName]];
    [self.dot5 setImage:[UIImage imageNamed:(NSString*)kEmptyCircleName]];
    
    switch(dot){
        case 1:
            [self.dot1 setImage:[UIImage imageNamed:(NSString*)kFilledCircleName]];
            break;
        case 2:
            [self.dot2 setImage:[UIImage imageNamed:(NSString*)kFilledCircleName]];
            break;
        case 3:
            [self.dot3 setImage:[UIImage imageNamed:(NSString*)kFilledCircleName]];
            break;
        case 4:
            [self.dot4 setImage:[UIImage imageNamed:(NSString*)kFilledCircleName]];
            break;
        case 5:
            [self.dot5 setImage:[UIImage imageNamed:(NSString*)kFilledCircleName]];
            break;
        default:
            break;
    }
}

@end

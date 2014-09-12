//
//  SGPaintingImageViewDelegate.h
//  SacredGifts
//
//  Created by Ontario on 12/17/13.
//
//

#import <Foundation/Foundation.h>
@class SGPaintingImageView;

@protocol SGPaintingImageViewDelegate <NSObject>
- (IBAction)paintingTapped: (SGPaintingImageView*) paintingView;
@end

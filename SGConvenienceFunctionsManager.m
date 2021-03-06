//
//  SGConvenienceFunctionsManager.m
//  SacredGifts
//
//  Created by Ontario on 11/9/13.
//
//

#import "SGConvenienceFunctionsManager.h"

@implementation SGConvenienceFunctionsManager

+(id)sharedManager
{
    static SGConvenienceFunctionsManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedManager = [self new];
    });
    
    return  sharedManager;
}

+(void)facebookLogout
{
    NSHTTPCookie *cookie;
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (cookie in [storage cookies]) {
        [storage deleteCookie:cookie];
    }
}

+ (NSString*)artistForPainting: (NSString*)paintingStr abbreviated:(BOOL)abbreviate
{
    NSArray* schwartzPaintings = @[@"garden", @"aalborg"];
    NSArray* hofmannPaintings = @[@"capture", @"temple", @"temple-ny", @"ruler", @"gethsemane", @"savior"];
    
    for (NSString* pName in schwartzPaintings ) {
        if( [pName isEqualToString:paintingStr])
            return abbreviate ? @"schwartz" : @"Frans Schwartz";
    }
    for (NSString* pName in hofmannPaintings ) {
        if( [pName isEqualToString:paintingStr])
            return abbreviate ? @"hofmann" : @"Heinrich Hofmann";
    }
    
    return abbreviate ? @"bloch" : @"Carl Bloch";
}

+ (NSString *)getStringForModule:(ModuleType)moduleType
{
    switch (moduleType) {
        case kModuleTypeChildrens:      return (NSString*)kChildrensStr;    break;
        case kModuleTypeHighlights:     return (NSString*)kHighlightsStr;   break;
        case kModuleTypeGifts:          return (NSString*)kGiftsStr;        break;
        case kModuleTypeMusic:          return (NSString*)kMusicStr;        break;
        case kModuleTypePerspective:    return (NSString*)kPerspectiveStr;  break;
        case kModuleTypeSocial:         return (NSString*)kSocialStr;       break;
        case kModuleTypeSummary:        return (NSString*)kSummaryStr;      break;
        case kModuleTypeTombstone:      return (NSString*)kTombstoneStr;    break;
        case kModuleTypeText:           return (NSString*)kTextStr;         break;
        case kModuleTypeNarration:      return (NSString*)kNarrationStr;    break;
        case kModuleTypeNone:           default:                            break;
    }
    
    return nil;
}

+ (NSString *)getFBURLStrForModule:(NSString*)paintingStr
{
    for( int i = 0; i < kFullPaintingListTotal; ++i ){
        if( [paintingStr isEqualToString:(NSString*)kFullPaintingList[i]] ){
            NSLog(@"i: %i", i);
            return (NSString*)kPaintingFbUrls[i];
        }
    }
    
    return (NSString*)kPaintingFbUrls[0];
}

@end

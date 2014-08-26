//
//  SGConstants.m
//  SacredGifts
//
//  Created by Ontario on 9/20/13.
//  Copyright (c) 2013 Wells Fargo. All rights reserved.
//

const NSString* kAnimTypeZoomIn = @"kSG ZoomIn Anim";
const NSString* kAnimTypeZoomOut = @"kSG ZoomOut Anim";
const NSString* kAnimTypeSwipeRight = @"kSG SwipeRight Anim";
const NSString* kAnimTypeSwipeLeft = @"kSG SwipeLeft Anim";
const NSString* kAnimTypeFade = @"kSG Fade Anim";

const NSString* kControllerIDHomeStr = @"SacredGifts Home";
const NSString* kControllerIDFindAPaintingStr = @"SacredGifts FindAPainting";
const NSString* kControllerIDMeetTheArtistsStr = @"SacredGifts MeetTheArtists";
const NSString* kControllerIDAboutTheExhibitionStr = @"SacredGifts AboutTheExhibition";
const NSString* kControllerIDStoryOfTheExhibitionStr = @"SacredGifts StoryOfTheExhibition";
const NSString* kControllerIDIntroMovieStr = @"SacredGifts IntroMovie";
const NSString* kControllerIDPaintingContainerStr = @"SacredGifts PaintingContainer";
const NSString* kControllerIDPaintingStr = @"SacredGifts Painting";
const NSString* kControllerIDBlochStr = @"bloch";
const NSString* kControllerIDSchwartzStr = @"schwartz";
const NSString* kControllerIDHofmantr = @"hofman";
const NSString* kControllerIDPanoramaStr = @"panorama";

NSString* const kPaintingFbUrls[] = {
    @"",
    @"",
    @"",
    @"",
    @"",
    @"",
    @"",
    @"",
    @"",
    @"",
    @"",
    @"",
    @"",
    @"",
    @"",
    @"",
    @"",
    @"",
    @"",
    @"",
    @"",
    @"",
    @"",
};

const int kFullPaintingListTotal = 30;
NSString* const kFullPaintingList[] = {
    @"balakrishna_butterballs", //0
    @"fluting_krishna1",        //1
    @"fluting_krishna2",        //2
    @"fluting_krishna3",        //3
    @"krishna_butterballs",     //4
    @"krishna_radha",           //5
    @"radha1",                  //6
    @"radha2",                  //7
    @"nadu_gopala1",            //8
    @"nadu_gopala2",            //9
    @"nadu_gopala3",            //10
    @"nadu_gopala4",            //11
    @"nadu_gopala5",            //12
    @"temple_urn",              //13
    @"painting_devotee",        //14
    @"painting_flute",          //15
    @"painting_friend",         //16
    @"painting_garlands",       //17
    @"painting_instrument",     //18
    @"painting_radha",          //19
    @"male_torso",              //20
    @"shrine1",                 //21
    @"shrine2",                 //22
    @"vishnupatta",             //23
    @"vishnu_attendants1",      //24
    @"vishnu_attendants2",      //25
    @"vishnu_attendants3",      //26
    @"vishnu_attendants4",      //27
    @"vishnu_varaha",           //28
    @"vishnu_mandala",          //29
};

const int kTotalPaintingsBloch = 13;
NSString* const kPaintingNamesBloch[] = {
    @"mocking",
    @"consolator",
    @"emmaus",
    @"castle",
    @"shepherds",
    @"sermon",
    @"children",
    @"healing",
    @"cleansing",
    @"denial",
    @"cross",
    @"burial",
    @"resurrection",
};

const int kTotalPaintingsSchwartz = 2;
NSString* const kPaintingNamesSchwartz[] = {
    @"garden",
    @"aalborg",
};

const int kTotalPaintingsHofmann = 5;
NSString* const kPaintingNamesHofmann[] = {
    @"capture",
    @"temple",
    @"ruler",
    @"gethsemane",
    @"savior",
};

NSString* const kArtistNames[] = {
    @"hofman",
    @"schwartz",
    @"bloch"
};

const NSString* kDontateURLStr = @"https://donate.byu.edu/TNHO3ajmoEyyUA7Sb5uKkg/P/LlGZnojZCEC0r8dLhBjk2w?cat=0&ReturnUrl=sacredgifts%3A%2F%2F%3Fsender%3Dldsp";
const CGRect kWebviewBackBtnFrm = {10, 10, 100, 60 };
const CGRect kBlurFrame = {-18, -18, 804, 1060};

const NSString* kPaintingResourcesStr = @"PaintingResources";

const NSString* kModuleBtnSummaryImageNrm = @"SG_General_Painting_SummaryBtn";
const NSString* kModuleBtnSummaryImageSel = @"SG_General_Painting_SummaryBtn-on";
const NSString* kModuleBtnMusicImageNrm = @"SG_General_Painting_MusicBtn";
const NSString* kModuleBtnMusicImageSel = @"SG_General_Painting_MusicBtn-on";
const NSString* kModuleBtnChildrensImageNrm = @"SG_General_Painting_ChildrensBtn";
const NSString* kModuleBtnChildrensImageSel = @"SG_General_Painting_ChildrensBtn-on";
const NSString* kModuleBtnPerspectiveImageNrm = @"SG_General_Painting_PerspectivesBtn";
const NSString* kModuleBtnPerspectiveImageSel = @"SG_General_Painting_PerspectivesBtn-on";
const NSString* kModuleBtnGiftsImageNrm = @"SG_General_Painting_GiftsBtn";
const NSString* kModuleBtnGiftsImageSel = @"SG_General_Painting_GiftsBtn-on";
const NSString* kModuleBtnHighlightsImageNrm = @"SG_General_Painting_DetailsBtn";
const NSString* kModuleBtnHighlightsImageSel = @"SG_General_Painting_DetailsBtn-on";

NSString* const kSummaryStr = @"summary";
NSString* const kPerspectiveStr = @"perspectives";
NSString* const kGiftsStr = @"gift";
const NSString* kMusicStr = @"music";
NSString* const kHighlightsStr = @"highlights";
const NSString* kChildrensStr = @"childrens";
const NSString* kTombstoneStr = @"tombstone";
const NSString* kSocialStr = @"social";
NSString* const kVideoStr = @"video";
const NSString* kPanoramaStr = @"panorama";
const NSString* kScanStr = @"scan";
const NSString* kSermonARStr = @"sermonAR";
const NSString* kTextStr = @"text";
const NSString* kNarrationStr = @"narration";
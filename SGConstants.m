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
    @"http://on.fb.me/1Acr91Y",
    @"http://on.fb.me/1qiBN6w",              //2-
    @"http://on.fb.me/1m4nz92",           //3-
    @"http://on.fb.me/1qN3hAW",      //4-
    @"http://on.fb.me/1peLfma",      //5-
    @"http://on.fb.me/1sMK8jr",             //6-
    @"http://on.fb.me/WZFwK3",              //7-
    @"http://on.fb.me/Yg3vGm",      //8-
    
    @"http://on.fb.me/1BeWQKl", //nadu_gopala1
    @"http://on.fb.me/1BeWQKl",            //10-
    @"http://on.fb.me/1BeWQKl",            //11-
    @"http://on.fb.me/1BeWQKl",            //12-
    @"http://on.fb.me/1BeWQKl",            //13-
    
    @"http://bit.ly/1DbkZUe",   //fluting_krishna1
    @"http://bit.ly/1DbkZUe",        //15
    @"http://bit.ly/1DbkZUe",        //16
    
    @"http://on.fb.me/1wbaqvv", //radha1
    @"http://on.fb.me/1wbaqvv",                  //18-
    
    @"http://on.fb.me/ZkMYRM", //19
    
    @"http://on.fb.me/WZFeD0",     //20
    @"http://on.fb.me/Xf3oJZ",                 //21-
    @"http://on.fb.me/1CvXDIl",     //22-
    @"http://on.fb.me/1lKGDJw",       //23-
    @"http://on.fb.me/1txrkpT",        //24-
    @"http://on.fb.me/1raQ9BQ",          //25-
    @"http://on.fb.me/1qsh7Zm",         //26-
    @"http://on.fb.me/1lDJiUY",          //27-
    @"http://on.fb.me/1D5D6Lf",           //28
    @"http://on.fb.me/1CvWLDG",      //29-
    @"http://on.fb.me/1wrjkYC",
};

const int kFullPaintingListTotal = 30;

NSString* const kFullPaintingList[] = {
    @"vishnu_mandala",          //1-
    @"male_torso",              //2-
    @"vishnu_varaha",           //3-
    @"vishnu_attendants2",      //4-Duplicate of vishnu_attendants1
    @"vishnu_attendants1",      //5-
    @"vishnupatta",             //6-
    @"temple_urn",              //7-
    @"vishnu_attendants3",      //8-
    
    @"nadu_gopala1",            //9-
    @"nadu_gopala2",            //10-
    @"nadu_gopala3",            //11-
    @"nadu_gopala4",            //12-
    @"nadu_gopala5",            //13-
    
    @"fluting_krishna1",        //14//Missing
    @"fluting_krishna2",        //15//Missing
    @"fluting_krishna3",        //16//Missing
    
    @"radha1",                  //17-
    @"radha2",                  //18-
    
    @"balakrishna_butterballs", //19//Missing
    
    @"krishna_butterballs",     //20//Missing
    @"shrine1",                 //21-
    @"painting_instrument",     //22-
    @"painting_garlands",       //23-
    @"painting_devotee",        //24-
    @"painting_flute",          //25-
    @"painting_friend",         //26-
    @"painting_radha",          //27-
    @"krishna_radha",           //28//Missing
    @"vishnu_attendants4",      //29-
    @"shrine2",                 //30-
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
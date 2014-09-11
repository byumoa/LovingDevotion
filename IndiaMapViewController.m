//
//  IndiaMapViewController.m
//  LovingDevotion
//
//  Created by Ontario on 8/25/14.
//
//

#import "IndiaMapViewController.h"

@interface IndiaMapViewController ()

@end

@implementation IndiaMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if( self.mapName ){
        UIImageView* mapView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.mapName]];
        [self.view insertSubview:mapView atIndex:1];
    }
    else{
        self.backBtn.alpha = 0;
        UIImageView* mapView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"map_main"]];
        [self.view insertSubview:mapView atIndex:1];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)pressedBack:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

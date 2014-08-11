//
//  GlossaryViewControllerTableViewController.m
//  LovingDevotion
//
//  Created by Ontario on 8/11/14.
//
//

#import "GlossaryViewControllerTableViewController.h"

@interface GlossaryViewControllerTableViewController (){
    NSArray* _glossaryArr;
    NSMutableArray* _activeEntries;
}
@end

@implementation GlossaryViewControllerTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    NSString* glossaryPath = [[NSBundle mainBundle] pathForResource:@"glossary" ofType:@"plist"];
    _glossaryArr = [NSArray arrayWithContentsOfFile:glossaryPath];
    
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"SG_General_BackBtn"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"SG_General_BackBtn-on"] forState:UIControlStateHighlighted];
    backButton.frame = CGRectMake(10, 40, 122, 41);
    [backButton addTarget:self action:@selector(pressedBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    _activeEntries = [NSMutableArray new];
    for( int i = 0; i < _glossaryArr.count; i++ ){
        [_activeEntries addObject:[NSNumber numberWithBool:NO]];
    }
}

- (void) pressedBack: (UIButton*)sender{
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return _glossaryArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if( [((NSNumber*)_activeEntries[section]) boolValue] ){
        return ((NSDictionary*)[_glossaryArr objectAtIndex:section]).count;
    }
    else{
        return 1;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* reuseID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    
    NSDictionary* entry = _glossaryArr[indexPath.section];
    NSString* text = @"";
    switch( indexPath.row ){
        case 0:{
            NSString* entryText = [entry objectForKey:@"name"];
            text = entryText;
        }
            break;
        case 1:{
            NSString* entryText = [entry objectForKey:@"pronunciation"];
            text = [NSString stringWithFormat:@"    Pronunciation: %@", entryText];
        }
            break;
        case 2:{
            NSString* entryText = entry.count > 3 ? [entry objectForKey:@"alternative"] : [entry objectForKey:@"definition"];
            NSString* modifier = entry.count > 3 ? @"Alternative" : @"Definition";
            text = [NSString stringWithFormat:@"    %@: %@", modifier, entryText];
        }
            break;
        case 3:{
            NSString* entryText = [entry objectForKey:@"definition"];
            text = [NSString stringWithFormat:@"    Definition: %@", entryText];
        }
            break;
        default:
            break;
    }

    [cell.textLabel setText:text];
    cell.textLabel.backgroundColor = [UIColor whiteColor];
    if( indexPath.section == 0){
        if( indexPath.row == 0 ){
            cell.textLabel.backgroundColor = [UIColor yellowColor];
        }
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if( indexPath.row == 0 ){
        bool newBool = ![((NSNumber*)_activeEntries[indexPath.section]) boolValue];
        _activeEntries[indexPath.section] = [NSNumber numberWithBool:newBool];
        [tableView reloadData];
    }
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

@end

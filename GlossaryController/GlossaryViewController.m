//
//  GlossaryViewController.m
//  LovingDevotion
//
//  Created by Ontario on 9/11/14.
//
//

#import "GlossaryViewController.h"

@interface GlossaryViewController (){
    NSMutableArray* _glossaryArr;
    NSArray* _highlightWords;
}
- (NSDictionary*)getEntryForWord: (NSString*)key in:(NSArray*)entireGlossary;

@end

@implementation GlossaryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) setHighlightWords: (NSArray*) highlightWords{
    _highlightWords = highlightWords;
    
    NSString* glossaryPath = [[NSBundle mainBundle] pathForResource:@"glossary" ofType:@"plist"];
    NSArray* entireGlossaryArr = [NSArray arrayWithContentsOfFile:glossaryPath];

    _glossaryArr = [NSMutableArray new];
    for( NSString* wordKey in _highlightWords ){
        NSDictionary* dict = [self getEntryForWord:wordKey in:entireGlossaryArr];
        if( dict ){
            [_glossaryArr addObject:dict];
        }
    }
}

- (NSDictionary*)getEntryForWord: (NSString*)key in:(NSArray*)entireGlossary{
    for( NSDictionary* dict in entireGlossary){
        if([((NSString*)[dict objectForKey:@"name"]).lowercaseString isEqualToString:key.lowercaseString]){
            return dict;
        }
    }
    
    return nil;
}

- (IBAction)pressedBack:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.backgroundBottom.alpha = 0;
    self.backgroundTop.alpha = 0;
//
//    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [backButton setImage:[UIImage imageNamed:@"SG_General_BackBtn"] forState:UIControlStateNormal];
//    [backButton setImage:[UIImage imageNamed:@"SG_General_BackBtn-on"] forState:UIControlStateHighlighted];
//    backButton.frame = CGRectMake(10, 40, 122, 41);
//    [backButton addTarget:self action:@selector(pressedBack:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:backButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _glossaryArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* reuseID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    
    NSDictionary* entry = _glossaryArr[indexPath.row];
    UIColor* bgColor = [UIColor clearColor];
    
    NSString* title = [entry objectForKey:@"name"];
    NSString* pronunciation = [entry objectForKey:@"pronunciation"];
    NSString* leftParen = @"";
    NSString* rightParen = @"";
    if( pronunciation && ![pronunciation isEqualToString:@""]){
        leftParen = @"(";
        rightParen = @")";
    }
    NSString* definition = [entry objectForKey:@"definition"];
    
    NSString* plainText = [NSString stringWithFormat: @"%@ %@%@%@ %@", title, leftParen, pronunciation, rightParen, definition];

    UIColor* titleColor = [UIColor colorWithRed:254/255.0 green:205/255.0 blue:138/255.0 alpha:1];
    UIColor* defColor = [UIColor colorWithRed:254/255.0 green:234/255.0 blue:208/255.0 alpha:1];
    UIFont* bold = [UIFont boldSystemFontOfSize:22];
    
    NSMutableAttributedString* text = [[NSMutableAttributedString alloc] initWithString:plainText];
    [text addAttribute:NSForegroundColorAttributeName
                 value:titleColor
                 range:NSMakeRange(0, title.length)];
    [text addAttribute:NSFontAttributeName value:bold range:NSMakeRange(0, title.length)];
//    [text addAttribute:NSForegroundColorAttributeName
//                 value:defColor
//                 range:NSMakeRange(title.length, text.length)];
    /////////////
//    NSMutableAttributedString *text =
//    [[NSMutableAttributedString alloc]
//     initWithAttributedString: label.attributedText];
//    
//    [text addAttribute:NSForegroundColorAttributeName
//                 value:[UIColor redColor]
//                 range:NSMakeRange(10, 1)];
//    [label setAttributedText: text];
    ///////////////
    
    cell.textLabel.textColor = defColor;
    [cell.textLabel setAttributedText:text];
    cell.textLabel.backgroundColor = bgColor;
    cell.textLabel.numberOfLines = 0;
    cell.backgroundColor = bgColor;
    cell.contentView.backgroundColor = bgColor;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

@end

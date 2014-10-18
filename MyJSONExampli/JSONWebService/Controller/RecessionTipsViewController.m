//
//  RecessionTipsViewController.m
//  dummy
//
//  Created by Priyank Ranka on 24/08/13.
//  Copyright (c) 2013 Nimap Infotech. All rights reserved.
//

#import "RecessionTipsViewController.h"

@interface RecessionTipsViewController ()

@end

@implementation RecessionTipsViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        // Custom initialization
        self.edgesForExtendedLayout=UIRectEdgeNone;
        parser  =   [[RecessionTipsParser alloc] init];
        parser.delegate =   self;
        [parser getRecessionSafetyTips];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   // RecessionTipsViewController *rec=[[RecessionTipsViewController alloc] init];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - RecessionTipsParserDeleagate Methods Implementation

-(void) didReceiveRecessionTips:(NSArray*) recessionTips
{
    tips    =   recessionTips;
    
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        tipTable    =   [[UITableView alloc] initWithFrame:CGRectMake(56.0,50.0,656.0,900.0) style:UITableViewStyleGrouped];
    }
    else
    {
        tipTable    =   [[UITableView alloc] initWithFrame:CGRectMake(20.0,30.0,276.0,400.0) style:UITableViewStyleGrouped];
    }
    
    tipTable.delegate   =   self;
    tipTable.dataSource =   self;
    tipTable.backgroundView =   nil;
    [self.view addSubview:tipTable];
}

-(void) didReceiveConnetionError
{
    
}

-(void) didReceiveProcessingError
{
    
}

#pragma mark - UITableViewDataSource Methods Implementation

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tips.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RecessionTipCell *mycell;
    
    mycell = (RecessionTipCell*) [tableView dequeueReusableCellWithIdentifier:@"terrorcell"];
    
    if(!mycell)
    {
        mycell = [[RecessionTipCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"terrorcell"];
    }
    
    
    if(indexPath.row %2 == 0)
        mycell.backgroundColor =   [UIColor colorWithPatternImage:[UIImage imageNamed:@"greenbox@2x.png"]];//;
    else
         mycell.backgroundColor =   [UIColor colorWithPatternImage:[UIImage imageNamed:@"orangebox@2x.png"]];
    
    mycell.tipNumber.text   =   [NSString stringWithFormat:@"Tip # %lu",tips.count-indexPath.row];
    mycell.tip.text         =   ((RecessionTipModel*)[tips objectAtIndex:indexPath.row]).tipdescription;
    mycell.author.text      =   [NSString stringWithFormat:@"by- %@",((RecessionTipModel*)[tips objectAtIndex:indexPath.row]).username];
    
    mycell.clientID.text=((RecessionTipModel*) [tips objectAtIndex:indexPath.row]).client_No;
    return mycell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 250.0;
}

@end

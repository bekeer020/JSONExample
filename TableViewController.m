//
//  TableViewController.m
//  MyJSONExampli
//
//  Created by Abualwaleed on 10/17/14.
//  Copyright (c) 2014 Alkhaleej. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)init
{
    self = [super init];
    if (self)
    {
        // Custom initialization
        self.edgesForExtendedLayout=UIRectEdgeNone;
        parser  =   [[StudentParser alloc] init];
        parser.delegate =   self;
        [parser getStudentsSafty];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    parser  =   [[StudentParser alloc] init];
    parser.delegate =   self;
//    self.tableView.delegate   =   self;
//    self.tableView.dataSource =   self;
    [parser getStudentsSafty];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.studentss.count;
 }


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text         =   ((StudentObjectModel*)[self.studentss objectAtIndex:indexPath.row]).studentName;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - RecessionTipsParserDeleagate Methods Implementation

-(void)didRecieveStudents:(NSArray*)students;
{
    self.studentss    =   students;
   //  [self.tableView reloadData];

    
    self.tableView.delegate   =   self;
    self.tableView.dataSource =   self;
    self.tableView.backgroundView =   nil;
    //[self.view addSubview:tipTable];
}

-(void) didRecieveConnectionError
{
    
}

-(void) didRecieveResponseError
{
    
}

@end

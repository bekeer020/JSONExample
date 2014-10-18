//
//  TableViewController.h
//  MyJSONExampli
//
//  Created by Abualwaleed on 10/17/14.
//  Copyright (c) 2014 Alkhaleej. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentParser.h"

@interface TableViewController : UITableViewController<StudentParserDelegate>
{
    
StudentParser *parser;

UITableView *tipTable;
    
}

@property(strong,nonatomic) NSArray *studentss;
@end

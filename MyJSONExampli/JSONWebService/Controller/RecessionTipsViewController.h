//
//  RecessionTipsViewController.h
//  dummy
//
//  Created by Priyank Ranka on 24/08/13.
//  Copyright (c) 2013 Nimap Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecessionTipCell.h"
#import "RecessionTipsParser.h"

@interface RecessionTipsViewController : UIViewController <RecessionTipsParserDeleagate,UITableViewDataSource,UITableViewDelegate>
{
    RecessionTipsParser *parser;
    
    NSArray *tips;
    
    UITableView *tipTable;
}

@end

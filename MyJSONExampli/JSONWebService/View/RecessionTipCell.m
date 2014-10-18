//
//  Recessionself.tipCell.m
//  dummy
//
//  Created by Priyank Ranka on 24/08/13.
//  Copyright (c) 2013 Nimap Infotech. All rights reserved.
//

#import "RecessionTipCell.h"

@implementation RecessionTipCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.tipNumber     =   [[UILabel alloc] initWithFrame:CGRectMake(20.0,5.0,260.0,20.0)];
        self.tipNumber.font  =   [UIFont boldSystemFontOfSize:12.0];
        self.tipNumber.textAlignment =   NSTextAlignmentCenter;
        self.tipNumber.textColor =   [UIColor whiteColor];
        self.tipNumber.backgroundColor   =   [UIColor clearColor];
        [self addSubview:self.tipNumber];
        
        self.tip                =   [[UILabel alloc] initWithFrame:CGRectMake(20.0,5.0+self.tipNumber.frame.size.height,240.0,200.0)];
        self.tip.font           =   [UIFont boldSystemFontOfSize:16.0];
        self.tip.textColor      =   [UIColor whiteColor];
        self.tip.numberOfLines   =   0;
        self.tip.backgroundColor =   [UIColor clearColor];
        [self addSubview:self.tip];
        
        
        
        self.clientID     =   [[UILabel alloc] initWithFrame:CGRectMake(20.0,5.0,260.0,150.0)];
        self.clientID.font  =   [UIFont boldSystemFontOfSize:12.0];
        self.clientID.textAlignment =   NSTextAlignmentCenter;
        self.clientID.textColor =   [UIColor whiteColor];
        self.clientID.backgroundColor   =   [UIColor clearColor];
        [self addSubview:self.clientID];
        
        
        
        self.author     =   [[UILabel alloc] initWithFrame:CGRectMake(20.0,self.tip.frame.origin.y+self.tip.frame.size.height+5.0,240.0,20.0)];
        self.author.font  =   [UIFont boldSystemFontOfSize:12.0];
        self.author.textAlignment =   NSTextAlignmentCenter;
        
        self.author.textColor =   [UIColor whiteColor];
        self.author.backgroundColor  =   [UIColor clearColor];
        [self addSubview:self.author];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

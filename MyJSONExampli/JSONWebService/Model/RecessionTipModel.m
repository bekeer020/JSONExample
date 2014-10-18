//
//  RecessionTipModel.m
//  dummy
//
//  Created by Priyank Ranka on 24/08/13.
//  Copyright (c) 2013 Nimap Infotech. All rights reserved.
//

#import "RecessionTipModel.h"

@implementation RecessionTipModel

-(void) dealloc
{
    if(self.username != nil)
    {
    //    [self.username release];
        self.username   =   nil;
    }
    
    if(self.tipdescription != nil)
    {
       // [self.tipdescription release];
        self.tipdescription =   nil;
    }
    
    if (self.client_No!=nil) {
        self.client_No=nil;
    }
    
  //  [super dealloc];
}

@end

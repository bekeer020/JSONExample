//
//  RecessionTipsParser.h
//  dummy
//
//  Created by Priyank Ranka on 24/08/13.
//  Copyright (c) 2013 Nimap Infotech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RecessionTipModel.h"

@protocol RecessionTipsParserDeleagate <NSObject>

-(void) didReceiveRecessionTips:(NSArray*) recessionTips;
-(void) didReceiveConnetionError;
-(void) didReceiveProcessingError;

@end

@interface RecessionTipsParser : NSObject
{
    NSMutableData       *webData;
    
    NSMutableArray      *recessionTips;//container
    
}

@property(weak,nonatomic) id<RecessionTipsParserDeleagate> delegate;

-(void) getRecessionSafetyTips;
-(void) processRecessionSafetyTipsWithData:(NSData*)data;

@end

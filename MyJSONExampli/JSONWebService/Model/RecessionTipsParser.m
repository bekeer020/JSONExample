//
//  RecessionTipsParser.m
//  dummy
//
//  Created by Priyank Ranka on 24/08/13.
//  Copyright (c) 2013 Nimap Infotech. All rights reserved.
//

#import "RecessionTipsParser.h"

@implementation RecessionTipsParser

-(id) init
{
    self = [super init];
    
    if(self)
    {
        
    }
    
    return self;
}

-(void) getRecessionSafetyTips
{
   // NSString *JSONURL = @"http://www.nimapinfotech.com/RecessionSafetyTips/TipService.svc/GetData/1";
     NSString *JSONURL=@"http://www.dlf-sa.com/orderservice.svc/GetStudents/11test";
    NSURL *url = [NSURL URLWithString:JSONURL];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
}


#pragma mark - NSURLConnectionDelegate Method Implementation


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    webData =   [[NSMutableData alloc] init];
	[webData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[webData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if(self.delegate)
    {
        [self.delegate didReceiveConnetionError];
    }
        
    
	//[connection release];
    connection  =   nil;
    
   // [webData release];
    webData =   nil;
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	//Aziz   Why should wait for dealloc
    
	[self processRecessionSafetyTipsWithData:webData];
    
    //[connection release];
    connection  =   nil;
    
   // [webData release];
    webData =   nil;
}

-(void) processRecessionSafetyTipsWithData:(NSData*)data
{
    
    
    NSError *error;
    
    NSDictionary* json =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    if (!json || error != nil)
    {
        if(self.delegate)
        {
            [self.delegate didReceiveProcessingError];
        }
    }
    else
    {
        recessionTips   =   [[NSMutableArray alloc] init];
       // NSArray *tips = [json objectForKey:@"Tips"];
        NSArray *tips = [json objectForKey:@"Info"];

        
        for (int i=0; i<tips.count; i++)
        {
            NSDictionary *tip = (NSDictionary*)[tips objectAtIndex:i];
            
            RecessionTipModel *recessionTip    =   [[RecessionTipModel alloc] init];
            
            //recessionTip.tipdescription         =   (NSString*)[tip objectForKey:@"tipdescription"];
            //recessionTip.username               =   (NSString*)[tip objectForKey:@"username"];
            
            
            
            recessionTip.tipdescription         =   (NSString*)[tip objectForKey:@"mobile"];
            recessionTip.username               =   (NSString*)[tip objectForKey:@"nameAr"];
            recessionTip.client_No               =   (NSString*)[tip objectForKey:@"client_id"];
            
            
            [recessionTips addObject:recessionTip];
        }
        
        if(self.delegate)
        {
            [self.delegate didReceiveRecessionTips:recessionTips];
        }
        
    }
    
}

-(void) dealloc
{
  
}

@end

//
//  StudentParser.m
//  MyJSONExampli
//
//  Created by Abualwaleed on 10/17/14.
//  Copyright (c) 2014 Alkhaleej. All rights reserved.
//

#import "StudentParser.h"

@implementation StudentParser


-(id) init
{
    self=[super init];
    if (self) {
        
    }
    return self;
}


-(void)getStudentsSafty
{
    NSString *JSONURL=@"http://www.dlf-sa.com/orderservice.svc/GetStudents/11test";
    NSURL *url= [NSURL URLWithString:JSONURL];
    NSMutableURLRequest *theRequist=[NSMutableURLRequest requestWithURL:url];
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequist delegate:self];
   [theConnection scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
}


-(void)proccessingStudentsDataSafty:(NSData*) data
{
    NSLog(@"%@ Abdulaziz:",data);

    NSError *error;
    NSDictionary *json=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (json || error!=nil) {
      
        if (1==7) {
          //[self.delegate didRecieveResponseError];
        }
        else
        {
            studentsObject = [[NSMutableArray alloc] init];
            NSArray *studentsArr = [json objectForKey:@"Info"];
            
            
            for (int i=0; i<studentsArr.count; i++)
            {
                NSDictionary *tip = (NSDictionary*)[studentsArr objectAtIndex:i];
                
                StudentObjectModel *student    =   [[StudentObjectModel alloc] init];
                
                student.studentName         =   (NSString*)[tip objectForKey:@"nameAr"];
                student.studentMobile       =   (NSString*)[tip objectForKey:@"mobile"];
                student.studentClientID     =   (NSString*)[tip objectForKey:@"client_id"];

                [studentsObject addObject:student];
            }
            
            if(self.delegate)
            {
                [self.delegate didRecieveStudents:studentsArr];
            }
        }
      
    }
}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    webData =   [[NSMutableData alloc] init];
    [webData setLength:0];
}


-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [webData appendData:data];
    //NSLog(@"%@",data);
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    if(self.delegate)
    {
        [self.delegate didRecieveConnectionError];
    }

    connection  =   nil;
    webData =   nil;
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //Aziz   Why should wait for dealloc
    
    [self proccessingStudentsDataSafty:webData];
    //[connection release];
    connection  =   nil;
    // [webData release];
    webData =   nil;
}



@end

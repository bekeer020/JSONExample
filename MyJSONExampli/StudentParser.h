//
//  StudentParser.h
//  MyJSONExampli
//
//  Created by Abualwaleed on 10/17/14.
//  Copyright (c) 2014 Alkhaleej. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StudentObjectModel.h"

@protocol StudentParserDelegate <NSObject>

-(void)didRecieveStudents:(NSArray*)students;
-(void)didRecieveConnectionError;
-(void)didRecieveResponseError;


@end



@interface StudentParser : NSObject<NSURLConnectionDelegate>
{
    NSMutableData       *webData;
    NSMutableArray      *studentsObject;//container

}
@property (weak,nonatomic)id<StudentParserDelegate> delegate;

-(void)getStudentsSafty;
-(void)proccessingStudentsDataSafty:(NSData*) data;

@end

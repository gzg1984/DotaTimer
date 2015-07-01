//
//  SoundListElement.m
//  Dota Timer
//
//  Created by 高志刚 on 15/6/25.
//  Copyright (c) 2015年 高志刚. All rights reserved.
//

#import "SoundListElement.h"
@interface SoundListElement()
@property (nonatomic,strong) NSString *Name;
@property (nonatomic) NSInteger Interval;

@end


@implementation SoundListElement

@synthesize Name=_Name;
@synthesize Interval=_Interval;

//{
//    SystemSoundID SSID;
//    NSString *PathName;
//    BOOL on;
//}


-(id) initWithString:(NSString *)InitName
{
    self = [super init] ;
    if (_Name ==nil ) _Name=[[NSString alloc] initWithString:InitName];
    return self;
}

- (NSString *) Name
{
    return _Name;
}

- (NSInteger) Interval
{
    _Interval=0;
    return _Interval;
}

@end


/*- (void) setName: (NSString *) theName{
    if (self.Name==nil) self.Name=[[NSString alloc] initWithString:theName];
}*/
 /*
25 - (NSString *) lastName{
    26  return lastName;
    27 }
28
29
30 - (NSString *) description
31 {
    32  if (firstName == nil || lastName == nil) {
        33  return @"No Name found.";
        34     } else {
            35  return [NSString stringWithFormat:@"%@ %@",
                        36             firstName,lastName];
            37     }
    38    
    39 }
40 
41 @end*/

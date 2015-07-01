//
//  SoundListElement.h
//  Dota Timer
//
//  Created by 高志刚 on 15/6/25.
//  Copyright (c) 2015年 高志刚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>


@interface SoundListElement : NSObject

- (id)initWithString:(NSString*)InitName;
//@property (nonatomic,strong) NSString *Name;

- (NSString *) Name;
- (NSInteger) Interval;

//- (void) setName:(NSString *)theName;
/*
- (void) setLastName: (NSString *) m_lastName;
- (NSString *) lastName;
*/

@end

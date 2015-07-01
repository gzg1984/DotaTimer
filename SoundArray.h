//
//  SoundArray.h
//  Dota Helper
//
//  Created by 高志刚 on 15/6/15.
//  Copyright (c) 2015年 高志刚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface SoundArray : NSObject

- (void)pushsound:(SystemSoundID)SSID;
- (void)PlayPendingSound;

@end

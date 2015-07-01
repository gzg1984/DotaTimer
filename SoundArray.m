//
//  SoundArray.m
//  Dota Helper
//
//  Created by 高志刚 on 15/6/15.
//  Copyright (c) 2015年 高志刚. All rights reserved.
//

#import "SoundArray.h"
@interface SoundArray()
@property (nonatomic,strong) NSMutableArray *SoundIDs;
//- (void) aftersoundend:(SystemSoundID) SID :(void*) cdata
//@property (nonatomic) AudioServicesSystemSoundCompletionProc* aftersoundend;

@end

static BOOL  isplaying = NO;


@implementation SoundArray

@synthesize SoundIDs=_only_one_SoundIDArray;
//@synthesize aftersoundend=_aftersoundend;

- (NSMutableArray* )SoundIDs
{
    if (_only_one_SoundIDArray ==nil ) _only_one_SoundIDArray = [[NSMutableArray alloc] init];
    return _only_one_SoundIDArray;
}

- (void)pushsound:(SystemSoundID)SSID
{
    //NSNumber* NextSound = [NSNumber numberWithInt:SSID];
    [self.SoundIDs addObject:[NSNumber numberWithInt:SSID]];
}

//- (void) _aftersoundend:(SystemSoundID) SID :(void*) cdata
static void aftersoundend(SystemSoundID doundID,void * ClientData)
{
 //   SoundArray* callbackarray=(__bridge SoundArray *)(ClientData);
    isplaying= NO;

    return;
}

- (void)PlayPendingSound
{
    //...if current playing finished
    //and the soundids is no empty
    NSLog(@"Enter check");
    if (isplaying == NO)
    {
            NSNumber *currendpending = [self.SoundIDs lastObject];
    if (currendpending != nil )
    {
        NSLog(@"pending is not nil ");

        SystemSoundID CurrentID= [currendpending intValue];
        AudioServicesAddSystemSoundCompletion(CurrentID, nil, nil, aftersoundend, nil);
        AudioServicesPlaySystemSound(CurrentID);

    [self.SoundIDs removeLastObject];
        isplaying= YES;
        
    }
        
    }

    return;
    
}

@end

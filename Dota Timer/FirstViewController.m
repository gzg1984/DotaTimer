//
//  FirstViewController.m
//  Dota Timer
//
//  Created by 高志刚 on 15/6/23.
//  Copyright (c) 2015年 高志刚. All rights reserved.
//

#import "FirstViewController.h"
#import "SoundListElement.h"
#import "SecondViewController.h"

#import "SoundArray.h"


@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UILabel *TimerShower;
@property (weak, nonatomic) IBOutlet UIButton *Starter;

@property (strong,nonatomic) NSNumber *current_minut;
@property (strong,nonatomic) NSNumber *current_second;

@property (nonatomic) BOOL  isrunning;
@property (nonatomic,strong) SoundArray* Sa;
@property (nonatomic,strong) SecondViewController* ListController;


@end

@implementation FirstViewController
@synthesize ListController=_ListController;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title=@"Chat";
    for (UIViewController *controller in self.parentViewController.childViewControllers)
    {
        if ([controller isKindOfClass:[SecondViewController class]])
        {
            _ListController=(SecondViewController*)controller;
            self.ListController.tabBarItem.title=@"Contact";
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@synthesize Sa=_sa;

- (SoundArray* )Sa
{
    if (!_sa)
    {
        _sa = [[SoundArray alloc] init];
    }
    return _sa;
}




@synthesize TimerShower=_timerShower111;
@synthesize current_minut=_current_minut111;
@synthesize isrunning=_isrunning;

static SystemSoundID qiangfu = 0;
static SystemSoundID xiaobinsj = 0;

static SystemSoundID yeguaisx = 0;

static SystemSoundID xiaobinsx = 0;


- (NSNumber *)current_minut
{
    if (_current_minut111 == nil ) _current_minut111=[[NSNumber alloc]init];
    return _current_minut111;
}

-(void)UpdateString:(NSTimer *)theTimer
{
    if (self.current_minut.intValue <10 )
    {
        //NSString *astring = [[NSString alloc] initWithString:[NSString stringWithFormat:@"00:%d",self.current_minut.intValue]];
        self.TimerShower.text = [[NSString alloc] initWithString:[NSString stringWithFormat:@"%d:0%d",self.current_second.intValue, self.current_minut.intValue]];
        
        
        
    }
    else if ( self.current_minut.intValue >=10 && self.current_minut.intValue < 60)
    {
        self.TimerShower.text = [[NSString alloc] initWithString:[NSString stringWithFormat:@"%d:%d",self.current_second.intValue ,   self.current_minut.intValue]];
        
        
        
    }
    else
    {
        self.current_second = [NSNumber numberWithInt:(self.current_second.intValue +  1)];
        self.current_minut = 0 ;
        self.TimerShower.text = [[NSString alloc] initWithString:[NSString stringWithFormat:@"%d:%d",self.current_second.intValue,  self.current_minut.intValue]];
        //   AudioServicesPlaySystemSound(1106);
    }
    //self.timerShower.text=astring;
    self.current_minut = [NSNumber numberWithInt:(self.current_minut.intValue +  1)];
    [self.Sa PlayPendingSound];
    
    
}

-(void)WarningEvery30:(NSTimer *)theTimer
{
    // AudioServicesPlaySystemSound(shake_sound_male_id);
    [self.Sa pushsound:xiaobinsx];
}
-(void)WarningEvery60:(NSTimer *)theTimer
{
    
    //   AudioServicesPlaySystemSound(shake_sound_male_id);
    [self.Sa pushsound:yeguaisx];
    
}

-(void)WarningEvery120:(NSTimer *)theTimer
{
    
    //   AudioServicesPlaySystemSound(shake_sound_male_id);
    [self.Sa pushsound:qiangfu];
    
}

-(void)WarningEvery450:(NSTimer *)theTimer
{
    
    //   AudioServicesPlaySystemSound(shake_sound_male_id);
    [self.Sa pushsound:xiaobinsj];
    
}
- (IBAction)StarterClick:(id)sender {
    //NSString *timerstring=[sender currentTitle];
    //NSLog(@"timerstring is %@",timerstring);
    //UILabel *myDisplay = self.timerShower; //[self timerShower];
    //NSString *currenttitle = [myDisplay text];
    //NSLog(@"current lable title is %@",currenttitle);
    //NSString *newtitle=[currenttitle stringByAppendingString:timerstring];
    //[myDisplay setText:newtitle]; //myDisplay.text = newtitle;
    //self.timerShower.txt=newtitle
    SoundListElement* sle;

    for (id key in self.ListController.ListData)
    {
        NSLog(@"key: %@ ,value: %@!!!!!!!!!",key,[self.ListController.ListData objectForKey:key]);
        sle=[self.ListController.ListData objectForKey:key];
        NSLog(@"sle.name: %@",sle.Name);
        NSLog(@"sle.interval: %ld",(long)sle.Interval);        
    }
    self.TimerShower.text=@"00:00";
    self.current_minut= 0;
    self.current_second= 0;
    if (self.isrunning == NO )
    {
        [NSTimer scheduledTimerWithTimeInterval:(1.0) target:self selector:@selector(UpdateString:) userInfo:nil repeats:YES];// show the string
        [NSTimer scheduledTimerWithTimeInterval:(30.0) target:self selector:@selector(WarningEvery30:) userInfo:nil repeats:YES];//30 second warning
        [NSTimer scheduledTimerWithTimeInterval:(60.0) target:self selector:@selector(WarningEvery60:) userInfo:nil repeats:YES];//60 second warning
        [NSTimer scheduledTimerWithTimeInterval:(120.0) target:self selector:@selector(WarningEvery120:) userInfo:nil repeats:YES];//120 second warning
        [NSTimer scheduledTimerWithTimeInterval:(450.0) target:self selector:@selector(WarningEvery450:) userInfo:nil repeats:YES];//450 second warning
        
        self.isrunning =YES;
        NSString *path_qiangfu = [[NSBundle mainBundle] pathForResource:@"qiangfu" ofType:@"mp3"];
        if (path_qiangfu) {
            //注册声音到系统
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path_qiangfu],&qiangfu);
            //        AudioServicesPlaySystemSound(shake_sound_male_id);//如果无法再下面播放，可以尝试在此播放
        }
        NSString *path_xiaobinsj = [[NSBundle mainBundle] pathForResource:@"xiaobinsj" ofType:@"mp3"];
        if (path_xiaobinsj) {
            //注册声音到系统
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path_xiaobinsj],&xiaobinsj);
            //        AudioServicesPlaySystemSound(shake_sound_male_id);//如果无法再下面播放，可以尝试在此播放
        }
        NSString *path_yeguaisx = [[NSBundle mainBundle] pathForResource:@"yeguaisx" ofType:@"mp3"];
        if (path_xiaobinsj) {
            //注册声音到系统
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path_yeguaisx],&yeguaisx);
            //        AudioServicesPlaySystemSound(shake_sound_male_id);//如果无法再下面播放，可以尝试在此播放
        }
        NSString *path_xiaobinsx = [[NSBundle mainBundle] pathForResource:@"xiaobinsx" ofType:@"mp3"];
        if (path_xiaobinsj) {
            //注册声音到系统
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path_xiaobinsx],&xiaobinsx);
            //        AudioServicesPlaySystemSound(shake_sound_male_id);//如果无法再下面播放，可以尝试在此播放
        }
        
        [UIApplication sharedApplication].idleTimerDisabled = YES;//设置不允许休眠
        
        
    }
    
    
}






@end

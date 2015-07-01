//
//  SecondViewController.m
//  Dota Timer
//
//  Created by 高志刚 on 15/6/23.
//  Copyright (c) 2015年 高志刚. All rights reserved.
//

#import "SecondViewController.h"
#import "SoundListElement.h"


@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITableView *SoundList;
@property (strong, nonatomic) NSArray *list;
@end

@implementation SecondViewController

@synthesize SoundList=_SoundList;
@synthesize list=_list;

/*
 - (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.list count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [self.list objectAtIndex:indexPath.row];
    cell.accessoryView = [[UISwitch alloc] init];
    //UISwitch *switchView = cell.accessoryView;
    ((UISwitch*)cell.accessoryView).on=YES;
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    //SoundListElement *xiaobinshuaxin = [[SoundListElement alloc] init];
    SoundListElement *xiaobinshuaxin = [[SoundListElement alloc] initWithString:@"小兵刷新"];

   //[xiaobinshuaxin setName:@"小兵刷新"];
    SoundListElement *yeguaishuaxin =[[SoundListElement alloc] initWithString:@"野怪刷新"];
    SoundListElement *qiangfu = [[SoundListElement alloc] initWithString:@"抢符"];
    SoundListElement *my4 = [[SoundListElement alloc] init];
    
    
  //  NSDictionary *myClassDict = [NSDictionary dictionaryWithObjectsAndKeys:xiaobinshuaxin, @"xiaobinshuaxin" ,nil];;
   // NSDictionary *myClassDict = [NSDictionary dictionaryWithObjectsAndKeys:xiaobinshuaxin, [xiaobinshuaxin getName],nil];;

   NSDictionary *myClassDict = [NSDictionary dictionaryWithObjectsAndKeys:xiaobinshuaxin, [xiaobinshuaxin getName],yeguaishuaxin, [yeguaishuaxin getName] ,qiangfu, [qiangfu getName],my4, @"my4", nil];
    
    NSMutableArray* array = [[NSMutableArray alloc] init];

    for (id key in myClassDict)
{
        NSLog(@"key: %@ ,value: %@",key,[myClassDict objectForKey:key]);
    [array addObject:key];

  }
    self.list = array;
    self.tabBarItem.title=@"Contact";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.list= nil;
    
}

@end

/*



7 #import <Foundation/Foundation.h>
8 #import "MyClass.h"
9
10 int main (int argc, const char * argv[]) {
    11     NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    12
    13  // 创建字典：dictionaryWithObjectsAndKeys:
    14     MyClass *my1 = [MyClass new];
    15     MyClass *my2 = [MyClass new];
    16     MyClass *my3 = [MyClass new];
    17     MyClass *my4 = [MyClass new];
    18
    19     NSDictionary *myClassDict;
    20     myClassDict = [NSDictionary dictionaryWithObjectsAndKeys:
                          21               my1, @"my1",
                          22               my2, @"my2",
                          23               my3, @"my3",
                          24               my4, @"my4", nil];
    25  // 获取值 objectForKey
    26     MyClass *sub = [myClassDict objectForKey: @"my3"];
    27  if (sub == nil) {
        28         exit(1);
        29     }
    30     [sub setFirstName:@"Elf"];
    31     [sub setLastName:@"Sundae"];
    32
    33     NSLog(@"修改数据： %@",sub);
    34
    35  // 遍历字典
    36     NSLog(@"***遍历字典myClassDict如下：");
    37  for (id key in myClassDict)
        38     {
            39         NSLog(@"key: %@ ,value: %@",key,[myClassDict objectForKey:key]);
            40     }
    41     NSLog(@"***遍历字典myClassDict结束。");
    42
    43  // MARK: ***  添加新元素  ***
    44  // NSDictionary无法添加或删除元素，可以使用NSMutableDictionary.
    45     NSMutableDictionary *myNewDict = [NSMutableDictionary dictionary];
    46  // 将原有字典添加到新字典的一对元素
    47  //[myNewDict setObject:myClassDic forKey:@"旧的不可变字典myClassDic"];
    48
    49  // 遍历添加已有数据(原字典)
    50  for (id key in myClassDict)
        51     {
            52         [myNewDict setObject: [myClassDict objectForKey:key]
                        53                   forKey:key];
            54     }
    55
    56     NSString *newkey = @"newKey";
    57     NSString *newValue = @"This is a new Value.";
    58     [myNewDict setObject:newValue forKey:newkey];
    59
    60  // 遍历myNewDict
    61     NSLog(@"***遍历字典myNewDict如下：");
    62  for (id key in myNewDict)
        63     {
            64         NSLog(@"key: %@ ,value: %@",key,[myNewDict objectForKey:key]);
            65     }
    66     NSLog(@"***遍历字典myNewDict结束。");
    67    
    68  // 删除元素
    69     [myNewDict removeObjectForKey: @"newKey"];
    70    
    71  // 遍历myNewDict
    72     NSLog(@"***遍历字典myNewDict如下：");
    73  for (id key in myNewDict)
        74     {
            75         NSLog(@"key: %@ ,value: %@",key,[myNewDict objectForKey:key]);
            76     }
    77     NSLog(@"***遍历字典myNewDict结束。");
    78    
    79     [pool drain];
    80  return 0;
    81 }
 */

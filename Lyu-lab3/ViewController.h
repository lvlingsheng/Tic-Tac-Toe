//
//  ViewController.h
//  Lyu-lab3
//
//  Created by Lingsheng Lyu on 15/9/23.
//  Copyright (c) 2015 Lingsheng Lyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIActionSheetDelegate>
{
    UIActionSheet *modechoose;
    UIActionSheet *orderchoose;
    UIActionSheet *againchoose;
    UIActionSheet *equalgamechoose;
    UIActionSheet *wingamechoose;
    UIActionSheet *losegamechoose;
    UIActionSheet *Owingamechoose;
    UIActionSheet *Xwingamechoose;
    NSMutableArray *currentstate;
    NSMutableArray *state;
    NSString *player;
    NSString *gamemode;
    NSString *playeralpha;
    int order;
    int playernumber;
    BOOL win;
    NSString *stateinfo;
}


@property (weak, nonatomic) IBOutlet UIButton *location1;
@property (weak, nonatomic) IBOutlet UIButton *location2;
@property (weak, nonatomic) IBOutlet UIButton *location3;
@property (weak, nonatomic) IBOutlet UIButton *location4;
@property (weak, nonatomic) IBOutlet UIButton *location5;
@property (weak, nonatomic) IBOutlet UIButton *location6;
@property (weak, nonatomic) IBOutlet UIButton *location7;
@property (weak, nonatomic) IBOutlet UIButton *location8;
@property (weak, nonatomic) IBOutlet UIButton *location9;
@property (weak, nonatomic) IBOutlet UIButton *newgame;
@property(nonatomic, copy) NSString *message;

@end


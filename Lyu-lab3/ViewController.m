//
//  ViewController.m
//  Lyu-lab3
//
//  Created by Lingsheng Lyu on 15/9/23.
//  Copyright (c) 2015 Lingsheng Lyu. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end





@implementation ViewController

enum state {
    O = 1,
    X,
    E,
};


- (void)viewDidLoad {
    [super viewDidLoad];
    currentstate=[[NSMutableArray alloc] initWithObjects: @" ",@" ",@" ",@" ",@" ",@" ",@" ",@" ",@" ", nil];
    
    [self choosegamemode];
    
    //[self box];

}


- (void) choosegamemode{
     modechoose = [[UIActionSheet alloc]
                                  initWithTitle:@"Choose game mode"
                                  delegate:self
                                  cancelButtonTitle:nil
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:@"one player", @"multiplayer", nil];
    modechoose.tag=1;
    [modechoose showInView:self.view];
    
}

- (void) playagain{
    againchoose = [[UIActionSheet alloc]
                   initWithTitle:@"Start New game?"
                  delegate:self
                  cancelButtonTitle:nil
                  destructiveButtonTitle:nil
                  otherButtonTitles:@"Play again!",@"Cancel",nil];
    againchoose.tag=3;
    [againchoose showInView:self.view];
    
}

- (void) equalgame{
    equalgamechoose = [[UIActionSheet alloc]
                   initWithTitle:@"No one wins"
                   delegate:self
                   cancelButtonTitle:nil
                   destructiveButtonTitle:nil
                   otherButtonTitles:@"Play again!",@"Cancel",nil];
    equalgamechoose.tag=4;
    [equalgamechoose showInView:self.view];
    
}

- (void) Owingame{
    Owingamechoose = [[UIActionSheet alloc]
                     initWithTitle:@"O player win the game"
                     delegate:self
                     cancelButtonTitle:nil
                     destructiveButtonTitle:nil
                     otherButtonTitles:@"Play again!",@"Cancel",nil];
    Owingamechoose.tag=7;
    [Owingamechoose showInView:self.view];
    
}

- (void) Xwingame{
    Xwingamechoose = [[UIActionSheet alloc]
                      initWithTitle:@"X player win the game"
                      delegate:self
                      cancelButtonTitle:nil
                      destructiveButtonTitle:nil
                      otherButtonTitles:@"Play again!",@"Cancel",nil];
    Xwingamechoose.tag=8;
    [Xwingamechoose showInView:self.view];
    
}


- (void) wingame{
    wingamechoose = [[UIActionSheet alloc]
                       initWithTitle:@"You win the game"
                       delegate:self
                       cancelButtonTitle:nil
                       destructiveButtonTitle:nil
                       otherButtonTitles:@"Play again!",@"Cancel",nil];
    wingamechoose.tag=5;
    [wingamechoose showInView:self.view];
    
}

- (void) losegame{
    losegamechoose = [[UIActionSheet alloc]
                     initWithTitle:@"You lose the game"
                     delegate:self
                     cancelButtonTitle:nil
                     destructiveButtonTitle:nil
                     otherButtonTitles:@"Play again!",@"Cancel",nil];
    losegamechoose.tag=6;
    [losegamechoose showInView:self.view];
    
}

- (void) choosefirst{
    orderchoose= [[UIActionSheet alloc]
                  initWithTitle:@"You wanna First or Second?"
                  delegate:self
                  cancelButtonTitle:nil
                  destructiveButtonTitle:nil
                  otherButtonTitles:@"I wanna first", @"I wanna second",@"Random",nil];
    [orderchoose showInView:self.view];
    orderchoose.tag=2;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- ( void ) changeTurn
{
    if ( [self->player isEqual: @"X"] )
    {
        self->player = @"O";
    }
    else
    {
        self->player = @"X";
    }
    
    
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(actionSheet.tag==2){
        if(buttonIndex==0){
            player=@"X";
            playeralpha=@"X";
        }else if(actionSheet.tag==1){
            player=@"O";
            playeralpha=@"O";
            [self smartgame];
        }else{
            int first = arc4random_uniform(2);
            if(first==0){
                player=@"X";
                playeralpha=@"X";
            }
            if(first==1){
                player=@"O";
                playeralpha=@"O";
                [self smartgame];
            }
        }
    }
    
    
    if(actionSheet.tag==1){
        if(buttonIndex==0){
            gamemode=@"one";
            [self choosefirst];
        }else{
            gamemode=@"two";
            player=@"X";
            
        }
    }
    if(actionSheet.tag==3 || actionSheet.tag==4 || actionSheet.tag==5 || actionSheet.tag==6 || actionSheet.tag ==7 || actionSheet.tag==8){
        if(buttonIndex==0){
            currentstate=[[NSMutableArray alloc] initWithObjects: @" ",@" ",@" ",@" ",@" ",@" ",@" ",@" ",@" ", nil];
            [[self location1] setTitle:@" " forState:UIControlStateNormal];
            [[self location1] setBackgroundColor:self.view.tintColor];
            [[self location2] setTitle:@" " forState:UIControlStateNormal];
            [[self location2] setBackgroundColor:self.view.tintColor];
            [[self location3] setTitle:@" " forState:UIControlStateNormal];
            [[self location3] setBackgroundColor:self.view.tintColor];
            [[self location4] setTitle:@" " forState:UIControlStateNormal];
            [[self location4] setBackgroundColor:self.view.tintColor];
            [[self location5] setTitle:@" " forState:UIControlStateNormal];
            [[self location5] setBackgroundColor:self.view.tintColor];
            [[self location6] setTitle:@" " forState:UIControlStateNormal];
            [[self location6] setBackgroundColor:self.view.tintColor];
            [[self location7] setTitle:@" " forState:UIControlStateNormal];
            [[self location7] setBackgroundColor:self.view.tintColor];
            [[self location8] setTitle:@" " forState:UIControlStateNormal];
            [[self location8] setBackgroundColor:self.view.tintColor];
            [[self location9] setTitle:@" " forState:UIControlStateNormal];
            [[self location9] setBackgroundColor:self.view.tintColor];
            win=0;
            [self choosegamemode];
        }else{
            NSLog(@"playagain");
        }
    }
}

- (void) smartgame{
    if([player isEqual:@"O"]){
        [self sysplay];
    }
}

- (void) sysplay{
    win=NO;
    order = arc4random_uniform(9);
    if([[currentstate objectAtIndex:4] isEqual:@" "]){
        [self loc5change:nil];
        return;
    }
    
    for(int i=0;i<=8;i++){
        if([[currentstate objectAtIndex:i] isEqual:@" "]){
            [currentstate removeObjectAtIndex: i];
            [currentstate insertObject: player atIndex: i];
            if([self judge]){
                win=NO;
                [currentstate removeObjectAtIndex: i];
                [currentstate insertObject: @" " atIndex: i];
                if(i==0){
                    [self loc1change:nil];
                    return;
                }
                if(i==1){
                    [self loc2change:nil];
                    return;
                }
                if(i==2){
                    [self loc3change:nil];
                    return;
                }
                if(i==3){
                    [self loc4change:nil];
                    return;
                }
                if(i==4){
                    [self loc5change:nil];
                    return;
                }
                if(i==5){
                    [self loc6change:nil];
                    return;
                }
                if(i==6){
                    [self loc7change:nil];
                    return;
                }
                if(i==7){
                    [self loc8change:nil];
                    return;
                }
                if(i==8){
                    [self loc9change:nil];
                    return;
                }
                win=NO;
                return;
            }else{
                [currentstate removeObjectAtIndex: i];
                [currentstate insertObject: @" " atIndex: i];
            }
        }
    }

    
    for(int i=0;i<=8;i++){
        if([[currentstate objectAtIndex:i] isEqual:@" "]){
            [self changeTurn];
            [currentstate removeObjectAtIndex: i];
            [currentstate insertObject: player atIndex: i];
            
            if([self judge]){
                win=NO;
                [self changeTurn];
                [currentstate removeObjectAtIndex: i];
                [currentstate insertObject: @" " atIndex: i];
                if(i==0){
                    [self loc1change:nil];
                    return;
                }
                if(i==1){
                    [self loc2change:nil];
                    return;
                }
                if(i==2){
                    [self loc3change:nil];
                    return;
                }
                if(i==3){
                    [self loc4change:nil];
                    return;
                }
                if(i==4){
                    [self loc5change:nil];
                    return;
                }
                if(i==5){
                    [self loc6change:nil];
                    return;
                }
                if(i==6){
                    [self loc7change:nil];
                    return;
                }
                if(i==7){
                    [self loc8change:nil];
                    return;
                }
                if(i==8){
                    [self loc9change:nil];
                    return;
                }
                win=NO;
                return;
            }else{
                [self changeTurn];
                [currentstate removeObjectAtIndex: i];
                [currentstate insertObject: @" " atIndex: i];
            }
        }
    }
    
    
    
    
    

    
        
    while([[currentstate objectAtIndex:order] isEqual:@" "]==false){
        order = arc4random_uniform(9);
    }
                if(order==0){
                    [self loc1change:nil];
                }
                if(order==1){
                    [self loc2change:nil];
                }
                if(order==2){
                    [self loc3change:nil];
                }
                if(order==3){
                    [self loc4change:nil];
                }
                if(order==4){
                    [self loc5change:nil];
                }
                if(order==5){
                    [self loc6change:nil];
                }
                if(order==6){
                    [self loc7change:nil];
                }
                if(order==7){
                    [self loc8change:nil];
                }
                if(order==8){
                    [self loc9change:nil];
                }
        return;

            
    
        
    
}


- (IBAction)loc1change:(id)sender {
    if ( [[currentstate objectAtIndex: 0] isEqual: @" "] )
    {
        [currentstate removeObjectAtIndex: 0];
        [currentstate insertObject: player atIndex: 0];
        [self updatecurrentstate];
        [self changeTurn];
        if([gamemode isEqual:@"one"] && [player isEqual:@"O"] && [currentstate containsObject:@" "] && !win){
            [self sysplay];
        }
    }
}

- (IBAction)loc2change:(id)sender {
    if ( [[currentstate objectAtIndex: 1] isEqual: @" "] )
    {
        [currentstate removeObjectAtIndex: 1];
        [currentstate insertObject: player atIndex: 1];
        [self updatecurrentstate];
        [self changeTurn];
        if([gamemode isEqual:@"one"] && [player isEqual:@"O"] && [currentstate containsObject:@" "] && !win){
            [self sysplay];
        }
    }
    
}


- (IBAction)loc3change:(id)sender {
    if ( [[currentstate objectAtIndex: 2] isEqual: @" "] )
    {
        [currentstate removeObjectAtIndex: 2];
        [currentstate insertObject: player atIndex: 2];
        [self updatecurrentstate];
        [self changeTurn];
        if([gamemode isEqual:@"one"] && [player isEqual:@"O"] && [currentstate containsObject:@" "] && !win){
            [self sysplay];
        }
    }
}

- (IBAction)loc4change:(id)sender {
    if ( [[currentstate objectAtIndex: 3] isEqual: @" "] )
    {
        [currentstate removeObjectAtIndex: 3];
        [currentstate insertObject: player atIndex: 3];
        [self updatecurrentstate];
        [self changeTurn];
        if([gamemode isEqual:@"one"] && [player isEqual:@"O"] && [currentstate containsObject:@" "] && !win){
            [self sysplay];
        }
    }
}

- (IBAction)loc5change:(id)sender {
    if ( [[currentstate objectAtIndex: 4] isEqual: @" "] )
    {
        [currentstate removeObjectAtIndex: 4];
        [currentstate insertObject: player atIndex: 4];
        [self updatecurrentstate];
        [self changeTurn];
        if([gamemode isEqual:@"one"] && [player isEqual:@"O"] && [currentstate containsObject:@" "] && !win){
            [self sysplay];
        }
    }
}

- (IBAction)loc6change:(id)sender {
    if ( [[currentstate objectAtIndex: 5] isEqual: @" "] )
    {
        [currentstate removeObjectAtIndex: 5];
        [currentstate insertObject: player atIndex: 5];
        [self updatecurrentstate];
        [self changeTurn];
        if([gamemode isEqual:@"one"] && [player isEqual:@"O"] && [currentstate containsObject:@" "] && !win){
            [self sysplay];
        }
    }
}

- (IBAction)loc7change:(id)sender {
    if ( [[currentstate objectAtIndex: 6] isEqual: @" "] )
    {
        [currentstate removeObjectAtIndex: 6];
        [currentstate insertObject: player atIndex: 6];
        [self updatecurrentstate];
        [self changeTurn];
        if([gamemode isEqual:@"one"] && [player isEqual:@"O"] && [currentstate containsObject:@" "] && !win){
            [self sysplay];
        }
    }
}
- (IBAction)loc8change:(id)sender {
    if ( [[currentstate objectAtIndex: 7] isEqual: @" "] )
    {
        [currentstate removeObjectAtIndex: 7];
        [currentstate insertObject: player atIndex: 7];
        [self updatecurrentstate];
        [self changeTurn];
        if([gamemode isEqual:@"one"] && [player isEqual:@"O"] && [currentstate containsObject:@" "] && !win){
            [self sysplay];
        }
    }
    
}

- (IBAction)loc9change:(id)sender {
    if ( [[currentstate objectAtIndex: 8] isEqual: @" "] )
    {
        [currentstate removeObjectAtIndex: 8];
        [currentstate insertObject: player atIndex: 8];
        [self updatecurrentstate];
        [self changeTurn];
        if([gamemode isEqual:@"one"] && [player isEqual:@"O"] && [currentstate containsObject:@" "] && !win){
            [self sysplay];
        }
    }
    
}
- (IBAction)startnewgame:(id)sender {
    [self playagain];
}

- ( BOOL ) judge
{
    if ( !win )
    {
        if ( [self checkFirst: [currentstate objectAtIndex: 0] second: [currentstate objectAtIndex: 1] third: [currentstate objectAtIndex: 2]] )
        {
            win = TRUE;
            return TRUE;
        }
        else if ( [self checkFirst: [currentstate objectAtIndex: 3] second: [currentstate objectAtIndex: 4] third: [currentstate objectAtIndex: 5]] )
        {
            win = TRUE;
            return TRUE;
        }
        else if ( [self checkFirst: [currentstate objectAtIndex: 6] second: [currentstate objectAtIndex: 7] third: [currentstate objectAtIndex: 8]] )
        {
            win = TRUE;
            return TRUE;
        }
        else if ( [self checkFirst: [currentstate objectAtIndex: 0] second: [currentstate objectAtIndex: 3] third: [currentstate objectAtIndex: 6]] )
        {
            win = TRUE;
            return TRUE;
        }
        else if ( [self checkFirst: [currentstate objectAtIndex: 1] second: [currentstate objectAtIndex: 4] third: [currentstate objectAtIndex: 7]] )
        {
            win = TRUE;
            return TRUE;
        }
        else if ( [self checkFirst: [currentstate objectAtIndex: 2] second: [currentstate objectAtIndex: 5] third: [currentstate objectAtIndex: 8]] )
        {
            win = TRUE;
            return TRUE;
        }
        else if ( [self checkFirst: [currentstate objectAtIndex: 0] second: [currentstate objectAtIndex: 4] third: [currentstate objectAtIndex: 8]] )
        {
            win = TRUE;
            return TRUE;
        }
        else if ( [self checkFirst: [currentstate objectAtIndex: 2] second: [currentstate objectAtIndex: 4] third: [currentstate objectAtIndex: 6]] )
        {
            win = TRUE;
            return TRUE;
        }
        else
        {
            return FALSE;
        }
        
        
    }
    else
    {
        return FALSE;
    }
}

- ( BOOL ) checkFirst: ( NSString * ) first second: ( NSString * ) second third: ( NSString * ) third;
{
    return ( [player isEqual: first] && [player isEqual: second] && [player isEqual: third] );
}

- (void) updatecurrentstate
{
    [[self location1] setTitle: [currentstate objectAtIndex: 0] forState: UIControlStateNormal ];
    if([[currentstate objectAtIndex:0] isEqual:@"X"]){
        [[self location1] setBackgroundColor:[UIColor blackColor]];
    }else if([[currentstate objectAtIndex:0] isEqual:@"O"]){
        [[self location1] setBackgroundColor:[UIColor redColor]];
    }
    self.location1.showsTouchWhenHighlighted=YES;
    
    
    
    [[self location2] setTitle: [currentstate objectAtIndex: 1] forState: UIControlStateNormal ];
    if([[currentstate objectAtIndex:1] isEqual:@"X"]){
        [[self location2] setBackgroundColor:[UIColor blackColor]];
    }else if([[currentstate objectAtIndex:1] isEqual:@"O"]){
        [[self location2] setBackgroundColor:[UIColor redColor]];
    }
    self.location2.showsTouchWhenHighlighted=YES;
    
    
    
    [[self location3] setTitle: [currentstate objectAtIndex: 2] forState: UIControlStateNormal ];
    if([[currentstate objectAtIndex:2] isEqual:@"X"]){
        [[self location3] setBackgroundColor:[UIColor blackColor]];
    }else if([[currentstate objectAtIndex:2] isEqual:@"O"]){
        [[self location3] setBackgroundColor:[UIColor redColor]];
    }
    self.location3.showsTouchWhenHighlighted=YES;
    
    
    
    [[self location4] setTitle: [currentstate objectAtIndex: 3] forState: UIControlStateNormal ];
    if([[currentstate objectAtIndex:3] isEqual:@"X"]){
        [[self location4] setBackgroundColor:[UIColor blackColor]];
    }else if([[currentstate objectAtIndex:3] isEqual:@"O"]){
        [[self location4] setBackgroundColor:[UIColor redColor]];
    }
    self.location4.showsTouchWhenHighlighted=YES;
    
    
    
    [[self location5] setTitle: [currentstate objectAtIndex: 4] forState: UIControlStateNormal ];
    if([[currentstate objectAtIndex:4] isEqual:@"X"]){
        [[self location5] setBackgroundColor:[UIColor blackColor]];
    }else if([[currentstate objectAtIndex:4] isEqual:@"O"]){
        [[self location5] setBackgroundColor:[UIColor redColor]];
    }
    self.location5.showsTouchWhenHighlighted=YES;
    
    
    
    [[self location6] setTitle: [currentstate objectAtIndex: 5] forState: UIControlStateNormal ];
    if([[currentstate objectAtIndex:5] isEqual:@"X"]){
        [[self location6] setBackgroundColor:[UIColor blackColor]];
    }else if([[currentstate objectAtIndex:5] isEqual:@"O"]){
        [[self location6] setBackgroundColor:[UIColor redColor]];
    }
    self.location6.showsTouchWhenHighlighted=YES;
    
    
    
    [[self location7] setTitle: [currentstate objectAtIndex: 6] forState: UIControlStateNormal ];
    if([[currentstate objectAtIndex:6] isEqual:@"X"]){
        [[self location7] setBackgroundColor:[UIColor blackColor]];
    }else if([[currentstate objectAtIndex:6] isEqual:@"O"]){
        [[self location7] setBackgroundColor:[UIColor redColor]];
    }
    self.location7.showsTouchWhenHighlighted=YES;
    
    
    
    [[self location8] setTitle: [currentstate objectAtIndex: 7] forState: UIControlStateNormal ];
    if([[currentstate objectAtIndex:7] isEqual:@"X"]){
        [[self location8] setBackgroundColor:[UIColor blackColor]];
    }else if([[currentstate objectAtIndex:7] isEqual:@"O"]){
        [[self location8] setBackgroundColor:[UIColor redColor]];
    }
    self.location8.showsTouchWhenHighlighted=YES;
    
    
    
    [[self location9] setTitle: [currentstate objectAtIndex: 8] forState: UIControlStateNormal ];
    if([[currentstate objectAtIndex:8] isEqual:@"X"]){
        [[self location9] setBackgroundColor:[UIColor blackColor]];
    }else if([[currentstate objectAtIndex:8] isEqual:@"O"]){
        [[self location9] setBackgroundColor:[UIColor redColor]];
    }
    self.location9.showsTouchWhenHighlighted=YES;
    
    if ( [self judge] )
    {
        if([player isEqual:@"X"] && [gamemode isEqual:@"two"]){
            [self Xwingame];
        }
        if([player isEqual:@"O"] && [gamemode isEqual:@"two"]){
            [self Owingame];
        }
        
        
        if([player isEqual:playeralpha]  && [gamemode isEqual:@"one"]){
            [self wingame];
        }else if(![player isEqual:playeralpha]  && [gamemode isEqual:@"one"]){
            [self losegame];
        }
    }else if(![self judge] && ![currentstate containsObject:@" "]){
        [self equalgame];
        return;
    }
}
@end



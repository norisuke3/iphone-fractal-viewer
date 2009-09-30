//
//  TouchSensitiveView.m
//  FractalViewer
//
//  Created by norisuke3@gmail.com on 09/09/18.
//  Copyright 2009 FireDictionary.com. All rights reserved.
//

#import "TouchSensitiveView.h"

@implementation TouchSensitiveView

@synthesize dataSource;

- (void) startTimer{
    if (!timer) {
        timer = [[NSTimer scheduledTimerWithTimeInterval:1.0f target:self 
                                                selector:@selector(timerFired:)
                                                userInfo:nil
                                                 repeats:NO] retain];
    }
}

- (void) stopTimer{
    [timer invalidate];
    [timer release];
    timer = nil;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self startTimer];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [self stopTimer];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [self stopTimer];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    [self stopTimer];
}

- (void) timerFired:(NSTimer*)theTimer{
    UIActionSheet* menu = [[UIActionSheet alloc]
                           initWithTitle:@"Menu"
                           delegate:dataSource
                           cancelButtonTitle:@"Cancel"
                           destructiveButtonTitle:nil
                           otherButtonTitles:@"Back to Main Menu", @"Save to Photo Album", nil
                           ];
    
    [menu showInView:dataSource.view];
}

-(void)resetRect{
    self.transform = CGAffineTransformMakeScale(1.0, 1.0);
    
    CGRect frame = self.frame;
    frame.origin = CGPointMake(0.0, 20.0);
    [self setFrame:frame];
}

-(void)dealloc{
    [timer release];
    [super dealloc];
}

@end

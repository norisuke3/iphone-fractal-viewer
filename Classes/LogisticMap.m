//
//  LogisticMap.m
//  DrawSample
//
//  Created by Hamamoto Noriaki on 09/09/22.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LogisticMap.h"

@implementation LogisticMap


- (id)init{
    if (self = [super init]) {
        outline = CGRectMake(0.0, 3.0, 1.0, 1.0);
        rect = CGRectMake(-1.0, 2.0, 3.0, 3.0);
        scale = 1.0 / 3.0;
        initialLineWidth = 0.0001;
        dotCount = 500;
        ignoreDotCount = 50;
    }
    
    return self;
}

- (void)draw{
    [super draw];
    
    for(float x = rect.origin.y; x <= rect.origin.y + rect.size.height ; x += rect.size.height / (resolution.height)){
        float y = 0.5;
        for(int i = 0 ; i < dotCount; i++){
            y = x * y * ( 1 - y );
            if(i > ignoreDotCount &&
               y > rect.origin.x && 
               y < rect.origin.x + rect.size.width && 
               y > outline.origin.x &&
               y < outline.origin.x + outline.size.width
            ){
                [self dot:CGPointMake(y, x)];
            }
        }
    }
}

@end

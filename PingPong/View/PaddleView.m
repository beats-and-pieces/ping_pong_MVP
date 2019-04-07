//
//  PaddleView.m
//  PingPong
//
//  Created by Anton Kuznetsov on 07/04/2019.
//  Copyright © 2019 Anton Kuznetsov. All rights reserved.
//

#import "PaddleView.h"

@implementation PaddleView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (id)init
{
    if ( self = [super init] )
    {
        self.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 30.0, 0, 60.0, 5.0);
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

- (id)initWithPosition:(CGFloat)positionY
{
    if ( self = [super init] )
    {
        self.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 30.0, positionY, 60.0, 5.0);
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

@end

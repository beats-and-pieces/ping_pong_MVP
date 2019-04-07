//
//  BallView.m
//  PingPong
//
//  Created by Anton Kuznetsov on 07/04/2019.
//  Copyright © 2019 Anton Kuznetsov. All rights reserved.
//

#import "BallView.h"

@implementation BallView



/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (id)init
{
    if ( self = [super initWithFrame:CGRectMake(0.0, 0.0, 30.0, 30.0)] )
    {
        self.backgroundColor = [UIColor cyanColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = self.frame.size.width / 2;
    }
    return self;
}

- (id)initWithRadius:(CGFloat)radius
{
    if ( self = [super initWithFrame:CGRectMake(0.0, 0.0, radius * 2, radius * 2)] )
    {
        self.backgroundColor = [UIColor cyanColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = self.frame.size.width / 2;
    }
    return self;
}

- (id)initWithDiameter:(CGFloat)diameter
{
    if ( self = [super initWithFrame:CGRectMake(0.0, 0.0, diameter, diameter)] )
    {
        self.backgroundColor = [UIColor cyanColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = self.frame.size.width / 2;
    }
    return self;
}

@end

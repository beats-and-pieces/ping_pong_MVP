//
//  ViewController.m
//  PingPong
//
//  Created by Anton Kuznetsov on 07/04/2019.
//  Copyright © 2019 Anton Kuznetsov. All rights reserved.
//

#import "ViewController.h"
#import "PaddleView.h"
#import "BallView.h"

@interface ViewController ()

@property (strong, nonatomic) PaddleView *bottomPaddle;
@property (strong, nonatomic) PaddleView *topPaddle;
@property (strong, nonatomic) UIView *ball;
@property (assign, nonatomic) CGFloat dX;
@property (assign, nonatomic) CGFloat dY;
@property (assign, nonatomic) CGFloat ballRadius;
@property (assign, nonatomic) CGFloat ballDiameter;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initGameField];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)initGameField
{   self.ballRadius = 15.0f;
    self.ballDiameter = 30.0f;
    self.view.backgroundColor = [UIColor blackColor];
    
    self.topPaddle = [[PaddleView alloc] initWithPosition:0];
    self.bottomPaddle = [[PaddleView alloc] initWithPosition:self.view.frame.size.height - 5.0];
    self.ball = [[BallView alloc] initWithDiameter:self.ballDiameter];
    
    [self.view addSubview:self.topPaddle];
    [self.view addSubview:self.bottomPaddle];
    [self.view addSubview:self.ball];
    [self startGame];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint currentPoint = [touch locationInView:self.view];
    
    // Простейшая проверка, чтобы bottomPaddle не уезжал за границы экрана
    if (currentPoint.x >= self.view.frame.size.width - self.ballDiameter)
    {
        self.bottomPaddle.center = CGPointMake(self.view.frame.size.width - self.ballDiameter, self.view.frame.size.height - 2.5);
    }
    else if (currentPoint.x <= self.ballRadius * 2)
    {
        self.bottomPaddle.center = CGPointMake(self.ballDiameter, self.view.frame.size.height - 2.5);
    }
    else
    {
        self.bottomPaddle.center = CGPointMake(currentPoint.x, self.view.frame.size.height - 2.5);
    }
}

- (void)startGame
{
    self.ball.center = self.view.center;
    self.dX = self.dY = 1.0;
//    self.currentSpeed = 0.005f; // По умолчанию, скорость нормальная
    
   // NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(countTime) object:nil];
//    [thread start];
    
    NSTimer *gameTimer = [NSTimer scheduledTimerWithTimeInterval:0.005f target:self selector:@selector(moveBall) userInfo:nil repeats:YES];
}

- (void)moveBall
{
    // Простейшая проверка, чтобы topPaddle не уезжал за границы экрана
    if (self.ball.center.x >= self.view.frame.size.width - 30.0)
    {
        self.topPaddle.center = CGPointMake(self.view.frame.size.width - 30.0, 2.5);
    }
    else if (self.ball.center.x <= 30.0)
    {
        self.topPaddle.center = CGPointMake(30.0, 2.5);
    }
    else
    {
        self.topPaddle.center = CGPointMake(self.ball.center.x, 2.5);
    }

    [self bounceBallIfNeeded];
    self.ball.center = CGPointMake(self.ball.center.x + self.dX, self.ball.center.y + self.dY);
    
}

- (void)bounceBallIfNeeded
{
    if (CGRectIntersectsRect(self.ball.frame, self.topPaddle.frame) || CGRectIntersectsRect(self.ball.frame, self.bottomPaddle.frame))
    {
        self.dY *= -1;
    }
    
    if ((self.ball.frame.origin.x + self.ball.frame.size.width > self.view.frame.size.width) ||
        (self.ball.frame.origin.x < 0))
    {
        self.dX *= -1;
    }
}

@end

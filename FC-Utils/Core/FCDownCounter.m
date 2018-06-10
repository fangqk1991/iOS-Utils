//
//  FCDownCounter.m
//  FC-Utils
//
//  Created by fang on 2018/6/9.
//

#import "FCDownCounter.h"

@interface FCDownCounter()

@property (nonatomic) NSUInteger totalSeconds;
@property (nonatomic) CGFloat step;

@property (atomic) BOOL running;
@property (atomic) CGFloat remain;

@end

@implementation FCDownCounter

- (instancetype)init
{
    if(self = [super init])
    {
        _running = NO;
        _totalSeconds = 0;
        _step = 1;
    }
    return self;
}

- (void)setTotalSeconds:(NSUInteger)totalSeconds
{
    [self setTotalSeconds:totalSeconds step:1];
}

- (void)setTotalSeconds:(NSUInteger)totalSeconds step:(CGFloat)step
{
    _running = NO;
    _totalSeconds = totalSeconds;
    _remain = totalSeconds;
    _step = step;
}

- (void)reset
{
    _running = NO;
    _remain = _totalSeconds;
}

- (void)startWithStepCallback:(void(^)(CGFloat remain))stepCallback doneCallback:(void(^)(void))doneCallback
{
    if(_running)
    {
        return ;
    }
    
    _running = YES;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(timer,dispatch_walltime(NULL, 0), self.step * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(timer, ^{
        
        if(!self.running)
        {
            dispatch_source_cancel(timer);
            return ;
        }
        
        if(self.remain > 0)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                if(stepCallback)
                {
                    stepCallback(self.remain);
                }
                
                self.remain -= self.step;
            });
        }
        else
        {
            dispatch_source_cancel(timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                if(doneCallback)
                {
                    doneCallback();
                }
                [self reset];
            });
        }
    });
    dispatch_resume(timer);
}

@end

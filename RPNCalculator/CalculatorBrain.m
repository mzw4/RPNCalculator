//
//  CalculatorBrain.m
//  RPNCalculator
//
//  Created by Mike Wang on 8/12/14.
//  Copyright (c) 2014 Mike Wang. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;

- (NSMutableArray *)operandStack {
    if(_operandStack == nil) {
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

- (void)pushOperand:(double)operand {
    if(self.operandStack)
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double)popOperand {
    NSNumber *operand = [self.operandStack lastObject];
    if(operand) [self.operandStack removeLastObject];
    return [operand doubleValue];
}

- (double)performOperation:(NSString *)operation {
    double result = 0;
    if([operation isEqualToString:@"+"]) {
        result = [self popOperand] + [self popOperand];
    } else if([operation isEqualToString:@"*"]) {
        result = [self popOperand] * [self popOperand];
    } else if([operation isEqualToString:@"-"]) {
        result = [self popOperand] - [self popOperand];
    } else if([operation isEqualToString:@"/"]) {
        // Doesn't work
        result = [self popOperand] / [self popOperand];
    }
    [self.operandStack addObject:[NSNumber numberWithDouble:result]];
    return result;
}

@end

//
//  CalculatorBrain.m
//  RPNCalculator
//
//  Created by Mike Wang on 8/12/14.
//  Copyright (c) 2014 Mike Wang. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *programStack;
@end

@implementation CalculatorBrain

@synthesize programStack = _programStack;

- (NSMutableArray *)programStack {
    if(_programStack == nil) {
        _programStack = [[NSMutableArray alloc] init];
    }
    return _programStack;
}

- (void)pushOperand:(double)operand {
    if(self.programStack)
    [self.programStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double)performOperation:(NSString *)operation {
    NSLog(@"OMG PERFORMING");
    [self.programStack addObject:operation];
    return [CalculatorBrain runProgram:self.program];
}

+ (double)popOperand:(NSMutableArray *)stack {
    double result = 0;
    id topOfStack = [stack lastObject];
    if(topOfStack) [stack removeLastObject];
    
    if([topOfStack isKindOfClass:[NSNumber class]]) {
        result = [topOfStack doubleValue];
    } else if([topOfStack isKindOfClass:[NSString class]]) {
        NSString *operation = topOfStack;
        if([operation isEqualToString:@"+"]) {
            result = [self popOperand:stack] + [self popOperand:stack];
        } else if([operation isEqualToString:@"*"]) {
            result = [self popOperand:stack] * [self popOperand:stack];
        } else if([operation isEqualToString:@"-"]) {
            result = [self popOperand:stack] - [self popOperand:stack];
        } else if([operation isEqualToString:@"/"]) {
            double divisor = [self popOperand:stack];
            if(divisor) result = [self popOperand:stack] / divisor;
        }
    }
    
    return result;
}

- (id)program {
    return [self.programStack copy];
}

+ (double)runProgram:(id)program {
    NSMutableArray *stack;
    if([program isKindOfClass:[NSArray class]]) {
        stack = [program mutableCopy];
    }
    return [self popOperand:stack];
}

+ (NSString *)descriptionOfProgram:(id)program {
     // blah blah
    return nil;
}

@end

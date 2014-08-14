//
//  CalculatorBrain.h
//  RPNCalculator
//
//  Created by Mike Wang on 8/12/14.
//  Copyright (c) 2014 Mike Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;

@property (readonly) id program;

+ (double)runProgram:(id)program;
+ (NSString *)descriptionOfProgram:(id)program;

@end

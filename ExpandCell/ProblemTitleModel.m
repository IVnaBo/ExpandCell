//
//  ProblemTitleModel.m
//  ExpandCell
//
//  Created by BO on 17/2/22.
//  Copyright © 2017年 BO. All rights reserved.
//

#import "ProblemTitleModel.h"

@implementation ProblemTitleModel

-(instancetype)initWithDic:(NSDictionary *)dic
{
    self.title = dic[@"title"];
    
    NSArray * inforDic = dic[@"infor"];
    NSDictionary * itemDic  = inforDic.firstObject;
    NSString * answer = [NSString stringWithFormat:@"%@",itemDic[@"answer"]];
    self.answers = answer;
    
    return self;
}

@end

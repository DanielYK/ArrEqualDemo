//
//  ViewController.m
//  ArrEqualTest
//
//  Created by Daniel Yao on 17/1/9.
//  Copyright © 2017年 Daniel Yao. All rights reserved.
//

#import "ViewController.h"
#import "ClassOne.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //普通字符串类型数组
    [self arrTest];
    [self arrTest2];
    [self arrTest3];
    
    //对象型数组
    [self arrTest4];
    
    //判断数组相等
    [self judgeArrEqual];
}
- (void)arrTest{
    NSArray *arr1 = [NSArray arrayWithObjects:@"5",@"6",@"1",@"3",@"2",@"4", nil];
    
    NSArray *arr2 = [NSArray arrayWithObjects:@"5",@"6",@"1",@"3",@"2",@"4", nil];
    if ([arr2 containsObject:arr1]){
        NSLog(@"相等");
    }else{
        NSLog(@"不相等");
    }
    if ([arr2 containsObject:@"5"]){
        NSLog(@"包含");
    }else{
        NSLog(@"没有这个object");
    }
    
    
    NSArray *arr3 = [NSArray arrayWithObjects:@"5",@"6",@"1",@"3",@"2",@"4", nil];
    NSArray *arr33 = arr3;
    if (arr33 == arr3) {
        NSLog(@"arr33两者相等");
    }else{
        NSLog(@"arr33两者不相等");
    }
    if (arr1 == arr3) {
        NSLog(@"数组1 == 数组3");
    }else{
        NSLog(@"数组1 != 数组3");
    }
    
    
    NSArray *arr4 = [NSArray arrayWithObjects:@"6",@"5",@"1",@"3",@"2",@"4", nil];
    NSArray *arr44 = [NSArray arrayWithObjects:@"5",@"6",@"1",@"3",@"2",@"4", nil];
    if ([arr1 isEqual: arr4]) {
        NSLog(@"isEqualarr1 == arr4");
    }else{
        NSLog(@"isEqualarr1 != arr4");
    }
    if ([arr1 isEqual: arr44]) {
        NSLog(@"isEqualarr1 == arr44");
    }else{
        NSLog(@"isEqualarr1 != arr44");
    }
    
    if ([arr1 isEqualToArray: arr4]) {
        NSLog(@"数组1 == 数组4");
    }else{
        NSLog(@"数组1 != 数组4");
    }
    if ([arr1 isEqualToArray: arr44]) {
        NSLog(@"数组1 == arr44");
    }else{
        NSLog(@"数组1 != arr44");
    }
    

}
//已选，未选
- (void)arrTest2{

    NSArray *arr1 = [NSArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G", nil];
    NSArray *arr2 = [NSArray arrayWithObjects:@"B",@"C",@"D",@"E",nil];//用户选择

    //用户选择
    NSArray *selectTure = [arr1 filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF in %@", arr2]];
    NSLog(@"用户选择的正确答案 -> %@", selectTure);
    NSArray *unselectTure = [arr1 filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"NOT (SELF in %@)", arr2]];
    NSLog(@"用户没选择的正确答案 -> %@", unselectTure);

}

-(void)arrTest3{
    NSArray *array1 = @[@"2",@"3",@"1"];
    NSArray *array2 = @[@"1",@"5",@"6"];
    NSMutableSet *set1 = [NSMutableSet setWithArray:array1];
    NSMutableSet *set2 = [NSMutableSet setWithArray:array2];
    
//      [set1 unionSet:set2];//取并集后 set1中为1，2，3，5，6
      [set1 intersectSet:set2];  //取交集后 set1中为1
//      [set1 minusSet:set2];//取差集后 set1中为2，3     array1 与array2的差集
//    [set2 minusSet:set1];//取差集后 set1中为5，6       array2 与array1的差集
    
    NSLog(@"set1-------》%@",set1);
    NSLog(@"set2-------》%@",set2);
}

-(void)arrTest4{
    ClassOne *one   = [[ClassOne alloc]init];
    one.identifi    = 1;
    one.name        = @"张一";
    
    ClassOne *two   = [[ClassOne alloc]init];
    two.identifi    = 2;
    two.name        = @"张二";
    
    ClassOne *three = [[ClassOne alloc]init];
    three.identifi  = 3;
    three.name      = @"张三";
    
    ClassOne *four  = [[ClassOne alloc]init];
    four.identifi   = 4;
    four.name       = @"张四";
    
    NSArray *arr1 = @[one,two,three];
    NSArray *arr2 = @[one,two,three,four];
    NSArray *arr3 = @[two,one,three,four];

    if ([arr1 isEqualToArray:arr2]) { NSLog(@"对象型数组 arr1 == arr2");
    }else{ NSLog(@"对象型数组 arr1 != arr2");}
    
    if ([arr1 isEqualToArray:arr3]) { NSLog(@"对象型数组 arr1 == arr3");
    }else{ NSLog(@"对象型数组 arr1 != arr3"); }
    
    if ([arr1 isEqual:arr2]) { NSLog(@"对象型数组isEqual arr1 == arr2");
    }else{ NSLog(@"对象型数组isEqual arr1 != arr2"); }

    if ([arr1 isEqual:arr3]) { NSLog(@"对象型数组isEqual arr1 == arr3");
    }else{  NSLog(@"对象型数组isEqual arr1 != arr3"); }
    
    NSMutableSet *set1 = [NSMutableSet setWithArray:arr2];
    NSMutableSet *set2 = [NSMutableSet setWithArray:arr3];
    
    //      [set1 unionSet:set2];//取并集后 set1中为1，2，3，5，6
    [set1 intersectSet:set2];  //取交集后 set1中为1
    NSLog(@"set1--->%@",set1);
}
-(void)judgeArrEqual{
    
    NSArray *array1 = @[@"2",@"3",@"1"];
    NSArray *array2 = @[@"1",@"2",@"3",@"4"];
    NSMutableSet *set1 = [NSMutableSet setWithArray:array1];
    NSMutableSet *set2 = [NSMutableSet setWithArray:array2];
    
    [set1 intersectSet:set2];  //取交集后 set1中为1
  
    if (set1.count < array1.count) {
        NSLog(@"两者不相等,说明arr1包含有arr2没有的数据");
    }else if(set1.count == array1.count){
        if (set1.count == array2.count) {
            NSLog(@"array2 == array1 数组相等");
        }else{
            NSLog(@"arr2大于arr1的数据");
        }
    }else{
        NSLog(@"交集count > arr1的count，算法出错了了了了");
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

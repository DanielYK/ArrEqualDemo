

ArrEqualDemo
=
喜欢的朋友可以下载下来，如果代码对你有所帮助，还请给个Star，非常感谢你的支持！
= 
 *  判断数组是否相等,并分别介绍了 ==  , isEqual： , isEqualToArray: ,containsObject: , filteredArrayUsingPredicate ,以及交并差集合。有兴趣额的朋友可以下下来看看。

 * 这里只展示出来怎么判断数组相等
<pre><code>
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
</code></pre>
 
 ## 使用过程中有问题请加QQ或发邮件:584379066 备注：Git ArrEqual ##


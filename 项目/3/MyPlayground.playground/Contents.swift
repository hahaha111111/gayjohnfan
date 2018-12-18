//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport   //引用该包后，就可以进行可视化操作


//类必须自己写初始化方法,用来初始化没有默认值的非可选存储属性
//子类如果没有自己的初始化方法,系统默认使用父类的初始化方法,一旦有了自己的初始化方法,或者重写了父类的初始化方法,则父类的所有初始化不能被子类调用
//7.可以给子类添加和父类相同的初始化方法,但需要加上override 修饰
//8.重写父类的convenience修饰的便利初始化方法,不需要加override

class Person {//创建一个类
    var name:String
    var age:Int
    init(name:String ,age:Int){
        //类的初始化：使用 init 来创建一个构造器
        self.age = 18
        self.name = name
    }
    func simreturn() ->String {
        return "\(name)'s age is \(age)"
    }
}
var a = Person(name:"Linda",age:21)
var b = a.simreturn()


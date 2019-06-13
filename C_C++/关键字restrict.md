# 关键字restrict

关键字restrict从C99引入，主要作用是编译器优化。只可用于指针，并表明指针是**访问一个数据对象的惟一且初始的方式**，用于告诉编译器，对象已经被指针所引用，不能通过除该指针外所有其他直接或间接的方式修改该对象的内容。
它告诉编译器，所有修改该指针所指向内存中内容的操作都必须通过该指针来修改,而不能通过其它途径(其它变量或指针)来修改;
这样做的好处是,能帮助编译器进行更好的优化代码,生成更有效率的汇编代码.如 int *restrict ptr, ptr 指向的内存单元只能被 ptr访问到，任何同样指向这个内存单元的其他指针都是未定义的，直白点就是无效指针。
示例：

```C
int main(int argc, const char * argv[]) {
    int ar[10];
    int * __restrict restar=(int *)malloc(10*sizeof(int));
    int *par=ar;
    for(int n = 0; n < 10; n++)
    {
        par[n]+=5;
        restar[n]+=5;
        ar[n]*=2;
        par[n]+=3;
        restar[n]+=3;
        // 因为restar是访问分配的内存的唯一且初始的方式，那么编译器可以将上述对restar的操作进行优化：
        // restar[n]+=8;
    }
    return 0;
}
```

关键字restrict有两个读者。
一个是编译器，它告诉编译器可以自由地做一些有关优化的假定。
另一个读者是用户，他告诉用户仅使用满足restrict要求的参数。

一般，编译器无法检查您是否遵循了这一限制，如果您蔑视它也就是在让自己冒险。
To help the compiler determine memory dependencies,
you can qualify a pointer, reference, or array
with the restrict keyword.
The restrict keyword is a type qualifier that may be
applied to pointers, references, and arrays.
Its use represents a guarantee by the programmer
that within the scope of the pointer declaration
the object pointed to can be accessed only by that pointer.

Any violation of this guarantee renders the program undefined.
This practice helps the compiler optimize certain sections of code
because aliasing information can be more easily determined.


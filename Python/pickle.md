# pickle

python的pickle模块实现了基本的数据序列和反序列化。

通过pickle模块的序列化操作我们能够将程序中运行的对象信息保存到文件中去，永久存储。

示例代码：

```Python
#!/usr/bin/python3

import pickle

data1 = {'a': [1, 2.0, 3, 4+6j],
         'b': ('string', u'Unicode string'),
         'c': None}
selfref_list = [1, 2, 3]
selfref_list.append(selfref_list)

output = open('/Users/xxx/Desktop/1.pkl', 'wb')
pickle.dump(data1, output) # 把对象data存入到output, Pickle dictionary using protocol 0.
pickle.dump(selfref_list, output, -1)

output.close()

f = open('/Users/xxx/Desktop/1.pkl', 'rb')

data1 = pickle.load(f)
print(data1)

data2 = pickle.load(f)
print(data2)
f.close() 
``` 

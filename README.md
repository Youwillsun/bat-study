[TOC]

# BAT 批处理文件

> 可以在CMD中使用  /? 来查看命令使用方法：
>
> 例如：`title /?` `color /?` `find /?`等

## 使用`copy con`创建批处理文件

例如：

- `copy con syw.bat` 创建一个名字为syw的bat批处理文件。
- 创建完成之后，输入`@echo on` 回车之后，我们就可以输入我们的批处理命令。
- 输入完成，点击`ctrl+z`然后回车，即可结束输入状态。

---

## 使用`REM`或`::`命令注释命令行

例如：

```bat
@echo off
REM first order
:: first order
```

---

## 使用`pause`命令暂停程序执行

例如：

- 直接使用pause命令:

  ```bat
  @echo off
  echo first order
  pause
  ```

  执行时，会提示我们`请按任意键继续...`。

- 如果想不显示，我们可以这样：

  `echo first order & pause > nul`

  这样程序也会暂定，但是**不会显示`请按任意键继续...`，**当然操作还是一样的，按任意键继续。

---

## 使用`title`命令更改窗口左上角文字

例如：

```bat
@echo off
title this is my computer
```

这样 cmd 窗口左上角的文字就会变成`this is my computer`

---

## 使用`color`命令更改窗口颜色

例如：

```bat
@echo off
title change color
color f2
```

注意：`f2`是十六进制，f 是窗口背景色，2 是字体颜色。

> 0：黑色	1：蓝色	2：绿色	3：湖蓝色	4：红色	5：紫色	6：黄色	7：白色	8：灰色	9：淡蓝色
>
>  A：淡绿色	B：淡浅绿色	C：淡红色	D：淡紫色	E：淡黄色	F：亮白色

---

## 使用`mode`命令配置窗口设置

例如：

```bat
@echo off
title window setting
mode con cols=113 lines=15 & color 08
```

把窗口横向显示113列（113个字符）超出换行，纵向显示15行，颜色是 08

---

## 使用`goto` 和` ：`命令转向

- `: `后面，如果是一个数字或者字母，就会被当做标识被 `goto` 识别。
- 如果` ：`后面是其他特殊符号，则会被认为是注释符号 和` rem` 等同。

例如：

```bat
@echo off
:+ first order
title use goto and : to change direction
:start
set /a var+=1
echo %var%
if %var% leq 3 goto start
pause
```

`:start` 是一个标识，代表则 `goto`要转到的位置。

上面的程序里，定义了一个变量，每次 + 1，然后输出变量，接着判断变量是否等于3，如果不等于，`goto start `即回到 `:start `位置重新开始，当变量等于 3 时，程序就执行`pause`暂停了。

----

## 使用`find`命令，在文件中搜索字符串

`find` 命令参数：*[可选参数]*

- `[/V]` 显示所有未包含指定字符串的行。
- `[/C]`仅显示包含指定字符串的函数。
- `[/N]`显示行号。
- `[/I]`搜索字符串时忽略大小写。
-  `/OFF[LINE]`不要跳过具有脱机属性集的文件。
- `"string"`要搜索的目标字符串。
- `[drive:]`驱动器号，就是哪个磁盘。
- `[path]` 路径。
- `filename` 文件名

整体命令格式：`find [/V] [/C] [/N] [/I] /OFF[LINE] "string" [drive:][path]filename`

例如：

```bat
@echo off
:: 创建一个 test.txt 文件，并写入 111
echo 111 > test.txt

REM 向 test.txt 文件追加字符串 222
echo 222 >> test.txt

REM 查找字符串 111
find "111" test.txt;

:: 删除 test.txt 文件
del test.txt

```

---

## 使用`type`命令显示文件内容

`type`命令参数：

- `[dirve:]`驱动器盘符
- `[path]`路径
- `filename`文件名

命令格式： `type [dirve:][path]filename`

例如：

```bat
@echo off
echo 111 > test.txt
echo 222 >> test.txt
:: 显示文件内容
type test.txt
del test.txt
```

或者：

```bat
@echo off
echo 111 > test.txt
echo 222 >> test.txt
type test.txt | find "111"
del test.txt
```

### 把查找到的字符串写入文件中

**显示文件内容,把显示的结果 通过管道符 | 给 find ，然后用find命令查找显示的结果，并写入到 tempfile 文件中**

`type [dirve:][path]filename | find "string" [>tmpfile]`

## 使用`start`命令，在批处理中调用外部程序

注意：批处理会继续执行下去，不会理会外部程序的执行状况。

注意：bat 指令是从上到下一行一行来执行的，即便上一步操作花费的时间很长，下一条命令也要等待上一条命令执行完成才能运行。

例如：

```bat
REM 显示D盘下的所有文件内容
start explorer d:\
:: hello 仍然会显示，不会受到外部程序的影响
echo hello
```

---

## 使用`assoc`显示/修改文件扩展名的关联

**最好不要去改**

显示-例如：

```bat
:: 显示所有文件扩展名的关联
assoc
REM 显示 .txt 扩展名的关联
assoc .txt
```

修改-例如：

```bat
:: .doc 文件的关联是 Word.Document.8 就是word
assoc .doc 
:: .txt 文件的关联是 txtfile 就是记事本
assoc .txt
:: 如果我们想 .txt 文件都用 word 打开，只需要修改 .txt 文件的关联
assoc .txt = Word.Document.8
:: 注意：如果提示没有权限，请用管理员身份打开cmd再执行bat
```

---

## 使用`ftype`显示/修改文件类型关联

**最好不要去改**

显示-例如：

```bat
:: txtfile 就是通过assoc 查找出来的txt文件关联
ftype txtfile
```

修改-例如：

```bat
:: txt 文件使用 word 打开
ftype txtfile = C:\Program Files (x86)\Microsoft Office\Root\Office16\WINWORD.EXE" /n "%1" /o "%u

:: word 文件的扩展名关联查看
assoc .doc
```

---

## 使用`pushd` 和 `popd`切换目录

例如：

```bat
@echo off
c: & cd\ & md mp3
md d:\mp4
cd /d d:\mp4
pushd c:\mp3
popd
```

命令解释：

`c: & cd\ & md mp3` 在C盘根目录下创建一个名为mp3的文件夹。

`md d:\mp4` 在D盘根目录下创建一个名为mp4的文件夹。

`cd /d d:\mp4` 进入到mp4文件夹下。

`pushd c:\mp3` 保存上一步执行的目录【即d:\mp4】并切换到 c:\mp3 目录下。

`popd` 切换到上一个保存的目录下【即d:\mp4】 

所以上面的命令执行完毕，最终会进入到`d:\mp4`下。

----

## 使用`call`命令去调用另外一个批处理命令

**在批处理执行过程中，可以调用call命令去调用另外一个批处理命令，然后等另外一个批处理命令执行完毕后在返回执行当前的批处理命令**

call命令参数：

- `[dirve:]` 磁盘
- `[path]` 路径
- `filename` 文件名,必须是 .bat 或 .cmd 格式文件
- `[batch-parmaerers]` 参数

命令格式：`call [drive:][path]filename [batch-parameters]`

> call命令不仅可以调用外部的批处理命令，也可以调用自己批处理程序内部的子程序。
>
> 子程序必须以`:label`开头，以`goto :eof`结尾。
>
> call调用时`call :label argument`

## setLocal与变量延迟

批处理执行过程中会出现一个比较怪异的现象：

```bat
@echo off
set a=4
set a=5 & echo %a%
pause
```

此时，**输出 a 为 4**。因为批处理执行到`set a=5 & echo %a%`时，是在读的过程中进行了赋值，所以 echo 输出 a 时输出的是上一个 a 的值。【批处理的执行机制就是这样的】

*注：有点类似 set a=5 和 echo %a%是同时执行，所以 a 为上一个 a 的值*

但是这很明显不符合我们的预期，怎么输出 5 呢？解决这种问题的办法有两种：

第一种：分开写

```bat
@echo off
set a=4
set a=5
echo %a%
pause
```

第二种：使用变量延迟

```bat
@echo off
@REM 开启变量延迟
setlocal enabledelayedexpansion
set a=4
@REM 使用变量延迟，那么输出 a 时要使用！！
set a=5 & echo !a!
pause
```

使用了变量延迟之后，批处理执行到`set a=5 & echo !a!`时，就是先读完，最后执行过程中，在对 a 进行赋值，此时输出 a 就得到了正确的 5。

*注：使用变量延迟之后，有点类似对 echo ！a！输出时，先进行等待，等赋值完成在输出*

### 变量延迟例子：

变量延迟在 for 循环中的使用:

```bat
@echo off
setlocal enabledelayedexpansion
for /l %%i in (1,1,5) do (
    set a=%%i
    echo !a!
)
pause
```

> for 循环中：
>
> - `/l`表示以增量的方式循环
> - `(1,1,5)`开头的 1 和末尾的 5 表示循环的范围，中间的 1 表示 步长
> - `%%i` 是每次循环之后的值，第一次循环是1，第二次是 2 ...

启用变量延迟之后，for 循环输出 a 的结果为：1 2 3 4 5

若不使用变量延迟，那么for 循环输出 a 结果就是：5 5 5 5 5

## 批处理中常用的特殊字符

优先级知识点：`|` 高于 `>> >`  高于 `& && ||`

### @ 命令回显屏蔽符

在批处理中表示关闭当前行的回显。

`echo off`表示关闭所有命令行回显，但不包括当前行，所以会使用 `@echo off` 把当前行也关闭回显。

### % 批处理变量引导符

% 严格意义上来说不是一个命令，只是批处理中的一个参数，但是多个%的意思另说。

如果我们需要调用当前程序以外的参数，可以使用 `%1 至 %9`来代替第 几个 参数，第一个参数就是 `%1`。

`%0`代表批处理本身，包括完整的路径和扩展名。

- 例如：

  ```bat
  @echo off
  copy %0 d:\a.bat
  @REM 会输出已复制1个文件，但是如果再去 d 盘下执行 a.bat,会告诉你文本无法自身复制。
  ```

  意思是：拷贝当前批处理命令到 d 盘下，并改名为 a.bat 。【类似于拷贝了一份当前文件，然后改了名字】

`%*`代表所有参数。

### > 重定向符

也叫输出重定向符。所起的作用是，将所取得的结果传递到后面的范围。

- 例如：

  ```bat
  echo hello > 1.txt
  ```

  把 `hello` 放到 `1.txt` 中，如果 `1.txt `不存在，则会去创建，如果存在则进行覆盖。

所以我们使用 `>` 一般是创建一个文件,并把要放的内容放进去。

当然 > 的输出范围不只包括 文件，也包括一些系统控制台。

- 例如：更改系统时间

  ```bat
  @echo off
  echo 2020-01-01 > temp.txt
  date < temp.txt
  del temp.txt
  ```

  意思是：先把 2020-01-01 这个时间写入到 temp.txt 中，然后再把 temp.txt 中的内容，赋值给date(系统时间)，然后删除 temp.txt

### >> 重定向符

和 单个 `>` 类似，不过 `>>` 是把内容在输出范围的末尾追加。

- 例如：

  ```bat
  echo hello > 1.txt
  echo world >> 1.txt
  ```

所以一般使用 `>>` 是向某个文件追加内容。

### | 命令管道符

`|`可以将第一条命令的结果，当做第二条命令的参数来使用。

格式：`第一条命令  |  第二条命令  |  第三条命令  [|  第N条命令]`

- 例如：查找 C盘 下所有 txt 字符串

  ```bat
  dir c:\ | find "txt"
  ```

- 例如：格式化磁盘  $\textcolor{red}{危险} $

  ```bat
  echo y|format a:/s/q/v:system
  ```

  y是参数，把 y 通过管道符传递给 format 命令，此命令表示：格式化 磁盘 a。

  *注：可以这么理解，format 格式化磁盘会问你，是否确认格式化，把 y 传递过去，意味着确认。*

### ^ 转义字符

转义字符，是`> < &`这三个字符的特殊的前导字符，在命令中，如果把三个字符前加上` ^ `字符，则表示只是使用这个字符，而不会使用其功能。

- 例如：

  ```bat
  echo test ^> 1.txt
  ```

  将会输出：`test > 1.txt` 因为 > 符号被转义，不会创建 `1.txt`

- ^ 也可作为续行符号

  ```bat
  echo 孙^
  永^
  威
  puse
  ```

  将会输出：孙永威

  但是如果不加 ^ ,那么就会把 永 和 威 看做是一行命令来执行，就会报错。

### & 组合命令

1. 允许在一行中使用两个以上的命令组合
2. 执行顺序为从前至后
3. 碰到错误的命令也不会停止，会继续执行，直达命令结束 【重点语句】

语法：`第一条命令 & 第二条命令 [& 第n条命令]`

- 例如：

  ```bat
  @echo off
  dir z:\ & dir y:\ & dir c:\
  ```

### && 组合命令

1. 允许在一行中使用两个以上的命令组合
2. 执行顺序为从前至后
3. 碰到$\textcolor{red}{错误}$的命令会立即停止，后面的命令将不再执行【重点语句】

语法：`第一条命令 && 第二条命令 [&& 第n条命令]`

- 例如：

  ```bat
  @echo off
  dir z:\ && dir y:\ && dir c:\
  ```

### || 组合命令

1. 允许在一行中使用两个以上的命令组合
2. 执行顺序为从前至后
3. 碰到$\textcolor{red}{正确}$的的命令会立即停止，后面的命令将不再执行【重点语句】

语法：`第一条命令 || 第二条命令 [|| 第n条命令]`

- 例如：

  ```bat
  @echo off
  dir c:\ || dir y:\ || dir e:\
  ```

### "" 字符串定界符

为一个字符串制定边界，多用于字符串之间存在空格的情况。

- 例如：要在字符串之间添加空格

  ```bat
  cd c:\"program files"
  
  REM 进入 program files还有其他方法
  REM 例如：
  REM cd progra~1
  REM cd pro*
  ```

### ，逗号

逗号相当于空格，很多时候会把逗号当做空格来使用

- 例如：展示C盘目录

  ```bat
  dir,c:\
  ```

### ；分号

1. 当命令相同时，我们可以将不同的目标用 分号 来隔离
2. 但是执行的效果是不会变的
3. 如果执行过程中发生了错误，程序就会停止。

- 例如：

  ```bat
  dir c:\;d:\;z:\;e:\
  ```

### （）括号

括号在批处理中必须成对使用，会把括号内的命令当做一条命令

- 例如：

  ```bat
  echo 1 & echo 2 & echo 3
  :: 等价于下面的
  (
  	echo 1
  	echo 2
  	echo 3
  )
  ```

### ！ 感叹号

感叹号在变量延迟中来使用，用来表示变量。

- 例如：

  ```bat
  @echo off
  setlocal enabledelayedexpansion
  set a=1
  echo !a!
  ```

## For 语句基本用法

`For %%i in (command1) do (command2)`

```bat
@echo off
for %%i in (www,liebao,net,cn) do echo %%i
```

For循环 command1 如果是一个命令语句，需要用 单引号 引起来。如果是字符串，则必须是双引号。

```bat
@echo off
for %%i in ('dir /a-d /b *test*.txt') do echo %%i
for %%i in ("www.youwillsun.com") do echo %%i
```

### For语句简单示例：

- 查看当前硬盘分区有哪些：

  ```bat
  @echo off
  for %%i in (c,d,e,f,g) do if exist %%i: echo %%i
  ```

- 输出当前文件夹下的所有文件

  ```bat
  @echo off
  for %%i in (*.*) do echo "%%i"
  ```

- 输出当前文件夹下，所有以 txt 结尾的文件

  ```bat
  @echo off
  for %%i in (*.txt) do echo "%%i"
  ```

- 输出名称是4个字符的 txt 文件

  ```bat
  @echo off
  for %%i in (????.txt) do echo "%%i"
  ```

  ? 表示任意字符，一个 ? 表示一个任意字符，两个 ?? 表示两个任意字符。

### For语句参数

#### `/f`解析文本

- 例如：读取文本文件

  - for.txt

    ```
    我叫孙永威
    今年22岁了
    ```

  - for.bat

    ```bat
    @echo off
    for /f %%i in (for.txt) do echo %%i
    pause
    ```

    这样就会读取出 for.txt 文件中的内容

  for 循环读取文本文件时，会自动按照默认规则来截取：

  - 默认按照 空格 和 制表符（tab键） 来截取

  如果想指定截取规则，则需使用delims

#### `delims` 切分字符串

delims 后面跟一个 字符 ，就可以按照这个字符来进行分割字符串。

- 例如：根据文本中的 `,` 切分字符串

  - for.txt

    ```
    我叫孙永威,今年12岁
    身体健康
    ```

  - for.bat

    ```bat
    @echo off
    for /f "delims=," %%i in (for.txt) do echo %%i
    pause
    
    REM输出结果：
    REM我叫孙永威
    REM身体健康
    ```

    第一行，逗号后面的没有读取，根据逗号进行了分割。

    需要注意的是，txt中如果是中文逗号则不起作用。

delims 后面所跟字符串，可以有多个：

- 例如：

  - for.txt

    ```
    我叫孙永威,哈哈哈
    网址：www.youwillsun.com
    ```

  - for.bat

    ```bat
    @echo off
    for /f "delims=.," %%i in (for.txt) do echo %%i
    pause
    
    REM输出结果：
    REM我叫孙永威
    REM网址：www
    ```

    同时按照 点 和 逗号 进行分割。

#### `tokens` 提取文件内容

tokens 可以指定读取文件中第几段内容，一般和delims配合使用。

- 例如：

  - for.txt

    ```
    尺有所短,寸有所长,万物均衡。
    ```

  - for.bat

    ```bat
    @echo off
    for /f "delims=, tokens=2" %%i in (for.txt) do echo %%i
    pause
    ```

    此时就会读取由 delims 按照 逗号 分隔的 第二段内容。

tokens 也可以指定读取多节。

**注意：当 tokens 指定读取多节时，那么需要有相对应的输出变量做接收。输出变量的定义是按照26个英文字母依次排列。**

- 例如：

  - for.txt

    ```
    尺有所短,寸有所长,万物均衡,是为天道.
    ```

  - for.bat

    ```bat
    @echo off
    for /f "delims=, tokens=2,3" %%i in (for.txt) do echo %%i %%j
    pause
    ```

    1. 这里第一个 `%%i` 是批处理默认循环变量，不要修改。

    2. 需要在 echo 输出时，按照英文字母顺序，多定义一个变量`%%j`，接收提取的 3 的内容即可。

    3. 如果不多定义，那么echo 输出  `%%i` 时只会接收 2 的内容。

    4. 如果修改了前面的循环变量，那么后面的也要做出相应的改变：

       ```bat
       for /f "delims=, tokens=2,3" %%a in (for.txt) do echo %%a %%b
       ```

       比如把循环变量改成了`%%a`，那么后面的变量就要以英文字母 a 开始排序。

> 小提示：
>
> 如果我们想利用tokens读取全部的内容，那么有一个简化写法：
>
> - 例如，一个文本可以 delims 分成 5 段
>
>   `for /f "delims=, tokens=1,2,3,4,5" %%i in (for.txt) do echo %%i %%j %%k %%l %%m`
>
>   ---
>
>   上面那种写法可以这样：
>
>   `for /f "delims=, tokens=1,2-5" %%i in (for.txt) do echo %%i %%j %%k %%l %%m`
>
>   ---
>
>   tokens简写时，前面必须要有一个数字，例如读取第二个到第五个：
>
>   `for /f "delims=, tokens=2,3-5" %%i in (for.txt) do echo %%i %%j %%k %%l`
>
>   **但是后面接收到变量不能省略,读取几个就要写几个。**
>
>   ---
>
>   如果感觉 写 2-5之类的还是太麻烦，而且需要读取全部的，那可以 把 后面的替换成一个 *
>
>   `for /f "delims=, tokens=2,*" %%i in (for.txt) do echo %%i %%j %%k %%l`

#### `skip` 跳到某一行

skip 后面的数值表示忽略几行。

- for.txt

  ```
  天地万物。
  天上地下。
  天高地迥。
  ```

- for.bat

  ```bat
  @echo off
  for /f "skip=2" %%i in (for.txt) do echo %%i
  pause
  ```

  只会输出：天高地迥

#### `eol` 忽略以某一个字符开头的行

例如：忽略以 逗号 开头的行。

- for.txt

  ```
  ,天地万物
  天高地迥
  ```

- for.bat

  ```bat
  @echo off
  for /f "eol=," %%i in (for.txt) do echo %%i
  pause
  ```

  只会输出：天高地迥

> 注意：
>
> - for循环会默认忽略以 `;`开头的行。
>
>   但是如果指定了 eol 开关，那么不会自动忽略`;`开头的行。
>
> - eol 后面所跟的字符不能有多个。

#### `usebackq` 增强参数

- 例如：

  - for 1.txt

    ```
    天高地囧，觉宇宙之无穷，兴尽悲来，识盈余之有数。
    望长安于日下，目吴会于云间。
    ```

  - for.bat

    ```bat
    @echo off
    REM 这样写是不行，找不到文件
    for /f %%i in (for 1.text) do echo %%i
    REM 即时变成了字符串，也不行
    for /f %%i in ("for 1.text") do echo %%i
    
    REM 使用增强参数
    for /f "usebackq" %%i in ("for 1.text") do echo %%i
    ```

如果使用了增强参数，且 for 循环中是命令语句，则需要使用 `` 来包括。

```bat
@echo off
for /f "usebackq" %%i in (`命令语句`) do echo %%i
```

如果使用了增强参数，且 for 循环中是字符串，则需要使用 ' ' 来包括。

```bat
@echo off
for /f "usebackq" %%i in ('字符串') do echo %%i
```

如果使用了增强参数，且 for 循环中是文件名，则需要使用 " " 来包括。

```bat
@echo off
for /f "usebackq" %%i in ("文件名") do echo %%i
```

- 这里的文件名就可以包括 空格 这种特殊字符。【主要针对中文文件名】

#### `/r` 遍历文件夹

`/r`又叫递归参数， 主要应用在遍历文件夹上。

命令格式：`for /r 目录 %%i in (元素集合) do 命令语句集合`

- 例如：

  ```bat
  @echo off
  for /r E:\BAT %%i in (.) do echo %%i
  pause
  ```

  会输出`E:\BAT\`文件夹下的所有子文件夹目录。

  > 解释一下 in :
  >
  > - in 后面是要告诉命令浏览文件夹下的什么东西.
  >
  >   在命令中写了一个 `.` 所以会在遍历出来的文件目录后面都跟一个`.`
  >
  > - 如果 in (a b c)
  >   则会在每个文件下都跟上 a b c 三个字母
  >
  >   - 就像这样：
  >
  >     `E:\BAT\a`
  >
  >     `E:\BAT\b`
  >
  >     `E:\BAT\c`
  >
  > - 再例如找某文件夹下所有bat文件—— `in(*.bat)`
  >
  >   `E:\BAT\test.bat` 即 目录 + 文件名
  >
  > ---
  >
  > 所以 in(a b c) 和 in (*.bat) 的区别：
  >
  > - in(a b c) 是把 a b c 当做了文件夹名。
  > - in(*.bat) 是把 *.bat 当做了文件名。
  >
  > for 语句中默认以 空格和tab键 进行元素分割。

  - 如果是用`/f`来写例子：

    ```bat
    @echo off
    for /f %%i in ('dir/ad/b/s E:\BAT\') do echo %%i
    pause
    ```

  **二者区别：**

  - /r 读取文件目录流程：

    ```flow
    st=>start: Start
    e=>end: End
    op1=>operation: 告诉计算机要遍历 xxx 路径下的文件夹【因为使用了 /r】，且通过in告诉要找什么
    op2=>operation: 读取完毕，赋值给 %%i
    op3=>operation: 交给do输出结果
    
    st->op1->op2->op3->e
    ```

    一边读取，一边赋值输出。

  - /f 读取文件目录流程：

    ```flow
    s=>start: start
    e=>end: end
    op1=>operation: 先使用dir命令遍历出 xxx 目录下的文件夹
    op2=>operation: 把遍历出来的内容赋值给 %%i
    op3=>operation: 交给do输出结果
    
    s->op1->op2->op3->e
    ```

    先读取，在赋值输出。

  所以在读取大批量目录时，/f 命令会慢一些 /r 会快一点。

  什么时候用 /r 什么时候用 /f 呢？

  - 如果只是为了获取某个文件夹下所有子文件夹的目录，建议用 /f
  - 如果需要过滤带有隐藏属性的文件夹的话，建议用 /r

#### `/d` 处理文件夹

`/d` d 就是 directory 目录 的意思。

命令格式：`for /d %%i in (元素集合【目录】) do 命令语句集合`

>/d 和 /r 类似，但是 /r 是匹配当前目录下的所有文件夹，/d 则是匹配当前目录下第一级文件夹或指定位置的文件夹

- 例子：

  ```bat
  @echo off
  REM 如果元素集合中存在通配符 * 则匹配的是文件夹
  for /d %%i in (c:\*) do echo %%i
  pause
  ```

  会输出 C 盘下第一级文件目录。

#### `/l` 计数循环

`/l` 是loop的缩写。

- 例子：

  ```bat
  @echo off
  ::in 中 第一个值是开始值，第二个值是步长，第三个值是结束值，注意：第三个值只能取整数
  for /l %%i in (1,2,10) do echo syw
  pause
  ```

  会输出 5 遍 syw。

### For 语句中的变量

#### ~i：删除引号("")，扩展%i

- 例如：

  - temp.txt

    ```
    "1111"
    "2222"
    3333"
    "4444"44
    "55"55"55
    ```

  - text.bat

    ```bat
    @echo off
    REM 注意最后是%%~i
    for /f %%i in (temp.txt) do echo %%~i
    pause
    
    REM 输出：
    REM 1111
    REM 2222
    REM 3333"
    REM 4444"44
    REM 55"55"55
    ```

引号删除规则：

1. 如果 字符串首尾 同时存在引号，则首尾引号都删除。
2. 如果 字符串尾 没有引号，则删除字符串首的引号。
3. 如果 字符串中间或尾部 出现引号，则不删除。

总结：无头不删，有头连尾删，中间保留。

#### %~fi：文件路径名

- 例子：

  ```bat
  @echo off
  for /f %%i in ('dir /b') do echo %%~fi
  pause
  REM 输出：E:\BAT\text.bat
  REM 显示当前路径下的文件的完整路径名
  ```

#### %~di：文件所在驱动器号

- 例子：

  ```bat
  @echo off
  for /f %%i in ('dir /b') do echo %%~di
  pause
  REM 输出：E:
  REM 只显示每个文件所在的驱动器号
  ```

#### %~pi：文件相对路径

- 例子：

  ```bat
  @echo off
  for /f %%i in ('dir /b') do echo %%~pi
  pause
  REM 输出： \test\
  REM 输出当前文件所在的相对路径
  ```

#### %~ni：文件名

- 例子：

  ```bat
  @echo off
  for /f %%i in ('dir /b') do echo %%~ni
  pause
  REM 输出 temp
  REM 只是输出文件名，没有扩展名后缀
  ```

#### %~xi：文件的扩展名

- 例子：

  ```bat
  @echo off
  for /f %%i in ('dir /b') do echo %%~xi
  pause
  REM 输出 .txt
  REM 只输出文件扩展名
  ```

#### %~si：文件路径只含有短名

- 例子：

  ```bat
  REM 若有一文件名称为：test1325asdfasdfasdfasdf4565641.txt
  @echo off
  for /f %%i in ('dir /b') do echo %%~si
  pause
  REM 输出 test13~1.txt
  REM 当文件名长度达到一定长度是，通过si读取出来的文件名会自动缩小，只显示一个简短的名。
  ```

  注意：经过测试，目前 %~si 并不会缩短文件名，会完全输出。【自己测试】

#### %~ti：文件的日期时间

- 例子：

  ```bat
  @echo off
  for /f %%i in ('dir /b') do echo %%~ti
  pause
  REM 输出：2021/02/05 16:46
  REM 显示的是文件的创建时间
  ```

#### %~zi：显示文件大小

- 例子

  ```bat
  @echo off
  for /f %%i in ('dir /b') do echo %%~zi
  pause
  REM 输出：638 【单位：字节】
  REM 显示的是文件的大小
  ```

#### %~$PATH:i

> 查找列在路径环境变量的目录，并将 %i 扩展到找到的第一个完全合格的名称，如果环境变量名未定义，或者没有找到文件，此组会扩展到空字符串。

- 例子：

  ```bat
  @echo off
  for /f %%i in ("notepad.exe") do echo %%~$PATH:i
  pause
  REM 输出：C:\Windows\System32\notepad.exe
  ```

  执行流程：

  ```flow
  start=>start: 开始
  input=>inputoutput: 拿到in里的字符串赋给 i
  operation=>operation: 在$PATH环境变量里寻找 i
  condition=>condition:  是否找到了？
  output=>inputoutput: 找到了就输出 i 的环境变量目录
  error=>operation: 没有找到就输出空字符串
  end=>end: 结束
  
  start->input
  input->operation
  operation->condition
  condition(no,top)->error
  condition(yes,bottom)->output
  output->end
  error->end
  ```

## Set命令用法

###set自定义变量

语句格式：`Set [variable=[string]]`

- 例子：

  ```bat
  @echo off
  set /P var=youwillsun
  echo %var%
  pause
  
  REM 输出：youwillsun
  ```

  ```bat
  set /P var=请输入一个变量值
  echo %var% ~_~
  pause
  
  REM 请输入一个变量值 【用户输入一个数字，例如 15】
  REM 15 ~_~
  ```

  ```bat
  REM 表达式计算范围：-2147483647 ~ 2147483647
  set /P input=请输入计算表达式
  set /a var=%input%
  echo %input%=%var% ~_~
  pause
  
  REM 请输入计算表达式 【用户输入一个表达式，例如 15+5】
  REM 15+5=20 ~_~
  ```

  ```bat
  REM 逻辑运算
  set /a var=4">>"2
  echo %var%
  pause
  
  REM 输出：1
  ```

  ```bat
  set /a a=1+1,b=2+1,c=3+1
  echo %a% %b% %c%
  pause
  
  REM 输出：2 3 4
  ```

  ```bat
  set /p n=请输入2的几次方:
  set /a num=1^<^<n
  echo %num%
  pause
  
  REM 输出
  ```

- 查看 set 命令帮助

  ```bat
  set /?
  ```

### set进行字符串处理

#### 字符串替换

替换公式：`%PATH:str1=str2%`

str1：被替换的字符串

str2：要替换的字符串

- 例子：

  ```bat
  set a=www.youwillsun.com .net .cn
  echo 替换前的字符串: "%a%"
  set var=%a: =%
  echo 替换后的字符串: "%var%"
  pause
  
  REM 会把原始字符串中的空格，全部替换成没有空格。
  ```

- 例子2：

  ```bat
  set a=www.youwillsun.com.net.cn
  echo 替换前的字符串: "%a%"
  set var=%a:.cn=.xyz%
  echo 替换后的字符串: "%var%"
  pause
  
  REM 会把 .cn 替换成 .xyz
  ```

#### 字符串截取

截取公式：`%a:~[m,[n]]%`

m：截取起始位置，若为 负值，则从后向前数 m 位，m默认为0

n：截取的长度，若为空，则默认截取剩余所有字符，若为 负值，则表示从后向前截取 n 位。

- 例子：

  ```bat
  set a=www.youwillsun.com
  echo 截取前的字符串: "%a%"
  set var=%a:~1,4%
  echo 截取后的字符串: "%var%"
  pause
  
  REM 会输出，第 1 - 4 位字符串，即ww.y
  ```

- 例子2：

  ```bat
  set a=www.youwillsun.com
  echo 截取前的字符串: "%a%"
  set var=%a:~-10%
  echo 截取后的字符串: "%var%"
  pause
  
  REM 从后向前数10位，然后截取剩下的所有字符，即：illsun.com
  ```

- 例子3：

  ```bat
  set a=www.youwillsun.com
  echo 截取前的字符串: "%a%"
  set var=%a:~0,-3%
  echo 截取后的字符串: "%var%"
  pause
  
  REM 从后【倒数第三位】向前截取，即：www.youwillsun.
  ```

## IF命令用法

查看帮助：`if /?`

### 语句1 - errorlevel

语句1格式：`IF [NOT] ERRORLEVEL number command`

- 例子：

  ```bat
  @echo off
  REM 显示当前计算机的用户
  net user
  REM errorlevel是一个系统变量，这里会接收上一条命令的值，errorlevel的结果值是在 0 - 255 之前，每个数都有不同的含义
  if %errorlevel%  == 0 echo net user 命令执行成功
  pause
  
  REM 会输出当前计算的用户
  ```

- 例子2：

  ```bat
  @echo off
  net useree
  if %errorlevel%  == 0 echo net user 命令执行成功
  pause
  
  net useree
  if errorlevel 0 echo net user 命令执行成功
  pause
  ```

  这两条命令中，`net useree`执行肯定是出错的，但是这两条命令的区别在于，第一条会直接暂停，第二条则还是会输出 `net use 命令执行成功`。

  原因：

  - 第一条写法，明确的说，只有当 errorlevel == 0时，才判断通过。
  - 第二条写法，则会理解为，当 errorlevel >= 0时，都会判断通过。

- 例子3：

  ```bat
  @echo off
  set /p var=请输入一个命令：
  %var%
  if %errorlevel%==0 goto yes
  goto no
  
  :yes
  echo %var%命令执行成功
  pause
  exit
  
  :no
  echo %var%命令执行失败
  pause
  ```

  -  简化写法：

    ```bat
    set /p var=请输入一个命令：
    %var%
    if %errorlevel%==0 (
        echo %var%执行成功
    ) else (
        echo %var%执行失败
    )
    pause
    ```

    利用 else 来简化。

### 语句2 - string1 = string2

语句2格式：`IF [NOT] string1==string2 command`

- 例子：

  ```bat
  @echo off
  set /p var1=请输入第一个比较字符：
  set /p var2=请输入第二个比较字符：
  if %var1% == %var2% (
      echo %var1% 等于 %var2%
  ) else (
      echo %var1% 不等于 %var2%
  )
  pause
  
  REM 判断两个字符是否相等
  ```

  上例中，两个字符比较时会忽略空格.

  如果需要连同空格一起比较，这需要把比较对象加上引号：

  ```bat
  if "%var1%" == "%var2%"
  ```

- 例子2：`not`

  ```bat
  @echo off
  set /p var1=请输入第一个比较字符：
  set /p var2=请输入第二个比较字符：
  if not %var1% == %var2% (
      echo %var1% 等于 %var2%
  ) else (
      echo %var1% 不等于 %var2%
  )
  pause
  
  REM 此时如果输入两个 1，则会显示 1 不等于 1
  ```

  `not` 相当于对比较的结果取反。 1 == 1 取反，即为 1 !== 1

### 语句3 - exist

语句3格式：`IF [NOT] EXIST filename command`

- 例子：

  ```bat
  @echo off
  if exist "E:\BAT\set.bat" (
      echo 存在文件
  ) else (
      echo 不存在文件
  )
  
  REM 判断是否存在文件
  ```

  同理，如果加上 not ，则为比较结果取反：

  ```bat
  if not exist "E:\BAT\set.bat"
  ```

###  参数`/i`：忽略大小写

- 例子：

  ```bat
  if a == A (
      echo 相等
  ) else (
      echo 不相等
  )
  REM 输出 不相等
  
  REM 但是如果使用了 /i
  if /i a == A (
      echo 相等
  ) else (
      echo 不相等
  )
  REM 输出 相等
  ```

### 判断条件英文缩写

1. `EQU` 等于
2. `NEQ` 不等于
3. `LSS` 小于
4. `LEQ` 小于或等于
5. `GTR` 大于
6. `GEQ` 大于或等于

- 例子：

  ```bat
  @echo off
  set /p var=请输入一个数字：
  if %var% LEQ 4 (
      echo %var% 小于等于 4
  ) else (
      echo %var% 大于 4
  )
  ```

## 批处理交互界面设计

```bat
@echo off
cls
title 多功能修复
:menu
cls
color 0A
echo.
echo ==============================
echo 请选择要进行的操作，然后按回车。
echo ==============================
echo.
echo 1.显示C盘目录文件。
echo.
echo 2.启动计算机小程序。
echo.
echo Q.退出。
echo.
:cho
set /p choice=请选择：
if "%choice%" == "1" goto showFile
if "%choice%" == "2" goto caculate
if /i "%choice%" == "Q" goto endd
echo 选择无效，请重新输入。
echo.
goto cho
:showFile
dir c:\
echo 按任意键返回菜单
pause
goto menu
:caculate
set /p input=请输入计算表达式:
set /a var=%input%
echo %input%=%var% ~_~
echo 按任意键返回菜单
pause
goto menu
:endd exit
```

完结。
# Архитектура вычислительных систем. ИДЗ №2 Вариант 10. Селезнев Григорий Ильич БПИ217.

## Вариант 10:
Разработать программу, вычисляющую с помощью степенного ряда с точностью не хуже 0,05% значение функции гиперболического тангенса tanh(x) = (e^x −e^(−x))/(e^x +e^(−x)) для заданного параметра x.
> Так как формула для подсчета через степенной ряд имеет ограничение |x| < pi/2 следовательно все значение больше pi/2 не принимаются в программу.
>  Плюс так как в формуле присутсвует степень двойки и аргумент происходит переполнение переменных (то етсь они обнуляются) следовательно поставил ограничение в -1.41 < x < 1.41
> Возможно небольшое превышение в рамках точности +-0.01
> После превышение аргумента по модулю точность уходит от нас ;( (Может превышать 50%)

## Как устроена программа:

Для того, чтобы собрать программу требуется прописать в консоле:
```
gcc main.c -S -o main.s -lm
gcc th.c -S -o th.s -lm
gcc main.s -c -o main.o -lm 
gcc th.s -c -o th.o -lm 
gcc main.o th.o -o program.exe -lm
```

Для того, чтобы сделать ввод рандомных данных:
```
./program.exe
```
> После чего будет запрошено кол-во данных для рандомизации, то есть если ввести 10 будет созданно 10 иксов, которые будут подставлены в функцию th(x) и выведены все результаты в консоль

Для того, чтобы сделать ввод с клавиатуры:
```
./program.exe x
```
> Вместо x нужно будет подставить дробное число от -pi/2 до pi/2. Если введено число не попадающее в диапозон будет завершена программа с сообщением об ошибке

Для того, чтобы сделать ввод строки из файла (input.txt output.txt - это созданные файлы который лежит рядом с .exe):
```
./program.exe input.txt output.txt
```

Для того, чтобы сделать замер работы программы (Тест проводится с x = 1.39). При это Выводится результат и точность.
```
./program.exe measuring
```

## Отчет на 4 балла:
1. **Приведено решение на С**
> [main.c](https://github.com/Grisha1232/ABC_HW3/blob/86cfc08b685fa49add60ebd1975f230576fa64a6/C%20code/main.c)  
> [th.c](https://github.com/Grisha1232/ABC_HW3/blob/caae295565936eb2c74743d31f7d2a08ce08a1e3/C%20code/th.c)  
> Правила пользование написаны выше

2. **Приведено решение на Assembler** (Не модифицированый без оптимизирующих и отладочных опций) с комментариями
> [main.s](https://github.com/Grisha1232/ABC_HW3/blob/56f0d96dcd91911b3734de39fad5c7d67edd0653/Assembler%20non%20mod/main.s)  
> [th.s](https://github.com/Grisha1232/ABC_HW3/blob/f8ecd827844163b1643ea39685a0a26d042fe528/Assembler%20non%20mod/th.s)  

3. **Приведено решение на Assembler** с комментариями
> [main.s](https://github.com/Grisha1232/ABC_HW3/blob/4510db6a46f9890e53ff981681154bd2a9fa5163/Assembler/main.s)  
> [th.s](https://github.com/Grisha1232/ABC_HW3/blob/4510db6a46f9890e53ff981681154bd2a9fa5163/Assembler/th.s)  
> [Список измененений (модификаций) ассемблерной программы](https://github.com/Grisha1232/ABC_HW3/blob/761feb16b40e764760d4074f58b93bf0900552b2/Assembler/Modifications.md)

### Итог:
* Приведено решения на С
* Приведена ассемблерная программа без отладочных опций (с комментариями)
* Приведена ассемблерная программа с модификациями (с комментариями)
* Проведены [тесты](https://github.com/Grisha1232/ABC_HW3/blob/181efaecf1a144ce792b4de501f078299d601f3c/C%20code/Test/testFor4.md) для подтвержинения индентичной работы двух программ

## Отчет на 5 баллов:

**1. Сделаны функции с передачей данных через параметры:**  
* realTh(double x) в [main.c](https://github.com/Grisha1232/ABC_HW3/blob/86cfc08b685fa49add60ebd1975f230576fa64a6/C%20code/main.c) 
* cgeckPrecision(long double x, logn double curr) в [main.c](https://github.com/Grisha1232/ABC_HW3/blob/86cfc08b685fa49add60ebd1975f230576fa64a6/C%20code/main.c) 
* th(double x) в [th.c](https://github.com/Grisha1232/ABC_HW3/blob/caae295565936eb2c74743d31f7d2a08ce08a1e3/C%20code/th.c) 
* fact(unsigned long long n) в [th.c](https://github.com/Grisha1232/ABC_HW3/blob/caae295565936eb2c74743d31f7d2a08ce08a1e3/C%20code/th.c) 
* pow2(unsigned long long int n) в [th.c](https://github.com/Grisha1232/ABC_HW3/blob/caae295565936eb2c74743d31f7d2a08ce08a1e3/C%20code/th.c) 
* bink(unsigned long long n, usigned long long k) в [th.c](https://github.com/Grisha1232/ABC_HW3/blob/caae295565936eb2c74743d31f7d2a08ce08a1e3/C%20code/th.c) 
* bernolli(unsigned long long n) в [th.c](https://github.com/Grisha1232/ABC_HW3/blob/caae295565936eb2c74743d31f7d2a08ce08a1e3/C%20code/th.c) 
* ABS(long double x) в [th.c](https://github.com/Grisha1232/ABC_HW3/blob/caae295565936eb2c74743d31f7d2a08ce08a1e3/C%20code/th.c) 

### Итог: 
* Использованы локальные переменные в файле [main.c](https://github.com/Grisha1232/ABC_HW3/blob/86cfc08b685fa49add60ebd1975f230576fa64a6/C%20code/main.c)  
* Добавлены комментарии в ассемблерную програму описывающую передачу данных через параметры [modification](https://github.com/Grisha1232/ABC_HW3/tree/main/Assembler), а также в не модифицированную ассемблерную программу [nonMod](https://github.com/Grisha1232/ABC_HW3/tree/main/Assembler%20non%20mod)

## Отчет на 6 баллов:

**1. Заменены следующие переменные:**
* Замена переменной i (C code) во всех циклах на регистр r12d
* Замена переменной countMemb (C code) на регистр r13d

### Итог:
* Использованы регистры для некоторых переменных в assembler
* Для сравнение размеров программы были взяты файлы [main.o и th.o](https://github.com/Grisha1232/ABC_HW3/tree/main/Assembler) (их размер составил 5.5 Кб и 4.0 Кб соответсвенно), а также [nonModMain.o и nonModTh.o](https://github.com/Grisha1232/ABC_HW3/tree/main/Assembler%20non%20mod) (их размер составил 6.1 Кб и 4.6 Кб соотвественно)   {Эти файлы получены командой gcc file.s -c -o file.o -lm} => размер программы уменьшился, но результат остался тот же [тесты](https://github.com/Grisha1232/ABC_HW3/blob/181efaecf1a144ce792b4de501f078299d601f3c/C%20code/Test/testFor4.md), которые использовались для проверки идентичности

## Отчет на 7 баллов:

**1. Реализована программа с двумя еденицами компиляции:**

Функции вынесены в отдельный файл th.c:   
* th(double x);   
* fact(unsigned long long n);   
* pow2(unsigned long long int n);   
* bink(unsigned long long n, usigned long long k);   
* bernolli(unsigned long long n);   ABS(long double x)   

> 
**Добавлена одна еденица компиляции к уже имеющейся:**
```
gcc main.s -c -o main.o
gcc th.s -c -o th.o
gcc main.o th.o -o program.exe
```

**2. Реализован ввод и вывод через файлы.** Для того, чтобы ввести данные через файл и также вывести в другой файл нужно:
* Создать два файла input.txt и output.txt (Названия файлов не важны).
* Расположить эти два файла рядом с **program.exe**
* Прописать в командной строке:
```
./program.exe input.txt output.txt
```
Где **input.txt** - для ввода данных, а **output.txt** - для вывода результата. **input.txt** содержит в себе иксы, которые записаны или через пробел, или на каждой строчке

### Итог: 
* Добавлена еденица компиляции
* Добавлен ввод и вывод через файлы
* Проведены [тесты с файлами](https://github.com/Grisha1232/ABC_HW3/tree/main/Test%20Files), которые показали идентичную работу

## Отчет на 8 баллов:

**1. Реализован генератор случайной строки.**
Для того, чтобы запустить программу, которая сама генерирует значения и выводит ответ нужно ввести в командную строку:
```
./program.exe
```
> После программы спросит сколько рандомных значений нужно сгенерировать.

**2. Реализован замер времени без учета ввода и ввывода (только операция вычесления результата).**
Для того, чтобы запустить программу, которая прогонет много раз один и тот же тест для замера времени нужно ввести в командную строку:
```
./program.exe measuring
```
> Только с этим ключем запуститься тест на замер времени работы программы.

### Итог:
* Добавлен генератор случайной строки для облегчения тестирования
* Добавлена возможность запустить тест для замера времени с выводом времени.

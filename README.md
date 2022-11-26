# Архитектура вычислительных систем. ИДЗ №2 Вариант 22. Селезнев Григорий Ильич БПИ217.

## Вариант 22:
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
1. *Приведено решение на С*
> [main.c](https://github.com/Grisha1232/ABC_HW3/blob/86cfc08b685fa49add60ebd1975f230576fa64a6/C%20code/main.c)  
> [th.c](https://github.com/Grisha1232/ABC_HW3/blob/caae295565936eb2c74743d31f7d2a08ce08a1e3/C%20code/th.c)  
> Правила пользование написаны выше

2. *Приведено решение на Assembler* (Не модифицированый без оптимизирующих и отладочных опций) с комментариями
> [main.s](https://github.com/Grisha1232/ABC_HW3/blob/56f0d96dcd91911b3734de39fad5c7d67edd0653/Assembler%20non%20mod/main.s)  
> [th.s](https://github.com/Grisha1232/ABC_HW3/blob/f8ecd827844163b1643ea39685a0a26d042fe528/Assembler%20non%20mod/th.s)  

3. *Приведено решение на Assembler* с комментариями
> [main.s](https://github.com/Grisha1232/ABC_HW3/blob/b6841687468d9ed1c980e5bf2c6cd893d1528e95/Assembler/main.s)  
> [th.s](https://github.com/Grisha1232/ABC_HW3/blob/40e846eea3ba76a8caf9c4f7aabc29b72fd1b3e7/Assembler/th.s)  
> [Список измененений (модификаций) ассемблерной программы] ()

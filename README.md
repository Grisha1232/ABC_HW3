# Архитектура вычислительных систем. ИДЗ №2 Вариант 22. Селезнев Григорий Ильич БПИ217.

## Вариант 22:
Разработать программу, вычисляющую с помощью степенного ряда с точностью не хуже 0,05% значение функции гиперболического тангенса tanh(x) = (e^x −e^(−x))/(e^x +e^(−x)) для заданного параметра x.
> Так как формула для подсчета через степенной ряд имеет ограничение |x| < pi/2 следовательно все значение больше pi/2 не принимаются в программу.
> + Так как в формуле присутсвует степень двойки и аргумент происходит переполнение переменных (то етсь они обнуляются) следовательно поставил ограничение в -1.41 < x < 1.41
> Возможно небольшое превышение в рамках точности +-0.01


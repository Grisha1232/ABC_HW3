# Сделанные модификации

Использована команда для ассемблирование двух файлов:
```
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -fverbose-asm ./main.c -S -o ./main.s -lm
gcc -masm=intel -fno-asynchronous-unwind-tables -fno-jump-tables -fno-stack-protector -fno-exceptions -fverbose-asm ./th.c -S -o ./th.s -lm
```

**Заменены штуки вида:**
```Assembler
lea rax, 'something'     # (или какой-нибудь другой регистр вместо rax)
mov rdi, rax
```
**на:**
```
lea rdi, 'something'    
```


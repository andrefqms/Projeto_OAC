#include <stdio.h>
#include <stdbool.h>

/* Função para obter paridade do número n. Ele retorna 1
   se n tem paridade ímpar, e retorna 0 se n tiver par
   paridade */
bool getParity(unsigned int n) 
{ 
    bool parity = 0; 
    while (n) 
    { 
        parity = !parity; 
        n      = n & (n - 1); 
    }         
    return parity; 
} 
/* Main para testar getParity() */
int main() 
{ 
    unsigned int n;
    scanf("%d",&n); 
    printf("Parity of no %d = %s",  n,  
             (getParity(n)? "Impar": "Par")); 
      
    getchar(); 
    return 0; 
} 
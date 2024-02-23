#include <stdio.h>

int operation (int a, int b, int c, int d) __attribute__((cdecl));

int main ()
{

    int result;
    int a, b, c, d;

    printf ("Ingresar el valor de A: ");
    scanf ("%d", &a);
    printf ("Ingresar el valor de B: ");
    scanf ("%d", &b);
    printf ("Ingresar el valor de C: ");
    scanf ("%d", &c);
    printf ("Ingresar el valor de D: ");
    scanf ("%d", &d);

    printf ("\n");	
   
    result = operation(a, b, c, d);

    printf ("El resultado es: (%d * %d) - (%d * %d) = %d\n", a,c,b,d,result);
    printf ("\n");
}

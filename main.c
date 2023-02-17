#include "inc.h"

void sample ( void );
uint16_t sub ( bool_t b, uint16_t *p );

int hoge  ;
int uma ;
int hogehoge ;

void sample ( void )
{
    uint16_t ret;
    uint16_t arg;

    sub ( false, &arg ); /* comment */
    if ( arg == 3U )
    {
    } 
    return ;
} 

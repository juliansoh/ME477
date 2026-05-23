/*
 * Lab <number>
 * Author: <name>
 * Date: <date>
 * Description: <lab exercise description>
 */

/* includes */
#include <stdio.h>
#include "MyRio.h"
#include "T1.h"

/* prototypes */

/* definitions */

int main(int argc, char **argv)
{
	NiFpga_Status status;

    status = MyRio_Open();		    			// open FPGA session
    if (MyRio_IsNotSuccess(status)) return status;

    //my code here
    printf("Hello World!\n");				// Print to console
    printf_lcd("\fHello World!\n");		// Print to LCD display

	status = MyRio_Close();						// close FPGA session

	return status;
}

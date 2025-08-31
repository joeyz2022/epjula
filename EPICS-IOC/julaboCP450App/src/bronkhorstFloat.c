/*
 * readFloat.c
 *
 *  Created on: Mar 20, 2014
 *      Author: user
 */

#include <stdio.h>
#include <aSubRecord.h>
#include <registryFunction.h>
#include <epicsExport.h>

static int readFloat(aSubRecord *precord)
{
	/*
	 * Long variable in precord->a field, needs to reinterpreted as a float
	 * and stored to the output value field precord->vala
	 */
	*((float *)precord->vala) = *((float *)precord->a);

	return 0;
}

static int writeFloat(aSubRecord *precord)
{
	/*
	 * Float variable in precord->a field, needs to reinterpreted as a long
	 * and stored to the output value field precord->vala
	 */
	*((long *)precord->vala) = *((long *)precord->a);

	return 0;
}


epicsRegisterFunction(readFloat);
epicsRegisterFunction(writeFloat);




#include <iostream>

#include "Misc/String.h"
#include "Misc/Console.h"

int main()
{
	Singularity::String test = Singularity::String( "First working string in %s\n", "Singularity");

	std::cout << test.ToChar();
	std::cin.ignore();

	return 0;
}
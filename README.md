# GeneticAlgorithm
Authors : Esmé James & Wilfried Pouchous

## Description

A mono-objective genetic algorithm containing user inputs for:
* Genetic Algorithm parameters (Population size, crossover and mutation probabilities, etc)
* A choice between two functions : Rosenbrock or Griewank
* A choice of the selection process (RWS, Kill Tournament, SUS)
* A choice between multiple crossover options (single-point, multi-point, uniform, whole and local aritmetic, BLX-0.5, simulated binary, three parent)
* A choice between multiple mutation options (bit-flip, uniform, boundary, non-uniform, normal, polynomial)
* A choice for the end-criteria
* ...

All generations are saved into a generation_data.mat file and the first and last generations are plotted onto a figure and the end of the program.

## File organisation

The Genetic Algorithm is contained in the "AlgoGenetique" folder, containing each step of the algorithm in sub-folders (initialisation, evaluation, slection, ...).
The program is launched by executing the main.m file.
A folder called "Problemes" contains the functions to test the algorithm.

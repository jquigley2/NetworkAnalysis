#Statistical Analysis of Network Data with R
#Chapter 2: Manipulating Netword Data

install.packages("sand")
library(sand) #Statistical Analysis of Netword Date with R
?sand
install_sand_packages()

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install()

#Network- a collection of elements and their inter-relations.

#Graph- a collection of vertices and edges

#igraph- a library and package for network analysis

#2.2 Creating Network Graphs################################
#2.2.1 Undirected and Directed Graphs ######################

#Formally, a graph G = (V,E) is a mathematical structure consisting of a set V of vertices (aka nodes) and a set of E edges (aka links),
# where elements of E are unordered pairs {u, v} of distinct vertices u,v Element V.

#order - the number of Vertices Nv - |V|
#size- the number of edges Ne = |E|

#For small, toy graphs, the function graph.formula can be used:
library(igraph)
?graph.formula
g <- graph.formula(1-2, 1-3, 2-3, 2-4, 3-5, 4-5, 4-6, 4-7, 5-6, 6-7) #list of all vertex connections

V(g) #list the vertices
E(g) #list the edges
str(g) #structure of g
plot(g) #visual representation

#undirected graph- a graph with no ordering in the vertices defining an edge

#directed graph- a graph for which each edge has an ordering to its vertices

#directed edge/arc- edges in a directed graph, which move from heaad to tail.  A mutual edge goes in both directions.

dg <- graph.formula(1-+2, 1-+3, 1-+4, 2-+5, 2-+6)
V(dg)$name <- c("SpiritAerospace", "Boeing","Textron","LockheedMartin","UnitedAirlines","AirLeaseCorp")
print_all(dg)
plot(dg)

#2.2.2 Representations for Graphs ######################
#3 basic formats of data files:
#1.) adjacency lists: an array of size Nv, ordered with respect to the ordering of the vertices, each element of which is a list, 
#where the ith list contains the set of all vertices j for which there is an edge from i to j.
print_all(dg)

#2.) edge lists: a simple two column list of all vertex pairs joined by an edge.
E(dg)
get.edgelist(dg)

#3.) adjacency matrices: non-zero for entries whose row-column indices (i,j) correspond to vertices in G joined by an edge, from i to j, and zero
# for those that are not.  The matrix will be symmetric for undirected graphs:
get.adjacency(g)
get.adjacency(dg)

?graph.adjlist
?graph.edgelist
?graph.adjacency
?read.graph
?write.graph











































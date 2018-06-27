#https://briatte.github.io/ggnet/

library(GGally)
library(network)
library(sna)

# random graph
net = rgraph(10, mode = "graph", tprob = 0.5) #generates a sample network, 10 nodes, 50% chance of connection
?rgraph

net = network(net, directed = FALSE) 
?network

# vertex names
network.vertex.names(net) = letters[1:10] #names nodes a-j

ggnet2(net) #basic grapho fo this network
?ggnet2

#Adjusting Node Shape, Size, Color, and Transparency
ggnet2(net, node.size = 6, node.color = "black", edge.size = 1, edge.color = "grey")

#Node.size and node.color can be abbreviated:
ggnet2(net, size = 6, color = "black", edge.size = 1, edge.color = "grey")

#Can pass a vector of node colors if the vector has the same number of elements
#as the network:
ggnet2(net, size = 6, color = rep(c("green", "red"),5), edge.size = 1, edge.color = "grey")

#Nodes can be placed according to any algo provided by the sna package:
ggnet2(net, mode = "adj")
ggnet2(net, mode = "circle")
ggnet2(net, mode = "circrand")
ggnet2(net, mode = "eigen")
ggnet2(net, mode = "fruchternareingold")
ggnet2(net, mode = "geodist")
ggnet2(net, mode = "hall")
ggnet2(net, mode = "kamadakawai")
ggnet2(net, mode = "mds")
ggnet2(net, mode = "princcord")
ggnet2(net, mode = "random")
ggnet2(net, mode = "segeo")
ggnet2(net, mode = "seham")
ggnet2(net, mode = "spring")
ggnet2(net, mode = "springrepulse")
ggnet2(net, mode = "target")

#Can also pass the options to the the algo through the "layout.par" argument:
ggnet2(net, layout.par = list(cell.jitter = 0.75))
ggnet2(net, mode = "target", layout.par = list(niter=100))


#Mapping varable to Node color:
#This creates a vertex indicating whether a label is a vowel or consonant:
net %v% "phono" = ifelse(letters[1:10] %in% c("a", "e","i"), "vowel", "consonant")

#Now, pass to the "color" argument:
ggnet2(net, color = "phono") 

#ggnet uses a greayscale by default.
#3 options to modify this:

#1.) "Hard Code" the colors by assigning them to a vertex attribute, then passing attribute to ggnet2:
net %v% "color" = ifelse(net %v% "phono" == "vowel", "steelblue", "tomato")
ggnet2(net, color="color")

#2a.) Pass the color legend as a named vector through the "pallette" argument:
ggnet2(net, color = "phono", palette = c("vowel" = "steelblue", "consonant" = "tomato"))


#2b.) Generate the color vector on the fly via a function call:
ggnet2(net, color = ifelse(net %v% "phono" == "vowel", "steelblue", "tomato"))


#3.) Or, use a pre-defined color palette:
ggnet2(net, color="phono", palette = "Set2")


####Node Sizes#######
#Nodes are often sized by centrality or another indicator.
#The size argiment og ggnet2 can take a single numeric value, a vector of names, or a vertex attribute.
































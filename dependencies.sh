#!/bin/bash
set -e
# DEPENDENCIES:
# stack
# graphviz
# feh
# 
########################################

# get all the nodes in a `.dot` graph
function dot2nodes() {

sed "1,1d; $d" | tr -cd '([:alnum:]|[\-\.]|[\n >])' | grep -F '>' | sed 's/ -> /\n/' | sort | uniq | sed '/^[[:space:]]*$/d'

# NOTES
#
# delete the first line(/row) and the last one
# sed "1,1d; $d"
#
# sed '/^[[:space:]]*$/d
# delete blank lines (matching any sequence of whitespace characters)
# 
# TODO make less hacky, c.f. the filtering of `Cabal`'s dependencies:  grep -E -v "^(Cabal-|ghci-)" 

}

########################################

DIRECTORY=metadata

DOT_FILE="$DIRECTORY/dependencies.dot"
TEXT_FILE="$DIRECTORY/dependencies.txt"
IMAGE_FILE="$DIRECTORY/dependencies.png"

########################################

mkdir -p "$DIRECTORY"

#TODO
# ./environment.sh --pure --arg packageDotNix "./nix/validation-warning_only-library.nix" --arg minimalDependencies true --run "./generate-dependencies.sh > $DOT_FILE"

# generate the transitive dependencies:

stack dot --no-include-base --external > "$DOT_FILE"
# --prune x,y,z

# boot libraries (?):
# 
# array
# binary
# bytestring
# containers
# deepseq
# directory
# ghc-boot-th
# pretty
# process
# rts
# time

########################################

cat "$DOT_FILE" | dot2nodes > "$TEXT_FILE"

echo 
echo '========================================'
echo '[the dependencies]'
echo 
cat "$TEXT_FILE"

echo 
echo '========================================'
echo '[the number of dependencies]'
echo 
cat "$TEXT_FILE" | wc -l 

########################################

echo 
echo '========================================'
echo '[the image]'
echo 
dot -Tpng "$DOT_FILE" -o "$IMAGE_FILE"

feh "$IMAGE_FILE"

########################################

 #       dot draws directed graphs.  It works well on directed acyclic graphs and other graphs that can be drawn as hierarchies  or
 #       have a natural ``flow.''

 #       neato  draws undirected graphs using a ``spring'' model and reducing the related energy (see Kamada and Kawai, Information
 #       Processing Letters 31:1, April 1989).

 #       twopi draws graphs using a radial layout (see G. Wills, Symposium on Graph Drawing GD'97,  September,  1997).  Basically,
 #       one  node  is chosen as the center and put at the origin.  The remaining nodes are placed on a sequence of concentric cir‐
 #       cles centered about the origin, each a fixed radial distance from the previous circle.  All nodes distance 1 from the cen‐
 #       ter  are placed on the first circle; all nodes distance 1 from a node on the first circle are placed on the second circle;
 #       and so forth.

 #       circo draws graphs using a circular layout (see Six and Tollis, GD '99 and ALENEX '99, and Kaufmann and  Wiese,  GD  '02.)
 #       The  tool  identifies  biconnected components and draws the nodes of the component on a circle. The block‐cutpoint tree is
 #       then laid out using a recursive radial algorithm. Edge crossings within a circle are minimized by placing as many edges on
 #       the circle's perimeter as possible.  In particular, if the component is outerplanar, the component will have a planar lay‐
 #       out.  If a node belongs to multiple non‐trivial biconnected components, the layout puts  the  node  in  one  of  them.  By
 #       default, this is the first non‐trivial component found in the search from the root component.

 #       fdp  draws undirected graphs using a ``spring'' model. It relies on a force‐directed approach in the spirit of Fruchterman
 #       and Reingold (cf. Software‐Practice & Experience 21(11), 1991, pp. 1129‐1164).

 #       sfdp also draws undirected graphs using the ``spring'' model described above, but it uses a multi-scale approach  to  pro‐
 #       duce layouts of large graphs in a reasonably short time.

 #       patchwork  draws the graph as a squarified treemap (see M. Bruls et al., ``Squarified treemaps'', Proc. Joint Eurographics
 #       and IEEE TCVG Symp. on Visualization, 2000, pp. 33-42). The clusters of the graph are used to specify the tree.

 #       osage draws the graph using its cluster structure. For a given cluster, each of its subclusters is  laid  out  internally.
 #       Then the subclusters, plus any remaining nodes, are repositioned based on the cluster's pack and packmode attributes.
 # Manual page dot(1) line 20 (press h for help or q to quit)

########################################



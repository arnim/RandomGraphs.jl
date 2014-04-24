Watts-Strogatz graphs
~~~~~~~~~~~~~~~~~~~~~

The `Watts–Strogatz
model <https://en.wikipedia.org/wiki/Watts_and_Strogatz_model>`_ is a random
graph generation model that produces graphs with small-world properties,
including short average path lengths and high clustering.

.. py:function:: watts_strogatz_graph(g, n, k, beta)

    Adjust the edges between vertices 1:n of the graph ``g`` in accordance with the Watts-Strogatz model.

    :param g:           the input graph
    :param n:           the number of vertices between which to adjust edges
    :param k:           the base degree of each vertex (n > k, k >= 2, k must be even.)
    :param beta:        the probability of each edge being "rewired".

    :returns: the graph ``g``.

.. py:function:: watts_strogatz_graph(n, k, beta)

    Convenience function to construct an ``n``-vertex Watts-Strogatz graph as an incidence list.

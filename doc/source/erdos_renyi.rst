Erdős–Rényi graphs
~~~~~~~~~~~~~~~~~~

The `Erdős–Rényi model <https://en.wikipedia.org/wiki/Erd%C5%91s%E2%80%93R%C3%A9nyi_model>`_ sets an edge between each pair of vertices with equal
probability, independently of the other edges.

.. py:function:: erdos_renyi_graph(g, n, p[; has_self_loops=false])

    Add edges between vertices 1:n of graph ``g`` randomly, adding each possible edge with probability ``p`` independently of all others.

    :param g:           the input graph
    :param n:           the number of vertices between which to add edges
    :param p:           the probability with which to add each edge
    :param has_self_loops:      whether to consider edges ``v -> v``.

    :returns: the graph ``g``.

.. py:function:: erdos_renyi_graph(n, p[, has_self_loops=false])

    Convenience function to construct an ``n``-vertex Erdős–Rényi graph as an incidence list.

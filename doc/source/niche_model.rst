Niche model graphs
~~~~~~~~~~~~~~~~~~

The `Niche model <http://www.nature.com/nature/journal/v404/n6774/abs/404180a0.html>`_ is
used to generate realistic random graphs resembling predator-prey networks, or food webs. Its inputs
are a number of species, and expected connectance (density)

.. py:function:: niche_model_graphs(g, S, C)

   Generates one random model with ``S`` species

   :param S: number of species (vertices)
   :param C: expected connectance (density), between 0 (no arcs) and 1 (complete graph)

   :returns: the directed graph ``g``

.. py:function:: niche_model_graph(S, C)

   Convenience function to generate a graph using the niche model

# Mixing of the No-U-Turn Sampler and the Geometry of Gaussian Concentration

This repository contains a functional implementation of NUTS in the standard Gaussian target used to produce Figures 4 and 5 in the paper 'Mixing of the No-U-Turn Sampler and the Geometry of Gaussian Concentration' by Nawaf Bou-Rabee and Stefan Oberdörster.

## Use guide

To reproduce Figure 4, first run 'figure4_data.m' to produce and save the required data, followed by 'figure4_plot.m'.

To reproduce Figure 5, first run 'figure5_data.m' to produce and save the required data, followed by 'figure5_plot.m'.

To experiment with NUTS in the standard Gaussian target, use:

nuts.m                containing a function making one NUTS transition

nuts_sync_coupling.m  containing a function synchronously coupling two transitions of NUTS

The remaining files contain functions called by nuts and nuts_sync_coupling

## License and Citation
Code is released under MIT License.
Please cite the following paper if the code helps your research:

    @article{BouRabeeOberdoersterNUTSandGaussianGeometry,
      title={Mixing of the No-U-Turn Sampler and the Geometry of Gaussian Concentration},
      author={Bou-Rabee, Nawaf and Oberd\"orster, Stefan},
      journal={arXiv preprint},
      year={2024}
    }

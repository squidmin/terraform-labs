# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Terraform Labs'
copyright = '2024, James Morse'
author = 'James Morse'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    'recommonmark',
    'sphinx_rtd_theme',
]

# Paths to look for files (here we include the project root and subdirectories)
source_suffix = {
    '.rst': 'restructuredtext',
    '.md': 'markdown',
}

# The master toctree document.
master_doc = 'index'

# -- Options for HTML output -------------------------------------------------

html_theme = 'furo'
html_static_path = ['_static']
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and directories to ignore when looking for source files.
exclude_patterns = [
    'lib/python3.12/site-packages/**',
    'README.md',
]

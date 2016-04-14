import sys
import os

# project variables
project = u'iOS SDK'
copyright = u'2016, SuperAwesome Ltd'
author = u'Gabriel Coman'
version = u'<iossdk_version>'
release = u'<iossdk_version>'

# theme config
html_theme = 'satheme'
html_theme_options = {"logo_only":True}
html_theme_path = ["themes",]
html_logo = 'themeres/logo.png'
html_context = {
    'all_versions' : [u'3.8.1'],
    'domain': 'AwesomeAds',
    'sourcecode': '<iossdk_source>'
}

# aux vars
extensions = []
templates_path = ['_templates']
source_suffix = '.rst'
master_doc = 'index'
language = None
exclude_patterns = []
show_authors = True
pygments_style = 'sphinx'
todo_include_todos = False

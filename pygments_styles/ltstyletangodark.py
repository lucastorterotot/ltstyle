# -*- coding: utf-8 -*-
"""
    pygments.styles.tangodark
"""

from pygments.style import Style
from pygments.token import Keyword, Name, Comment, String, Error, \
     Number, Operator, Generic, Whitespace, Punctuation, Other, Literal


class ltTangodarkStyle(Style):
    """
    ltstyle dark theme based on the tango dark palette.
    """

    # work in progress...

    background_color = "#2e3436"
    highlight_color = '#383e40'
    default_style = "#eeeeee"
    
    styles = {
        # No corresponding class for the following:
        #Text:                     "", # class:  ''
        Whitespace:                "underline #2e3436",      # class: 'w'
        Error:                     "#a40000 border:#ef2929", # class: 'err'
        Other:                     "#eeeeee",                # class 'x'

        Comment:                   "italic #6ad216", # class: 'c'
        Comment.Multiline:         "italic #6ad216", # class: 'cm'
        Comment.Preproc:           "noitalic #6ad216", # class: 'cp'
        Comment.Single:            "italic #6ad216", # class: 'c1'
        Comment.Special:           "noitalic bold #6ad216", # class: 'cs'

        Keyword:                   "bold #B4FA70",   # class: 'k'
        Keyword.Constant:          "bold #B4FA70",   # class: 'kc'
        Keyword.Declaration:       "bold #B4FA70",   # class: 'kd'
        Keyword.Namespace:         "bold #B4FA70",   # class: 'kn'
        Keyword.Pseudo:            "bold #B4FA70",   # class: 'kp'
        Keyword.Reserved:          "bold #B4FA70",   # class: 'kr'
        Keyword.Type:              "bold #B4FA70",   # class: 'kt'

        Operator:                  "bold #eeeeee",   # class: 'o'
        Operator.Word:             "bold #B4F470",   # class: 'ow' - like keywords

        Punctuation:               "bold #eeeeee",   # class: 'p'

        # because special names such as Name.Class, Name.Function, etc.
        # are not recognized as such later in the parsing, we choose them
        # to look the same as ordinary variables.
        Name:                      "#eeeeee",        # class: 'n'
        Name.Attribute:            "#c4a000",        # class: 'na' - to be revised
        Name.Builtin:              "#d787d7",        # class: 'nb'
        Name.Builtin.Pseudo:       "#d6aed6",        # class: 'bp'
        Name.Class:                "#87d7ff",        # class: 'nc' - to be revised
        Name.Constant:             "#eeeeee",        # class: 'no' - to be revised
        Name.Decorator:            "bold #5c35cc",   # class: 'nd' - to be revised
        Name.Entity:               "#ce5c00",        # class: 'ni'
        Name.Exception:            "bold #87d7ff",   # class: 'ne'
        Name.Function:             "#ffd75f",        # class: 'nf'
        Name.Property:             "#eeeeee",        # class: 'py'
        Name.Label:                "#f57900",        # class: 'nl'
        Name.Namespace:            "#eeeeee",        # class: 'nn' - to be revised
        Name.Other:                "#eeeeee",        # class: 'nx'
        Name.Tag:                  "bold #B4FA70",   # class: 'nt' - like a keyword
        Name.Variable:             "#ffaf5f",        # class: 'nv' - to be revised
        Name.Variable.Class:       "#ffaf5f",        # class: 'vc' - to be revised
        Name.Variable.Global:      "#ffaf5f",        # class: 'vg' - to be revised
        Name.Variable.Instance:    "#ffaf5f",        # class: 'vi' - to be revised

        # since the tango light blue does not show up well in text, we choose
        # a pure blue instead.
        Number:                    "bold #eeeeee",   # class: 'm'
        Number.Float:              "bold #eeeeee",   # class: 'mf'
        Number.Hex:                "bold #eeeeee",   # class: 'mh'
        Number.Integer:            "bold #eeeeee",   # class: 'mi'
        Number.Integer.Long:       "bold #eeeeee",   # class: 'il'
        Number.Oct:                "bold #eeeeee",   # class: 'mo'

        Literal:                   "#eeeeee",        # class: 'l'
        Literal.Date:              "#eeeeee",        # class: 'ld'

        String:                    "#E9B96E",        # class: 's'
        String.Backtick:           "#E9B96E",        # class: 'sb'
        String.Char:               "#E9B96E",        # class: 'sc'
        String.Doc:                "italic #6ad216", # class: 'sd' - like a comment
        String.Double:             "#E9B96E",        # class: 's2'
        String.Escape:             "#E9B96E",        # class: 'se'
        String.Heredoc:            "#E9B96E",        # class: 'sh'
        String.Interpol:           "#E9B96E",        # class: 'si'
        String.Other:              "#E9B96E",        # class: 'sx'
        String.Regex:              "#E9B96E",        # class: 'sr'
        String.Single:             "#E9B96E",        # class: 's1'
        String.Symbol:             "#E9B96E",        # class: 'ss'

        Generic:                   "#eeeeee",        # class: 'g'
        Generic.Deleted:           "#a40000",        # class: 'gd'
        Generic.Emph:              "italic #eeeeee", # class: 'ge'
        Generic.Error:             "#ef2929",        # class: 'gr'
        Generic.Heading:           "bold #000080",   # class: 'gh'
        Generic.Inserted:          "#00A000",        # class: 'gi'
        Generic.Output:            "italic #eeeeee", # class: 'go'
        Generic.Prompt:            "#6ad216",        # class: 'gp'
        Generic.Strong:            "bold #eeeeee",   # class: 'gs'
        Generic.Subheading:        "bold #800080",   # class: 'gu'
        Generic.Traceback:         "bold #a40000",   # class: 'gt'
    }

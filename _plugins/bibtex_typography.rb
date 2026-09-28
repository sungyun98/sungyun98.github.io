# BibTeX filters for LaTeX typography that jekyll-scholar does not convert.
# Enabled by name in `scholar.bibtex_filters` in _config.yml. They must run
# before the `latex` filter, which strips the braces these patterns rely on.
module Jekyll
  class Scholar
    # \textsubscript{...} -> <sub>...</sub>
    class Subscript < BibTeX::Filter
      def apply(value)
        value.to_s.gsub(/\\textsubscript(\{(?:[^{}]|\g<1>)*\})/) {
          "<sub>#{$1[1..-2]}</sub>"
        }
      end
    end

    # \textminus -> U+2212 MINUS SIGN (latex-decode has no mapping for it)
    class Textminus < BibTeX::Filter
      def apply(value)
        value.to_s.gsub(/\\textminus(?![A-Za-z])(?:\{\}|\s*)/, "−")
      end
    end
  end
end

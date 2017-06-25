module Linter
  module_function

  def markdown
    settings = [hedge_words]
    settings << alex if which("alex")
    settings << write_good if which("write-good")
    settings
  end

  def alex
    {
      name: "Alex",
      version: `'#{which("alex")}' --version`,
      output_command: "'#{which("alex")}' '#{filepath}' --why",
      line_column_match: /(\d+):(\d+)-(\d+):(\d+) /,
      extra_gsubs: {
        /^\s+/ => "",
        /⚠ \d+ warnings?/ => "",
        /warning\s+/ => "",
        %r{^(\.\./?)*#{filepath}} => "",
        filename => "",
        ": no issues found" => "",
      },
    }
  end

  def write_good
    {
      name: "Write Good",
      version: `'#{which("write-good")}' --version`.gsub("write-good version ", " "),
      output_command: "'#{which("write-good")}'",
      line_column_match: /on line (\d+) at column (\d+)/,
      extra_gsubs: {
        "In #{filepath}" => "",
        /^=+$/ => " ",
        /^-+$/ => "\n ",
      },
    }
  end

  def self.hedge_words
    matches = []
    File.read(filepath).to_s.lines.each_with_index do |line, line_number|
      HEDGE_WORDS.each do |word|
        offset = 0
        while (column = line.index(/(^|[^a-z])#{word}([^a-z]|$)/i, offset))
          matches << "L#{line_number + 1}:C#{column + 1} warning: used hedge word '#{word}'"
          offset = column + 1
        end
      end
    end
    {
      name: "hedge words list",
      output: matches.join("\n"),
      line_column_match: /L(\d+):C(\d+) /,
    }
  end

  # MIT License
  # Copyright (c) 2014 lexicalunit@lexicalunit.com
  # https://github.com/lexicalunit/linter-just-say-no/blob/master/resources/hedges.cson
  HEDGE_WORDS = [
    "a bit",
    "a little",
    "a tad",
    "a touch",
    "almost",
    "apologize",
    "apparently",
    "appears",
    "around",
    "basically",
    "bother",
    "could",
    "does that make sense",
    "effectively",
    "evidently",
    "fairly",
    "generally",
    "hardly",
    "hopefully",
    "I am about",
    "I think",
    "I will try",
    "I'll try",
    "I'm about",
    "I'm just trying",
    "I'm no expert",
    "I'm not an expert",
    "I'm trying",
    "in general",
    "just about",
    "just",
    "kind of",
    "largely",
    "likely",
    "mainly",
    "may",
    "maybe",
    "might",
    "more or less",
    "mostly",
    "nearly",
    "overall",
    "partially",
    "partly",
    "perhaps",
    "possibly",
    "presumably",
    "pretty",
    "probably",
    "quite clearly",
    "quite",
    "rather",
    "really quite",
    "really",
    "seem",
    "seemed",
    "seems",
    "some",
    "sometimes",
    "somewhat",
    "sorry",
    "sort of",
    "suppose",
    "supposedly",
    "think",
  ].freeze
end

module Linter
  module_function

  def json
    {
      name: "JSONLint",
      version: `'#{which("jsonlint")}' --version`,
      output_command: "'#{which("jsonlint")}' --compact --quiet",
      line_column_match: /#{filepath}: line (\d+), col (\d+), /,
    }
  end
end

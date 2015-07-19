// PEG grammar for parsing the OpenUserJS metadata block

/*
Test the generated parser with some input for PEG.js site at http://pegjs.org/online:

// ==OpenUserJS==
// @author          Marti
// @collaborator    sizzle
// ==/OpenUserJS==

*/

// Uncomment to parse an entire metadata block for PEG.js site.
// e.g. for testing/development only

/*
block =
  '// ==OpenUserJS==\n'
  lines:line*
  '// ==/OpenUserJS==' ('\n'?)
  {
    return lines;
  }
*/


line =
  '// @'
  keyphrase:
    (
      keyphrase1 /
      keysphrase1
    )
  '\n'?
  {
    return keyphrase;
  }

whitespace = [ \t\n]+
non_whitespace = $[^ \t\n]+
non_newline = $[^\n]+

keyphrase1 =
  key:
    (
      'author'
    )
  whitespace
  value: non_newline
  {
    return {
      key: key,
      value: value,

      unique: true,
      keyword: key
    };
  }

keysphrase1 =
  key:
    (
      'collaborator'
    )
  whitespace
  value: non_newline
  {
    return {
      key: key,
      value: value,

      keyword: key
    };
  }

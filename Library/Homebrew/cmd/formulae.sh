#:  * `formulae`
#:
#:  Prints a sorted list of locally available formulas including shortnames.
#:

# shellcheck disable=SC2155
homebrew-formulae() {
  local formulae="$(
    find "$HOMEBREW_REPOSITORY"/Library/Taps -type d \( -name Casks -o -name spec -o -name lib -o -name cmd -o -name .github \) -prune -false -o -name '*\.rb' |
    sed -E -e 's/\.rb//' -e 's .*/Taps/(.*)/homebrew- \1/ ' -e 's /Formula/ / ')"
  local shortnames="$(echo "$formulae" | cut -d / -f 3)"
  echo -e "$formulae \n $shortnames" | grep -v '^homebrew/' | sort -uf
}

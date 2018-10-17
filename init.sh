#!/bin/sh

. "$(git --exec-path)/git-sh-setup"

require_work_tree
cd_to_toplevel

if [ ! -f .git/hooks/pre-commit ]; then
  cp .git/hooks/pre-commit.sample .git/hooks/pre-commit
  chmod a+x .git/hooks/pre-commit
  sed -i'' 's/exec git diff-index/#&/' .git/hooks/pre-commit
  cat >> .git/hooks/pre-commit << 'EOF'

# verify that the SMTP_PASS is not committed
if git grep -q --cached '^\s*SMTP_PASS' -- .cygport.conf
then
  >&2 echo "Error: Attempt to commit the SMTP_PASS in .cygport.conf."
  exit 1
fi
EOF
fi

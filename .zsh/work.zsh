# Aliases for 1win projects
#
alias pyt='pytest -sx --ff'
alias pytv='pytest -slv --ff'
alias pytdb='pytest --ff --pdb'
alias pytcov='pytest --cov-report=term'

alias poeti='poetry install'
alias poetl='poetry lock'
alias poetu='poetry update'
alias poeta='poetry add'
alias poetad='poetry add --dev'
alias poetact='poetry shell'
alias poetb='poetry build'

alias aleup='alembic upgrade head'
alias alerev='alembic revision --autogenerate -m'

alias proj_name="basename $PWD"
alias newmr="lab mr create origin dev -d -s -a roman.voropaev -m"
alias tox="tox && say success || say fail"
alias xot="flake8 $(proj_name) tests && pylint $(proj_name) && mypy $(proj_name)"
alias dbsh="pgcli -h localhost -p 5436 -u $(proj_name) $(proj_name)"

alias work="docomp up -d minio postgres redis"
alias nowork="docomp down"

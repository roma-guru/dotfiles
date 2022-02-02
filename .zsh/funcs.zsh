alias func=function
alias def=function

def trash {
    mv $1 ~/.Trash
}
func ipinfo() {
    curl ipinfo.io/$1
}
def pypkg() {
    mkdir $1 && touch $1/__init__.py
}

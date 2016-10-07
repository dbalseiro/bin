function main() {
    while true; do
        mostrarlistado $servers

        while elegir $servers; do
            echo "error"
        done

    done
}

function mostrarlistado() {
    clear
    cat $1 | cut -f1 -d"#" | numerar
}

function numerar() {
    n=1
    while read line ; do
        echo "$n) $line"
        let n+=1
    done
}

function elegir() {
    cmd=$2
    if [ "$2" == "" ]; then
        cmd=ejecutar
    fi
    echo -n "[1-$(maximo $1)]? "
    read r
    if [ "$r" == "" ]; then
        clear
        exit
    fi
    if ! [[ "$r" =~ [1-9].* ]]; then
        return 0
    else
        $cmd $r
        return 1
    fi
}

function maximo() {
    wc -l $1 | awk '{ print $1 }'
}



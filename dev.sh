HERE=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
project_name_cache=./cache/current_project

case $1 in
    -b)
        # cat $project_name_cache | xargs -I {} cd ./main/{} && pwd
        proj=$(cat $project_name_cache)
        cd ./main/$proj
        cargo build
    ;;
    -br)
        proj=$(cat $project_name_cache)
        cd ./main/$proj
        cargo build
        cargo run
    ;;
    set)
        shift
        mkdir -p ./cache && echo $1 >$project_name_cache 
    ;;
    new-exe)
        shift
        cd ./main
        cargo new $1 --bin && echo $1 >$project_name_cache
    ;;
    update-rust)
        rustup update
    ;;
    *)
        echo "bad option"
        echo $1
    ;;
esac

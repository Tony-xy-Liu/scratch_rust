HERE=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
project_name_cache=./cache/current_project

# https://doc.rust-lang.org/cargo/index.html
# https://web.mit.edu/rust-lang_v1.25/arch/amd64_ubuntu1404/share/doc/rust/html/book/second-edition/ch01-00-introduction.html

case $1 in
    -b)
        # rustup target add x86_64-unknown-linux-musl
        proj=$(cat $project_name_cache)
        cd ./main/$proj
        cargo build --target=x86_64-unknown-linux-musl
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

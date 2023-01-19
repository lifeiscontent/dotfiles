help() {
    echo "Usage: ./install.sh sudo use_touch_id"
    exit 1
}

task() {
    case "$1" in
    use_touch_id) sh $(uname -s)/sudo/use_touch_id.sh ;;
    *) help ;;
    esac
}

case "$1" in
sudo) task $2 ;;
*) help ;;
esac

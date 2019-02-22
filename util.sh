work_dir=`pwd`/output
export PATH="${work_dir}/sbin:$PATH"
bin_vec=(``)
bin_vec[0]="stop"
stop() {
    echo "stop"
    nginx -p ${work_dir} -s stop
}
bin_vec[1]="start"
start() {
    echo "start"
    nginx -p ${work_dir} -c ${work_dir}/conf/hello_nginx.conf
    sleep 1
    pid=`ps -ef | grep "nginx" | grep -v "grep" | awk '{print $2}'`
    echo $pid > pid
}
bin_vec[2]="info"
info() {
    echo "info"
    netstat -nlt | grep 8080
    lsof -i tcp:8080
}
bin_vec[3]="restart"
restart() {
    echo "restart"
    nginx -p ${work_dir} -s stop
    nginx -p ${work_dir} -c ${work_dir}/conf/hello_nginx.conf
    sleep 1
    pid=`ps -ef | grep "nginx" | grep -v "grep" | awk '{print $2}'`
    echo $pid > pid

}
bin_name=$1
help=1
for((i=0;i<${#bin_vec[*]};i++))
do
    if [ "${bin_vec[$i]}" = "$bin_name" ];then
        shift 1
        help=0
        ${bin_vec[$i]}
    fi
done

if [ $help -eq 1 ];then
    echo "opt is :"
    for((i=0;i<${#bin_vec[*]};i++))
    do
        echo "[${bin_vec[$i]}]"
    done
fi

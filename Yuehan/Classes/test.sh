#文件下载目录
destmp="/Users/gelei/Downloads/tmp"
#项目工程目录
projectDir="/Users/gelei/Desktop/testcode/LogNSNullRegex/LogNSNullRegex"


JQ_EXEC=`which jq`
echo $JQ_EXEC
FILE_PATH='/Users/gelei/Desktop/testcode/Yuehan/Yuehan/Classes/pack.json'
#获取数组长度
count=$(cat $FILE_PATH | jq '.url | length')

for((i=0;i<$count;i++));
do
#url
url=$(jq ".url[${i}]" $FILE_PATH )
#下载文件,在download文件夹下的tmp目录
url="wget -P $destmp $url"
#移除字符串中的双引号""
url=$(echo $url | sed 's/\"//g')
echo $url
#执行下载
$url
done

#打开下载目录
cd $destmp
#解压所有的文件
find . -name '*.zip' -exec unzip {} \;
#解压完成以后删除
find . -type f -name '*.zip' -delete


#遍历该文件夹下的所有文件,获取文件名
function read_dir(){
    for file in `ls $1`
    do
        if [ -d $1"/"$file ]
        then
            read_dir $1"/"$file
        else
        #判断是否是图片资源
        
#文件路径
#            echo $1"/"$file
#file即为文件名
            echo $file
            #与项目目录下的文件进行匹配,podsPath已经在spec中获取了,实际目录自定义,这里假定一个目录
            #gerp命令拼接
            gre="grep -rn $file $projectDir/*"
            #执行gerp
            $gre
            
            #获取gre结果
            
#            if [ -z $result ]
#            then
#            echo "================Success"
#            else
#            echo "================Fail"
#            fi
        fi
    done
}
read_dir $destmp

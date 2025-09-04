idl_dir=${IDL_DIR:=./idl}
module_name=$(grep '^module' go.mod | awk '{print $2}')
files=$(find $idl_dir -type f -name '*.proto')
if [ $? != 0 ];then
  exit 1
fi
for file in $files
do
  kitex -module $module_name -I $idl_dir $file
  if [ $? != 0 ];then
    exit 2
  fi
done
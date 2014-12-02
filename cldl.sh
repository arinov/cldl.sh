#!/bin/bash
 
# Baskspace @ RusNet
#
# ОПИСАНИЕ:
# Скрипт определяет типы файлов в директории Загрузки,
# создает новые директории для каждого типа и переносит
# в них соответствующие файлы.

echo "CLDL структурирует директорию Загрузки путем ПЕРЕМЕЩЕНИЯ файлов из директории Загрузки в создаваемые скриптом поддиректории в зависимости от типа файла."
echo "Backspace @ RusNet"

# Устанавливает путь к директории, которую нужно очистить
# и переменные с типовыми фразами

DOWN_DIR=~/Загрузки
LBL_SORTED="Уборка завершена!"
LBL_SAVELIST="Полный список файлов и директорий сохранен в"
LBL_JOBLIST="Список файлов на сортировку"
LBL_SURE="Вы уверены, что хотите это сделать? [y/N]"
LBL_NO="Уборка не была завершена..."

read -r -p "$LBL_SURE" response
case $response in
[yY][eE][sS]|[yY])

  # Saving files list in directory before moving
  echo
  echo "$DOWN_DIR $LBL_SAVELIST .list"
  ls $DOWN_DIR -al > "$DOWN_DIR"/.list

  echo "$DOWN_DIR $LBL_JOBLIST:"

  # Ignore directories and move each file into its type subdir
  for file in "$DOWN_DIR"/*; do
    if [ -f "$file" ]; then
      CREATE=$(file -b "$file") && \
      echo "$CREATE" && \
      mkdir -p "$DOWN_DIR"/"$CREATE" && \
      mv -v "$file" "$DOWN_DIR"/"$CREATE"
    fi
  done;

  echo
  echo $LBL_SORTED
  echo
  ;;
*)

  echo $LBL_NO
  ;;

esac

exit

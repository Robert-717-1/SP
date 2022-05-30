#!/bin/bash
LANG="ru_RU.UTF-8"

echo "Developer: Арендт Роберт гр. 718-1"
echo "Программа проверяет содержит ли образ контрольную сумму его содержимого"
echo "Если указанный образ не содержит контрольную сумму его содержимого"
echo "То программа имплантирует в образ контрольную сумму его содержимого"
echo "Если указанный образ содержит контрольную сумму его содержимого"
echo "То выводит значение суммы и проверяет образ на корректность."

while :; do
  echo "Начать выполнение программы(s). Выход(e):"

  read start
  case $start in
    s)
       break
       ;;
    e)
       exit
       ;;
    *)
       echo "Введена неверная команда, повторите ввод"
       ;;
  esac
done


while :; do
  echo "Введите путь к образу:"

  read path
  if [ -f "$path" ]; then
    while :; do
      echo "Выберите действие:"
      echo "1) Проверить содержит ли образ контрольную сумму его содержимого"
      echo "2) Имплантировать в образ контрольную сумму его содержимого"
      echo "3) Вывести значение суммы и проверить образ на корректность"

      read command
      case $command in
        1)
           checkisomd5 "$path"
           break
           ;;
        2)
           implantisomd5 --force $path
           break
           ;;
        3)
           checkisomd5 --verbose $path
           break
           ;;
        *)
           echo "Введена неверная команда, повторите ввод"
           ;;
      esac
    done
    
    while :; do
      echo "Хотите продолжить?(y/n):"
      
      read continue
      case $continue in
        y)
           break
           ;;
        n)
           exit
           ;;
        *)
           echo "Введена неверная команда, повторите ввод"
           ;;
      esac
    done
  else
    while :; do
      echo "Неверный путь. Продолжить(y/n)"
      
      read continue
      case $continue in
        y)
           break
           ;;
        n)
           exit
           ;;
        *)
           echo "Введена неверная команда, повторите ввод"
           ;;
      esac
    done
  fi
done

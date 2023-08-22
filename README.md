# root31337_infra
root31337 Infra repository

Homework 3 (cloud-bastion)

bastion_IP = 51.250.1.33
bastion_local_IP = 10.128.0.19
someinternalhost_IP = 10.128.0.26

Генерируем ssh публичный ключ для пользователя appuser:
$ssh-keygen -t rsa -f ~/.ssh/appuser -C appuser -P ""

Запускаем агент и добавляем ключ для перисылки:
$eval "$(ssh-agent)"
$ssh-add ~/.ssh/appuser

Для подключения к хосту внутри сети через bastion можно использовать команду в одну строку:
$ssh -A -i ~/.ssh/appuser -J  appuser@51.250.1.33 appuser@10.128.0.26

где ключ -J -J (jump) switch

альтернативный вариант использование форвардинг через ProxyCommand (ключ -W):
$ssh appuser@10.128.0.26 -o "proxycommand ssh -W %h:%p -i ~/.ssh/appuser appuser@51.250.1.33"

Для создания алиаса предпологается прописать настройки для хоста в конфиге ~/.ssh/config

Host someinternalhost
  Hostname 10.128.0.26
  ForwardAgent yes
  User appuser
  ProxyJump appuser@51.250.1.33 (либо ProxyCommand ssh -W %h:%p -i ~/.ssh/appuser appuser@51.250.1.33

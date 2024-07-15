sudo service klipper stop

echo
echo Updating git repo..
cd ~/klipper
git pull
echo

# flash pi secondary MCU
make clean KCONFIG_CONFIG=config.secondmcu
make menuconfig KCONFIG_CONFIG=config.secondmcu
make KCONFIG_CONFIG=config.secondmcu
make flash KCONFIG_CONFIG=config.secondmcu

sudo service klipper start


sudo service klipper stop

echo
echo Updating git repo..
cd ~/klipper
git pull
echo

# flash SDCARD MCU
make clean KCONFIG_CONFIG=config.skrmini-3.0-b0
make menuconfig KCONFIG_CONFIG=config.skrmini-3.0-b0
make KCONFIG_CONFIG=config.skrmini-3.0-b0
./scripts/flash-sdcard.sh /dev/ttyS5 btt-skr-mini-e3-v3-b0

# flash pi secondary MCU
make clean KCONFIG_CONFIG=config.secondmcu
make menuconfig KCONFIG_CONFIG=config.secondmcu
make KCONFIG_CONFIG=config.secondmcu
make flash KCONFIG_CONFIG=config.secondmcu

# flash BTT S2DW accelerometer
make clean KCONFIG_CONFIG=config.s2dw
make menuconfig KCONFIG_CONFIG=config.s2dw
make KCONFIG_CONFIG=config.s2dw
make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_rp2040_btt_acc-if00 KCONFIG_CONFIG=config.s2dw

sudo service klipper start


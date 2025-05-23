#!/bin/bash
set -e

echo "Firmware updater for OPace5 Pro"
echo "Use this only for updating firmware on custom ROMs. Using it on stock will get you bricked."
read -p "Press Enter to continue..."

echo "Make sure the device is in bootloader mode before continuing."
read -p "Press Enter to continue..."

fastboot flash modem_a modem.img
fastboot flash modem_b modem.img
fastboot reboot fastboot

# Check if the device is in FastbootD mode
is_userspace=$(fastboot getvar is-userspace 2>&1 | grep -oE "yes|no")
if [[ "$is_userspace" != "yes" ]]; then
    echo "Device failed to enter FastbootD mode."
    echo "Aborting..."
    read -p "Press Enter to exit..."
    exit 1
fi

echo "Device is in FastbootD mode. Proceeding with firmware flash..."

fastboot flash abl_a abl.img
fastboot flash abl_b abl.img
fastboot flash aop_a aop.img
fastboot flash aop_b aop.img
fastboot flash aop_config_a aop_config.img
fastboot flash aop_config_b aop_config.img
fastboot flash bluetooth_a bluetooth.img
fastboot flash bluetooth_b bluetooth.img
fastboot flash cpucp_a cpucp.img
fastboot flash cpucp_b cpucp.img
fastboot flash devcfg_a devcfg.img
fastboot flash devcfg_b devcfg.img
fastboot flash dsp_a dsp.img
fastboot flash dsp_b dsp.img
fastboot flash engineering_cdt_a engineering_cdt.img
fastboot flash engineering_cdt_b engineering_cdt.img
fastboot flash featenabler_a featenabler.img
fastboot flash featenabler_b featenabler.img
fastboot flash hyp_a hyp.img
fastboot flash hyp_b hyp.img
fastboot flash imagefv_a imagefv.img
fastboot flash imagefv_b imagefv.img
fastboot flash keymaster_a keymaster.img
fastboot flash keymaster_b keymaster.img
fastboot flash oplus_sec_a oplus_sec.img
fastboot flash oplus_sec_b oplus_sec.img
fastboot flash oplusstanvbk_a oplusstanvbk.img
fastboot flash oplusstanvbk_b oplusstanvbk.img
fastboot flash qupfw_a qupfw.img
fastboot flash qupfw_b qupfw.img
fastboot flash shrm_a shrm.img
fastboot flash shrm_b shrm.img
fastboot flash splash_a splash.img
fastboot flash splash_b splash.img
fastboot flash tz_a tz.img
fastboot flash tz_b tz.img
fastboot flash uefi_a uefi.img
fastboot flash uefi_b uefi.img
fastboot flash uefisecapp_a uefisecapp.img
fastboot flash uefisecapp_b uefisecapp.img
fastboot flash xbl_a xbl.img
fastboot flash xbl_b xbl.img
fastboot flash xbl_config_a xbl_config.img
fastboot flash xbl_config_b xbl_config.img
fastboot flash xbl_ramdump_a xbl_ramdump.img
fastboot flash xbl_ramdump_b xbl_ramdump.img

echo "Flashing firmware done... If you see any failed messages above, please re-run the script. Otherwise, reboot to the system."
read -p "Press Enter to exit..."
exit 0
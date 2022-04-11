#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
  echo "Please run as sudo with \"sudo /bin/bash 5mp.sh\""
  exit
fi

print_border () {
  echo "=========================================="
}

# Check for LD_PRELOAD
stat /etc/ld.so.preload
LD_PRELOAD_EXISTS=$?
print_border
if [[ $LD_PRELOAD_EXISTS -eq 0 ]]; then
  echo -e "You might be vulnerable to an \e[1;31mLD_PRELOAD Rootkit\e[0m"
  echo -e "\e[1;31mPLEASE CHECK THE FOLLOWING FILES:\e[0m"
  cat /etc/ld.so.preload
else
  echo -e "\e[32mNo LD_PRELOAD Rootkits detected\e[0m"
fi
print_border
if [[ -z $LD_PRELOAD ]]; then
  echo -e "\e[32mEnv var LD_PRELOAD is unset\e[0m"
else
  echo -e "\e[01;31mEnv var LD_PRELOAD is set"
  echo -e "PLEASE CHECK THE FOLLOWING FILES:\e[0m"
  echo $LD_PRELOAD
fi
print_border

# Check if kernel module signing is enabled
SIG_ENFORCE=$(cat /etc/default/grub | grep "module.sig_enforce=1")
if [[ $SIG_ENFORCE == "" ]]; then
  echo -e "\e[33mModule signing not detected,\e[0m please enable it with the following commands:"
  echo "sudo sed -i '/GRUB_CMDLINE_LINUX=/s/\"$/module.sig_enforce=1\"/' /etc/default/grub"
  echo "sudo grub-mkconfig -o /boot/grub/grub.cfg"
  echo "sudo reboot"
else
  echo -e "\e[32mKernel module signing already enabled :)\e[0m"
fi
print_border

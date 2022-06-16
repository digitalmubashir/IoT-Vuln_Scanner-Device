# Vulnerability Scanner for IoT Devices
## Project Abstract:

In 2021, the estimated number of IoT devices in the world is 23.14 billion, it is expected that by 2022, there will be an estimated 30.73 billion IoT devices. As time passes, more and more IoT devices are being introduced into the average household. More connected devices will mean greater security threats and more points of entry into your home network. In a survey of 5000 enterprises, 85% of these are in the process of deploying IoT devices, but only 10% are confident that they can secure these devices. This statistic shows that there will be a serious demand for IoT security in the coming years. 

The goal of this project is to put a vulnerability scanner on a Raspberry Pi which will have the ability to scan your internal network and inform you of potential security issues on your network. This device will tell you what ports are open, the OS running on each device and will also detect new devices added to the network. This will allow the user to quickly identify which IoT devices on their network require security attention. This project will involve finding out what are the most common vulnerabilities in IoT devices, what devices are most commonly infected, steps which a user can take to prevent infection and the use a threat actor has for taking control of your IoT device.

## How to Create your Own Raspberry Pi Vulnerability Scanner:

Depending on your technical background, creating your own RPi vulnerability scanner may be extremely straightforward or extremely difficult. If you’ve never used a command line or terminal before, you may struggle to follow these steps. If you’d rather not struggle, email us at mubashirinstaa@gmail.com, and we’d be happy to send you a pre-configured device.

For everyone else, let’s dive in.

## Ingredients:

If you’re going to make a Raspberry Pi vulnerability scanner, you’re going to need some ingredients:

1. CanaKit Raspberry Pi 4, 4GB RAM Started Kit
2. Ethernet Cable
3. USB Keyboard and USB Mouse
4. Computer Monitor (with HDMI port)

It’s likely you already own items 2-4, but we’ve included everything you could possibly need to be sure. We linked some items on Amazon for convenience, but feel free to look around and find something else equivalent.

## Directions:

Preparing the Pi

- Install Raspberry Pi Imager for your Operating System (https://www.raspberrypi.org/downloads/)

- After it downloads, open the Imager, plug your Raspberry Pi micro SD card into the USB adapter and plug the USB adapter into your computer

- Use Raspberry Pi Imager to install Raspberry Pi OS onto the micro SD card

- Set up your Raspberry Pi according to the CanaKit instructions (attach heatsinks, fan, and cover)

- Put your configured Raspberry Pi micro SD card into the port on the Raspberry Pi

- Plug one end of your HDMI cable (included in the CanaKit) into your Raspberry Pi HDMI port and the other end into your monitor

- Plug in your USB Mouse/Keyboard to the USB spots on the RPi

- Plug in the RPi power cable and wait for it to boot up

- Once the Pi boots up, follow the prompts to configure the Pi with your country and timezone. Change the password to something besides the default.

- Configure the Raspberry Pi’s internet access, which can be done wirelessly or via your Ethernet cable. Allow the software update. Allow the Pi to reboot once the update finishes.


## Installing and Configuring the Vulnerability Scanner

- Once the Pi restarts, open up a terminal window on your RPi (you may also want to open this blog post in a browser on the RPi so that you can copy and paste the command below easily)

- Copy and paste the following command into the terminal. Note: You will be prompted to enter the email address you want to receive the report to when the scan finishes.

>  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/digitalmubashir/IoT-Vuln_Scanner-Device/master/rpi/rpi-install.sh)"


- Once the script finishes the installation process, unplug your RPi, and all of its connections (HDMI, mouse, keyboard, etc.).

- Plug an Ethernet cable from your RPi to the back of your router.

- Plug the RPi into a power source and power it on.

After a couple of minutes, you should receive an email telling you the scan has started.

Several hours later, you will receive the scan results via email.

Anytime you want to rerun the script, power cycle the Pi.


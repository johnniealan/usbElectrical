#!/bin/sh
# ***************************************************************************
# owner : Johnnie Alan
# ***************************************************************************

#############################
#    USB 0 testmode settings
#############################
usb0_testmode="/sys/kernel/debug/musb-hdrc.0.auto/testmode"

#############################
#    USB 1 testmode settings
#############################
usb1_testmode="/sys/kernel/debug/musb-hdrc.1.auto/testmode"

echo
echo
echo Current USB 0 electrical test settings...
echo -port 0 
echo -testmode entry  $usb0_testmode
echo
echo
echo Current USB 1 electrical test settings...
echo -port 1 
echo -testmode entry  $usb1_testmode
echo

read -p "Do you want to change these settings? [y/n] " -n 1 -r

until [[ $REPLY =~ ^[Yy]$ ]]||[[ $REPLY =~ ^[Nn]$ ]]; do
    echo
    echo "Invalid input..."
    read -p "Do you want to change these settings? [y/n] " -n 1 -r
done   	    
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Change the settings in the script.!!"
    exit 1
elif [[ $REPLY =~ ^[Nn]$ ]]
then
    echo
    echo "USB High Speed Electrical Test starting..."
    echo
fi

read -p "Which USB port to test? [0/1] " -n 1 -r
until [[ $REPLY =~ ^[0]$ ]]||[[ $REPLY =~ ^[1]$ ]]; do
    echo 
    echo "Invalid input.."
    read -p "Which USB port to test? [0/1] " -n 1 -r
done

if [[ $REPLY =~ ^[0]$ ]]
    then
    TEST_AGAIN="1"

    while [ $TEST_AGAIN -ne 0 ]
    do
        echo
        echo "Test cases:     Option: "
        echo "TEST J -          1"
        echo "TEST K -          2"
        echo "TEST PACKET 53 -  3"
        echo "TEST FORCE HOST - 4"
	echo "TEST SE0 NAK -    5"
        echo "TEST Reset -      6"
        echo
        read -p "Which test is to be executed? [1/2/3/4/5/6] " -n 1 -r
        echo

        if [[ $REPLY =~ ^[1]$ ]]
        then
            echo
            echo "Sending J pattern to USB 0"
            echo "test J" > $usb0_testmode
            echo

        elif [[ $REPLY =~ ^[2]$ ]]
        then
            echo
            echo "Sending K pattern to USB 0"
            echo "test K" > $usb0_testmode
            echo

        elif [[ $REPLY =~ ^[3]$ ]]
        then
            echo
            echo "Sending 53 test packet pattern to USB 0"
            echo "test packet" > $usb0_testmode
            echo

        elif [[ $REPLY =~ ^[4]$ ]]
        then
            echo
            echo "Sending force host test to USB 0"
            echo "force host" > $usb0_testmode
            echo
 
        elif [[ $REPLY =~ ^[5]$ ]]
        then
            echo
            echo "Sending SE0 NAK packets to USB 0"
            echo "test SE0 NAK" > $usb0_testmode
            echo
        
        elif [[ $REPLY =~ ^[6]$ ]]
        then
            echo
            echo "Sending Reset to USB 0"
            echo "reset" > $usb0_testmode
            echo

        else
        echo "Invalid input..."
        echo "Please enter valid input"
        fi

        read -p "Do you want to test again? [y/n] " -n 1 -r
        until [[ $REPLY =~ ^[Yy]$ ]]||[[ $REPLY =~ ^[Nn]$ ]]; do
            echo 
            echo "Invalid input..."
            read -p "Do you want to test again? [y/n] " -n 1 -r
        done

        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            echo
            echo "starting again.."
            echo
        elif [[ $REPLY =~ ^[Nn]$ ]]
        then
            TEST_AGAIN="0"
            echo
            echo "Bye Bye..."        
        fi
    done

elif [[ $REPLY =~ ^[1]$ ]]
then
    TEST_AGAIN="1"
    while [ $TEST_AGAIN -ne 0 ]
    do
        echo
        echo "Test cases:     Option: "
        echo "TEST J -          1"
        echo "TEST K  -         2"
	echo "TEST PACKET 53 -  3"
        echo "TEST FORCE HOST - 4"
        echo "TEST SE0 NAK -    5"
        echo "TEST Reset -      6"
        echo
        read -p "Which test is to be executed? [1/2/3/4/5/6] " -n 1 -r
        echo

        if [[ $REPLY =~ ^[1]$ ]]
        then
            echo
            echo "Sending J pattern to USB 1"
            echo "test J" > $usb1_testmode
            echo

        elif [[ $REPLY =~ ^[2]$ ]]
        then
            echo
            echo "Sending K pattern to USB 1"
            echo "test K" > $usb1_testmode
            echo

        elif [[ $REPLY =~ ^[3]$ ]]
        then
            echo
            echo "Sending 53 test packet pattern to USB 1"
            echo "test packet" > $usb1_testmode
            echo

        elif [[ $REPLY =~ ^[4]$ ]]
        then
            echo
            echo "Sending force host test to USB 1"
            echo "force host" > $usb1_testmode
            echo
       
	elif [[ $REPLY =~ ^[5]$ ]]
        then
            echo
            echo "Sending SE0 NAK packets to USB 1"
            echo "test SE0 NAK" > $usb1_testmode
            echo
        
        elif [[ $REPLY =~ ^[6]$ ]]
        then
            echo
            echo "Sending Reset to USB 1"
            echo "reset" > $usb1_testmode
            echo

        else 
            echo
            echo "Invalid input..."
            echo "Please enter valid input"
        fi
        
        read -p "Do you want to test again? [y/n] " -n 1 -r
        until [[ $REPLY =~ ^[Yy]$ ]]||[[ $REPLY =~ ^[Nn]$ ]]; do
            echo 
            echo "Invalid input..."
            read -p "Do you want to test again? [y/n] " -n 1 -r
        done
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            echo
            echo "starting again.."
            echo
        elif [[ $REPLY =~ ^[Nn]$ ]]
        then
            TEST_AGAIN="0"
            echo             
            echo "Bye Bye..."
        fi
    done

else
echo "Invalid input...."
echo "Terminating the test case now"
fi

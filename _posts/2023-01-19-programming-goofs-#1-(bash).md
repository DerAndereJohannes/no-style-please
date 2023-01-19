--- 
layout: post 
category: goof
---

Ever since my previous post, I have been adding a bunch of "quality of life" updates to my scanning script to make my life easier. For example, at the start of my scanning adventure, I was naming the scanned files sequentially (1.png, 2.png, 3.png, ...) which looks obviously like a good idea. This is generally bad as when we reach 10.png, the sorting of the files gets a little odd. Therefore, with a quick fix of actually seeing the %d numbering as the C printf style formatting, I could alter it to add the padding (I should tell myself to read the manual more thoroughly). 

Another update I made was a function to combine a "scanning session" into one. A scanning session can be defined as a period of time when I utilize the scan script multiple times before renaming the (ordered by date/time) directories to something more representative of the contents. The situation can be visualised like this:

```sh
johannes@deb:~$ tree -d scans/
scans/
├── 2023-01-15T08:23:41
├── 2023-01-15T08:23:57
├── 2023-01-15T08:24:34
└── completed_scans

4 directories
```

This situation surprisingly occurs quite frequently. For example, it can happen if you are scanning too many documents at once, and you need to "reload" more pages that belong to the same section. Another (unfortunately more frequent) example, is when the scanner jams due to it accidentally pulling multiple documents at once. To solve this, I decided to write a short function that would take all the scanned folders and dump all the scans into the first ordered, rename the scans to fit the scheme and delete the now empty folders. 

Once there is only a single directory containing all pages of a certain section, I can simply rename and store them into the completed_scans folder structure *conveniently* placed in the same root folder. With this function, I am able to save my time manually doing the merge afterwards, checking folders if there even is anything in them etc. Sounds Great! The function I initially wrote looked like this:


```bash
merge_folders () {
    MERGE_DELIM=${1-$(date +%Y-%m-%d)}
    FOLDERS=$(find . -maxdepth 1 -type d -iname "*$MERGE_DELIM*" | sort)

    MAIN_FOLDER=$(echo "$FOLDERS" | awk 'NR==1')
    OTHER_FOLDERS=$(echo "$FOLDERS" | awk 'NR!=1')

    CURR_FILE=$(ls "$MAIN_FOLDER" | tail -1 | cut -d"." -f1 | echo "$(cat -)+1" | bc -s | printf "%05.f" $(cat -))

    FILE_LIST=$(find $OTHER_FOLDERS -type f | sort)

    for file in $FILE_LIST
    do
        EXT=$(basename "$file" | cut -d'.' -f2)
        mv "$file" "$MAIN_FOLDER/$CURR_FILE.$EXT"

        CURR_FILE=$(echo "$CURR_FILE+1" | bc -s | printf "%05.f" $(cat -))
    done

    echo "$OTHER_FOLDERS" | xargs rm -r
}

```

### Short Overview of the Code
* **MERGE_DELIM** defines the delimiter that is used to find all related directories for the merge
* **FOLDERS** retrieves all the directories in the current directory (. (dot)) based on **MERGE_DELIM**
* **MAIN_FOLDER** is the directory to dump all the scans into (the first folder), while **OTHER_FOLDERS** contains the rest
* **CURR_FILE** gets the last scan in the **MAIN_FOLDER** and increments the file number by one to get the next scan in line
* **FILE_LIST** simply searches the **OTHER_FOLDERS** for all their files and sorts them so that the overall order is preserved

With all of these variables, we can simply iterate over the **FILE_LIST**, rename and move all into the **MAIN_FOLDER** and afterwards simply remove all the empty folders.

This is perfectly functioning code and I used it for most of the scanning I have done since my last post. However, something went wrong. If you can immediately see this code, then you are far smarter than I was when I wrote this. 

## The Consequence (What Happened?)
Before talking about the problem, I will talk about the consequence. When I executed the command, it definitely took longer to execute than I thought, and I was getting a strange feeling. It turns out that executing this command caused my entire "completed_scans" folder to be dumped into the currently selected main folder, removing any sort of organization I already had done. 

Luckily, due to my confusion I held down CTRL+C to cancel the command as soon as possible. While it did not manage to move my entire "completed_scans" folder, it had managed to displace a grand total of 600-page scans into the main folder. Ouch. 

## What Went Wrong? (Why did it Happen?)
The culprit was the line defining the **FILE_LIST** variable. As defined, it finds all the files in the directories given to it through **OTHER_FOLDERS**. When the **OTHER_FOLDER** variable contains actual folder paths, there is no problem (yay!). But can you guess what would happen if I accidentally executed `$ bscan merge` when there were no other folders to merge? 

That's right! With the **OTHER_FOLDERS** variable empty, we result to using the default behaviour of the find command. Unfortunately for this case, if the find receives no folder to check, it checks the entire current directory along with subfolders. Due to this, my entire "completed_scans" folder was part of the moving plan! The sorted alphabetical list of "completed" files was iterated through and gracefully displaced into the main folder.


## What Did We Learn?
At the end of the day, the effect this had in my case was pretty minor. Since the **FILE_LIST** was sorted, I had great luck that "bank" is pretty high up there in the alphabet and that the majority of files it did move were part of a single folder anyway. Regardless, if I had not cancelled the command at all, I would have had to do quite a bit of additional manual labour for the mistake to be corrected. What I should have done is keep the "completed_scans" folder outside of reach for any command in the script to reach it.  It's strange, since I am usually pretty careful when it comes to files I would like to keep frozen, but alas. 

I have never used any sort of testing frameworks when it has come to my bash scripts. I did not even know that there were any that existed. Consequently, I feel like I should start looking into one, especially when it comes to something that affects important files on a system. Well then. I guess it's time to learn another one then! :-)

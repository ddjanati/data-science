Task 2.
- "New repository" on github.com
- mkdir repos
- Create SSH key with "cat ~/.ssh/authorized_keys"
- ssh-keygen -t COMP370_2025 -C "ddjanati@yahoo.com"
- cd repos > git clone git@github.com:ddjanati/data-science.git

Task 3.
- wget https://github.com/derpypony/My-Little-Pony-Data-Science-is-Magic-/raw/refs/heads/master/clean_dialog.csv
- How big is the dataset? 
    > wc -c clean_dialog.csv
	4,896,994 bytes
    > wc -l clean_dialog.csv
	36,860 lines
    > wc -w clean_dialog.csv
	705,400 words
- What's the structure of the data?
    > head -n 10 clean_dialog.csv
	"title" = title of episode
	"writer" = writer of episode
	"dialog" = content of lines of dialog
	"pony" = pony speaking very lines
- How many episodes does it cover?
    > cut -d'"' -f2 clean_dialog.csv | sort -u | wc -l
	198-1 = 197 episodes (excluding title header)
- Find at least one aspect of the dataset that is unexpected – meaning that it seems like it could create issues for later analysis.
    Because there are commas in the text fields themselves, delimiting with commas will not be reliable. We have to view the csv file as delimited by quotation marks, but since there sometimes are quotation marks in the text fields of "dialog", this delimitation itself has its limits (space after quotes to be considered, but cut won't "cut" it). Moreover, there are several occurrences of multiple speakers for one line, which could complicate speaker frequency analyses.

Task 4.
grep -Ee ',"Twilight Sparkle"' -Ee ',"Twilight Sparkle and .+"' -Ee ',".+ and Twilight Sparkle"' clean_dialog.csv | wc -l

Repeat pattern by swapping names of respective pony.

Total lines: (wc -l clean_dialog.csv) = 36,860 -1 = 36,859

Task 5.
- git add .
- git commit -m "My Little Pony Exploration"
- git pull

set episode $argv[1]
set urls (curl "https://www.webtoons.com/en/comedy/mage-and-demon-queen/episode-$episode/viewer?title_no=1438&episode_no=$episode" | rg _images | sed -r 's/.*data-url="([^"]*)".*/\1/p')

mkdir 1.$episode

for i in (seq -w 1 2 (count $urls))
  curl --referer https://webtoon-phinf.pstatic.net/ -o 1.$episode/"eng $i.jpg" $urls[$i]
end

convert -append 1.$episode/eng\ *.jpg 1.$episode/eng.png
rm 1.$episode/eng\ *.jpg

#!/bin/bash
# script name : kr.bash
# 
git clone git@github.com:munair/www-quilombolatraders-kr.git
cd www-quilombolatraders-kr
echo "you have five seconds to Ctrl-Z in your manual changes"
sleep 5
cp -f ../js/* js
cp -f ../css/* css
cp -f ../images/* images
cp -f ../fonts/* fonts
cp -f ../sounds/* sounds
cat ../README.md | sed 's/quilombolatraders-com/quilombolatraders-kr/g' | sed 's/quilombolatraders\.com/quilombolatraders\.kr/g' > README.md
cat ../edit.bash | sed 's/quilombolatraders-com/quilombolatraders-kr/g' | sed 's/quilombolatraders\.com/quilombolatraders\.kr/g' > edit.bash
cat ../inc_capoeira.html | sed 's/quilombolatraders-com/quilombolatraders-kr/g' | sed 's/quilombolatraders\.com/quilombolatraders\.kr/g' > inc_capoeira.html
cat ../inc_music.html | sed 's/quilombolatraders-com/quilombolatraders-kr/g' | sed 's/quilombolatraders\.com/quilombolatraders\.kr/g' > inc_music.html
cat ../inc_faq.html | sed 's/quilombolatraders-com/quilombolatraders-kr/g' | sed 's/quilombolatraders\.com/quilombolatraders\.kr/g' > inc_faq.html
cat ../inc_contact.html | sed 's/quilombolatraders-com/quilombolatraders-kr/g' | sed 's/quilombolatraders\.com/quilombolatraders\.kr/g' > inc_contact.html
cat ../inc_email.html | sed 's/quilombolatraders-com/quilombolatraders-kr/g' | sed 's/quilombolatraders\.com/quilombolatraders\.kr/g' > inc_email.html
cat ../inc_formconfirmation.html | sed 's/quilombolatraders-com/quilombolatraders-kr/g' | sed 's/quilombolatraders\.com/quilombolatraders\.kr/g' > inc_formconfirmation.html
cat ../package.json | sed 's/quilombolatraders-com/quilombolatraders-kr/g' | sed 's/quilombolatraders\.com/quilombolatraders\.kr/g' > package.json
cat ../web.js | sed 's/quilombolatraders-com/quilombolatraders-kr/g' | sed 's/quilombolatraders\.com/quilombolatraders\.kr/g' > web.js
bash edit.bash . "[AUTOMATED] Pushing changes to KR website from COM website excluding index.html in particular. To modify index.html git clone the repo and modify by hand." noprompting
cd ..
rm -rf www-quilombolatraders-kr

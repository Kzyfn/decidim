for var in `ls | grep decidim`
do
    if [ -e ${var}/config/locales  ]; then
        cp ../decidim_error/${var}/config/locales/ja.yml ${var}/config/locales/
    fi
done

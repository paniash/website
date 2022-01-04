@def authors = "Ashish Panigrahi"
@def published = "30-05-2021"
@def rss_pubdate = Date(2021, 5, 30)
@def rss_description = "Are you irritated by the font rendering in firefox? This blog post explains how to fix it on unix-based systems."
@def title = "Font rendering in firefox"

# Font rendering on firefox

## Why do my fonts look disgusting?

If you're on a \*nix system and compare the fonts on chrome and firefox, you'd notice the difference. The fonts on the latter just look... _off_, or atleast that was the case on my system.

## My personal odyssey

Recently I had made the switch from firefox to brave, for the naive reason that fonts were just rendered better (and LaTeX looks like it) on it (being a chromium based browser). However, I really missed the customizability and other nifty features of firefox. It just felt like home. I knew for sure that I'm missing something, because surely firefox couldn't be responsible for messing fonts, right? (atleast I hoped).

On firefox, you may have come across the font settings that look something like this:

![](/assets/images/firefox-font.png)

My past self would unselect the option _**Allow pages to choose their own fonts, instead of your selections above**_, just so that I can have my custom fonts rendered. But oh boy, would that turn out disastrous to say the least. I visit a good number of websites that render math equations in TeX, but with this setting turned off, LaTeX looked more like some flunky '90s PC trying to render math.

What was the fix you might ask? Well, just select the option that I had unselected earlier. But this would bring that the atrocious fonts back on many websites.

## The fix

I later came across [this](https://nolanlawson.com/2020/05/02/customizing-fonts-in-firefox-on-linux/) blog post where I got to know that firefox depends on an OS-level font configuration called [fontconfig](https://wiki.archlinux.org/title/Font_configuration) and is located at `~/.config/fontconfig/fonts.conf`.

### Create a fontconfig file

If you don't have one, just create it at the specific location.

```xml
<?xml version='1.0'?>
<!DOCTYPE fontconfig SYSTEM 'fonts.dtd'>
<fontconfig>
    <alias>
        <family>Helvetica</family>
        <prefer><family>IBM Plex Sans</family></prefer>
    </alias>
    <alias>
        <family>sans-serif</family>
        <prefer><family>IBM Plex Sans</family></prefer>
    </alias>
    <alias>
        <family>monospace</family>
        <prefer><family>DejaVu Sans Mono</family></prefer>
    </alias>
</fontconfig>
```

A lot of websites these days use Helvetica as their serif font, and firefox will fallback to a specific font if Helvetica is not found. By default, this fallback seems to be Nimbus Sans, which is not pretty to say the least. This is where fontconfig comes in.

The above XML file tells firefox that, "Hey! If you're trying to render Helvetica, just use IBM Plex Sans", and similar font rules for sans-serif and monospace fonts.

### The result

\figenv{Daniel}{/assets/images/oldfonts.png}{width:40em;}

\figenv{The cooler Daniel}{/assets/images/newfonts.png}{width:40em;}

## Parting ways

I was really happy when I came across this fix! and I hope this has helped you as well.

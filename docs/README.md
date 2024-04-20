# gnupack_msys2

cygwinをMSYS2に変えたgnupackっぽい作業環境。  
MSYS2を別途、`gnupack_msys2\exe\msys64\`にインストール必要。


<br>

## 使い方

gnupack_msys2 を任意のドライブ直下に配置。  
  
↓  
  
配置したドライブに併せて `gnupack_msys2\script\adapt_drive.ps1` を調整。  
`C:\gnupack_msys2` に配置しているなら下記の通り。  

```
$env:DRIVE = "C"
```
  
↓  
  
MSYS2を`gnupack_msys2\exe\msys64\`にインストール  
  
↓
  
フォントをインストール：  
`gnupack_msys2\font\FiraCode\distr\ttf\*.ttf`  
`gnupack_msys2\font\IPAexfont\*.ttf`  
  
↓  
  
`gnupack_msys2\change_execution_policy.cmd`を管理者として実行  
  
↓  
  
`gnupack_msys2\startup_msys2.ps1`を右クリックして  
「プログラムから開く」 >> 「別のプログラムを選択」 >> 「PCでアプリを選択」  
その後に表示されるエクスプローラで  
```
C:\Windows\system32\WindowsPowerShell\v1.0\powershell.exe
```
を選択
  
↓  
  
emacs起動  
==> `gnupack_msys2\startup_emacs.ps1`  
  
gvim起動  
==> `gnupack_msys2\startup_gvim.ps1`  
  
MSYS2起動  
==> `gnupack_msys2\startup_msys2.ps1`  

<br>

## 構成

* cmigemo
* cscope
* emacs
* hunspell
* pandoc
* vim

<br>

## cmigemo
KaoriYa ([https://www.kaoriya.net/software/cmigemo/](https://www.kaoriya.net/software/cmigemo/)) から、cmigemo-default-win64-20110227.zip をダウンロードして解凍。 
解凍したフォルダの名前を cmigemo-default-win64/ ==> cmigemo/ に変更して下記に配置。
```
gnupack_msys2\exe\cmigemo
```

migemo-dictの場所は、setenv_emacs.ps1で下記のように設定して  

```
$env:MIGEDIC = $env:DRIVE + ":/gnupack_msys2/exe/cmigemo/dict/utf-8/migemo-dict"
```

`gnupack_msys2\home\.emacs.d\init.el` で下記のように取り込み。

``` emacs-lisp
(setq migemo-dictionary (getenv "MIGEDIC"))
```

<br>

## cscope
Windows用にビルドされたcscope-win32  
cscope-win32 ([https://code.google.com/archive/p/cscope-win32/downloads?authuser=0](https://code.google.com/archive/p/cscope-win32/downloads?authuser=0))  
ここから、cscope-15.8a-win64rev1-static.zip をダウンロード、インストール、解凍して、  
cscope.exe を下記に配置。  
cscope-indexer も下記に配置済。  
```
gnupack_msys2\exe\cscope\
```
cscopeをソースコードからMSYS2でビルドしたものを実行すると、なぜか会社の Symantec Endpoint Protection にブロックされてしまうので、しぶしぶネットを探し回って見つけた cscope-win32 を採用しています。

<br>

## emacs
[https://mirror.lagoon.nc/gnu/emacs/windows/emacs-28/](https://mirror.lagoon.nc/gnu/emacs/windows/emacs-28/)  
から、emacs-28.2.zipをダウンロードして展開。  
展開したフォルダ名をemacs-28.2からemacsに変更して  
```
gnupack_msys2\exe\emacs
```
に配置。  
取扱いは下記を参考にしました。  
[Emacs 28.2 のインストールとIMEの設定とその他の設定（Windows 上）](https://www.kkaneko.jp/tools/win/emacs.html)  
<br>
emacsを下記でインストールすると、png画像の表示がうまくいかないので、MSYS2の枠組みから独立した方法でemacsを取り込んであります。
```
$ pacman -S mingw-w64-x86_64-emacs
```
<br>
もろもろのコンフィグは下記の通り。

* 設定ファイル: home/.emacs.d/init.el

* 拡張: home/.emacs.d/site-lisp/
  + howm
  + imenu-list
  + markdown-mode
  + moccur (color-moccur & moccur-edit)
  + persistent-scratch
  + redo+
  + restart-emacs
  + text-adjust
  + tr-ime
  + w32-ime
  + xcscope

* フォント設定
  下表のフォントを使う場合は、  
  gnupack_msys2/font/*
  にあるフォントをWindowsにインストール必要。

  | フォント種別 | 設定 |
  | :--- | :--- |
  | default | Fira Code |
  | variable-pitch (proportional) | Arial |
  | fixed-pitch | Fira Code |
  | tooltip | Arial |
  | 日本語 | IPAexGothic |

* キーバインド

  | キーバインド | 関数 |
  | :--- | :--- |
  | C-. | tabbar-forward-tab |
  | C-, | tabbar-backward-tab |
  | C-x,, | howm-menu |
  | C-? | redo |
  | C-: | toggle-truncate-lines |
  | C-; | auto-fill-mode |
  | C-^ | flymake-mode |
  | M-g | goto-line |
  | M-n | flymake-goto-next-error |
  | M-p | flymake-goto-prev-error |
  | M-o | occur-by-moccur |

* gnupack_msys2\exe\emacs\share\emacs\28.2\lisp\org\org-keys.el
  C-,をtab切り替えに使えるように下記をコメントアウト  

  ```emacslisp
  (org-defkey org-mode-map (kbd "C-,") #'org-cycle-agenda-files)
  ```

* color-theme
  + busybee ==> 有効
  + emacs-21
  + dark-laptop
  + badwolf
  + high-contrast

* persistent-emacs  
  
  scratchバッファは、`gnupack_msys2\scratch\scratch.emacs`に保存され、このファイルから復元される。

<br>

## hunspell
gnupack_msys2\exe\hunspell  
に配置。  
<br>
下記、pacman でインストールした hunspell を使うと、なぜか会社の Symantec Endpoint Protection にブロックされてしまうので、  
```
pacman -S mingw-w64-x86_64-hunspell
```
しぶしぶネットを探し回って見つけた下記からダウンロードした  
hunspell-windows-h-1.6.2-1-d-9ec31e4-v2.zip  
を採用。  
[https://github.com/gromnitsky/hunspell-windows/releases/](https://github.com/gromnitsky/hunspell-windows/releases/)  
  
emacs で実際に使えるようにする際、下記のエラーに苦しんだ。  
```
ispell-find-hunspell-dictionaries: Can’t find Hunspell dictionary with a .aff affix file
```

問題解決の役立ったサイト。すばり模範解答は書いてなかった。  
[How do I set up hunspell on a Windows PC? ](https://emacs.stackexchange.com/questions/14952/how-do-i-set-up-hunspell-on-a-windows-pc/22311#22311)  
[Tutorial: spellchecking with hunspell (1.7.0) for emacs (26.2) on Windows (10)](https://www.reddit.com/r/emacs/comments/dgj0ae/tutorial_spellchecking_with_hunspell_170_for/)  
  
他にもhunspell設定用のemacs lispが書いてあるウェブサイトがたくさんあり、掲載されているemacs lispを試したものの、どれもうまくいかなかった。記事が対象とするemacsのバージョンが28よりも古いものが多い印象。  
``` 
/emacs/share/emacs/28.2/lisp/textmodes/ispell.el  
```
を読んでみたところ、emacs 28.2では、hunspell-default-dictの設定が肝らしいことがわかり、下記のやり方で辞書が見つからないエラーが解消し、M-x ispellでhunspellを使えるようになった。  
※下記の`$env:DRIVE`は適宜読み替えてください。  
※下記の1, 2, 3はsetenv_emacs.ps1にまとめてあります。  

1. 環境変数 LANG=en_US.UTF-8 に設定

2. hunspell\binにパスを通す。このgnupack_msys2の場合は、setenv.ps1にて下記を実行
   ``` powershell
   $env:PATH = $env:DRIVE + ":\gnupack_msys2\exe\hunspell\bin;" + $env:PATH
   ```

3. emacsの起動前に下記の環境変数をsetenv_emacs.ps1にて設定
   ``` powershell
   $env:DICTIONARY = "en_US"
   $env:DICPATH = $env:DRIVE + ":/gnupack_msys2/exe/hunspell/share/hunspell"
   ```

4. home/.emacs.d/init.elに下記を記述。
   ``` emacs-lisp
   (setq ispell-program-name "hunspell")
   (setq ispell-local-dictionary "en_US")
   
   ;; string        :tag "Dictionary name"          => "en_US"
   ;; regexp        :tag "Case characters"          => "[[:alpha:]]"
   ;; regexp        :tag "Non case characters"      => "[^[:alpha:]]"
   ;; regexp        :tag "Other characters"         => "[']"
   ;; boolean       :tag "Many other characters"    => nil
   ;; repeat        :tag "Ispell command line args" => ("-d" "en_US" "-i" "utf-8")
   ;; choice        :tag "Extended character mode"  => nil
   ;; coding-system :tag "Coding system"            => utf-8
   (setq ispell-local-dictionary-alist
         '(("en_US"
            "[[:alpha:]]"
            "[^[:alpha:]]"
            "[']"
            nil
            ("-d" "en_US" "-i" "utf-8")
            nil
            utf-8)))
   
   ;; new variable 'ispell-hunspell-dictionary-alist' is defined
   ;; in Emacs. If it's nil, Emacs tries to automatically set up
   ;; the dictionaries.
   (setq ispell-hunspell-dictionary-alist ispell-local-dictionary-alist)
   
   ;; With Emacs 28.2 may also need to set hunspell-default-dict
   (setq hunspell-default-dict "en_US")
   
   (ispell-change-dictionary "en_US" t)
   
   ;; skip Japanese words
   (add-to-list 'ispell-skip-region-alist '("[^\000-\377]+"))
   ```
  
  
TODO  

* 下記を評価してみる  
  [https://github.com/mlt/hunspell/releases/download/appveyor_v1.7.0/hunspell-msvc-Release-x64.zip](https://github.com/mlt/hunspell/releases/download/appveyor_v1.7.0/hunspell-msvc-Release-x64.zip)  


<br>

## MSYS2

gnupack_msys2ではMSYS2を同梱していないので、別途、`gnupack_msys2\exe\msys64\`にインストールが必要です。



<br>

## pandoc

下記から pandoc-3.1.12.3-windows-x86_64.zip をダウンロードおよび解凍。  
[https://github.com/jgm/pandoc/releases/tag/3.1.12.3](https://github.com/jgm/pandoc/releases/tag/3.1.12.3)  
<br>
解凍したフォルダ pandoc-3.1.12.3 の名前を pandoc に変更して、下記に配置。  

```
gnupack_msys2\exe\pandoc

```
pandoc.exe のファイルサイズが 100MB を超えているので pandoc.zip にしてあります。GitHub からダウンロードした後、解凍して pandoc.exe を使います。  

### emacsとの関連付け

`gnupack_msys2\script\setenv_emcas.ps1`にて下記環境変数を設定。

```powershell
$env:MKDWCSS = $env:DRIVE + ":/gnupack_msys2/script/github-markdown.css"
```

この環境変数を`gnupack_msys2\home\.emacs.d\init.el`で下記のように取り出して markdown-mode.el の markdown-command に css ファイルの所在を設定。

``` emacs-lisp
(with-eval-after-load 'markdown-mode

  (setq pandoc-cmd (concat "pandoc -s -f gfm t html5 -c " (getenv "MKDWCSS")))

  (custom-set-variables
   '(markdown-command pandoc-cmd)
   ...)
```

emacsからpandocでmarkdownテキストをプレビューするには下記のどちらかを実行:  
M-x (ESC-x or Alt-x) markdown-preview  
or  
C-c C-c p  

<br>

## vim

* 下記から vim82-kaoriya-win64-8.2.1287-20200724.zip をダウンロード。  
  [https://www.kaoriya.net/software/vim/](https://www.kaoriya.net/software/vim/)  
  解凍して、vim82-kaoriya-win64/ が展開されるので、名前を vim/ に変更。  
  そして、下記に配置。  
  ```
  gnupack_msys2\exe\vim
  ```

* 設定ファイル
  home/.vimrc  

* colorschem  
  home/vimfiles/colors/*  
  有効なカラースキーム ==> badwolf。home/_gvimrcで設定。

* プラグイン  

  + @anyakichiさんの下記プラグインを追加。  
    10年以上前に「あにゃログ」で見つけて、手元に残しておいたもの  

    | プラグイン | 配置場所 |
    | :--- | :--- |
    | vim-csutil | gnupack_patches\app\vim\plugins\vim-csutil\ |
    | vim-qfutil | gnupack_patches\app\vim\pluginsvim-qfutil\ |
    | vim-tabutil | gnupack_pathes\app\vim\pluginsvim-tabutil\ |

  + その他のプラグインを追加  

    | プラグイン | 配置場所 |
    | :--- | :--- |
    | cscope_maps | gnupack_patches\home\vimfiles\cscope_maps.vim |
    | gtags | gnupack_patches\home\vimfiles\gtags.vim |
    | QFixHowm |  gnupack_patches\app\vim\plugins\qfixapp\ |

<br>

## Link

[vim-csutil](https://github.com/anyakichi/vim-csutil)  
[vim-qfutil](https://github.com/anyakichi/vim-qfutil|)  
[vim-tabutil](https://github.com/anyakichi/vim-tabutil)  
[cscope_maps.vim](https://github.com/joe-skb7/cscope-maps/blob/master/plugin/cscope_maps.vim)  
[gtags.vim](https://github.com/ivechan/gtags.vim)  
[QFixHowm](https://sites.google.com/site/fudist/Home/qfixhowm)  
[howm](https://github.com/kaorahi/howm)  
[imenu-list](https://github.com/bmag/imenu-list)  
[markdown-mode](https://github.com/jrblevin/markdown-mode)  
[color-moccur](https://www.emacswiki.org/emacs/color-moccur.el)  
[moccur-edit](https://www.emacswiki.org/emacs/moccur-edit.el)  
[redo+](https://www.emacswiki.org/emacs/redo+.el)  
[text-adjust](https://github.com/uwabami/text-adjust.el)  
[cscope](https://sourceforge.net/projects/cscope/files/cscope/15.8a/)  
[cscope-win32](https://code.google.com/archive/p/cscope-win32/downloads?authuser=0)  
[xscope](https://github.com/dkogan/xcscope.el)  
[Emacs Theme](https://emacsthemes.com/)  
[Fira Code](https://github.com/tonsky/FiraCode)  
[IPAフォント](https://moji.or.jp/ipafont/ipafontdownload/)  
[GNU Emacs](https://mirror.lagoon.nc/gnu/emacs/)  
[KaoriYa (Vim)](https://www.kaoriya.net/software/vim/)  
[KaoriYa (C/Migemo)](https://www.kaoriya.net/software/cmigemo/)  
[hunspell-windows](https://github.com/gromnitsky/hunspell-windows/releases/)  
[tr-ime, w32-ime](https://github.com/trueroad/tr-emacs-ime-module)  
[pandoc](https://github.com/jgm/pandoc/releases/tag/3.1.12.3)  
[restart-emacs](https://github.com/iqbalansari/restart-emacs)  

以上

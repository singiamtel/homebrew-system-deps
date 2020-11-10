# Updating the alibuild recipe

Full instructions at:

https://docs.brew.sh/Python-for-Formula-Authors

Short of it:

```
python3 -m venv alibuild-homebrew
source alibuild-homebrew/bin/activate
pip3 install alibuild homebrew-pypi-poet
poet alibuild | pbcopy
```

This will put in your clipboard the updated dependencies. Use them to update the [alibuild.rb]() recipe.

Also make sure you do:

```
curl -L https://github.com/alisw/alibuild/archive/vX.Y.Z.tar.gz | sha256sum
```

and use it to update the sha2sum in the same recipe. Make also sure you update the url and the version.

# Rust Support
The configuration uses a program known as racer in order to provide completion for Rust.
First, install rust by running `curl https://sh.rustup.rs -sSf | sh`. 
Assuming you are using ZSH, add `$HOME/.cargo/bin`

```shell
pip install jedi black flake8 
```
Run the above with sudo if you need to. 
Now, when you open a Python file inside Emacs, it should automatically provide you with IDE features. 

## Virtualenv Setup
Working with virtual environments requires just a little bit more work. 
```shell
# Creates and activates a virtual environment called venv
virtualenv venv && source venv/bin/activate

# You need to install necessary libraries on virtual environment as well
pip install jedi black flake8

# Install any other libraries you need

# Deactivate virtualenv
deactivate
```
Open your project directory within Emacs, and open the main Python file. 
You should then run the command `pyvenv-activate` within Emacs, and select 
your virtual environment. It should now provide you with autocompletion and 
your installed libraries.

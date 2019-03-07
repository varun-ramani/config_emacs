# Python Support
The configuration uses Elpy in order to provide IDE-like features for Python development. You will need to ensure that whatever python environment you are using has the necessary Python packages installed, detailed below.

## General Setup
Ensure that you have pip installed, and then install the necessary libraries like so:
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

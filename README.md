# Vagrantfile for virtualized jupyter notebook server

- [Requirements](#requirements)
- [To run](#to-run)
- [Tweaking](#tweaking)

This is Vagrantfile of a virtual machine running jupyter notebook on a
Ubuntu server. The system is provisioned with [numpy][np], [scipy][sp],
[matplotlib][mpl], [seaborn][sns], [scikit-learn][skl], [TensorFlow][tf],
[keras][k] and [Jupyter notebook][ju] for trying out plotting, statiscal
analysis and machine learning interactively in [Python][py].

Example notebook can be seen in [notebooks/Hello.ipynb][sample].

[np]: http://www.numpy.org/
[sp]: https://www.scipy.org/scipylib/
[mpl]: http://matplotlib.org/
[sns]: http://seaborn.pydata.org/
[skl]: http://scikit-learn.org/
[tf]: https://www.tensorflow.org/
[k]: https://keras.io/
[ju]: https://jupyter.org/
[py]: https://www.python.org/
[sample]: https://github.com/frickiericker/vagrant_jupyter_scipy_keras/blob/master/notebooks/Hello.ipynb

## Requirements

To launch the virtual machine you need to install [Vagrant][vup] and
[VirtualBox][vbox] on your computer. These are most likely provided by
the package manager of your operating system.

FreeBSD:

    pkg install vagrant virtualbox

Ubuntu:

    apt-get install vagrant virtualbox

macOS with Homebrew:

    brew cask install vagrant virtualbox

[vup]: https://www.vagrantup.com/
[vbox]: https://www.virtualbox.org/

## To run

Clone the repository and vagrant-up:

    git clone https://github.com/frickiericker/vagrant_jupyter_scipy_keras.git
    cd vagrant_jupyter_scipy_keras
    vagrant up

This will take five to ten minutes. Now the virtual machine is up. Next,
launch jupyter notebook server with

    ./start_notebook.sh

This script logs in to the virtual machine using SSH and executes jupyter
notebook command. It will print some informational logs and an instructive
message like:

    Copy/paste this URL into your browser when you connect for the first time,
    to login with a token:
        http://0.0.0.0:8888/?token=fad1....

Open the URL and you'll see a jupyter notebook. Enjoy!

## Tweaking

By default, the virtual machine takes up 2GB of RAM and 2 CPU cores. You can
change the numbers by editing the relevant part of the Vagrantfile:

      v.memory = 2048
      v.cpus = 2

Memory is in megabytes and cpus specifies the number of cores. Increasing
the number of CPU cores should noticeablly speed up computing in the
notebook, especially training of neural networks (such as one in the sample
notebook).

Do not forget to reboot the virtual machine after editing Vagrantfile!

    vagrant reload

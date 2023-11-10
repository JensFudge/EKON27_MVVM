# EKON27_MVVM
Demoproject for EKON 27 about MVVM [(Model View ViewModel)](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93viewmodel)

This project contains two seperate Delphi projects, bundled in a group. It is created in Delphi 11.3
It's meant to be a fairly simple description of how and why we should seperate Graphical Userinterface from GUI.

## Before
The project in "Before" has everything in the form. This is the typical way Delphi Developers learn how to use Delphi
Myself included.
Drop a button on the form, doubleclick it, and write code.

The problem is, that this code becomes hard to maintain, hard to test, har to reuse in other projects and hard to refactor into a threading model.

## After
The project in "After" has split the code into three seperate pas-files (and still the dfm file).

The **Model.Invoice.pas** contains everything we need to know about an invoice. It has no idea what the view is or the viewmodel.
The model would contain everything there is to know about the business logic, but not the User Interface

The **ViewModel.Invoice.pas** acts as an interpreter between the view and the model. The purpose is to react to requests from the View, and facilitate in a user interface prepared manner everything about the model

The **View.Invoice.pas** is the userinterface but now using the MVVM pattern

### NOTE!
I am using a more pragmatic approach to acheive the goal. The goal for me is not to use MVVM as such, but to seperate the code from the userinterface. I really do not care much which of the patterns you use, as long as it's done.

## Benefits
There is of course some work involved in taking on the task of cleaning up old legacy code, but there are also benefits.

- Maintenance: Maintaining the system is much easier when it's clean.
- Replace UI: You can design a completely new UI for the project, and just hook into the ViewModel and Model quite easily. For example change the VCL user interface to a Firemonkey interface is easy, and now this app could run on Mac for example
- Test: It's now possible to write unit tests for the code
- Threading: If it was desired you could now create invoices inside a thread. If you for example had several invoices read from some datasource, you could in a Parallel for-loop run all the invoices. They would be isolated from each other because they no longer refer to the GUI.


This code is provided as is. You can download and run it at your own risc. 

# <b>shopcart_system</b>

Built with Flutter by OXXYDDE.
<br></br>
This project is the training for implementation of Provider State Management by making a simple Shopping Cart System.

## **State on Flutter**

Before we start from the Provider itself, we must know the State's fundamental.

**What is State on Flutter?**
> According to Flutter, **State** is the information that can be read synchronously when the widget is built and might change during the lifetime of the widget.

State widgets can be refreshed using few approach, two of them are `setState()` function and using Provider State Management.

## **Provider State Management Advantages**
`setState()` function is occurs by rendering the widgets, **start from the root of the widget tree.** When our Flutter application get complicated, this approach will decrease our overall app performance.

To solve this, we're using one of alternative approach by using **Provider State Management**.
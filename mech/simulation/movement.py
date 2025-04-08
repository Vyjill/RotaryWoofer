import tkinter as tk
import math


def elie(arm_length, distance):
    # Atrocity found by elie

    # return math.acos((1+distance**2+arm_length**2-arm_length)/(2*math.sqrt(1+distance**2)*arm_length)) + math.tan(1/distance)
    return math.acos((1**2+distance**2)/(2*arm_length*math.sqrt(arm_length**2+distance**2))) + math.tan(1/distance)

def _theta(arm_length, distance):
    # Atrocity found with wolframalpha
    numerator = (
        distance**3
        - math.sqrt(
            -(distance**4)
            + 4 * distance**2 * arm_length**2
            - 2 * distance**2
            + 4 * arm_length**2
            - 1
        )
        + distance
    )

    denominator = 2 * (distance**2 + 1)

    return math.acos(numerator / arm_length / denominator)


r = tk.Tk()

WIDTH = 500
HEIGHT = 500

c = tk.Canvas(r, width=WIDTH, height=HEIGHT)
c.pack()

l = 2
m = 3


sens = 1

k = 50


def draw_line(c: tk.Canvas, x1, y1, x2, y2, fill):
    c.create_line(x1, HEIGHT - y1, x2, HEIGHT - y2, fill=fill)


def animate():
    global l, sens

    if l < 3:
        sens = 1
    if l > 1.5 * m:
        sens = -1

    l += sens * 0.1

    theta1 = elie(m, l)
    theta21 = _theta(m, l)

    # theta1 = elie(m, l)

    print(l, math.degrees(theta1))

    c.delete("all")

    draw_line(c, 0, 0, m * k * math.cos(theta1), m * k * math.sin(theta1), fill="blue")
    draw_line(
        c,
        k * l,
        k * 1,
        m * k * math.cos(theta1),
        m * k * math.sin(theta1),
        fill="green",
    )

    draw_line(
        c, 0, 0, m * k * math.cos(theta21), m * k * math.sin(theta21), fill="cyan"
    )
    draw_line(
        c,
        k * l,
        k * 1,
        m * k * math.cos(theta21),
        m * k * math.sin(theta21),
        fill="yellow",
    )

    draw_line(c, 0, k * 1, k * l, k * 1, fill="red")

    r.after(100, animate)


r.after(100, animate)

r.mainloop()

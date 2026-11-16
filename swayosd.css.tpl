@define-color background-color {{ background }};
@define-color border-color {{ accent }}99;
@define-color label {{ foreground }};
@define-color image {{ accent }};
@define-color progress {{ accent }};
@define-color progress-trough {{ lighter_bg }}8f;
@define-color progress-outline {{ accent }}59;
@define-color panel-tint {{ accent }}14;
@define-color critical {{ red }};
@define-color shadow {{ background }}80;

window:not(:backdrop),
window:backdrop {
    border: none;
    border-radius: 16px;
    background-color: transparent;
    box-shadow: none;
    padding: 12px;
}

window:not(:backdrop) #container,
window:backdrop #container {
    min-width: 320px;
    background-color: alpha(@background-color, 0.2);
    background-image: linear-gradient(to bottom, @panel-tint, transparent);
    border: 1px solid @border-color;
    border-radius: 16px;
    padding: 20px 22px;
    background-clip: padding-box;
    box-shadow: 0 16px 34px @shadow;
}

image {
    color: @image;
}

label {
    color: @label;
    font-weight: 600;
}

progressbar trough {
    min-height: 10px;
    background-color: @progress-trough;
    border: 1px solid @progress-outline;
    border-radius: 999px;
}

progressbar progress {
    background-color: @progress;
    border-radius: 999px;
}

image.muted,
image:disabled,
image.capslock {
    color: @critical;
}

progressbar:disabled progress,
progressbar.muted progress {
    background-color: @critical;
}
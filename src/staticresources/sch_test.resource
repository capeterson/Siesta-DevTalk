StartTest(function(t) {
    t.chain({
            drag: "schedulergridview => table.x-grid-item:nth-child(1) .sch-timetd .sch-event .sch-event-inner",
            by: [-69, 0]
        }, {
            drag: "schedulergridview => table.x-grid-item:nth-child(2) .sch-timetd",
            fromOffset: [10, 20],
            by: [150, 0]
        },

        {
            moveCursorTo: ">>templatecolumn[text=Staff]"
        },

        {
            moveCursorTo: "templatecolumn[text=Staff] => .x-column-header-trigger"
        },

        {
            click: "templatecolumn[text=Staff] => .x-column-header-trigger"
        },

        {
            click: "[itemId=descItem] => .x-menu-item-text"
        },

        {
            click: "tab[text=Tab 1 - Some other component] => .x-tab-inner",
            offset: [54, 4]
        },

        {
            click: "tab[text=Tab 2 - Scheduler] => .x-tab-inner",
            offset: [30, 5]
        }
    );
});
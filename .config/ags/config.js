const myLabel = Widget.Label({
    label: 'some example content',
})
const calendar = Widget.Calendar({
    showDayNames: true,
    showDetails: true,
    showHeading: true,
    showWeekNumbers: true,
    detail: (self, y, m, d) => {
        return `<span color="white">${y}. ${m}. ${d}.</span>`
    },
    onDaySelected: ({ date: [y, m, d] }) => {
        print(`${y}. ${m}. ${d}.`)
    },
})

const myBar = Widget.Window({
    name: 'bar',
    anchor: ['top'],
    child: calendar,
})

App.config({ windows: [myBar] })

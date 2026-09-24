import SwiftWebUI

struct HaloWebPage: View {
    @State private var opened = true

    let openedImage: String
    let closedImage: String

    var body: some View {
        HTMLContainer(
            attributes: [
                "style": """
                    position:fixed;inset:0;width:100vw;height:100vh;
                    box-sizing:border-box;overflow:auto;
                    background:#101217;color:white;
                    font-family:-apple-system,BlinkMacSystemFont,sans-serif;
                    display:flex;flex-direction:column;align-items:center;
                    """
            ]
        ) {
            HTMLContainer(
                attributes: [
                    "style": """
                        width:100%;height:42px;box-sizing:border-box;
                        display:flex;align-items:center;justify-content:space-between;
                        padding:0 16px;background:rgba(0,0,0,.35);
                        """
                ]
            ) {
                Text("Halo")
                Button(opened ? "Show closed" : "Show opened") {
                    opened.toggle()
                }
            }

            HTMLContainer(
                attributes: [
                    "style": """
                        flex:1;width:100%;box-sizing:border-box;
                        display:flex;align-items:flex-start;justify-content:center;
                        padding:28px;overflow:auto;
                        """
                ]
            ) {
                HTML(
                    "<img alt=\"Halo\" src=\"" + (opened ? openedImage : closedImage) + "\" style=\"display:block;max-width:100%;height:auto;\" />"
                )
            }
        }
    }
}

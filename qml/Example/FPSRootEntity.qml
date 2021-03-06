import Qt3D.Core 2.12
import Qt3D.Render 2.12
import Qt3D.Input 2.12
import Qt3D.Extras 2.12
import Qt3D.Logic 2.12
Entity {
    id: rootNode
    property color clearColor: Qt.rgba(0.2, 0.3, 0.3, 1.0)
    Camera {    //摄像机
        id: fCamera
        projectionType: CameraLens.PerspectiveProjection
        fieldOfView: 45
        nearPlane: 0.1
        farPlane: 1000.0
        position: Qt.vector3d(0.0, 0.0, 40.0)
        upVector: Qt.vector3d(0.0, 1.0, 0.0)
        viewCenter: Qt.vector3d(0.0, 0.0, 0.0)
    }
    FirstPersonCameraController {
        //第一人称摄像机控制器，效果就是FPS游戏中角色的视角
        // 帮助文档和实际效果略微不同

        // 鼠标左键按下，沿x轴或y轴拖动时，控制相机偏转。(身体不动，眼睛向左看、向右看，向上看、向下看)
        // 按下Shift再鼠标左键拖动，让偏转更精细。 (转的慢一些，仔细地看)
        // 上下左右键 分别沿x轴、y轴移动摄像机。   (眼睛不动，身体往左右、上下平移)
        // PageUp/PageDown/鼠标滚轮 移动z轴 (向前靠近一点，向后滚远一点)

        camera: fCamera
    }
    RenderSettings {
        activeFrameGraph: ForwardRenderer {
            //ForwardRender正向渲染。逐个光源计算的一种渲染方式。常用、易于理解。性能不优秀
            //Qt只有这一种。
            //还有DefferedRender 延迟渲染
            //还有Tiled-based Deferred ,以及衍生出来 的Forward+ Rendering
            camera: fCamera
            clearColor: rootNode.clearColor
        }
    }
    InputSettings {
        id: inputtingSettings
    }
    FrameAction {
        onTriggered: {
            gConfig.frame++
        }
    }
}

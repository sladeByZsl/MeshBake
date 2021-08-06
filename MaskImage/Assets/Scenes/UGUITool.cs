using System.Collections;
using System.Collections.Generic;
using System.IO;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public static class UGUITool
{
    /// <summary>
    /// 计算子项在容器中的Bounds(相对于container的锚点)
    /// </summary>
    /// <param name="container">可以不是直接父容器</param>
    /// <param name="child"></param>
    /// <returns></returns>
    public static Bounds CalculateBounds(RectTransform container, RectTransform child)
    {
        Vector3[] corners = new Vector3[4];
        child.GetWorldCorners(corners);

        Matrix4x4 containerWorldToLocalMatrix = container.worldToLocalMatrix;
        var vMin = new Vector3(float.MaxValue, float.MaxValue, float.MaxValue);
        var vMax = new Vector3(float.MinValue, float.MinValue, float.MinValue);

        for (int j = 0; j < 4; j++)
        {
            Vector3 v = containerWorldToLocalMatrix.MultiplyPoint3x4(corners[j]);
            vMin = Vector3.Min(v, vMin);
            vMax = Vector3.Max(v, vMax);
        }

        Bounds bounds = new Bounds(vMin, Vector3.zero);
        bounds.Encapsulate(vMax);

        return bounds;
    }

    // 计算RectTransform的Bounds
    public static Bounds CalculateBounds(RectTransform rectTransform)
    {
        return new Bounds(rectTransform.rect.center, rectTransform.rect.size);
    }

    // 获取GUI元素在Canvas中的矩形区域
    public static Rect GetCanvasRect(RectTransform t, Canvas c)
    {
        if (c == null)
            return new Rect();

        //1.获取t的世界坐标
        //2.将t的世界坐标转成c的本地坐标

        Vector3[] worldCorners = new Vector3[4];
        Vector3[] canvasCorners = new Vector3[4];
        t.GetWorldCorners(worldCorners);
        var canvasTransform = c.GetComponent<Transform>();
        for (int i = 0; i < 4; ++i)
            canvasCorners[i] = canvasTransform.InverseTransformPoint(worldCorners[i]);
        //计算出的x,y坐标是相对于Canvas锚点的
        return new Rect(canvasCorners[0].x, canvasCorners[0].y, canvasCorners[2].x - canvasCorners[0].x, canvasCorners[2].y - canvasCorners[0].y);
    }

    // 设置相对于锚点的坐标
    public static void SetAnchoredPosition(RectTransform rectTransform, float x, float y)
    {
        Vector2 anchoredPosition = rectTransform.anchoredPosition;
        anchoredPosition.x = x;
        anchoredPosition.y = y;
        rectTransform.anchoredPosition = anchoredPosition;
    }

    public static void SetAnchoredPositionX(RectTransform rectTransform, float x)
    {
        Vector2 anchoredPosition = rectTransform.anchoredPosition;
        anchoredPosition.x = x;
        rectTransform.anchoredPosition = anchoredPosition;
    }

    public static void SetAnchoredPositionY(RectTransform rectTransform, float y)
    {
        Vector2 anchoredPosition = rectTransform.anchoredPosition;
        anchoredPosition.y = y;
        rectTransform.anchoredPosition = anchoredPosition;
    }

    // 设置相对于锚点的坐标偏移
    public static void SetAnchoredPositionOffsetX(RectTransform rectTransform, float x)
    {
        Vector2 anchoredPosition = rectTransform.anchoredPosition;
        anchoredPosition.x += x;
        rectTransform.anchoredPosition = anchoredPosition;
    }

    public static void SetAnchoredPositionOffsetY(RectTransform rectTransform, float y)
    {
        Vector2 anchoredPosition = rectTransform.anchoredPosition;
        anchoredPosition.y += y;
        rectTransform.anchoredPosition = anchoredPosition;
    }

    // 绕轴旋转
    public static void SetAnchoredRotate(RectTransform rectTransform, Vector3 axis, float angle)
    {
        rectTransform.Rotate(axis, angle);
    }

    // 设置上边距
    public static void SetMarginTop(RectTransform rectTransform, float top, float size)
    {
        rectTransform.SetInsetAndSizeFromParentEdge(RectTransform.Edge.Top, top, size);
    }

    // 设置下边距
    public static void SetMarginBottom(RectTransform rectTransform, float bottom, float size)
    {
        rectTransform.SetInsetAndSizeFromParentEdge(RectTransform.Edge.Bottom, bottom, size);
    }

    // 设置左边距
    public static void SetMarginLeft(RectTransform rectTransform, float left, float size)
    {
        rectTransform.SetInsetAndSizeFromParentEdge(RectTransform.Edge.Left, left, size);
    }

    // 设置右边距
    public static void SetMarginRight(RectTransform rectTransform, float right, float size)
    {
        rectTransform.SetInsetAndSizeFromParentEdge(RectTransform.Edge.Right, right, size);
    }

    // 设置边距
    public static void SetMargin(RectTransform rectTransform, float top, float bottom, float left, float right, float size)
    {
        rectTransform.SetInsetAndSizeFromParentEdge(RectTransform.Edge.Top, top, size);
        rectTransform.SetInsetAndSizeFromParentEdge(RectTransform.Edge.Bottom, bottom, size);
        rectTransform.SetInsetAndSizeFromParentEdge(RectTransform.Edge.Left, left, size);
        rectTransform.SetInsetAndSizeFromParentEdge(RectTransform.Edge.Right, right, size);
    }

    // 设置宽度
    public static void SetRectTransformWidth(RectTransform rectTransform, float width)
    {
        rectTransform.SetSizeWithCurrentAnchors(RectTransform.Axis.Horizontal, width);
    }

    // 设置宽度
    public static void SetRectTransformWidth(RectTransform rectTransform, RectTransform widthRectTransform)
    {
        float width = widthRectTransform.sizeDelta.x;
        rectTransform.SetSizeWithCurrentAnchors(RectTransform.Axis.Horizontal, width);
    }

    // 设置高度
    public static void SetRectTransformHeight(RectTransform rectTransform, float height)
    {
        rectTransform.SetSizeWithCurrentAnchors(RectTransform.Axis.Vertical, height);
    }

    // 设置高度
    public static void SetRectTransformHeight(RectTransform rectTransform, RectTransform heightRectTransform)
    {
        float height = heightRectTransform.sizeDelta.y;
        rectTransform.SetSizeWithCurrentAnchors(RectTransform.Axis.Vertical, height);
    }

    // 设置宽高 scaleFactor: Canvas.scaleFactor
    public static void SetWidthAndHeight(RectTransform rectTransform, float width, float height, float scaleFactor = 1.0f)
    {
        rectTransform.SetSizeWithCurrentAnchors(RectTransform.Axis.Horizontal, width / scaleFactor);
        rectTransform.SetSizeWithCurrentAnchors(RectTransform.Axis.Vertical, height / scaleFactor);
    }

    // 允许随父容器水平拉申
    public static void SetAnchorsHorizontalStrength(RectTransform rectTransform)
    {
        rectTransform.anchorMin = new Vector2(0, 0.5f);
        rectTransform.anchorMax = new Vector2(1, 0.5f);
    }

    // 允许随父容器垂直拉申
    public static void SetAnchorsVerticalStrength(RectTransform rectTransform)
    {
        rectTransform.anchorMin = new Vector2(0.5f, 0);
        rectTransform.anchorMax = new Vector2(0.5f, 1);
    }

    // 居中
    public static void SetAnchorsMiddle(RectTransform rectTransform)
    {
        rectTransform.anchorMin = new Vector2(0.5f, 0.5f);
        rectTransform.anchorMax = new Vector2(0.5f, 0.5f);
    }

    // 全屏拉伸
    public static void SetAnchorsStretch(RectTransform rectTransform)
    {
        //第2个参数是离父容器边界的距离，第3个参数是大小
        rectTransform.SetInsetAndSizeFromParentEdge(RectTransform.Edge.Left, 0, 0);
        rectTransform.SetInsetAndSizeFromParentEdge(RectTransform.Edge.Right, 0, 0);
        rectTransform.SetInsetAndSizeFromParentEdge(RectTransform.Edge.Top, 0, 0);
        rectTransform.SetInsetAndSizeFromParentEdge(RectTransform.Edge.Bottom, 0, 0);
        rectTransform.anchorMin = new Vector2(0f, 0f);
        rectTransform.anchorMax = new Vector2(1f, 1f);
    }

    // 设置rectTransform的宽高与sprite的分辨率一至
    public static void SetNativeSize(RectTransform rectTransform, Sprite sprite)
    {
        if (rectTransform == null || sprite == null)
            return;
        Canvas canvas = rectTransform.gameObject.GetComponentInParent<Canvas>();
        float pixelsPerUnit = 1;
        if (canvas != null)
            pixelsPerUnit = sprite.pixelsPerUnit / canvas.referencePixelsPerUnit;
        float w = sprite.rect.width / pixelsPerUnit;
        float h = sprite.rect.height / pixelsPerUnit;
        rectTransform.anchorMax = rectTransform.anchorMin;
        rectTransform.sizeDelta = new Vector2(w, h);
    }

    // RectTransform四个角的坐标转屏幕坐标
    public static Vector2[] GetScreenCorners(RectTransform rectTransform, Camera cam = null)
    {
        if (rectTransform == null)
            return new Vector2[4];

        Vector3[] worldCorners = new Vector3[4];
        rectTransform.GetWorldCorners(worldCorners);

        Vector2[] screenCorners = new Vector2[4];
        for (int i = 0; i < worldCorners.Length; i++)
        {
            screenCorners[i] = RectTransformUtility.WorldToScreenPoint(cam, worldCorners[i]);
        }
        return screenCorners;
    }

    // 获取RectTransform所在屏幕区域(注意：屏幕坐标原点在左下角)
    public static Rect GetScreenRect(RectTransform rectTransform, Camera cam = null)
    {
        Vector2[] screenCorners = GetScreenCorners(rectTransform, cam);
        float x = screenCorners[0].x;
        float y = screenCorners[0].y;
        float w = screenCorners[2].x - screenCorners[0].x;
        float h = screenCorners[2].y - screenCorners[0].y;
        Rect rect = new Rect();
        rect.Set(x, y, w, h);
        return rect;
    }

    // 对RectTransform区域截屏
    // yield return new WaitForEndOfFrame();//必须在当前帧绘制完后才能截屏，否则会报错
    public static Texture2D CaptureScreenRect(RectTransform rectTransform, Camera cam = null)
    {
        if (rectTransform == null)
            return Texture2D.whiteTexture;

        Vector2[] screenCorners = GetScreenCorners(rectTransform, cam);
        Vector2 corner0 = screenCorners[0];
        Vector2 corner2 = screenCorners[2];
        int width = (int)(corner2.x - corner0.x);
        int height = (int)(corner2.y - corner0.y);
        Rect rect = new Rect(corner0.x, corner0.y, width, height);
        Texture2D screenShot = new Texture2D(width, height, TextureFormat.RGB24, false);
        // 读取屏幕像素信息并存储为纹理数据
        screenShot.ReadPixels(rect, 0, 0);
        screenShot.Apply();
        return screenShot;
    }

    // 保存Texture
    public static void SaveTexture(Texture2D tex, string path)
    {
        byte[] bytes = tex.EncodeToPNG();
        File.WriteAllBytes(path, bytes);
    }

    // 屏幕坐标转本地坐标
    // Canvas的Render Mode选择Screen Space - Overlay时Camera传null
    public static Vector2 ScreenPointToLocal(RectTransform rectTransform, Vector2 screenPoint, Camera cam = null)
    {
        Vector2 localPoint;
        RectTransformUtility.ScreenPointToLocalPointInRectangle(rectTransform, screenPoint, cam, out localPoint);
        return localPoint;
    }

    /// <summary>
    /// 转载 https://www.cnblogs.com/shanksyi/p/5634060.html
    /// 获取指定距离下相机视口四个角的坐标
    /// </summary>
    /// <param name="cam" />
    /// <param name="distance" />相对于相机的距离
    /// <returns></returns>
    public static Vector3[] GetCameraFovPositionByDistance(Camera cam, float distance)
    {
        Vector3[] corners = new Vector3[4];

        float halfFOV = (cam.fieldOfView * 0.5f) * Mathf.Deg2Rad;
        float aspect = cam.aspect;

        float height = distance * Mathf.Tan(halfFOV);
        float width = height * aspect;

        Transform tx = cam.transform;

        // 左上角
        corners[0] = tx.position - (tx.right * width);
        corners[0] += tx.up * height;
        corners[0] += tx.forward * distance;

        // 右上角
        corners[1] = tx.position + (tx.right * width);
        corners[1] += tx.up * height;
        corners[1] += tx.forward * distance;

        // 左下角
        corners[2] = tx.position - (tx.right * width);
        corners[2] -= tx.up * height;
        corners[2] += tx.forward * distance;

        // 右下角
        corners[3] = tx.position + (tx.right * width);
        corners[3] -= tx.up * height;
        corners[3] += tx.forward * distance;

        return corners;
    }

    // RectTransform区域转屏幕上的像素区域
    public static Rect PixelAdjustRect(RectTransform rt, Canvas canvas)
    {
        return RectTransformUtility.PixelAdjustRect(rt, canvas);
    }

    // 使Anchors的宽高与Text内容一致
    public static IEnumerator TextPreferredSize(Text t, RectTransform.Axis axis)
    {
        yield return new WaitForEndOfFrame();
        //以面的代码等效于t.preferredWidth、t.preferredHeight
        TextGenerator tg = t.cachedTextGeneratorForLayout;
        TextGenerationSettings settings = t.GetGenerationSettings(Vector2.zero);
        float size = (axis == RectTransform.Axis.Horizontal) ?
            tg.GetPreferredWidth(t.text, settings) : tg.GetPreferredHeight(t.text, settings);
        size /= t.pixelsPerUnit;
        //end
        RectTransform rectTransform = t.GetComponent<RectTransform>();
        rectTransform.SetSizeWithCurrentAnchors(axis, size);
    }

    // 获取Text宽度
    public static float GetTextPreferredWidth(Text t)
    {
        float width, height;
        GetTextPreferredSize(t, out width, out height);
        return width;
    }

    // 获取Text高度
    public static float GetTextPreferredHeight(Text t)
    {
        float width, height;
        GetTextPreferredSize(t, out width, out height);
        return height;
    }

    // 获取Text大小
    public static void GetTextPreferredSize(Text t, out float width, out float height)
    {
        //需要强制更新一次
        Canvas.ForceUpdateCanvases();
        TextGenerator tg = t.cachedTextGeneratorForLayout;
        TextGenerationSettings settings = t.GetGenerationSettings(Vector2.zero);
        width = tg.GetPreferredWidth(t.text, settings) / t.pixelsPerUnit;
        //如果Horizontal Overflow=Wrap,必须勾上Best Fit，否则获取到的高度不准。
        height = tg.GetPreferredHeight(t.text, settings) / t.pixelsPerUnit;
    }

    // 适配: 等比缩放
    public static void Zoom(RectTransform container, RectTransform rectTransform, float width, float height)
    {
        Vector3[] corners = new Vector3[4];
        container.GetLocalCorners(corners);

        float w = corners[2].x - corners[0].x;
        float h = corners[2].y - corners[0].y;
        float scale = 1;

        if (width > w)
        {
            scale = w / width;
            width = w;
            height *= scale;
        }

        if (height > h)
        {
            scale = h / height;
            height = h;
            width *= scale;
        }

        SetAnchorsMiddle(rectTransform);
        SetWidthAndHeight(rectTransform, width, height);
    }

    // 等比缩放，尽量填满父容器
    public static void FitInParent(RectTransform parent, RectTransform rectTransform, Texture texture)
    {
        Rect parent_rect = GetScreenRect(parent);
        //float aspect = texture.width / texture.height;
        float percent = 0f;
        float width = texture.width;
        float height = texture.height;

        //图片需要等比放大
        if (width < parent_rect.width && height < parent_rect.height)
        {
            float deltaW = parent_rect.width - width;
            float deltaH = parent_rect.height - height;
            if (deltaW < deltaH)
            {
                percent = 1 + deltaW / width;
                width = parent_rect.width;
                height *= percent;
            }
            else
            {
                percent = 1 + deltaH / height;
                height = parent_rect.height;
                width *= percent;
            }
        }

        //越界检测
        if (width > parent_rect.width)
        {
            percent = 1 - (width - parent_rect.width) / width;
            width = parent_rect.width;
            height *= percent;
        }

        if (height > parent_rect.height)
        {
            percent = 1 - (height - parent_rect.height) / height;
            height = parent_rect.height;
            width *= percent;
        }

        rectTransform.sizeDelta = new Vector2(width, height);
    }

    // 找到Root Canvas
    public static Canvas FindRootCanvas(Transform transform = null)
    {
        Canvas canvas = null;
        if (transform == null)
        {
            GameObject go = GameObject.FindGameObjectWithTag("RootCanvas");
            if (go == null)
                return null;
            canvas = go.GetComponent<Canvas>();
            return canvas;
        }

        Transform tran = transform;
        while (tran.parent != null)
            tran = transform.parent;
        canvas = tran.GetComponent<Canvas>();
        return canvas;
    }

    // 获取父容器大小
    public static Vector2 GetParentSize(RectTransform rectTransform)
    {
        RectTransform parent = rectTransform.parent as RectTransform;
        if (!parent)
            return Vector2.zero;
        return parent.rect.size;
    }

    // 获取大小
    public static Vector2 GetSize(RectTransform rectTransform)
    {
        return rectTransform.rect.size;
    }

    // 获取Canvas的缩放值
    public static float RootCanvasScaleFactor()
    {
        Canvas rootCanvas = FindRootCanvas();
        if (rootCanvas == null)
            return 1.0f;
        return rootCanvas.scaleFactor;
    }

    // 去掉路径前缀
    public static string TrimFilePrefix(string path)
    {
        path = path.Replace("file://", "");
        return path;
    }

    // 替换文件名
    public static string ReplaceFileName(string path, string newFileName)
    {
        string extension = Path.GetExtension(path);
        int index = path.LastIndexOf('/');
        path = path.Substring(0, index);
        path = string.Format("{0}/{1}{2}", path, newFileName, extension);
        return path;
    }

    /// <summary>
    /// 获取鼠标停留处UI
    /// </summary>
    public static GameObject GetOverUI(GameObject canvas)
    {
        PointerEventData pointerEventData = new PointerEventData(EventSystem.current);
        pointerEventData.position = Input.mousePosition;
        GraphicRaycaster gr = canvas.GetComponent<GraphicRaycaster>();
        List<RaycastResult> results = new List<RaycastResult>();
        gr.Raycast(pointerEventData, results);
        if (results.Count != 0)
            return results[0].gameObject;
        return null;
    }

    //RenderTexture转Texture2D
    public static Texture2D ConvertTexture2D(RenderTexture renderTexture)
    {
        int width = renderTexture.width;
        int height = renderTexture.height;
        Texture2D texture2D = new Texture2D(width, height, TextureFormat.ARGB32, false);
        RenderTexture.active = renderTexture;
        texture2D.ReadPixels(new Rect(0, 0, width, height), 0, 0);
        texture2D.Apply();
        return texture2D;
    }

    // 判断点击事件是否发生在UI上
    // 参考 https://blog.csdn.net/LIQIANGEASTSUN/article/details/46490041
    public static bool IsPointerOverUI()
    {
        bool over = false;
        if (Input.GetMouseButtonDown(0) || Input.touchCount > 0)
        {
#if UNITY_EDITOR || UNITY_STANDALONE_WIN
            if (EventSystem.current.IsPointerOverGameObject())
#elif UNITY_IPHONE || UNITY_ANDROID
            if (EventSystem.current.IsPointerOverGameObject(Input.GetTouch(0).fingerId))
#else
            if (EventSystem.current.IsPointerOverGameObject())
#endif
                over = true;

            else
                over = false;
        }
        return over;
    }
}
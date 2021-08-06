using System;
using System.Collections;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Events;
using UnityEngine.EventSystems;
using UnityEngine.Serialization;
/// <summary>
/// 滚动文本 (跑马灯效果)
/// </summary>
public class UIRollingText : MonoBehaviour, IPointerClickHandler
{
    [SerializeField] private GameObject root;
    [SerializeField] private RectTransform m_Mask;
    [SerializeField] private Text m_Text;
    [NonSerialized] private RectTransform m_Rect;
    [SerializeField] private float m_Speed = -30f;
    [SerializeField] private bool m_Loop = true;
    //消息列表
    [SerializeField] private List<string> m_MessageList = new List<string>();
    private float m_MaskWidth, m_TextWidth;
    private bool m_Preferred = false;
    private bool m_Playing = false;
    private bool m_Stared = false;
    //超链接列表
    private List<HyperLink> m_HyperLinkList = new List<HyperLink>();
    //超链接点击事件
    public Action<HyperLink> OnClickHyperLinkEvent;

    public struct HyperLink
    {
        //区域
        public Rect rect;
        //超链接参数
        public string href;
        //超链接文本
        public string text;
    }

    private RectTransform rectTransform
    {
        get
        {
            if (m_Rect == null)
                m_Rect = GetComponent<RectTransform>();
            return m_Rect;
        }
    }

    private float X
    {
        get
        {
            return rectTransform.anchoredPosition.x;
        }
        set
        {
            UGUITool.SetAnchoredPositionX(rectTransform, value);
        }
    }

    private void Awake()
    {
        if (m_Text == null)
            m_Text = GetComponent<Text>();
        if (m_Mask == null)
            m_Mask = this.rectTransform.parent.GetComponent<RectTransform>();
        m_MaskWidth = m_Mask.sizeDelta.x;
    }

    void Start()
    {
        m_Stared = true;
        PlayNext();
    }

    void Update()
    {
        if (!m_Playing || !m_Preferred)
            return;

        float deltaX = m_Speed * Time.deltaTime;
        UGUITool.SetAnchoredPositionOffsetX(rectTransform, deltaX);

        // 判断文本是否已跑到最左边
        if (X < -(m_MaskWidth + m_TextWidth))
        {
            X = 0;
            if (m_Loop) //循环播放当前消息
            {
                return;
            }
            else
            {
                m_Preferred = false;
                //播放下一条消息
                if (m_MessageList.Count > 0)
                {
                    string msg = m_MessageList[0];
                    m_MessageList.RemoveAt(0);
                    m_Text.text = msg;
                    StartCoroutine(TextPreferredSize(m_Text));
                }
                else
                {
                    m_Playing = false;
                    //关闭公告
                    Hide();
                }
            }
        }
    }

    // 点击事件
    public void OnPointerClick(PointerEventData eventData)
    {
        Vector2 position = eventData.position;
        Vector2 rect_position = UGUITool.ScreenPointToLocal(rectTransform, position);

        HyperLink hyper = GetHyperLinkByPosition(rect_position);
        if (!string.IsNullOrEmpty(hyper.text))
        {
            //Debug.LogFormat("Click: href={0}, text={1}", hyper.href, hyper.text);
            if (OnClickHyperLinkEvent != null)
                OnClickHyperLinkEvent(hyper);
        }
    }

    // 通过点击坐标获取超链接
    private HyperLink GetHyperLinkByPosition(Vector2 rect_position)
    {
        HyperLink hyperLink = default(HyperLink);
        float x = rect_position.x;
        float y = rect_position.y;

        for (int i = 0; i < m_HyperLinkList.Count; i++)
        {
            HyperLink hyper = m_HyperLinkList[i];
            if (x > hyper.rect.xMin && x < hyper.rect.xMax)
            {
                hyperLink = hyper;
                break;
            }
        }
        return hyperLink;
    }

    // 使Anchors的宽高与Text内容一致
    private IEnumerator TextPreferredSize(Text t)
    {
        yield return new WaitForEndOfFrame();
        TextGenerator tg = t.cachedTextGeneratorForLayout;
        TextGenerationSettings settings = t.GetGenerationSettings(Vector2.zero);
        float size = tg.GetPreferredWidth(t.text, settings) / t.pixelsPerUnit;
        rectTransform.SetSizeWithCurrentAnchors(RectTransform.Axis.Horizontal, size);
        m_TextWidth = size;
        m_Preferred = true;
        yield return new WaitForSeconds(1);//确保TextGenerator生效
        ParseHyperLink(t);
    }

    // 解析文本中的超链接
    private void ParseHyperLink(Text t)
    {
        m_HyperLinkList.Clear();
        string input = t.text;
        string nosymbol_text = StripSymbol(input);

        string pattern = "<a href=\"(?<url>[\\s\\S]*?)\">(?<text>[\\s\\S]*?)</a>";
        Regex reg = new Regex(pattern);
        foreach (Match match in Regex.Matches(input, pattern))
        {
            string url = match.Groups["url"].Value;
            string text = match.Groups["text"].Value;
            Capture capture = match.Groups["text"];
            //Debug.LogFormat("url={0}; text={1}", url, text);

            TextGenerator tg = m_Text.cachedTextGeneratorForLayout;
            //UGUI中标记符的字符不占用文本宽度(即,UICharInfo.charWidth=0)
            UICharInfo[] charInfos = tg.GetCharactersArray();//数组中包含标记符

            int start_index = capture.Index;
            int end_index = capture.Index + capture.Length;
            UICharInfo start_info = charInfos[start_index];
            UICharInfo end_info = charInfos[end_index];
            Rect rect = new Rect();
            rect.xMin = start_info.cursorPos.x;
            rect.xMax = end_info.cursorPos.x;

            HyperLink hyper = new HyperLink();
            hyper.href = url;
            hyper.text = StripSymbol(text);
            hyper.rect = rect;
            m_HyperLinkList.Add(hyper);
        }
    }

    // 返回不含标记符的文本
    private string StripSymbol(string text)
    {
        string str = string.Empty;
        List<char> list = new List<char>();
        bool findSymbol = false;
        for (int i = 0; i < text.Length; i++)
        {
            if (text[i] == '<')
            {
                findSymbol = true;
                continue;
            }

            if (text[i] == '>')
            {
                findSymbol = false;
                continue;
            }

            if (findSymbol)
                continue;

            list.Add(text[i]);
        }
        str = new string(list.ToArray());
        return str;
    }


    private void Hide()
    {
        root.SetActive(false);
    }

    private void Show()
    {
        root.SetActive(true);
    }

    // 播放下一条消息
    private void PlayNext()
    {
        if (m_MessageList.Count <= 0)
            return;
        X = 0;
        string msg = m_MessageList[0];
        m_MessageList.RemoveAt(0);
        m_Text.text = msg;
        m_Preferred = false;
        m_Playing = true;
        StartCoroutine(TextPreferredSize(m_Text));
    }

    // 添加消息
    public void AddMessage(string msg)
    {
        m_MessageList.Add(msg);
        if (m_Playing)
            return;
        Show();
        if (m_Stared)
            PlayNext();
    }
}
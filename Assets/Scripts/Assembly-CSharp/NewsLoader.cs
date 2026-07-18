using System;
using System.Collections.Generic;
using MEC;
using Steamworks;
using TMPro;
using UnityEngine;
using UnityEngine.Networking;
using UnityEngine.UI;

public class NewsLoader : MonoBehaviour
{
    [Serializable]
    public class Announcement
    {
        public string Title;
        public string Content;
        public string Date;
        public string Link;
        public NewsElement Thumbnail;

        public Announcement(string title, string content, string date, string link, NewsElement thumbnail)
        {
            Title = title;
            Content = content;
            Date = date;
            Link = link;
            Thumbnail = thumbnail;
        }
    }

    [Header("=== НАСТРОЙКИ СВОИХ НОВОСТЕЙ ===")]
    [SerializeField] private bool UseCustomNewsServer = true;
    [SerializeField] private string CustomNewsUrl = "https://githubusercontent.com";

    [Space]
    [SerializeField] private TextMeshProUGUI ArticleText;
    [SerializeField] private RectTransform ContentParent;
    [SerializeField] private RectTransform Element;
    [SerializeField] private Button OpenNewsUrlButton;

    private List<Announcement> _announcements;
    private string _curAnncUrl;

    private void Start()
    {
        _announcements = new List<Announcement>();
        Timing.RunCoroutine(Request());
    }

    private IEnumerator<float> Request()
    {
        string targetUrl = UseCustomNewsServer && !string.IsNullOrEmpty(CustomNewsUrl)
            ? CustomNewsUrl
            : "https://steampowered.com";

        if (UseCustomNewsServer && !string.IsNullOrEmpty(targetUrl))
        {
            string separator = targetUrl.Contains("?") ? "&" : "?";
            targetUrl = $"{targetUrl}{separator}nocache={DateTime.UtcNow.Ticks}";
        }

        using UnityWebRequest www = UnityWebRequest.Get(targetUrl);

        yield return Timing.WaitUntilDone(www.SendWebRequest());

        if (string.IsNullOrEmpty(www.error))
        {
            TextProcessor(www.downloadHandler.text);
            Debug.Log("Web request succeeded");
        }
        else
        {
            if (ArticleText != null)
                ArticleText.text = "Web request failed: " + www.error;
            Debug.LogError("Web request failed: " + www.error);
        }
    }

    private void TextProcessor(string json)
    {
        NewsRaw newsRaw = JsonSerialize.FromJson<NewsRaw>(json);
        if (newsRaw == null || newsRaw.appnews == null || newsRaw.appnews.newsitems == null) return;

        foreach (var newsItem in newsRaw.appnews.newsitems)
        {
            string title = newsItem.title ?? "Update";
            string date = newsItem.date != 0
                ? DateTimeOffset.FromUnixTimeSeconds(newsItem.date).ToLocalTime().ToString("yyyy-MM-dd")
                : "Unknown date";

            // Просто меняем текстовый маркер из файла на реальный перенос строки
            string content = (newsItem.contents ?? "").Replace("\\n", "\n");

            RectTransform instance = Instantiate(Element, ContentParent);
            NewsElement newsElement = instance.GetComponent<NewsElement>();
            if (newsElement == null) continue;

            // Заполняем карточку справа
            if (newsElement.Title != null) newsElement.Title.text = title;
            if (newsElement.Date != null) newsElement.Date.text = date;
            if (newsElement.Content != null) newsElement.Content.text = "Нажмите, чтобы открыть лог";

            newsElement.Id = _announcements.Count;
            newsElement.transform.localScale = Vector3.one;

            _announcements.Add(new Announcement(title, content, date, newsItem.url, newsElement));
        }

        ShowAnnouncement(0);
    }

    public void OpenAnnouncementUrl()
    {
        if (string.IsNullOrEmpty(_curAnncUrl)) return;

        if (SteamManager.IsSteamReady())
            SteamFriends.OpenWebOverlay(_curAnncUrl, false);
        else
            Application.OpenURL(_curAnncUrl);
    }

    public void ShowAnnouncement(int id)
    {
        if (_announcements == null || id < 0 || id >= _announcements.Count) return;

        Announcement ann = _announcements[id];
        _curAnncUrl = ann.Link;

        if (ArticleText != null)
        {
            ArticleText.text = ann.Content;
        }

        if (OpenNewsUrlButton != null)
            OpenNewsUrlButton.interactable = !string.IsNullOrEmpty(_curAnncUrl);

        for (int i = 0; i < _announcements.Count; i++)
        {
            NewsElement el = _announcements[i].Thumbnail;
            if (el == null) continue;
            el.transform.localScale = (i == id) ? Vector3.one : new Vector3(0.78125f, 0.78125f, 0.78125f);
        }
    }
}

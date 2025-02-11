## 📧 Configuration du compte mail

### 🌐 Serveur SMTP
- **Nom du serveur** : `mail.mailo.com`
- **Port** : `465`
- **Protocole** : `SSL/TLS`

### 📥 Serveur IMAP
- **Nom du serveur** : `mail.mailo.com`
- **Port** : `993`
- **Protocole** : `SSL/TLS`

### 🗂️ Emplacement des archives
- **Dossier local** : `mailbox:///C:/Users/Administrator/AppData/Roaming/Thunderbird/Profiles/4kxxcg0u.default-esr/Mail/Local Folders/Mes archives`

---

## ✉️ Contenu du mail

From - Thu Jan 02 12:07:05 2025
X-Mozilla-Status: 0003
X-Mozilla-Status2: 00000000
X-Mozilla-Keys:                                                                                 
X-Mozilla-Status: 0001
X-Mozilla-Status2: 00000000
Return-Path: <formationtssr31140@gmail.com>
Received: from mail-ed1-f46.google.com [209.85.208.46]
	by b221-8.in.mailobj.net [192.168.90.28] with ESMTP
	via ip-20.mailobj.net [213.182.54.20]
	for <wcs.formation@mailo.com>; Thu,  2 Jan 2025 13:05:28 +0100 (CET)
X-EA-Recv: time=1735819529;block(0,0,0,0)=0;adbook=0;antispam=0
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d647d5df90so4105921a12.2
        for <wcs.formation@mailo.com>; Thu, 02 Jan 2025 04:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735819527; x=1736424327; darn=mailo.com;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iWDirB/3hiCN9dPUzBC5mG26rFC/ld07K9gRj9c3JGI=;
        b=ccEOW4CNeqszsXfOrQatl83XYbxjc098vfLzj7+783NrrxtEcUlf31rX788esLpygV
         /0Uge8bO6DYeZ06s/ULhFjVMvZ+k3iOZdvYps91ZTNY9X52KQqtVPH3ilx59jEDnCQ2Q
         kZqP3SWXgzELIdHEyk4c0lrqZZ6iue9CpdWyuVpKQnIv/R9cHfA9AOfjR3rI+rW9965N
         guQRNq7kZmJthsaBJes1rk4PTXKQHv3XKfna2+2DSafUFl8GfVRrhMCXC3lL2sJkzUwc
         vfLW7H9qGSQsVvEmmxglDbYfbBZZ2unaaHLYwj0QGFk8xxlIZgTJVbDto/Z3tUv+tAIL
         7slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735819527; x=1736424327;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iWDirB/3hiCN9dPUzBC5mG26rFC/ld07K9gRj9c3JGI=;
        b=Fbk25NL6ujcbuLGFCm7GV/T5G5wRZwJOOfTnT+PW34+96M74KMqvBStSMDMdlvyo5+
         jsTur7nMToXGy1e5FdH7nMJ4s3ypZvcZM7ieQJ0R6uZfVfhA/HhhU8+LZPMxgDRddAHa
         TXTBjAetmUGvv0k3rYi8O1O5XtuT9Ln2MDDIHGw3lSZXq9pJHuCgKnYBGp7BstzNYXXx
         nwVD7kot878DocFrOaALtOHOnrK0LeTPNEcexLWhR5uw8WRFHeypRVlT0IKhnjUhKkVB
         /F9cSPqV7SQpvxqel/2d3YvVQKKSOR3yJJtkZpsgETpzw1Gy/GAx5t398KtUwQ5WuJRb
         WZow==
X-Gm-Message-State: AOJu0YxEItdmBcvX4eMptiqLTb/2pXZL4475legygtQLVPAyJsdLSxoa
	yEBcVDwpufsAtK40FgAaIPvCTNLnr5pDnFIDsouZn7eCG6kwcZwOstLpSD1XsBTgD7BlFO+JeqP
	HGytrxU37WB8vFxSc3X8/DEGWRa1qBg==
X-Gm-Gg: ASbGncshdcaaUSW3EWVNrGQv9H4eKWDKXtujsgKRghb6Pg3zVXt5v/ZtanqbqFZCE1B
	+IdQUEv2yc+ZYNyOKxBrafrV3kUhwcbDs4tD+I5DYhnGCRE2xQleXRab2n7/HgWTtjCIfKA==
X-Google-Smtp-Source: AGHT+IFSJWWZdYH8W3F0QGohaAz1Yg6NFnV5SHqmJNxnOFvfP6D4xzuobGCZ22zdJfOLMlp8g/G+X8sjKkcYO0yA9AU=
X-Received: by 2002:a05:6402:430f:b0:5d1:2631:b88a with SMTP id
 4fb4d7f45d1cf-5d81ddacf87mr31833130a12.17.1735819527024; Thu, 02 Jan 2025
 04:05:27 -0800 (PST)
MIME-Version: 1.0
From: Wilder Wilder <formationtssr31140@gmail.com>
Date: Thu, 2 Jan 2025 04:05:15 -0800
Message-ID: <CAK9FigUvy31XoJWFrF-cn15E0OcQ4a+QW4g4T64rChcQtyDP5w@mail.gmail.com>
Subject: Yo
To: wcs.formation@mailo.com
Content-Type: multipart/alternative; boundary="0000000000004d7d29062ab7fa55"

--0000000000004d7d29062ab7fa55
Content-Type: text/plain; charset="UTF-8"

Bien ou bien ?

--0000000000004d7d29062ab7fa55
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Bien ou bien ?</div>

--0000000000004d7d29062ab7fa55--

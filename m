Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754D52F3C26
	for <devicetree@vger.kernel.org>; Mon,  6 Apr 2026 07:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775461194; cv=none; b=YqwjnkMtNjSrFAhLG2Xe+cgZwGOp+DUekCklEQvBxNolfKXshC79cabtw4MAaasqrh/Zhjcry3tM/KqTUm/d9CaP4ICHFv8nHm17IY45AcYHdPz3AwrfIO9KBotU2lk5gPQpLrdEb8cXC7/615WLpLvBXlpZ2M8EZZI6liQ7lo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775461194; c=relaxed/simple;
	bh=XRCkqtFl2EmutrzZu9SglM3g8lfFjS58SmOubxHiPhw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HKA9ZlVLOc+9L7jjZ2Fe9BbxUYf402SDKqMzd4N6J5OKD4rsH2CAiKKxzmul6USwxvGuezNf4+lEWzqC0npkGt9nHVmQlKHuhn8WNdiAthruYWVwbapUDthA4A26uvnQmGYxJ9soq1ZV3cVIZBmSQqZC97ZsohqCBkKjz5MYesU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n3lxeEaj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n3lxeEaj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488ad135063so7097185e9.0
        for <devicetree@vger.kernel.org>; Mon, 06 Apr 2026 00:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775461192; x=1776065992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PV5yIQv/6bTdgVUZVXXsO9kP+vu/b8exNKt22mhgJ3E=;
        b=n3lxeEajEc2I2dlwlsmRRUpZ54EtRpVYUIczoZ1SpQ8Lk5B5GuKbgnxG/pS5G5stgq
         F5x+gWZufQRL4ryCpF7VzNMOumrP9wN0Yjs7XHdETY2INSMMh5OoiSIrAxszpKhSEj1/
         ekqKUSlkH8AYq82jRp0ovIA8AgEKcHS4pl2V4yeajUhBk9DVJduxapGwwlFdIvHX+DDK
         8xwC6cKhwwY5vRgkexeOa+abaMxbzOkJAoH2IekRvaP8CnpvwPNH8otWlUd8O0QKiVaD
         dhumrLiJSivs7zKQMcyhaJcGkuNAdkJXEtwduzfA1KpF6bLM8mQedTOYKntGv9PiHSQm
         fN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775461192; x=1776065992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PV5yIQv/6bTdgVUZVXXsO9kP+vu/b8exNKt22mhgJ3E=;
        b=T3PWzhG6iXJrHODwN8KbSvy+A6ckuKT0TjO/ptQBX3IGTV1BUD36YyursBWOMfQL+Y
         r/71ktCntuoIB0ABeTiorRhMZnIFSJqsjCkUkm2aRZlaYBtFSADTKFKqdzARqjkxuNlO
         AUt7sA937D82eb4Ydst1CB37lphiB+651bG2nYTnGvu19ax+DGw1o1BBr487Oo9IZK2A
         d5S7+f04BP1UMzFUYz1i9RvVp63UGS2Ab5m2g26H97UvxSymW0/wGHZFGA3MeAVc11CE
         MwnEyCkjmNN1lD0QA9forPdSmE5BQPLowJLXmEQJhAkmH944ZPvTqlbKsbIynfqPAZUl
         pRdg==
X-Forwarded-Encrypted: i=1; AJvYcCX3z/78OpRSigDDadRxxwohdvSGqCOow3ngeJalxiYfpC97zcWRKR3iDJXivexBoi6iCj5R6AscZKER@vger.kernel.org
X-Gm-Message-State: AOJu0YxOoh4GNWFH2/tQoHbzrGeEijqj4zrUrB1+B9WPwBwjc2y5cuua
	3yEQKhoYvMdlF+9K1uWMSua69YcVdNatra4oXjsDj7LOn3R49nmh8lm9
X-Gm-Gg: AeBDieuFF/Z5fLl07LK99JIv239crqzqt6Mrq+bBCY55XKKmUa//lzdLKlBRcp2/oSU
	3LqSsV7cL3VnW5yTn+dttB8lrEOa9xYaiIijZA1dsmZEUjVkiy0qSm80WYRpGcYOmgM/+PQNNR5
	nL1HI2L63rnCW6aYU62L/Qj+9wQcfu2XMnZY2LoepO1OfubgnsK1bgECyTP+tJfoL50dZL1etZR
	X6xVK8iKq8RwstpgzgN9XZeaTZvlQy/gjE6hyPylK7E3zJtnyW2YS18SgG66p8G2391FT2KWZjk
	44MGTV/q6FoqDwEtbKMDu+QYS7tOHQmyhdCOyhhDWWds9dSqSMYdnEL3/YSSRjnOg0bQK4x7vo3
	YK7HCwmv+LfkUI/NsWyNgLOae6cdu2P6fmdtEqAkp89mrjkmEwC/cYoiExdl0mGbBNyyBD/Kn2j
	Fwtdx0H0vuXVuP
X-Received: by 2002:a05:600c:3f0a:b0:487:2439:b7c8 with SMTP id 5b1f17b1804b1-488996a206dmr185178835e9.1.1775461191593;
        Mon, 06 Apr 2026 00:39:51 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e83e906sm527201325e9.8.2026.04.06.00.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 00:39:50 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3 RESEND] drm: bridge: add support for Triple 10-BIT
Date: Mon,  6 Apr 2026 10:39:26 +0300
Message-ID: <20260406073930.24662-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Triple 10-BIT LVDS Transmitter is used in Microsoft Surface RT and
MStar TSUMU88ADT3-LF-1 HDMI bridge is used in ASUS Transformer AiO
P1801-T.

Link to v3: https://lore.kernel.org/lkml/20250824092728.105643-1-clamor95@gmail.com/

---
Changes on switching from v3 to v4:
- rebased on top of v7.0

Changes on switching from v2 to v3:
- place mstar,tsumu88adt3-lf-1 alphabetically
- fix typos

Changes on switching from v1 to v2:
- sort compatible alphabetically in schema
---

David Heidelberg (1):
  dt-bindigs: display: extend the LVDS codec with Triple 10-BIT LVDS
    Transmitter

Maxim Schwalm (1):
  drm/bridge: simple-bridge: Add support for MStar TSUMU88ADT3-LF-1

Svyatoslav Ryhel (1):
  dt-bindigs: display: extend the simple bridge with MStar
    TSUMU88ADT3-LF-1 bridge

 .../devicetree/bindings/display/bridge/lvds-codec.yaml       | 1 +
 .../devicetree/bindings/display/bridge/simple-bridge.yaml    | 1 +
 drivers/gpu/drm/bridge/simple-bridge.c                       | 5 +++++
 3 files changed, 7 insertions(+)

-- 
2.51.0


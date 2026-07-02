Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B155D481643
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782995499; cv=none; b=ZIWf9L1gtmVGJPQbVHocTpwrcXFO5UblzevPKqlSb1m8O2pF6mtuOiNy6soY02izt1z/sPYygQvwq7q9p0c0q4d9ABaJoRcOea39tjb6UzEPdn5oHf8QE63qSNlkOakhMuUwv7A6AL/T5c1JPlXxqqz6sRIbR7Vj1pUKoiSxonw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782995499; c=relaxed/simple;
	bh=xos7in5Tx5zjrpPU8l6pvfEG31w4lotqHqq8+a6Gya0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dEDpFeEAaa3U3mJspYqkiLAr9hVuPKyIlfL3cRmZ5RYYDZRtinSux+Y7uhAKa7NgoSVDxdCqD1bJrdMud8n2QU9C6PKdi/nurvUomQYvSoXWQB/A9aY7TbUDlEZZgU91Bfzfvw7v3moq/6SpgjUT6HzN5gyjosqB6WZjCwXigbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tLMsQTMg; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tLMsQTMg"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-473ba028d46so1778226f8f.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 05:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782995490; x=1783600290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSc0cDIDo1ZXEmAON/XiNWuduFFW8ewj9EMw/32lW/w=;
        b=tLMsQTMgR5OiW254DFThrfMEqVwgSv5X9RP7E926YGgn8hZuU9NbK81qi9+uln57TG
         c9WXWuYBgnx9JwFHT1/i3Iq/o5cnwnO/bJq5dK9Jms9NESE/zdtJaBSbQBBHdbUUyOkX
         iiaemvBSLgqoGYS3/WbF4h1LIwzHv596J2jotIY/aSP5m/8jQFT1iEj4psEJpM2riYLt
         YiMGfe+SvwUqdpVh9e5iqiAEVeKbpqY6/RUJcCB5eO8FzxY6O+Au9PqL0FuXwVz92GXB
         u/K0RdSIfbNdLAOOQO7TyJu1Vt09YrA6Gcnp9eZa5eh4jPpdGP4/q1aq/q2UTofrpPLu
         9e1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782995490; x=1783600290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pSc0cDIDo1ZXEmAON/XiNWuduFFW8ewj9EMw/32lW/w=;
        b=h0u/y/Tu03rfgTEL5eQiquNe7N6RtMQzKcQLavQfyOkasn4ohr/+dhPAEUcabL79Mg
         MGfLaY7K7rTWXYB746aC7ZFkIFzCp7DoDfIJVQK8eFdOAPzGFtIxGv0X59wafkMrwcOD
         nXpA7G4VkTqNGcpuLjX//Fslg8zcpwfIpTYAkhYjWmNzrMYm85MMDLEbdizjGBttqTbR
         2pfgy5Hnt4ZbxFvgnkE9CQpPxf3W64nVZdqyxmZzbmvPBptlIMmvV2yxiObOM67SPgsg
         dmMg8QYw00wT9j1rZaSVJUi8kxu9LVYgcc/8z5L5olUZnH6G7FfMJyouD1kETrLW9EEf
         Z59Q==
X-Forwarded-Encrypted: i=1; AFNElJ+EVuudZTHeWqhEvXITtZ51O1kPdEuWgwr7E4JPPM52E7UaJW6+iW8tpMcnhVXhx0h3WPIyfyPhqREv@vger.kernel.org
X-Gm-Message-State: AOJu0YyaDAf0x5myk4Rea1nLmv5K2bQDoEOi1g8aQB0VginothykCTHY
	5td329pMx3dYSFK08RTEaGiiAXNjfkpQ7XEm7PHe1wDQR+68v0DgnMJh
X-Gm-Gg: AfdE7cme7UM5H2FGbqxh6FbBnGSE/GUSQeAzwSb41XZz6nwB6yCypSI9fUZMVb78Bm0
	Pgw6YmFw3crbRY2XaH3ySSHUqoqyqR34IPv86GmBZVGUUrtvpxGBV6uClHFzU/z1LA1HcblfgJ0
	uijQFHpvCuslB2tuL22l8+EsRDju85vwwJ4nkSwJAyCwbLvwN5Jgp0xU+6cwjGMbp1EL5WIfGPO
	NSoA6IvOOSX1YPffeX7d7/o0l5jB+H4vgszwz2EvKtkv6n/MB7LHh3DumdrUqsL4jlMY+lT1zDF
	JSIjWpSLiTree++nUIU4BMIIHZMZRo5Dnc6SS0c0RJNARciHMjK76ghWdw9v/tORFWJkI6pQpO/
	tnq10dnLe/+5Pao5/e5+uGo/IkGxCZx2Ysy7wDuiPTBKDsCLa5ytXNy87Ke36SLt0aPvz+AC6Kg
	NiR1+sIdQRvTcfL8JO6dTwcGxHpUr5ENxVTQvDMHvZQwJQ6Ev/5YWjzw3mmtyWnV7XT2MvC5sft
	Lbu/4IPzW3swlgjW5engLMfiR82bKKc35UlHg==
X-Received: by 2002:a05:600c:4f48:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-493c2b5400amr102965325e9.15.1782995490018;
        Thu, 02 Jul 2026 05:31:30 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7a4b:58b4:175e:8c2d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477ddf0f433sm9772923f8f.32.2026.07.02.05.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:31:29 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC v2 6/9] watchdog: rzv2h: Refactor WDTDCR start/stop handling
Date: Thu,  2 Jul 2026 13:31:09 +0100
Message-ID: <20260702123112.161160-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Refactor the WDTDCR start/stop helpers by introducing a common
rzt2h_wdt_wdtdcr_count_ctrl() function that controls the WDTSTOPCTRL
bit based on a boolean parameter.

This is in preparation for switching WDTDCR access to regmap-based
handling, where consolidating the control path simplifies the
conversion.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change.
---
 drivers/watchdog/rzv2h_wdt.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 3b6abb66a1da..e9545b8f5fd0 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -89,18 +89,26 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
 	return 0;
 }
 
-static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
+static void rzt2h_wdt_wdtdcr_count_ctrl(struct rzv2h_wdt_priv *priv, bool start)
 {
 	u32 reg = readl(priv->wdtdcr + WDTDCR);
 
-	writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+	if (start)
+		reg &= ~WDTDCR_WDTSTOPCTRL;
+	else
+		reg |= WDTDCR_WDTSTOPCTRL;
+
+	writel(reg, priv->wdtdcr + WDTDCR);
 }
 
-static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
+static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
 {
-	u32 reg = readl(priv->wdtdcr + WDTDCR);
+	rzt2h_wdt_wdtdcr_count_ctrl(priv, false);
+}
 
-	writel(reg & ~WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
+{
+	rzt2h_wdt_wdtdcr_count_ctrl(priv, true);
 }
 
 static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
-- 
2.54.0


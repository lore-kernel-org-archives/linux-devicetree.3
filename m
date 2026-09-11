Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B108D3F12D8
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 11:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125482; cv=none; b=NuDwufY/dANLjlV9fRgOMr5Gx37BDbg2vDKyjYVm9ZgyT93McEeWdAauz0H5ZeAzxyjeP1SCPwFxwQZePyf3XlVcuh49PrtxKNfgDW1yY+X7JjEJsPJ1hsoK7QPNFkEcicGAZVvfLXO/gdBBWpmkxFrzTJ+2fR3io7UbrcUwoV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125482; c=relaxed/simple;
	bh=o2Tt/yZd0egGDvWknmiYQzQA8JdKjOEMa19faoQ8SpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JOudPIhRffoW0iswplarIN3h0SH1qI36JXLmEh4BsaZWAYJNT+VU5RfFyx/zuhaouCbtg0t9VqX/Oav1wm0swLUTzZPcaAS2bBDiw2dv9ggOVjv8HFUxNPz6Kts13WTVI44lmFWUFQ5zClGME+eTWjO9BNAnLJ4A0slEp6l6FuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fc/nwl8k; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fc/nwl8k"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so4607625e9.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 04:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125466; x=1789730266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NXZjEIsYlhrDTNZ38lYdKcFWIDewXWmia/iEsbM8DKc=;
        b=fc/nwl8k8UamwQgYFr+A3yqxLg9VTSJ9yGavNWm1xg3BDgbMggz26LDX+cAOWdg7q7
         UvCiArina7hDecsq+tieOLKCNormSkdujrzWTBGxmwxhQ96bOyFGPzIhptWjXB+3e2za
         ltdMOYRwGxu36ha/QQEk6BDhz1KOpAOHjmvEMpcRrvyes3aWb7AYeZaZv2TnnJpHorkT
         6ErG+rGuvTbXX/YebLkIcTz6L6IbhZSNTfC65jRpD52tVxS9ui4Ngdo9B7fQBzrpdoEZ
         K5FfHkBxjeML0/Exht3NiJzwnKlUv0ns99H6/fnss+SfkhW8wYvuID06Pgd1A1SDA3tj
         MPig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125466; x=1789730266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NXZjEIsYlhrDTNZ38lYdKcFWIDewXWmia/iEsbM8DKc=;
        b=okI34h8mW3853qR/U+miqpQT2Ld/zlIMFLpHE4T1uONo2G98QJCCWhg51wgAXfWxYY
         P+s7RToTgRc3jWA4rcfG769k2cmAUzYt/Q+T3z58AKZZkszT7q9mkWu6jcDVCxdoweCA
         m1ww+IRlS0+LWOWtij/pJMvAOkJM11yy1yScUwr5Om+UNfGJalp842B7gPeIyoeS4ygu
         AwUwPxxgD3XjtbP08ar7c0YH2GXxFqDnh50gcPOvyoocAyV5d+bZP8qHFNnm5fUCrVuJ
         MvRxdV3UoqaogdQJ6eLnW7zhLI/G6DcNVc5s0uVS7hDfwXTPEU2n5u3u1bdXuXqJ/CrW
         2wqA==
X-Forwarded-Encrypted: i=1; AKwUvBxYMMYzxmdGNCTZwp0+fDr8zGUrT+pEeLgnpG5lgu9Ari9D3ra3xcElb0k3tRUtEUg5i4oeD/xL9GBI@vger.kernel.org
X-Gm-Message-State: AFuF++l/SPmpcTJGJiZHBel/qiIJZp+OtO9OKh0h1lN6KTwisdkyjYOJ
	v2C4ndSO6V7wnJh5S2yi/wrXz9lVdUAvwk7ppZkNchfqAoO8BsCgoELz
X-Gm-Gg: AYBFou3eoH2thWqLb4D3qe+92XKXq9mkBG6FSqrpBloIucXkRnrTLswINYJLi8QQ8U5
	Pr0wMghAzbLDCCRDt/GW72HcO73+Wc+WbvqoOSBA5WQaTfzNnsyGhgt3eUQzBTLPAD0PzFrKUhT
	dxoyCOr/cQs429/I3yAHmNW9eqzcSNWzB436ZFArjpDdupE/zSSi0gXNUdxYJfTLeqx1wZC0r3D
	hG6LQMTdbBlc8qO7jUjirPdWelIXMfBIJ0SzzrprwWY47ykWCAXGTdKJiEQwj77WPMY5M4HaU0n
	HkU2WV32Wnu+V6l8urURaK0xuT4j5v+cKs5z8tGFXp1L7MYc8SVJJm7R63ohtfIiwOtyGoa9kEi
	MhXiTfcswAnblGgNx8atenkVfuZShaqY6KCj4meCHak0/aooAV8Nh0N+sTjwsOpzoowL5066Cyb
	GXbObQM81TGZv93fy4krG5hhpVz6kXgbZaycV29V7UeKr9yQant3Mt80DvyYO8JI8MyjHhKuqu8
	2J3AkBMjU1N0YknOHKXZuX9bRnwE6/PIgXw+bskXpeO4e5i1Tt4eUmd3O7d+lPl9abBA64yoVbQ
	YDB6we1Pgx38tswOP2JrLfj9t3wRjYM=
X-Received: by 2002:a05:600c:a40e:b0:49e:65ac:eb5f with SMTP id 5b1f17b1804b1-49e65aced4bmr38572495e9.10.1789125466496;
        Fri, 11 Sep 2026 04:17:46 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3de1:9f21:e874:3931])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm5438182f8f.5.2026.09.11.04.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:17:46 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 3/8] watchdog: rzv2h: Propagate WDTDCR access errors
Date: Fri, 11 Sep 2026 12:17:26 +0100
Message-ID: <20260911111731.3404308-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260911111731.3404308-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The WDTDCR helpers access the register directly using readl()/writel() and
therefore cannot report failures to their callers. WDTDCR is located in a
shared syscon region and will be accessed through regmap in a subsequent
change, where register accesses can fail.

Make rzt2h_wdt_wdtdcr_count_start() and rzt2h_wdt_wdtdcr_count_stop()
return an error so their callers can propagate failures.

Handle these errors in the watchdog start and stop paths and unwind the
resources acquired before the WDTDCR access, restoring the reset state.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- Dropped checking rzt2h_wdt_wdtdcr_count_start() return value in
  restart path.

v2->v3:
- New patch, split from v2 patch #1 to make thing easier to review.
---
 drivers/watchdog/rzv2h_wdt.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index 7c6a4855bd8a..cbf414e0c9a3 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -87,18 +87,22 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
 	return 0;
 }
 
-static void rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
+static int rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
 {
 	u32 reg = readl(priv->wdtdcr + WDTDCR);
 
 	writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+
+	return 0;
 }
 
-static void rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
+static int rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
 {
 	u32 reg = readl(priv->wdtdcr + WDTDCR);
 
 	writel(reg & ~WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+
+	return 0;
 }
 
 static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
@@ -148,8 +152,14 @@ static int rzv2h_wdt_start(struct watchdog_device *wdev)
 	rzv2h_wdt_setup(wdev, of_data->cks_max | WDTCR_RPSS_100 |
 			WDTCR_RPES_0 | of_data->tops);
 
-	if (priv->of_data->wdtdcr)
-		rzt2h_wdt_wdtdcr_count_start(priv);
+	if (priv->of_data->wdtdcr) {
+		ret = rzt2h_wdt_wdtdcr_count_start(priv);
+		if (ret) {
+			reset_control_assert(priv->rstc);
+			pm_runtime_put(wdev->parent);
+			return ret;
+		}
+	}
 
 	/*
 	 * Down counting starts after writing the sequence 00h -> FFh to the
@@ -169,8 +179,13 @@ static int rzv2h_wdt_stop(struct watchdog_device *wdev)
 	if (ret)
 		return ret;
 
-	if (priv->of_data->wdtdcr)
-		rzt2h_wdt_wdtdcr_count_stop(priv);
+	if (priv->of_data->wdtdcr) {
+		ret = rzt2h_wdt_wdtdcr_count_stop(priv);
+		if (ret) {
+			reset_control_deassert(priv->rstc);
+			return ret;
+		}
+	}
 
 	pm_runtime_put(wdev->parent);
 
@@ -219,8 +234,10 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
 	rzv2h_wdt_setup(wdev, priv->of_data->cks_min | WDTCR_RPSS_25 |
 			WDTCR_RPES_75 | WDTCR_TOPS_1024);
 
-	if (priv->of_data->wdtdcr)
+	if (priv->of_data->wdtdcr) {
+		/* best effort, ignore ret */
 		rzt2h_wdt_wdtdcr_count_start(priv);
+	}
 
 	rzv2h_wdt_ping(wdev);
 
@@ -251,11 +268,11 @@ static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 	if (ret)
 		return ret;
 
-	rzt2h_wdt_wdtdcr_count_stop(priv);
+	ret = rzt2h_wdt_wdtdcr_count_stop(priv);
 
 	pm_runtime_put(&pdev->dev);
 
-	return 0;
+	return ret;
 }
 
 static int rzv2h_wdt_probe(struct platform_device *pdev)
-- 
2.55.0


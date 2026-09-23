Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31674A0132
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 10:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160085; cv=none; b=bPeFtLmrclUyU/pM5njNFordfzumdHX36frwWJvdKdusvlRxAi58J53oLaHYk72ONqkIo6FEUNQ5W8RwaKwh2PboleYlQEDjxh/1yguZIU52iML3CiPRRAUy/wPW54e1xkReRq5hzF5COXZFKK5IKprhqRC8Rr5HTecXAGrN2tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160085; c=relaxed/simple;
	bh=X1jAYThF13X8I2rqIxQ8X7qe4GN151gAbYtT21h/NrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jYJI6gIvN7fd58kS/XEYQwX5SodUSoIy2gGJKPPPF3CWkOlaaeFNO3BNYcMoiwwOcnYPXFY09csOun+B6N8GHRoE5Yenq/3eySayylKn59w3gWyZVVGvhNYA+jzPc3/nY4zlp/G1V1NCRbnQ+vwZ5yE21QKl911tUiZzNNoABhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bda7NUQ1; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bda7NUQ1"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso4124325e9.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 03:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160063; x=1790764863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GoGtYfI6mbncqB1kvt8xB8OWSjQJ5DXHu4pe4unlWr4=;
        b=Bda7NUQ1iqN5KGhTSPDJ35nHq7cg3MQFM4vmOXEmNkMN1FrjgQQeM50oR/kLxDRe++
         4qRnIel/u7eE5fkEVXyX4pT4w6tehntWnF54+YLWmSynAl6A5xyjImJDt5cZMvMS3QcM
         6WrCCvCfYkcWuiYi2P9RlrivSxa84LuO0XlOWK04hu0v009NoutFAzun6kr1c0WoDtfm
         aHvFXcGUAU/Bh5QqlSsenmP0ObYY16Dt7NKDYv4eWeakN5D9/ll8uMaA8hvihPEUhPf9
         oRu98h2w/Oe4ZDvS6KwwD2SLkKyRHviapJ0L54924f+KDKT6njzqCxmLZmxJDVdQiF9m
         gw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160063; x=1790764863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GoGtYfI6mbncqB1kvt8xB8OWSjQJ5DXHu4pe4unlWr4=;
        b=2KvF79gfkZnHeFZjzjKgClm4cd0s6iOCqQxJ2+E8VgN7guU+E1XTbh3wwBhz0RxqYD
         hjg07j557MH44Cs/+YQfWB3wHvKGud0o85HgCDasDjIlMAxkCexk2L4Q5X1roaGc/4Bv
         +cRW7qWiwI8n/C8fQ4IKsN8zE1sBvHgwGzlXQQbdsFXCh8WdkLV9h+zsZHg1uzQ4ND4P
         Up7u978BDaASSHY2NRs2v6KvRxZ4iJ6SmUS9hBwv2GP3vIQ+L+W1h3V3w+Lv78WrAUfE
         zyH2jY1BiQELiQvplvOQHJ704UEKojsRzWsLaSO0vDJa+4cAJrSKPywGu36Fpc5po4Ab
         oEiQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4otu16LKbhmY/mskyfo/wCMF601zlb06TLeW2KymRk5tenY3u2aVU/xVymPlWsiB7ZGnJOZWSAc5/@vger.kernel.org
X-Gm-Message-State: AFuF++moI8Jk4qTIRSt7o0OxivtsgYfJr5QJlfHh7ldcdQw/63BcMwTu
	jMmbpm9dFoY6D1GbhiRDHiN8/i7celjC+/MEGO/VQDsBPQza0a/BTCcV
X-Gm-Gg: AYBFou2jAVyhnA5wv33DEwVNpWdLa67zro2mWixFm3lGdxV8aV1UcuvT4lZmvWW5Ayc
	HPKs1hhlu2hg9ovb78PYOC7ulQaivjhfOHivLtQrKwnVwcw7zJUqzZfiaSD7yKSB18j2b2/fOQJ
	fo6LrF8tmhQg7P6UC994IG01Aox3lGIHy8WB2aJFipAkbmk0/MeUyMeCzoh8Dwdu2jc31pD3f1u
	MyN3omWaUXXalQl0I/+ruPq3yoHlTYizLtoBVDnmqPFf8yTPs6TskfIkuXABXngm4KC2q+j6oH8
	Q6M8rp2aAcUvaEVpklVOSctXhIF0nv6cLYTYoMjdz42Oo2PoDVAFESfiIsRYwPB8z5PHh+uW9lG
	hMa2wAGYJrW73vB1PGsYbn6XV3T//xYj5/8LDCzplnqj/2l7YwdNVob9Ztfd/E5Kozxa2PSymtO
	helYSlWDyvX+RvJyjnwrDu1R0F02fjghE94g0pJWFux/WNBALbCiOyqyuPTvPKFfelvUEOYGjop
	vvtS1edGpZaUceXWIgnG9VQJ3/os9AeF9UmYt4o3Del/1KmCwFZSMNEgMBG89txM4nGuDaX0kM/
	6v6jJ0x1
X-Received: by 2002:a05:600c:8489:b0:49e:73e7:888c with SMTP id 5b1f17b1804b1-49fdee0b7e7mr27113165e9.4.1790160063078;
        Wed, 23 Sep 2026 03:41:03 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:885e:6ade:cc5e:a35e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1acb91sm65170415e9.15.2026.09.23.03.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:02 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v6 5/8] watchdog: rzv2h: Convert WDTDCR handling to regmap
Date: Wed, 23 Sep 2026 11:40:51 +0100
Message-ID: <20260923104054.3324830-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260923104054.3324830-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Convert the WDTDCR register access from raw readl/writel variants over to
the regmap framework using devm_regmap_init_mmio().

This conversion serves as a preparatory refactoring step. It allows the
driver to subsequently support syscon-based system controllers natively
by passing along alternative regmap handles without forcing messy
architectural branching at runtime.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v5->v6:
- No change

v4->v5:
- Handled the regmap locking in the driver and introduced nolock
  version to be used in the restart path.

v2->v3:
- Dropped unwinding changes to patch#1.
- Set use_raw_spinlock to true in regmap config as certain watchdog operations
  runs in an atomic panic context.
---
 drivers/watchdog/rzv2h_wdt.c | 54 ++++++++++++++++++++++++++----------
 1 file changed, 39 insertions(+), 15 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index a65e5d6c48ad..bf46e239751c 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2024 Renesas Electronics Corporation.
  */
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/io.h>
@@ -12,7 +13,9 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/spinlock.h>
 #include <linux/units.h>
 #include <linux/watchdog.h>
 
@@ -65,7 +68,8 @@ struct rzv2h_of_data {
 
 struct rzv2h_wdt_priv {
 	void __iomem *base;
-	void __iomem *wdtdcr;
+	struct regmap *wdtdcr_regmap;
+	spinlock_t regmap_lock; /* Protects access to the wdtdcr_regmap */
 	struct clk *pclk;
 	struct clk *oscclk;
 	struct reset_control *rstc;
@@ -89,20 +93,19 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
 
 static int rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
 {
-	u32 reg = readl(priv->wdtdcr + WDTDCR);
-
-	writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
+	guard(spinlock_irqsave)(&priv->regmap_lock);
+	return regmap_set_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTOPCTRL);
+}
 
-	return 0;
+static inline int rzt2h_wdt_wdtdcr_count_start_nolock(struct rzv2h_wdt_priv *priv)
+{
+	return regmap_clear_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTOPCTRL);
 }
 
 static int rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
 {
-	u32 reg = readl(priv->wdtdcr + WDTDCR);
-
-	writel(reg & ~WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
-
-	return 0;
+	guard(spinlock_irqsave)(&priv->regmap_lock);
+	return rzt2h_wdt_wdtdcr_count_start_nolock(priv);
 }
 
 static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
@@ -235,8 +238,11 @@ static int rzv2h_wdt_restart(struct watchdog_device *wdev,
 			WDTCR_RPES_75 | WDTCR_TOPS_1024);
 
 	if (priv->of_data->wdtdcr) {
-		/* best effort, ignore ret */
-		rzt2h_wdt_wdtdcr_count_start(priv);
+		/*
+		 * Best effort, ignore return value and use the unlocked
+		 * variant of the function to avoid potential deadlocks.
+		 */
+		rzt2h_wdt_wdtdcr_count_start_nolock(priv);
 	}
 
 	rzv2h_wdt_ping(wdev);
@@ -255,14 +261,32 @@ static const struct watchdog_ops rzv2h_wdt_ops = {
 	.restart = rzv2h_wdt_restart,
 };
 
+static const struct regmap_config rzv2h_wdtdcr_regmap_config = {
+	.name = "wdtdcr",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = WDTDCR,
+	.max_register_is_0 = true,
+	.disable_locking = true,
+};
+
 static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 				 struct rzv2h_wdt_priv *priv)
 {
+	void __iomem *wdtdcr;
 	int ret;
 
-	priv->wdtdcr = devm_platform_ioremap_resource(pdev, 1);
-	if (IS_ERR(priv->wdtdcr))
-		return PTR_ERR(priv->wdtdcr);
+	wdtdcr = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(wdtdcr))
+		return PTR_ERR(wdtdcr);
+
+	spin_lock_init(&priv->regmap_lock);
+
+	priv->wdtdcr_regmap = devm_regmap_init_mmio(&pdev->dev, wdtdcr,
+						    &rzv2h_wdtdcr_regmap_config);
+	if (IS_ERR(priv->wdtdcr_regmap))
+		return PTR_ERR(priv->wdtdcr_regmap);
 
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret)
-- 
2.55.0


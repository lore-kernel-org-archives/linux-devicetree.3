Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F98944160D
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 11:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125501; cv=none; b=VMWSJgBsnVzgbPp5YtT8dgh1v/fzdKPZ/wzaxx+L1yUJcG7m5cwkieM9sQrMY2BLFLZq6HJPnjPFLfS/b1kaD02/UuNSVUEhcu5hmjXUolQuyXVCNyXxtcjIyZxrXps9PrfTxDMaS1+Ks/CdGqz0L+CRbPNpWlf30WbNr6FwY+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125501; c=relaxed/simple;
	bh=M0s5qNvm6lgULK2n8QPcCEFSAsT+ro/ADdWPoCKHveU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=powU3C8m2c2HONjuZuynHnDY75VL4ShcnFxToWE9HZYM1FVvAZL3Xx4sNkH3vaN20BkZxsFrRxFocZtmsuibVHLO+6vQjnHyT8kiXo98PGQjEpV78C1DGEGIVDtwGOwjUd9DaFnM6CKWOONeDIRIKcl1o2uuOLmTh/5ve+ecg30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AarCKnUS; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AarCKnUS"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso535492f8f.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 04:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789125469; x=1789730269; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4YPgDFVhAPV2YkfLlZc7dMgt04j5FYtenK3LnM0C1E=;
        b=AarCKnUSfJOClWAvJ+OrAx55BwAHtyhCbm3WDAcb40MVl5HiPbrLCCFgrSQMH0XEK2
         vUiE2Wn5KPH9bJS97Qz4Ou3U69Iku/Hvu7GHdDjjmmDba1ebtEvqEpq1r4vksdiPUptU
         XxQvdxixVZtcBO0g1y3SUXpm3g+tWMaTnreQ1P5STqXxYtm1tdmzDzDlaMlRgi+q0j68
         Lpba6uJiY/LU6YvWgElL+n09DAAyyLqdJfOujv5FOv0KoU81rHircYuppQ2d7gfEJ1Wm
         zu9hZGlV2h8lVEbuy1DuFGM2fTqVnZQHywjF0a3TjWQmUpxoEiuWJzk1Nr8OBJUxsyeW
         a7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789125469; x=1789730269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p4YPgDFVhAPV2YkfLlZc7dMgt04j5FYtenK3LnM0C1E=;
        b=dmK+Xkozj1Fv8XU79bf5J1fW+zD112gg5+pF/OA6DG61nGf5zBXOQ5tux0noyWLU+A
         NiiqcS1SbbEm4D4wMVYcw2W6K1C5LFibE3toOPSYC8JwV7jJXT6YqC9OEmAbj0SrJIBl
         uEJ2kONCkuQX5jNuU01Omd0zpOtoRpHhQm+37GPNc4bsxyaFbDbT5hISrnjicYtdJ1OM
         80Et4b8wtM3Qy7xsNi3ptvVMwseF9t8DLSomAmM30GDWjm95e97pq73bNHwhMW56ggDZ
         viG9MeaN8qHqaxKDrK6cWLNsMtMiTuUHMZwaZ39qJaUZaE8tBDcz/QFV+Qn4vJ4/9Lev
         SABw==
X-Forwarded-Encrypted: i=1; AKwUvBz6bMrq/NE1Kju+4B6xrszaX9QFQ3OBD6ivHK2p2wI6MHwWwgfN1XVIgNu6OtMWjq7rVMOVZOa3L6g+@vger.kernel.org
X-Gm-Message-State: AFuF++mIDSpBTITEuuKhyFJka0YfxyQzk1mlwPrJ7MYopVjDiVj3Plb/
	hd1QA3Di4PSbbOB6TlALkA4ITlmq3U5i/Q5t/Xw4QxWL5ec1/hz4VC9FywTTTf5Hsl4=
X-Gm-Gg: AYBFou1+gt6Jc19ntiY3iPwzbCaFxqU+fFfz/f15BBzp7bI7eIh49CljctGndUxi4j5
	BmKUiHQoqL1YMBMpSRQtVGB2PRuMmJmZIduiD9KDvmae889n5keE5yX+/PxC35rkAe6O42/xvjc
	GSxmRL16TUxtWJo2hpyxq0VdZ9Hj8cZNwjg3LOx65zfuA5ayIZIxOOjkHmRmNqkQCn0ZTzVxHrY
	MwVJOTYD5hBi/Yld4oxGLGON4RK7rvHYNZan0QSzJWFvUJ4aoYR35etg4ZzNrH7arnVVafG4MsN
	4nVQjCC+CBTq4vLwNhvk/KyRZKbAAidtQ+tLHknc1opz8UXqcFSwwFCh4XDm1WJ0yhKd3qDQ4xC
	iNTxTFbT6/CkfV40cFk/jakLbFWU4lI6bYOsa4OVFw/Gnqp6/oXBVDMGn1VRSnyKfvc1IdYzlUP
	9JzkROndrKrOJYAmOZaTIA9UJmcFZ5PQ5gT4UZudRZLuGvmV7PulzB3PmbLK7QbOPxtTddkewMY
	n8yEJpdFPDRVblloJ/x9GnGySgDYq5Pg54/Xe565XiuBdIhiKeOqv0O7GgijtvuL95nJMq56iAQ
	fEgI0ln6Xgpbjk08r4+L8ytxqEURbg==
X-Received: by 2002:adf:f2c9:0:b0:482:e22f:a2b2 with SMTP id ffacd0b85a97d-486eb303657mr3242321f8f.20.1789125468686;
        Fri, 11 Sep 2026 04:17:48 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3de1:9f21:e874:3931])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf23sm5438182f8f.5.2026.09.11.04.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:17:48 -0700 (PDT)
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
Subject: [PATCH v5 5/8] watchdog: rzv2h: Convert WDTDCR handling to regmap
Date: Fri, 11 Sep 2026 12:17:28 +0100
Message-ID: <20260911111731.3404308-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Convert the WDTDCR register access from raw readl/writel variants over to
the regmap framework using devm_regmap_init_mmio().

This conversion serves as a preparatory refactoring step. It allows the
driver to subsequently support syscon-based system controllers natively
by passing along alternative regmap handles without forcing messy
architectural branching at runtime.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
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
index 4a5a856060e9..550112446db4 100644
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
+	guard(spinlock_irqsave)(&priv->regmap_lock);
+	return regmap_set_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTOPCTRL);
+}
 
-	writel(reg | WDTDCR_WDTSTOPCTRL, priv->wdtdcr + WDTDCR);
-
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


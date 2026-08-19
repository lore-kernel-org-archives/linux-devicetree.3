Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E241F451985
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787134764; cv=none; b=SeVh4Z0qWjndhueDZw+GRTmTAidwnEr8EuvziVDTRfRuDWviwyrWSiLuorXjv2F6iRTpmeu8vANmwO2+IARPOrhD9fW+rs8IgCb4N7sc8xSQ5Hzv5Ed0jpYxTW799SOz68/ISMuLjUlK02WNcZgKbJV4aO+CT2ntZRxCvZEod+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787134764; c=relaxed/simple;
	bh=b3zTehLRVRpMgmGbjEKkS2pX2ssvKpV6r0xc25EZpXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ALRCp/anQV60LPng/N9/OR6g4WUVFv608dLu9MJ53zUUkk/cyn0VPHN+KUNYIlZFqG98LsuzusGwAorvVGPwva/AEQWEOZAToIG6AkduY2nWCXeLtU7UihHF5QGJLfG7kba4t6/rETIeph88Y1pa/L6AaVtWHnCvoWV1iFl7UhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SxF8qcye; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxF8qcye"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49800c6a846so7967535e9.3
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134761; x=1787739561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=puIMkImeLxgu3vt59X7mknJ0F5P/p4ojpjr+3990wvE=;
        b=SxF8qcyeqm2X9sao7DKV/KMRMwF1VEFZgJ9FO0BB4z6g7tQ/MWrAbMAQ8yGBHSw0vk
         7bfO5J9ySk8K/tH1QinUlfsOXbPEQ9rRzCnPKIDklEMwa7UPedgk/qzPbxTdMFcHIjkd
         j2e4102YuU3AwCeI9+tOYfyKzVomJ3/O4oemAv9P57IjbLOKjIeyEaO8oeWfTABKp5ns
         UvKfR9gzW/Sv1JtmKbSxz/yzw09jhFHwVbH5LifH9boEC46wbpIMJvOlVhUXqkOyS3Zc
         DAgJnm2omXL3xQ7cXbzCAo+WshRMcifNDTQgawgqGeSb18V6WvroakftmopCc5Iu8zP1
         7BZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134761; x=1787739561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=puIMkImeLxgu3vt59X7mknJ0F5P/p4ojpjr+3990wvE=;
        b=HmACgty2sdqTKz/WLdoHhWVcolSLKuMgQScfNK73bqk4+6ERxk2JShvS19JRAagNXP
         J6LVFF2zMwqoytkr5lsqKIjXlOVfMWzQ8mjG4R7Hd+QbrIzIXwMYhoVCKGo9a9qMj7Zd
         B8pWm2fzTq1jH+SnD+CV2xKn6tQUQ6U04BbPcSwEOlW/XqCRFSLIMu/A+OPmcm2X3DjN
         hHp8FYOaGHyOa9OqWSp4wO71gPl/onmWEVEALgB+dlqJ/cdBhLm/KFDG8/6sPQzm0lvS
         bFQ9zvnzdBJG/mqs/2473Yug+bgiACwqKB3hyci0JjJZKTWX9wWNgBI+glFdn2o2zjYS
         /pKA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7US2rf1E6zMyH9tAXoLto4a135VMhEyAFLDzZ7rwScKOqOdRmq/DsMalRx83OVNW9bgitlrBKJRzf@vger.kernel.org
X-Gm-Message-State: AOJu0YxwgCdMeAdHzP4qzlBfkzWPvjEj1iPBF4Pt08XXwej8v1gwTh77
	UfjCNPAiSz4phv+5BntGix7D41g6kp08NvvStBtYtcGxxGYVIESsMz2G
X-Gm-Gg: AR+sD11hu2N3cPBAHKAkiBxkzFbuiEkTdduA88Hzh57+MgY7quiljJQ53frW60Kl1kU
	dbjdjSfhI6bmoKlk9gDigyVoUpZIjZM6G1RgdRt2vwsgqo2nIbn6o3dUvKukJWah9+lrD81HIYw
	ZahlKXlBDCrOVu4x9loLiaSgsV6BBUhmkA+0pczCD7RHbCiLrA3uO6ppOGOVZXov8iQZzcgcLU2
	4Hh5WFeY00nTcAQEpKU6hP67MVz+DlY6ocVA/zTugM2pwUji/OABdZl9HZ0Sl2CPPxZ3uY8wyGP
	l2vJG5BvxaOuzCI185UN4YeaFuGiliQYxfhttSNJyFVq+3OMbJdDCKrGudAzwjdX8/VkHM5XI9X
	MLldH8UTkj6wHTqiI7mC4K5eyMwCSGlENb/C1HCY5tfTauSp/4/f4xvgQ2799VXCi1QLg4fwSzO
	/WX7SCMDueSIGy1hw+hrGEK6hhIlh95GrmEn6LNHzyYWg2rb9NVk4XQw==
X-Received: by 2002:a05:600c:3f19:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-499aa1499ecmr71419155e9.1.1787134761155;
        Wed, 19 Aug 2026 03:19:21 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9b7c987sm27316965e9.1.2026.08.19.03.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:20 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 5/7] watchdog: mediatek: Add support for mt8167 toprgu/watchdog
Date: Wed, 19 Aug 2026 12:16:26 +0200
Message-ID: <20260819101853.44681-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101853.44681-1-l.scorcia@gmail.com>
References: <20260819101853.44681-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Top Reset Generation Unit/Watchdog Timer found on
mt8167.

Since according to its data sheet mt8167 toprgu reset bits are not
contiguous, add support for a reset table to the driver. This lets us
define reset identifiers as contiguous indexes in the binding headers.

Also address a preexisting Sashiko finding that noticed that the
has_swsysrst_en configuration was set after the reset controller
registration.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 47 ++++++++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index f8208fb0f723..fa522fd80dd4 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -13,6 +13,7 @@
 #include <dt-bindings/reset/mediatek,mt6589-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
+#include <dt-bindings/reset/mediatek,mt8167-wdt.h>
 #include <dt-bindings/reset/mt7986-resets.h>
 #include <dt-bindings/reset/mt8183-resets.h>
 #include <dt-bindings/reset/mt8186-resets.h>
@@ -78,11 +79,14 @@ struct mtk_wdt_dev {
 	bool disable_wdt_extrst;
 	bool reset_by_toprgu;
 	bool has_swsysrst_en;
+	const u8 *toprgu_sw_rst_tb;
+	int toprgu_sw_rst_num;
 };
 
 struct mtk_wdt_data {
-	int toprgu_sw_rst_num;
-	bool has_swsysrst_en;
+	const u8 *toprgu_sw_rst_tb;
+	const int toprgu_sw_rst_num;
+	const bool has_swsysrst_en;
 };
 
 static const struct mtk_wdt_data mt2712_data = {
@@ -130,6 +134,29 @@ static const struct mtk_wdt_data mt8195_data = {
 	.toprgu_sw_rst_num = MT8195_TOPRGU_SW_RST_NUM,
 };
 
+static const u8 mt8167_toprgu_sw_rst_tb[] = {
+	[MT8167_TOPRGU_DDRPHY_FLASH_RST]	= 0,
+	[MT8167_TOPRGU_AUD_PAD_RST]		= 1,
+	[MT8167_TOPRGU_MM_RST]			= 2,
+	[MT8167_TOPRGU_MFG_RST]			= 3,
+	[MT8167_TOPRGU_MDSYS_RST]		= 4,
+	[MT8167_TOPRGU_CONN_RST]		= 5,
+	[MT8167_TOPRGU_PAD2CAM_DIG_MIPI_RX_RST]	= 6,
+	[MT8167_TOPRGU_DIG_MIPI_TX_RST]		= 7,
+	[MT8167_TOPRGU_SPI_PAD_MACRO_RST]	= 8,
+	/* The data sheet describes bit 9 as "reserved, unused" */
+	[MT8167_TOPRGU_APMIXED_RST]		= 10,
+	[MT8167_TOPRGU_VDEC_RST]		= 11,
+	[MT8167_TOPRGU_CONN_MCU_RST]		= 12,
+	[MT8167_TOPRGU_EFUSE_RST]		= 13,
+	[MT8167_TOPRGU_PWRAP_SPICTL_RST]	= 14
+};
+
+static const struct mtk_wdt_data mt8167_data = {
+	.toprgu_sw_rst_tb = mt8167_toprgu_sw_rst_tb,
+	.toprgu_sw_rst_num = ARRAY_SIZE(mt8167_toprgu_sw_rst_tb),
+};
+
 /**
  * toprgu_reset_sw_en_unlocked() - enable/disable software control for reset bit
  * @data: Pointer to instance of driver data.
@@ -160,6 +187,15 @@ static int toprgu_reset_update(struct reset_controller_dev *rcdev,
 	struct mtk_wdt_dev *data =
 		 container_of(rcdev, struct mtk_wdt_dev, rcdev);
 
+	if (data->toprgu_sw_rst_tb) {
+		if (id >= data->toprgu_sw_rst_num) {
+			dev_err(rcdev->dev, "Invalid reset ID: %lu (>=%u)\n",
+				id, data->toprgu_sw_rst_num);
+			return -EINVAL;
+		}
+		id = data->toprgu_sw_rst_tb[id];
+	}
+
 	spin_lock_irqsave(&data->lock, flags);
 
 	if (assert && data->has_swsysrst_en)
@@ -457,12 +493,14 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 
 	wdt_data = of_device_get_match_data(dev);
 	if (wdt_data) {
+		mtk_wdt->toprgu_sw_rst_num = wdt_data->toprgu_sw_rst_num;
+		mtk_wdt->toprgu_sw_rst_tb = wdt_data->toprgu_sw_rst_tb;
+		mtk_wdt->has_swsysrst_en = wdt_data->has_swsysrst_en;
+
 		err = toprgu_register_reset_controller(pdev,
 						       wdt_data->toprgu_sw_rst_num);
 		if (err)
 			return err;
-
-		mtk_wdt->has_swsysrst_en = wdt_data->has_swsysrst_en;
 	}
 
 	mtk_wdt->disable_wdt_extrst =
@@ -503,6 +541,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },
+	{ .compatible = "mediatek,mt8167-wdt", .data = &mt8167_data },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
 	{ .compatible = "mediatek,mt8188-wdt", .data = &mt8188_data },
-- 
2.43.0


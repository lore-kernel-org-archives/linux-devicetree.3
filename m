Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58034598BE5
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 17:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889468; cv=none; b=V5XXnUN2azGeG+vVGrhlMBK8VhWqN2K0xZA85pFA/uDZrnXRIbo43lMHucXdT/dNe28MHg4Kap/3m90J8KMEpRKMnjzW9svKOuKynt302t8BIcVHkqaee9Pdl8UhWLS0EwUmZImWNYmed7MZyohrtyawZ3bC2E2hLNn+/mBP+2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889468; c=relaxed/simple;
	bh=JfcdTLlJLc+C5ARN79D+4Fsrl6JFZTckjrC8v6dtM5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kNOC3yUpmUYaZjjWHNKrdEfRzauBwXxlNt/394Azke/Xgu+BTg6YcXT6bUcUFmJ96FLSmXdGjQwMkLSn2sh0Lag+hQ1uFywXgULS2/ZcziD0aEt+bHiMIdw8h8L6EJwKcqxozAvD/HvczeP/GRrEPFf/eyW/mW9Bt/kFzZeBsnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQqtbuAt; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQqtbuAt"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so39885145e9.3
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 10:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788889464; x=1789494264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GoJVdgu3OR1hm3Ux9hMLG80GY2W7JeBpJE05sP2z1ao=;
        b=FQqtbuAtTqJ/vxVhTwc1RVZhJVXQzEUiRFVceG6T9lAg/rzpC+DS0uWQL+CbzXufy+
         FXk1ghlrEGLSarIjYb5l51ALkjv3VF0CwuNFaJaXsaRymf82TReH7RrithY/R5DGD2vG
         i/rTfcNpjWYuWSrRt0psupBrFJYfZPxDHCnRhJDsH2hSUW3mA1efZwkvxOBZZCSlkeDF
         ig/o++xf27DbLuAgl45l0MXW5M3592+/+vqlFDFpjXpSKq7EzRO4GFz2hrK66pUylgCw
         dffxMbyL+q84GKxY6yaU9xVuiyV/8NxkNF/YcKWVybWcbOHcUviPEuvNzRhKBl44bClb
         gh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889464; x=1789494264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GoJVdgu3OR1hm3Ux9hMLG80GY2W7JeBpJE05sP2z1ao=;
        b=eE2a9b91ER081A+uh/sdfnq1KgbBoG80H+MPIHtn3MtkuBr8kPOFknfqS7pDLx082O
         M0fHC5CYzQ9RDs7XxzW89QiMgwCCet7NqTWX1eVBtmhQq41PX+eALxChuNT/zWY9Ytwa
         AyvVhScowesfWqoIuPE9SHbxlpmJoqggoSStWX1AyJaBBTPcyrJlHUxESmhju8woyFwV
         26FDMke6wZfdKo5iqhOJltxp17/oY1EhjuVt1VBHLc5CrclHdleF5JlF5AFqhQHIuQAI
         ueqbbx1CHbEcs4yYPxbmPfVmVnaDOk0Y7AY8+4ihQDTkS3XHfg7gJMeifTAjySSbjlqj
         NsBg==
X-Forwarded-Encrypted: i=1; AKwUvBySOo7Ar6grWJGR9lvmJBVZhAAV/Z7q+Dwe7giyfR+c75AA1VWCcUMrO8rDpxEGg7qTWe8oCAK2W+iJ@vger.kernel.org
X-Gm-Message-State: AFuF++lDM89VGBX7x3HQ9FI1165bb09PXezXeYAvOWObt72nzaxeKosN
	N3hp5GWXKzbZuJ6BYY0UUflgPEzJlbVHCoj7x4NqFK5SGGNPiG1m0Li2
X-Gm-Gg: AYBFou3YYaSaFTmEMwJ1MCdFp3wXnsV/wLvFSExIcQkOH24RTDzKpZpAieCvH6wZkzB
	p2WHZ6qIQ64g5oj8mGKMmq41D3A9FkdI4OBCr0IqhzY2a8K5WjbIljuSZ7KR/5uZ1rD3Nz5tc8Q
	W5OEUDjBmaEMRiISEgJnkubLwxDC1qsEIjRzWWCc4gDlk5LhV7vSg0CnyFkuZdv1N3Q0UsKo/14
	6iHx/hqYUIYzmyveMOsV8B2kAN9TDnjHFG2gbQkqSkyZHKZs0c2CIVRU1iePI8Nwgr+/vpK43Pp
	rl16P6ZDI8HCJbzMGIibNYkF8E1t3PcTbo/WNA2RiVZR7lWAl1fGuPHn/I8M/5xIbqLttxaqdYA
	HUmrIzfLUKSrT7cALsUO9igmkNxI7SyEwDxMO5MFa/dszgEM4rfOWv71iU2BpowD0PC1NA08GiQ
	HzXTEINTEDjtjsFhyO2d3QW84VWcm7IAfGBE78VWs7jFcJ1P9LKMXWkRk2EQ==
X-Received: by 2002:a05:600c:3b0e:b0:49c:fc6e:a3d5 with SMTP id 5b1f17b1804b1-49cfc6ea726mr268044365e9.20.1788889464237;
        Tue, 08 Sep 2026 10:44:24 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm487081105e9.15.2026.09.08.10.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:44:23 -0700 (PDT)
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
Subject: [PATCH v5 1/8] watchdog: mediatek: Add wdt/toprgu resets for mt6589
Date: Tue,  8 Sep 2026 19:38:28 +0200
Message-ID: <20260908174259.9009-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908174259.9009-1-l.scorcia@gmail.com>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to Android sources, mt6589 has 12 reset bits in the
WDT_SWSYSRST register. Populate toprgu_sw_rst_num to allow toprgu resets
in device trees of the many compatible devices.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index d9c30e4c80e3..d609f0fa35e3 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -64,6 +64,7 @@
 #define DRV_NAME		"mtk-wdt"
 #define DRV_VERSION		"1.0"
 
+#define MT6589_TOPRGU_SW_RST_NUM	12
 #define MT7988_TOPRGU_SW_RST_NUM	24
 
 static bool nowayout = WATCHDOG_NOWAYOUT;
@@ -88,6 +89,10 @@ static const struct mtk_wdt_data mt2712_data = {
 	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt6589_data = {
+	.toprgu_sw_rst_num = MT6589_TOPRGU_SW_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt6735_data = {
 	.toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
 };
@@ -493,7 +498,7 @@ static int mtk_wdt_resume(struct device *dev)
 
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
-	{ .compatible = "mediatek,mt6589-wdt" },
+	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
-- 
2.43.0


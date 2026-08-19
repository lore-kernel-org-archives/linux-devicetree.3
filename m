Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E390144C513
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787134755; cv=none; b=UPSCv8UOX28IeOoT0H634hGwJrwzfm1ZU5oeQqPKwt6rUxnZUmr3sGKhW4MrjGNE7H2hVXFs4aEvzTbMp049pO3tZQ7eEVQViDtr4KONCV2LJN21mlD1iROrD8BBI95338ainxFY0PmJ3ccEeN7Hpbb6vROiZgAl4XJg08JGquI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787134755; c=relaxed/simple;
	bh=4pf4OTamBGMYBWE9OUDagulAeam31oZk/0AX8NxjzdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VlVYb++2Yry10sAOv/dYLhY5lnWVQSvzIdkFMTmM+tANn16lk/uvYfMvudJRSXRv3JF4vXbJACq4BgTsHOSU5COP2KmyQX9KqRfGHJhvjotJdLlet592SFzFkhKo6GJPRgreI70LiQ4ILf4MNtc7oRAfJNIT9n+gMGGGZ5paruM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrOTjlad; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrOTjlad"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so6792055e9.2
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134752; x=1787739552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BNNHoWdgT2CrEfPiTooQfwweAtxpbzmh3UlJhmBHMrM=;
        b=SrOTjlad6w51iG36Tv4iaISHGqVyC/nHLs1XCTO3mIi4bupYprqnOb1qfS2GtxHb8E
         JKtpFrf/6+cDVg6/w7FG7iCi1e/LB6hc4yH41+YGN13p8d/jVmNGmfgGnNUK2KnZLjGe
         sVZMB2K7RMdKx5SS29aIScfWa/p2l5oYjW5RCcIvyp2zpWowU8WIK8GqMAJ/n+tSXQR6
         Mx9h/+CoE2QAP4EsjbKdW76KNxNxKvurqbXNAYlGahR8i5VwoKSKn9Twn9FE0oq6exmx
         emPMUeEdAZnae5H9cEvXrhiPdoQ/UIhPyDBoZ/izVYWw+KNaZhR+lY7pfbszDWJBSOXQ
         i09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134752; x=1787739552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BNNHoWdgT2CrEfPiTooQfwweAtxpbzmh3UlJhmBHMrM=;
        b=YxTLvlcTZvgVsi5knQi8pWgoRfPrUKDn4MLX4FMGXLmmIF8v4n3UHujO4qulQuGY04
         QQwoBy7y8gkOs0Fvvk1MkUnZ0WoOvy9s8eJ7dmLTEPGzkmmPr2WjlWjUvkyQQVYcwoYh
         TXhCvSQCYWbRfv2fnyFrs6Hmd5VnzbXwUTTOCnblMnk1jtM5qB97tbSL1pWh9uYK/FQ4
         gNzUNQhrjY4UiV7e8ckRuonWOMQqGBd6M6iSzGMffT3qS5JjTWjlwCP9uTGsss2Cod/Y
         zZ0yxlcVIghf+p4Uer+u9csXxnBkAVM73tiwi4z9V0+WJapijldjp59B6Wf3Hde/k8rM
         MyYw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0R/MUUgXQXUIDNB+KnJnBtLc9+A8lhwbNeN5eQARx7hmdeAbL9boQxNfxxLv7/LOUueAUQDbtQUvy@vger.kernel.org
X-Gm-Message-State: AOJu0YwFUJkYyPN5hJXGefvkWn7lDMU9SmnYCEAJjZn0qHP/MmH0eorB
	pOl8IVtATtOyDLYhjmyUwKnVcNXEYAfTlSHEvctBTIQzYprGWpGqtB+V
X-Gm-Gg: AR+sD112W4BUMn+1L6QY8Ct1qwP4mM2nBde8vzfL/2duy8oQWU2PRSoBV3rwhi/DSgM
	dCHatg+/oIPRp3uFKVnDpcSqilkDs3nIZh/yv7418R7sQytGPoSVHfgqKBHz4CcYHVMBfxOXLnz
	HyHo9iEs8wjx3HolPs8ZriP2vQalgn6cCsNmo6iryJGKPqmz1aIk4eVmPVbt1Tzj1NKgRv3Mb00
	NMLzavuR1F4ajy6Isl/uxhZHH/kbsXg/JZ5KxZrbCFqJ8FC5uNltRg4DS1gdrJjjlePzhc0udai
	hyf3fJ8XSSuewdG3qnjWQrlNKLffZypEoECZMUtDuaddtsOhSm2hKci/BsBze9n0GFAw7QrADIR
	vjitkpG1cfQz3K++aCz3X0bqDxQlHDksuO314zaGpPYJTqGHqoOMEaz9mif4MD+o974tmnf454t
	1HG0WfbvLJhR74zOlxYm5h8foahinF4zYPOq5lyJv3tLHD0UmJjByNCw==
X-Received: by 2002:a05:600c:4e01:b0:493:e365:ace9 with SMTP id 5b1f17b1804b1-499aa1d0747mr66690555e9.11.1787134752059;
        Wed, 19 Aug 2026 03:19:12 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9b7c987sm27316965e9.1.2026.08.19.03.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:11 -0700 (PDT)
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
Subject: [PATCH v4 2/7] watchdog: mediatek: Add wdt/toprgu resets for mt6589
Date: Wed, 19 Aug 2026 12:16:23 +0200
Message-ID: <20260819101853.44681-3-l.scorcia@gmail.com>
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

According to Android sources, mt6589 has 12 reset bits in the
WDT_SWSYSRST register. Populate toprgu_sw_rst_num to allow toprgu resets
in device trees of the many compatible devices.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 91d110646e16..f8208fb0f723 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -10,6 +10,7 @@
  */
 
 #include <dt-bindings/reset/mt2712-resets.h>
+#include <dt-bindings/reset/mediatek,mt6589-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
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


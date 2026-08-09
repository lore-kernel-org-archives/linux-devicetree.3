Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0EA3D47AF
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 16:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786291632; cv=none; b=ahzHuUGcUG/o1YMURl4LairSjAEfxCnvXnn5AFrxkVZUvBXkpNZ/q7N9SJuy+T1wDM9A7KkDTvJbjTDtTlF7OSQy9UsOQm/a7Ew5A5WHyuGzXrxllgg/oqyjAEg2DQI28vBC3KW3YBIuqvAN5bZNg+BE/stv4DtPYLwyt8RMgZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786291632; c=relaxed/simple;
	bh=XmNye/vjiULEsxnBNVYOTUkUu6v2VjDCwyqHNObnENA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JqX8qLasNh9M8Oe58w8e7TXgSjEdxbd14KJIwpzOWKT9oHkxKfLOgbZJCgcnfME2CmdWTfOSGUX7N/wf3zpsT/B7gVcGsna17epiYOuQ/ZEkgTM+Xh0gBHJ2LMAxOzCkZgozW5dyr19tG5/s1ud/PEU1xDHtJc/wIt5PfVIw8jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rEam4mkG; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rEam4mkG"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4956242332dso10987205e9.2
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291627; x=1786896427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQl5PVCGH7sIQlsUqjynV5DnMRSCC9HSJ3vmRORytzI=;
        b=rEam4mkGRWTaJ9BGTKs4XcrW6gcA4/kFhMfky+DCdgJPjvkzQUhq1goPwz+hvwXuYK
         7MD3FePlFX8mh9HoL1FZUKsEeCVIOXLHVDdzHRVao7IL/M0odWTrbUXmw9qJ2jGWbq+u
         SfuyzYXGmIz+fZEP4sMgVtEUgd4qmdOOC/HiScudcS529VgOmY483YU9MaQ22fuF20fI
         TCC2Bki96lXfR3HfrMCNK5Xzf+r34YsY08dO40mpigOPd9i6nJK37PkvmYt593pEmY6X
         jBknLQRSX874/Aqx95l74MrYkbXz7ldaboXcUPrOLAqvRCAHYQl3IYLmt+EDQ7HsGu82
         rwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291627; x=1786896427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YQl5PVCGH7sIQlsUqjynV5DnMRSCC9HSJ3vmRORytzI=;
        b=p26Hya7tAWlpN6h+lCt4YlaLT+r4STbT1sdU8x+T/YJLBCYTm9jhwUkrEIABQ7A87b
         uPE47i7kBTQrAuUZf98S3jbtC/efxsIojikIfsIVOzCEExswFUp/K5jMIt9pb6+qFC0x
         nbD0SdMEOl8OwSb0zFELIl7W6P5rrGNOXFedWrqy4OWHfMa5jDX6noX1bkEtW31pLya2
         McXwfTemx16iiCsP1Vd3maTo3mPbo56QjESQR2uC2jrPhMt5XI3MAOOCR12M83+D5mff
         OGCP2yDZPH3ZzrpbTctuID6TgW5XW7P8+Wk+pvLUBxSlHYe8slRh1r202f+UTbRDlM4f
         Od7w==
X-Forwarded-Encrypted: i=1; AHgh+RoL0FglxtXhJsb2LjyaRPu5hN2cF34sjXMxnXMPBzgY58sZYHveiYXzAXg5vxyfY+f834C8Bl9X7Jh+@vger.kernel.org
X-Gm-Message-State: AOJu0YyU03hNgrd7WjA1X0SIEF/Uoq4IKPGBdLCzb8WDOZtA6AxJgANq
	PtkA10puMSeguxilDej6R4pGiuMptiz7W99pyXMCude06gzUo8iMUgaX
X-Gm-Gg: AR+sD11tRcT4Ryg0A1iy8dfh1exjwZwG5e1iN9wTk+bWtz9oq6SeOg/IKJyjdF5Uj3z
	mOxDXls70LKHMeS5uQ1HT2RTASYqqdC0g/PiUTcHF1uSs1lJFrDtcl79o2RvhOYVFBUGTlaklZ6
	0V9u0yrD7Eqj1iIKnEGrJCS5yoExPlUla1nzYLxrVTGCAcA4p/oIC7oAP/r0SAPwYhzqu6cJxkG
	xgzzxU6wGksq9YjasViPMH20BQ+TGmRPQMG13XpjLuvScS4zEuRThvKjYqLl9O1luPYFpSEfolb
	QN4kVbMBZcfXnpgvuPwQJ2jN0NLCzVt8jY8x5j2Z4jltXLkcqHGBWXV5nwz5hU+Vr5iPOhhwqbS
	zueaFD56n3yDbaw0a7xEjUDIMPznNShJ1jEm5OaUs6L1UEG6LfnnXwCciyPqoirjawJqbJLhfbp
	c9ixckysw5Luphz2BHvIHXijYZHcwwnKdDJSbvgWg/SeNQDuQXqApEpA==
X-Received: by 2002:a05:600c:3b88:b0:499:52ab:a50c with SMTP id 5b1f17b1804b1-4996194e24bmr211098485e9.1.1786291627278;
        Sun, 09 Aug 2026 09:07:07 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:06 -0700 (PDT)
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
Subject: [PATCH v3 2/8] watchdog: mediatek: Add wdt/toprgu resets for MT6589
Date: Sun,  9 Aug 2026 18:03:26 +0200
Message-ID: <20260809160643.33991-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809160643.33991-1-l.scorcia@gmail.com>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to Android sources, MT6589 has 12 reset bits in the
WDT_SWSYSRST register. Populate toprgu_sw_rst_num to allow toprgu resets
in device trees of the many compatible devices.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 91d110646e16..e61f6ae74327 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -10,6 +10,7 @@
  */
 
 #include <dt-bindings/reset/mt2712-resets.h>
+#include <dt-bindings/reset/mediatek,mt6589-resets.h>
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


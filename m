Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1393803D2
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218807; cv=none; b=YN7lwlyksk3gdqtbhg0ipK0s5ZLqERLfxZG2hWjxu7Tbb2MnfYUCwmwYHNFuhyAhnWlJKw5M2s0jieCCC8mArpD3dHC26V9s/79wQLaBZghONRBzBD0tCfJJ1EjE8OqV9bzF/zny3Bnel7qbgTpSvScAbPBkmN69vr/r6BPyF5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218807; c=relaxed/simple;
	bh=BQ8NIV42hukAEiI8LOziWxaBdX37CL3sDg465D/3F9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aBrIHXVVhI+4o4T+f7+vBFfYTJ4oZZyaA9kunzsIMOPXaQ2gob2lGNPRlW3goK+gWtWc1o0nKL4NZhwMnpyajyEB7PXL9Jn7zBnFJear8fKgWc9kqHZ/bVk8RDfIAtjStfr+OCqFHOYRwUnaQVo0h4ggk0WRMPzHPj0pRkgU5l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MI27Y3GQ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MI27Y3GQ"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so7996495b3a.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784218800; x=1784823600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yubyZWrL+JQMdwCEigycr7CQmraB7luNnkV3xuug/Lc=;
        b=MI27Y3GQVk6cOIxou2S8uBas/rXY4+IchqJwRTRBkmlIbP8umaWIb5w+jAThZkLmu5
         dUkdcQpIpKRGvgNHJj48VI7i3kDMRDzUm4zMmxswSiN7C4QJG55R9V1evqMalCrOEZWY
         ns1oDnHaR8ZJ3THw0VxrCChIbbR9DsX8FitRmkyq2tgu7TQJNAuQ0JEgp7j7jxvR17JI
         4qYNG3XM0jkg6RQ+0Elm5FE5x9CBfHiCsuH2cpX8EWvyj+2gmZiHWLvV7QrnA4MtzhPj
         2yprLxqnf7pNwHVD/xqKpL+fyiqteF3YDce8mRne+P9iV0v6iVCZtOoj3yu+BuO15Gaq
         OV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218800; x=1784823600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yubyZWrL+JQMdwCEigycr7CQmraB7luNnkV3xuug/Lc=;
        b=GkIRxMGfwUzSiSJBqqWJ1EY/KaFD5SxQJaBWcwT+NeyAuc5zmenwYboqbYJB1r0vCn
         MwyBowABHFvqOqqwDuK3m8R7mtZhmpjFu5SKzkeiEH7BTPeUotxmOXdxx2wMFNG6Xymm
         rBBLQQ2qYbow+MMq7bjGcg0uUcuNNSkKDtA40MDbEEPQE3MWxoeZs1/9IwEUw9Ohw6a+
         suFatPgavldkfDAa7F1oRJBOW8n1dI4CBE4GcbegqFjsJsphgG50Qg8OYToT7BfZxxtz
         K0CRovMQ/uX18VxSAKnOoh8Ri8On/yxQzW7cENM6A4u8/RFaxb6fuK3EkFRkwfFNKxoA
         H2Ow==
X-Forwarded-Encrypted: i=1; AHgh+RrAq0hKlNK2v7G5VlvIN/yPijjBtD5UTJCTq5MtEX3sLZIWbUNALmNjwvzAFyRPn1cXkjk7+4fv+X9v@vger.kernel.org
X-Gm-Message-State: AOJu0YyWHhg+CPe8olyqEkE2eYBIdpUu85yzUvNt6WfaVGR1YB8QNZc0
	kzIlSgsac7djGd2JZ3JCsLOqlmaerOWVZnJ2/wTCMVFnwzhG0YtpcDht
X-Gm-Gg: AfdE7cnGjoDjNk1ShYX4bb9aG/CNvFlpRcXYT5wR5fKMMU1jwgc8aro0VSrsOmCeFyU
	0Tz8mxokWaqb+SXhbPkErDnSx3uf1fdEFsMa6mmc/vkQ/kefofvvk6TxyNnAt5ARVb/RzX9FffH
	fxrk0so9VwVzdU5qoeBAgQc7tbOV6Udj02T/Ad/TNeN2yP1E9tV7JZQ67/Ab7F4+MovOpylCFym
	/1eT0Xit39tieysrisypf6yYqsmQncaNLuuQYwp/pduhvXvPV2oZb/8c5lkjTxjfy7R/WeOCPjU
	axHBcVDXpSOmzdI03Wla59my7yzPwsjQKUVk7Pec5beX2ypgbsO+LIchCrPLNA78yM+o8CvYvhf
	lF7Hy9VwL0NiX0qzFPjTmF8Dh5gqDlS0qbKDRahHGy8ShnMA8GIKZl48V2kNaDMBIMQjqdDlk/4
	gHjLnvzK0fl6I9PIGrhmbTgbQoOQZBHzuPLg==
X-Received: by 2002:a05:6a00:b93:b0:848:5f4f:289a with SMTP id d2e1a72fcca58-84a516062c7mr12626941b3a.49.1784218799765;
        Thu, 16 Jul 2026 09:19:59 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a600sm5092661b3a.6.2026.07.16.09.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:19:59 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Roman Vivchar <rva333@protonmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 6/7] watchdog: mtk_wdt: add reset controller support for MT6589
Date: Fri, 17 Jul 2026 01:19:22 +0900
Message-ID: <20260716161923.266315-7-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that no other SoC depends on the mt6589 fallback, it is safe to
assign reset data to the mt6589 entry.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 345d2e89f414..c8ce45a59795 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -10,6 +10,7 @@
  */
 
 #include <dt-bindings/reset/mt2712-resets.h>
+#include <dt-bindings/reset/mt6589-resets.h>
 #include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
@@ -88,6 +89,10 @@ static const struct mtk_wdt_data mt2712_data = {
 	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt6589_data = {
+	.toprgu_sw_rst_num = MT6589_TOPRGU_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt6735_data = {
 	.toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
 };
@@ -496,7 +501,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
 	{ .compatible = "mediatek,mt6572-wdt" },
 	{ .compatible = "mediatek,mt6582-wdt" },
-	{ .compatible = "mediatek,mt6589-wdt" },
+	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt6797-wdt" },
-- 
2.54.0


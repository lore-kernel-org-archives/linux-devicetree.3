Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142E33FB060
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 16:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784306518; cv=none; b=tTqbOc0lCM4Om5viK7WfBvjvNE5nhBZ4OzpK6hJMd3YInjGA7zYbSkqUn66juawlPK7nh7cdvAmUPTVBjNLgTcqRRjBeFmEYYV+8Wf+b2IX8tZ7HZqQkOeet+2q7EdTp+xhln23NhZ+ciUQrvoPx3i63YDPzQ5jjy418Y+GYzT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784306518; c=relaxed/simple;
	bh=XmNye/vjiULEsxnBNVYOTUkUu6v2VjDCwyqHNObnENA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qE0kDrFLd/9sKIuuyCJd2T+HxpiYgDM72q2dMcIF9Uwdd6Wt8Ouiv+epaQC0B0Dr3OEcJlvCPo3Qo/b7Q9ddcDUECOrXnDOxhNLvVv7MSikW2XeAuVG0zwp4sDoou3MEjWsdMqpM8ILnj8aVxtPChfoTB9LfJQgPS2MiobMYsE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CKi1RgHP; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CKi1RgHP"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15c42a45adso248085366b.0
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306514; x=1784911314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YQl5PVCGH7sIQlsUqjynV5DnMRSCC9HSJ3vmRORytzI=;
        b=CKi1RgHPACSJ/T/LGVhWmo3WUG8K8tc66yrvmLrWY3YplDbUQSIF5N0/Dia2f+WtLm
         K6NtVkIUOSwXiKLM8MBfgPrL8jWC2QGcCegK0DkbO6lwOdWrel+7mC4JyadrU+DmcLAU
         mDXhYWguzpqhorGde6LbUPO0vExSfwImGmZShkZlV8Y3ziExRJ4b3EoXfGml01EGH1A9
         uhB4t9r6cm80GKHlDByziN1ja4/PGar8Q1hQf7CWEdqF5cvTvi8gXUVYv8H3QYHbseJ7
         bAoyvoupv6FSP3L8/pRvGir/yWOjLfnMzVu4sTOHZqf+UeEqiohHzlk9oi+3vYDndWwQ
         nW0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306514; x=1784911314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YQl5PVCGH7sIQlsUqjynV5DnMRSCC9HSJ3vmRORytzI=;
        b=L/PyxQt42NXHW/EhMGrQDhvqTK0IARLItJ0wPaqLy/FwwV0pQJGhjuxjxUo103ljfN
         8vfvZPOC/alBGvMHtbSJdkUDLdsRy663T0576SZQCsyFOqYlaeKPvsO7VNRbDAMJwR/P
         Y6/K7OS84uA5OFx8D7+kvQDehTtmPpFapP65gMc4B7D8im1C9arqf23pFtprF8C4cXAl
         8ybvThxcFKWAI1+N8kwF0GChLxZYIydWb7EPLjzcFU4NoPvlSSQE1lwfh0O4TqxtzjLy
         vWAaFKVQNUL2tPtt+HL0cMs87SSGqcXfrwaCRzq2vmsCB4R+OaM1vnenZke88+iV/EUw
         I0tQ==
X-Forwarded-Encrypted: i=1; AHgh+RqN6CyBuS+ip1ffKD61IKwODx4uyCIxL+RQ7auRBuiYTr+6OmPPf0II3ABbcmTn8SeYLpFWAT/agRvJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzRF/p2f8AOs2IOLNp8sTCBe/hiarKzEuh2z2NUSqVf0UQPlbj0
	1rFKgJmwfaWuruDUjiCxpPDJGeyiUlZV0974GUQlgR7jXvjEtkwD6gkS
X-Gm-Gg: AfdE7cmuFwXrHSws9WK/0sXgNq4RvopLr3eT1Jf54rr8IMNrUpJKJRwXeGdtw8MacJ+
	6cDlKMy9x/rynG3DtMXAMtWVR9W7jlZXqNDYJKo7LNr89uWg4ETax8wy9rHe1vN5plXeFfPUfZj
	o57ZJnt4HKxipkHAu0FcT6NQoWKBZADAZseYhEEPpt7yi+DwkuM2t2YX7Gd2Ji8uxeL1EzV3zKo
	RVfZQOETapb/cSGuGhX1FHtYJcFAu+GI/d+MntIFzVeF6/Zd949Y9xRvEmWJyUwIbqlBRGCkpu+
	HOK4cjjXFhkt0AAg5ACkSOAGQVPWj6GKhxFW6S3hC2mYgAAldhORR86Y+ImnnGNDdt2zlm35wZB
	lB/kTr3ip4/xZz5ARlZpI9PwQJQREkCruFOKwIuinA3sChKopi1FIQy0czXfHgMhpBksAvxuY3g
	==
X-Received: by 2002:a17:907:9625:b0:c15:dd1f:f2d with SMTP id a640c23a62f3a-c1692413dd8mr352045966b.25.1784306513979;
        Fri, 17 Jul 2026 09:41:53 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm105880366b.14.2026.07.17.09.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:41:53 -0700 (PDT)
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
Subject: [PATCH v2 2/7] watchdog: mediatek: Add wdt/toprgu resets for MT6589
Date: Fri, 17 Jul 2026 18:39:13 +0200
Message-ID: <20260717163959.714561-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717163959.714561-1-l.scorcia@gmail.com>
References: <20260717163959.714561-1-l.scorcia@gmail.com>
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


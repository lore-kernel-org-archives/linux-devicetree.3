Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517883;
	b=Ai7MPqS5bA9oSkw9A2/FmWiKJVwYVs7zPzeptspPen5bdyCtioZIH6HIYIahCZwciBKV
	 qglILx3s6b9yITqoM/MWeBLlqBReWRF3S+VAWaL7lBm8qed6iHoF2RZbjdhYT2ajU05Kr
	 2SLpl8q/Uv3ZtG4alCX+gELpijIrocfd/HIsmOzyP/J1WZn40kYqCfalNQxWCsWdaR9JA
	 gNGR2+oupizCwuVbsIpzLghSwa56yKfzNNw4zvWwCoiMykrkVi/rulE/0ECfVrJz1WoTC
	 V/58yeIVHhJFV6fbTGGVUBePw2qdG+BwLGerV/gZPMVLty5qUks8zXJ6+jdvTedGq2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=b2cuoSSXuPlFWsURCaXb/TKI1SgcO0qXqGq45/zPoZc=;
	b=3TgIj69z/BSENwvncq1bDDJm9HhGjCqp1nnaWqj7Yqk5kW6ERGp94/Mq62jmTTwV9OqL
	 T6IfEv4SALCHO2gvwor3EQ0qYf73ZEWA72VuDGC7C43ftJdp8zi2TfYpfgL8Ec9BAmZFm
	 8kDMDwRj8r2ns53qvMje4RWRC9/2hVLQLJ3Tkt9vyIQsgC42qHX36rJe77KneX08az3q1
	 AfJAJ1ADmtFg2cpAoRyKKN/AySQmWNa3OGompXndKulaS3IlE7Q0yuzXUxPh7zT6kxs81
	 Und1x4Qtq/XVc9q2Hqa2/QbgZCuRAfQffl8fbXWbQdvQBuPs0qT8BEmtKedQzSU0RsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GmlRKkzs;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9571C60A2609
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 17:38:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9571C60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GmlRKkzs
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1cef0439aso38512495e9.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 10:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517882; x=1793122682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b2cuoSSXuPlFWsURCaXb/TKI1SgcO0qXqGq45/zPoZc=;
        b=GmlRKkzsvSdtLCHmdZteJEXJKS8qVp37TbWjI+1duppJ5T+3A91EGiNYSSMd1vH9no
         +x8gcfrvRGCTFEu46jzsfHHtUXQa/GPII9U/hSH0aZNhN0hhGtVcl6cuG7n7U6PtPzp/
         Aqppn6vCN0usq0nBOl/GXyJ6NM5DHWlyR80Bkqj47xXPpadl4yNmlH0TNwfeftUoZIDh
         YgjITSX9V3RVsALF7rfmeresrwjX3Ph6WunegR6kw/E/TN66eDBsWP9N8rl3ItRfLKLE
         GJZHvexEFdZwoaDpa+cjslGHH0ipsbjJatxi8jh9d1uaAs6u5ArM1d9waxcuKnwhC7xU
         Dw9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517882; x=1793122682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b2cuoSSXuPlFWsURCaXb/TKI1SgcO0qXqGq45/zPoZc=;
        b=C79Oe1nYG1pHpM3+YMX71/7hJm8Hg898bEi777jEzS+supTZBoDRah+nEv/hKUvmAk
         yj7nhwcpZhAszmq7V+7t9+xygHNSZsGSTDPAdtEhRBeQ9WffcamscPjQLMRsVb1Fgk6v
         3uKq6BYn2JFpD+zVCZA2kdCV0qaR5U33qeisXMtDJ9OjUIz2f7M98kaZVsgP+GZvakv5
         zp7OFBm/Em5OurKTqRIaT9tmjODw0c16wkUA7+cTiPVxXgTVrt7s8f8gk9c7vDNt8P60
         zSWQaJOQm0OYGioiPAFx1xEPiU8neuOdvIzkl9VuWfgan81BM15VKyYTPsW7ePv3P9Wz
         y+pA==
X-Forwarded-Encrypted: i=1; AKwUvByM/1kfdmJmdtE8RwfMOx08+ryy45+PULKbdCIP91sAbRuISHlFJAs2U7usYfFRfLw0dZZtvSRz2E14@vger.kernel.org
X-Gm-Message-State: AFq9FYJzkNrP89oMo91lhs5nWUH5m32XFu9YLBvMvwJ/MbGl1Nu7Xmxy
	rMoicpGGSYykXRFtRgfWAI+PicKtziBwcJwFLKcj+CBadp8X68Z3rcqR
X-Gm-Gg: AYBFou3nUZcPs/aYMRVtXGaJzfXx/0sOec0ZLOqxtbYUWDsowP+qtVSotK2tJ/nBI7S
	+DHNFndwfWUduAaSM1aH05VPeayjOl/5IbD2FBKaJMvqYacHqMqk3NpMCsdFb9UGexoyDWCYV/4
	ltOzj1TahxF/5SlNc2WcWnhSNg0/tW+fScKAZJxJQ0An0MBa6rebdvvTJYewBfyn28DYUhVs2GY
	UFAW6onGeUw95DRTu8xMspNaj0IkNwEAO7Hw56h7qy9P1Vx4Qh7yD9vZBXM5sCwom/UK1TYz4z0
	sIuKvzJJ70JS53F6e7y2iNFp1FutQUn11Cumefh0yYVVje+2BKaIHM6ieAXpPwrVwq6rnytwkDT
	zfhcQVNrwHWuMrC4dnoUv8VqIbmCp9sfa1jQOGid2Tzs9PQm7J+HQ5JOBgWadM/2jlO7p1vsUU1
	6aa1JjvC4HhT1jog2rdB/D//mmN0VW/q+bUjV/RKShba+tILh/UYpDSWIFBf2231vg1bHf59n/j
	oNB
X-Received: by 2002:a05:600c:5494:b0:4a1:e0e3:7fe0 with SMTP id 5b1f17b1804b1-4a1e0e3802emr205945675e9.12.1792517881594;
        Tue, 20 Oct 2026 10:38:01 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:38:01 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Val Packett <val@packett.cool>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH RESEND v10 7/9] pinctrl: mediatek: mt6397: Add MediaTek MT6392
Date: Tue, 20 Oct 2026 19:33:28 +0200
Message-ID: <20261020173556.632798-8-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the MT6392 pinctrl device, which is very similar to
MT6397 with a handful of different property values and its own pins
definition.

Update the MT6397 driver to retrieve device data from the match table and
use it for driver init.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt6397.c     | 37 ++++++++++-
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h | 64 +++++++++++++++++++
 2 files changed, 99 insertions(+), 2 deletions(-)
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6397.c b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
index 13cee2a209c2..3944e39db7e6 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6397.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
@@ -12,10 +12,32 @@
 #include <linux/mfd/mt6397/core.h>
 
 #include "pinctrl-mtk-common.h"
+#include "pinctrl-mtk-mt6392.h"
 #include "pinctrl-mtk-mt6397.h"
 
 #define MT6397_PIN_REG_BASE  0xc000
 
+static const struct mtk_pinctrl_devdata mt6392_pinctrl_data = {
+	.pins = mtk_pins_mt6392,
+	.npins = ARRAY_SIZE(mtk_pins_mt6392),
+	.dir_offset = (MT6397_PIN_REG_BASE + 0x000),
+	.ies_offset = MTK_PINCTRL_NOT_SUPPORT,
+	.smt_offset = MTK_PINCTRL_NOT_SUPPORT,
+	.pullen_offset = (MT6397_PIN_REG_BASE + 0x020),
+	.pullsel_offset = (MT6397_PIN_REG_BASE + 0x040),
+	.dout_offset = (MT6397_PIN_REG_BASE + 0x080),
+	.din_offset = (MT6397_PIN_REG_BASE + 0x0a0),
+	.pinmux_offset = (MT6397_PIN_REG_BASE + 0x0c0),
+	.type1_start = 7,
+	.type1_end = 7,
+	.port_shf = 3,
+	.port_mask = 0x3,
+	.port_align = 2,
+	.mode_mask = 0xf,
+	.mode_per_reg = 5,
+	.mode_shf = 4,
+};
+
 static const struct mtk_pinctrl_devdata mt6397_pinctrl_data = {
 	.pins = mtk_pins_mt6397,
 	.npins = ARRAY_SIZE(mtk_pins_mt6397),
@@ -40,13 +62,24 @@ static const struct mtk_pinctrl_devdata mt6397_pinctrl_data = {
 static int mt6397_pinctrl_probe(struct platform_device *pdev)
 {
 	struct mt6397_chip *mt6397;
+	const struct mtk_pinctrl_devdata *data;
+
+	data = device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENOENT;
 
 	mt6397 = dev_get_drvdata(pdev->dev.parent);
-	return mtk_pctrl_init(pdev, &mt6397_pinctrl_data, mt6397->regmap);
+	return mtk_pctrl_init(pdev, data, mt6397->regmap);
 }
 
 static const struct of_device_id mt6397_pctrl_match[] = {
-	{ .compatible = "mediatek,mt6397-pinctrl", },
+	{
+		.compatible = "mediatek,mt6392-pinctrl",
+		.data = &mt6392_pinctrl_data
+	}, {
+		.compatible = "mediatek,mt6397-pinctrl",
+		.data = &mt6397_pinctrl_data
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mt6397_pctrl_match);
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
new file mode 100644
index 000000000000..e7241af28fdb
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6392.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __PINCTRL_MTK_MT6392_H
+#define __PINCTRL_MTK_MT6392_H
+
+#include <linux/pinctrl/pinctrl.h>
+#include "pinctrl-mtk-common.h"
+
+static const struct mtk_desc_pin mtk_pins_mt6392[] = {
+	MTK_PIN(PINCTRL_PIN(0, "INT"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO0"),
+		MTK_FUNCTION(1, "INT"),
+		MTK_FUNCTION(5, "TEST_CK2"),
+		MTK_FUNCTION(6, "TEST_IN1"),
+		MTK_FUNCTION(7, "TEST_OUT1")
+	),
+	MTK_PIN(PINCTRL_PIN(1, "SRCLKEN"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO1"),
+		MTK_FUNCTION(1, "SRCLKEN"),
+		MTK_FUNCTION(5, "TEST_CK0"),
+		MTK_FUNCTION(6, "TEST_IN2"),
+		MTK_FUNCTION(7, "TEST_OUT2")
+	),
+	MTK_PIN(PINCTRL_PIN(2, "RTC_32K1V8"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO2"),
+		MTK_FUNCTION(1, "RTC_32K1V8"),
+		MTK_FUNCTION(5, "TEST_CK1"),
+		MTK_FUNCTION(6, "TEST_IN3"),
+		MTK_FUNCTION(7, "TEST_OUT3")
+	),
+	MTK_PIN(PINCTRL_PIN(3, "SPI_CLK"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO3"),
+		MTK_FUNCTION(1, "SPI_CLK")
+	),
+	MTK_PIN(PINCTRL_PIN(4, "SPI_CSN"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO4"),
+		MTK_FUNCTION(1, "SPI_CSN")
+	),
+	MTK_PIN(PINCTRL_PIN(5, "SPI_MOSI"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO5"),
+		MTK_FUNCTION(1, "SPI_MOSI")
+	),
+	MTK_PIN(PINCTRL_PIN(6, "SPI_MISO"),
+		NULL, "mt6392",
+		MTK_EINT_FUNCTION(NO_EINT_SUPPORT, NO_EINT_SUPPORT),
+		MTK_FUNCTION(0, "GPIO6"),
+		MTK_FUNCTION(1, "SPI_MISO"),
+		MTK_FUNCTION(6, "TEST_IN4"),
+		MTK_FUNCTION(7, "TEST_OUT4")
+	),
+};
+
+#endif /* __PINCTRL_MTK_MT6392_H */
-- 
2.43.0


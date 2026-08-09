Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658F83D79F1
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 16:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786291645; cv=none; b=OTwH/19aC8YHmr2l0YsSh+jDgP7E5HtoanhhJ1pBmj0o/QxEXXlQtU5D68+w7xFxpL4VpqSctrEGTjE0KmPFudhBhJ92OpCVtgTW6c3K2l6nsH8Uw6PbNWEZ5sIWzHPAuaDZYLWGdnLFS8ze8y4ffY5wqM7stGImFiwSH1KMxt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786291645; c=relaxed/simple;
	bh=4nux2dDx8b1odT8v/xEMpJr6myyQQLALepQ3LPlAo1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=orgM1bN/uri80fYIxKaLuOTrrh+3VUTNslBMt+LrrjPkbT/8CGzpIqcDhxQlZUQJqd/ezs/0y64+k0p232srLbZPuph2q/8Iu4v/QkA+EUuamn6e3ARZuToHLVLJ1Oiza9WzNFRDdIdesZSWlFyyxBOB+O4kYp0QNfx63ro08pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BgA2D814; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BgA2D814"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49553515a8bso16954655e9.1
        for <devicetree@vger.kernel.org>; Sun, 09 Aug 2026 09:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291642; x=1786896442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ArReOYHVWGkqiCjvjPG3jfbqs328VtcGm9nbHTUdsqI=;
        b=BgA2D8145sCAqBBgn1uGllM94T2OgvHRZrFyDkFA/ZLIOq3QD+7LHHnGYjkpgV82J9
         YauZFEky5hQqN3rRNiVr3d0hdI0tEBYdO8TZuk5jbNOqexd4JOPMNnSXbmuW3JClJ/rD
         +h9XqYvV6ze5afi2V6XllW3nIDgt+6Cw3B//WfB4ubVjPJqAivvukwv1pr1JrFRmx8AY
         Zndtil4alHVquQU3bIx/T+iSm78V498VsKy+xGcoQPhPbMvDp2oc/EWwdZHVxKSv08Hk
         Hv4AHU60bFktn7L6OSxhnLVfdsRjBqSnFEDGBEWUDbEKhaGAxo9q5jI+XXMwXVXSXjz6
         tdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291642; x=1786896442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ArReOYHVWGkqiCjvjPG3jfbqs328VtcGm9nbHTUdsqI=;
        b=NKAkUcRLrdvSAxM45+P/76HW3T8os8hyO2b4gBu8zaCSKt8jmwe3HpCTt4yUuVWGez
         4NPiRURoJ4aYIKgew9+b3KYO55iGJ05s+kHCfh8Y9jVFM6avXOpqyDDzgfTeKAwbiYJz
         hKDrW92g4fdUDWguIC3sSVQ3AYCsUulJppR3AXNvhKyIOqewOAS0TwpRm7Fnp7/XPHY1
         uOUtit7BONHcAQ+vbX0vYGxFNB5nmzcKuhq99t7T+dl/PxBfw29Xzj6zyMdSBcY+xecE
         dRN+eY5p1EQWWEOTXaWF+LGO3k0saPoRe4xY7adQzDDKf+f12kd/ZSORhnooaK/KlgDt
         H5Zw==
X-Forwarded-Encrypted: i=1; AHgh+Rqj4yjw9HTy4b0lym+Rt2MOyPsIDd7l/EAwVqkahlzzZbCVDQz9UeiBllJ3Ueh4PDpCJNHOkBOJLbDZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1p+SJ7oMxjDW7EgG4bxKVsPHx/7PHG5INuiglSMRdE9hYgKE5
	fkvMe8Fy7n1SWaymK9MnscY7rgl6+nc5VYhEgPQgtwgj47GbX8gi6yFq
X-Gm-Gg: AR+sD13lsVOBMYQ4aUMLBAU7uofoARpcLyR+b7VZlWfMZwQxH6PCsoQS08F/3uCYUIR
	AoDSbius2iQPcXIK+xWHrp59sk3HNJWQUL6K4LyvTJ10YqOeWY43YtovMpgPXp3bvLCGp3QKIcO
	HKVnSHOyaSqFr4vOwM9jm+rvZh1R88UL7twRRn2h2mnJxWVuLf6f2O3Ge/DHQ3avEm68pfOtpsM
	DQtT063GEIQ+5qN24FPwob8i5QkNCH+mRyHuZbf6GB5BsHIOhiyT4+0zuVd1i2K8pDu5hsS0XvO
	SYf+7qClojLXH4pC1OTWw5iuebv5MqopQ9V2MuFmrmcFD3AEL+UmT5aeGKgsOmxQHINXGmEV0rb
	6H6buABzROt9nrhno10ypIgLud6ZEixkptWzDVLD5R2prNuXlN0yJHWL5SSMy6DIognhydOH+cI
	cdnytr/Mu+Sq0H8t2svbvjWMArKn7wwrJbSnTDw9ptdWiEjKDVAzMhZh3xHbyoGRrG21K83FQfW
	aqC
X-Received: by 2002:a05:600c:3b04:b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-49959e016f2mr315410825e9.3.1786291641636;
        Sun, 09 Aug 2026 09:07:21 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:21 -0700 (PDT)
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
Subject: [PATCH v3 8/8] soc: mediatek: mtk-mmsys: Add resets for mt8167
Date: Sun,  9 Aug 2026 18:03:32 +0200
Message-ID: <20260809160643.33991-9-l.scorcia@gmail.com>
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

The mt8167 SoC has 64 MMSYS resets, split in two contiguous 32-bits
registers, MMSYS_SW0_RST_B (0x140) and MMSYS_SW1_RST_B (0x144), as
also stated in the downstream kernel for the Lenovo Smart Clock
in the ddp_reg.h header.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/soc/mediatek/mt8167-mmsys.h |  3 +++
 drivers/soc/mediatek/mtk-mmsys.c    | 38 +++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index eef14083c47b..27793462ce0d 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -3,6 +3,9 @@
 #ifndef __SOC_MEDIATEK_MT8167_MMSYS_H
 #define __SOC_MEDIATEK_MT8167_MMSYS_H
 
+#define MT8167_MMSYS_SW0_RST_B				0x140
+#define MT8167_MMSYS_SW1_RST_B				0x144
+
 #define MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x030
 #define MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN	0x038
 #define MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x058
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 2f3e0778bb17..02649225e8a7 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -4,6 +4,7 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
+#include <dt-bindings/reset/mediatek,mt8167-resets.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
@@ -53,10 +54,47 @@ static const struct mtk_mmsys_driver_data mt6797_mmsys_driver_data = {
 	.clk_driver = "clk-mt6797-mm",
 };
 
+static const u8 mmsys_mt8167_rst_tb[] = {
+	[MT8167_MMSYS_SW0_RST_B_SMI_COMMON]	= MMSYS_RST_NR(0, 0),
+	[MT8167_MMSYS_SW0_RST_B_SMI_LARB0]	= MMSYS_RST_NR(0, 1),
+	[MT8167_MMSYS_SW0_RST_B_CAM_MDP]	= MMSYS_RST_NR(0, 2),
+	[MT8167_MMSYS_SW0_RST_B_MDP_RDMA0]	= MMSYS_RST_NR(0, 3),
+	[MT8167_MMSYS_SW0_RST_B_MDP_RSZ0]	= MMSYS_RST_NR(0, 4),
+	[MT8167_MMSYS_SW0_RST_B_MDP_RSZ1]	= MMSYS_RST_NR(0, 5),
+	[MT8167_MMSYS_SW0_RST_B_MDP_TDSHP0]	= MMSYS_RST_NR(0, 6),
+	[MT8167_MMSYS_SW0_RST_B_MDP_WDMA]	= MMSYS_RST_NR(0, 7),
+	[MT8167_MMSYS_SW0_RST_B_MDP_WROT0]	= MMSYS_RST_NR(0, 8),
+	[MT8167_MMSYS_SW0_RST_B_FAKE_ENG]	= MMSYS_RST_NR(0, 9),
+	[MT8167_MMSYS_SW0_RST_B_MUTEX]		= MMSYS_RST_NR(0, 10),
+	[MT8167_MMSYS_SW0_RST_B_DISP_OVL0]	= MMSYS_RST_NR(0, 11),
+	[MT8167_MMSYS_SW0_RST_B_DISP_RDMA0]	= MMSYS_RST_NR(0, 12),
+	[MT8167_MMSYS_SW0_RST_B_DISP_RDMA1]	= MMSYS_RST_NR(0, 13),
+	[MT8167_MMSYS_SW0_RST_B_DISP_WDMA0]	= MMSYS_RST_NR(0, 14),
+	[MT8167_MMSYS_SW0_RST_B_DISP_COLOR]	= MMSYS_RST_NR(0, 15),
+	[MT8167_MMSYS_SW0_RST_B_DISP_CCORR]	= MMSYS_RST_NR(0, 16),
+	[MT8167_MMSYS_SW0_RST_B_DISP_AAL]	= MMSYS_RST_NR(0, 17),
+	[MT8167_MMSYS_SW0_RST_B_DISP_GAMMA]	= MMSYS_RST_NR(0, 18),
+	[MT8167_MMSYS_SW0_RST_B_DISP_DITHER]	= MMSYS_RST_NR(0, 19),
+	[MT8167_MMSYS_SW0_RST_B_DISP_UFOE]	= MMSYS_RST_NR(0, 20),
+	[MT8167_MMSYS_SW0_RST_B_DISP_PWM]	= MMSYS_RST_NR(0, 21),
+	[MT8167_MMSYS_SW0_RST_B_DSI0]		= MMSYS_RST_NR(0, 22),
+	[MT8167_MMSYS_SW0_RST_B_DPI0]		= MMSYS_RST_NR(0, 23),
+	/* bit 24 is SMI_COMMON again according to data sheet */
+	/* bit 25 is SMI_LARB0 again according to data sheet */
+	[MT8167_MMSYS_SW0_RST_B_MIPI_TX_CONFIG]	= MMSYS_RST_NR(0, 26),
+	/* all other bits are not described in data sheet */
+	[MT8167_MMSYS_SW1_RST_B_LVDS_ENCODER]	= MMSYS_RST_NR(1, 2),
+	[MT8167_MMSYS_SW1_RST_B_DPI1]		= MMSYS_RST_NR(1, 3),
+	[MT8167_MMSYS_SW1_RST_B_HDMI]		= MMSYS_RST_NR(1, 4),
+};
+
 static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
 	.clk_driver = "clk-mt8167-mm",
 	.routes = mt8167_mmsys_routing_table,
 	.num_routes = ARRAY_SIZE(mt8167_mmsys_routing_table),
+	.sw0_rst_offset = MT8167_MMSYS_SW0_RST_B,
+	.rst_tb = mmsys_mt8167_rst_tb,
+	.num_resets = ARRAY_SIZE(mmsys_mt8167_rst_tb),
 };
 
 static const struct mtk_mmsys_driver_data mt8173_mmsys_driver_data = {
-- 
2.43.0


Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B071453A55
	for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 10:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787134767; cv=none; b=o5VUMDliPzLb9s+nvIa92uduqW/3dQekJ7XTsF+r531Na5neklo3Q0imeCXAwcKosQy2qh/tG7XhCWD9/0qgPTklWlkw9VC49/WXkRD6PSLax9EinpNnOPBP6QuFeZl6q1QCIr1H/eSO5U1HLTS5nCH8dOzdBRcmobKXxHzUs4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787134767; c=relaxed/simple;
	bh=pzu9DMe7iaDjrWFGbiXICChTmsydaYKLu67VDV5618c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r13cyzYIVJ4jvAaL/n+0QtMxDqOwut4uzUI8NfG5jmf75IPWAUdDDT7R5kYM9m7ljF8BSQOKrPsBUuIr/MQZw6Z4HwV4CiYkEHRYp/eD4IQnESuojMwpeQKL0BgxTRsowF6S5kLv0DgawhFFmdkk2f6kE+70zEfMsxgGI8zyzoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQzxCgib; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQzxCgib"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4998590d392so7811525e9.0
        for <devicetree@vger.kernel.org>; Wed, 19 Aug 2026 03:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134764; x=1787739564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ulU8x3Wy8nahtbqcLruGCqTsuJ9c7qAZmMPClxEabE4=;
        b=RQzxCgibhjaa2JAnPavhOwVM4XKbSq11YvgYOD1DW61XCtRN02xJp3yEq5OQiXuh9K
         wSTuAkwC4p9sEUiIR8rD+08IRseh8B8WVehTCYPtJ2KZURfkGiZTZ5aP9FeF7M/GVeK8
         epsBQdoRcqxfDqP8OHKBQV+QJ9plAB6xSK2YM8DBHb0p7h8MxRFI/k2Fck8gMM9PtYll
         l8YhbEQ8FDmc6lBSxZ9/Z2ABBLZ/8sp27mrKQoR3zJUbisYZo+IQbHlM0ODY/1lX/Sup
         8+QwFtgGoPIjxKV/pg4aj+M4N4ULQXhrkDcpPJbk0nPmld1FuZmBcBuIDBckqUStGwvF
         o9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134764; x=1787739564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ulU8x3Wy8nahtbqcLruGCqTsuJ9c7qAZmMPClxEabE4=;
        b=fDqqc8SH5XKR+pCUjCEjUMnl8M0W0qHP9b+PsmvnpDSGjhVk2FVw5MCjwPHwt7JWdi
         ippKjJ5lye11n/2DD2Njx0ZuFup3Woka+XI3adgM6eJ8jvRsImGf4/gdW3D7af9gmGoI
         mm6w+RZI5CfKgJNYjmrfb7o22peaMIL6m1lroe4hTyOz7+W/IEv728gCYZsbeMxS/L7m
         XSsCo4Rn3oAlAaSsBKLwyY0yHxvQlUdAnHDBR9gfb2LbqXIsjRAKsdcdAZfLomYAZdmh
         NfOX9f9E9tbirYUfihlG7tTJfaeWG0HYJ8s9X9UGCS3NpzUqCFJKRwGBK1/iIi1lm4FQ
         edyg==
X-Forwarded-Encrypted: i=1; AHgh+Rq0MIf+HY24bfw2fZA+kjOKEI6GOg+6QvjjHqJDHHgge3XZa0B9zSu3V3kFkgvOTxmPMDX90m5yth2s@vger.kernel.org
X-Gm-Message-State: AOJu0YwPusUZxInonHBk2+q4il98+L6hmqmczEs3Ul1p2KXn7/zWZIfD
	IJ/tVQTXDCnW/Ykzt412FMBXwuT09RxyZpZSt7IR+qFGXx0hqlF78fSM
X-Gm-Gg: AR+sD138idTt2DYYsrjRWvzoQ1nA8YB70s6TJXHzVesEWnsrhyXYlbQmki1fGHPYJeA
	Ue8ADPRMFymEGHwFX7XNVycsBxVZq4ZIJPmQd/0Wvq5ajPQ0tBjT1Xqh+xsIvB3s/WQf3PTyaqa
	CbBDynrbiJoa97nIG18JOMtV1Q4MoTDHfhZV4aPitcpaBy6RK7WRph9h5n+GnTLI7TEulbx1aT9
	rHmm8aD00c3/Ro4bOyhKc7pA0aBRujcOGNiaEcO94qk9KZkyP5nk6b10xW9cdkUC/bw+vnzAN7b
	FC7GLDxnSu93tD6YhKFJvLAJDeXs5L2Pig0cNsBWX4thmIeEsMc03ghKGDVOd4d9/jj9So3LlZF
	osYqG5BCIxSIBtYokMcTKYIAskk0Uo6v/sCFpWtspDb6Kx/w1urpxPLYnofA/hS8thqhlEmvNZP
	fheUD/qV6mBfzNQOgGaJhRD+JX3Q480NlRjXoA1gdQl608bJembSthIQ==
X-Received: by 2002:a05:600c:8b6e:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-499aa1a8bbcmr65261925e9.7.1787134763824;
        Wed, 19 Aug 2026 03:19:23 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9b7c987sm27316965e9.1.2026.08.19.03.19.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:23 -0700 (PDT)
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
Subject: [PATCH v4 6/7] soc: mediatek: mtk-mmsys: Add resets for mt8167
Date: Wed, 19 Aug 2026 12:16:27 +0200
Message-ID: <20260819101853.44681-7-l.scorcia@gmail.com>
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

The mt8167 SoC has 28 mmsys resets, split across two contiguous 32-bits
registers, MMSYS_SW0_RST_B (0x140) and MMSYS_SW1_RST_B (0x144).

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/soc/mediatek/mt8167-mmsys.h |  3 +++
 drivers/soc/mediatek/mtk-mmsys.c    | 38 +++++++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index 001379373507..5c7cded5cfa4 100644
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
index 2f3e0778bb17..015dc5b86478 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -4,6 +4,7 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
+#include <dt-bindings/reset/mediatek,mt8167-mmsys.h>
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


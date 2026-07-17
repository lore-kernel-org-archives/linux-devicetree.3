Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394C2429CCA
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 16:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784306531; cv=none; b=FWLQvh/xF+vBc7XEu8RJNV5ClptUpDTpK7fbSOO9qNmrwgjY2K57FMukM4mfz5GEeLgLrIoIQXBVFXFX4P4OMlBhAWuGaQdTOdOQlGwy5W1KipZphmHn7U0mI4NHSAENHd0P4U4xP5MH4YowkioOxCRcgw+7uQBW5FQcjLgmTN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784306531; c=relaxed/simple;
	bh=BTQ/P+G60DVqMy8J3KP8yMYOqmG/cM0EBmXzazAI0b4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HX0BRd2cxZgdoRr5XTBy4m8WbxLo4v4HEk2gB0znGgju4h1H1AGTSqFpmSZP/glRrKxr27wuAtVSYaJUurg0BmBR2DTOnQf5t9qK/KxCk7Gjjl41y/EZx8M8uhgCRmu9DAaJ19cdjscS5+4A8tERIvduRZJVQkh8L6vos3RZ7+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYigsg/P; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYigsg/P"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c169ae1cb26so297654266b.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306528; x=1784911328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FVHGnXvBQpyTabWvxEW9kBAk5dj9pZG9taR2Z135E3o=;
        b=KYigsg/P/LDx8XbkJJR5EBdFcO1Su3Z8HVpC2p9tVnhUKw9dHLr4tVhTx7OMGardhp
         qtZPhc57c546rI/3H2qe0gPIcO1llFO2aKuWU04q3CvYwMVwuWuoaw9gSrsDno8WO0vI
         /k9zISIk6wCjVmj8wyj1wDpF+Ht9yQebFAn87NRbRO3LcGa8rwmoEJR5eDie6enaZk+Y
         yG+5GwyzfpW+tT2qPtD4ltVXzVVIa36d1NvRt2+r3Oql3Dtwc/VDrCHhb9W9HdV0G7dI
         suzFXy1e0bSxT41NdMf/3hj2SaTh7KKN3+w3DdbisUuSkrlHrK8b3Did96zKG5DMCKMH
         0PCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306528; x=1784911328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FVHGnXvBQpyTabWvxEW9kBAk5dj9pZG9taR2Z135E3o=;
        b=YBRiQ568TBOl7BYz3IXRE/UQaqBWXTDKUSWLo+TxJzAZR+Q8+/qXDwiCy25Ukj9FED
         8JiDF3xuj2ld3X5FHU0PRp7RJUqhf1/AsraqvZGRV5pMPaYRJwHLNcvmadVsm5Mt/1Tv
         X9SDY2zyXdSxOz0iW8TgUfYK+ywgwDrSAbmLmvRIc63k1JHL6GhyRH2vFUrMrrPuTXw/
         SUsG1s4fmEoIsEcxLm379hopyjTIRcPgbDZzudiGq0FWYXpN7/vnLI8RUruUmjvD1kzE
         lYF90dQmA4FYC86GmYB0pZHUbSHmzgWeTrHFYSVBjTNuCzvI8pu/5YoVBWZLCN9MHw9o
         bMSA==
X-Forwarded-Encrypted: i=1; AHgh+RrhAmwMHqudn7axYVvrhIgbURx7VVC1XIzG13NVGytH8Q+B1jEQV6nfkbEUcFWrwaN4IIsYUxR/A0Od@vger.kernel.org
X-Gm-Message-State: AOJu0YzIr2YQNyxSfbNecyXY5Wt4KsGf8Ibyck8fq3itynFerIyEziqi
	tfwcyAZzwYsxpOqbweG8GLOiklD4pPv6mmugGhgpYQI95Y68fB2TXmC6
X-Gm-Gg: AfdE7cndiaiO1yynHzCkO34PG+RLsr9Nf5bUYdfcj2RyDV6scu59tKxQ+L5FRHNE9uM
	mWgk/yOyQOKBX387YMPNQmc/UG+td0rkb7uLmA8grfh6qYDKo83CULL8+k4YLtW/pC38pqwmMHJ
	4xDL0kBVunCInei2hkRjgvqFqdXZZ5vNAYetpNu/x2Z4zQ4O+myhaOD18fZtMw990LaVJMSD14b
	1nqBHyntTfadDuZSa1BqTfS1yUxrYimd+kvnFptgDVFLRbtZbpdOWV09//dlw1EWnz+H2L+n/Nq
	ZqvhY5ybx8CRA3Ad3WtG5U1yU2mMQ4RsLWUkQyiGrxX3AgDkXnPiu5C4k3KODxYOOhus5nNRoMW
	8WVPlb3vCn92wrAqGLdFd2oH9PH4Ift8yT/pzVX/ipdpvpvDfGC9U02q6HSHxW7ysfupy8HPWJQ
	==
X-Received: by 2002:a17:907:c28:b0:c12:3cbf:9f6d with SMTP id a640c23a62f3a-c16b4002a0emr155344366b.1.1784306528247;
        Fri, 17 Jul 2026 09:42:08 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm105880366b.14.2026.07.17.09.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:42:07 -0700 (PDT)
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
Subject: [PATCH v2 7/7] soc: mediatek: mtk-mmsys: Add resets for mt8167
Date: Fri, 17 Jul 2026 18:39:18 +0200
Message-ID: <20260717163959.714561-8-l.scorcia@gmail.com>
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

The mt8167 SoC has 64 MMSYS resets, split in two contiguous 32-bits
registers, MMSYS_SW0_RST_B (0x140) and MMSYS_SW1_RST_B (0x144), as
also stated in the downstream kernel for the Lenovo Smart Clock
in the ddp_reg.h header.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/soc/mediatek/mt8167-mmsys.h | 41 +++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c    |  3 +++
 2 files changed, 44 insertions(+)

diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index eef14083c47b..dc3e882a9893 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -3,6 +3,47 @@
 #ifndef __SOC_MEDIATEK_MT8167_MMSYS_H
 #define __SOC_MEDIATEK_MT8167_MMSYS_H
 
+#include <linux/soc/mediatek/mtk-mmsys.h>
+#include <dt-bindings/reset/mediatek,mt8167-resets.h>
+
+#define MT8167_MMSYS_SW0_RST_B				0x140
+#define MT8167_MMSYS_SW1_RST_B				0x144
+
+/* MMSYS resets */
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
 #define MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN	0x030
 #define MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN	0x038
 #define MT8167_DISP_REG_CONFIG_DISP_COLOR0_SEL_IN	0x058
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 2f3e0778bb17..abd96634b63c 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -57,6 +57,9 @@ static const struct mtk_mmsys_driver_data mt8167_mmsys_driver_data = {
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


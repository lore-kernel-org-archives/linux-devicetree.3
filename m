Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06834372063
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 21:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782078099; cv=none; b=JyWnviTKfgKIHVlh7sn0pwXY2UKGGF2khbKg4Z0IXEArT6WziYLpzG9F/dF99a5sXL9teR0pwIg5RuPQI7s966Q5d/6V2aZyhOfx+5mHkBJos41sZ3P5hzvjdINIordUe1o4D/3iMLJQZXCDMzt7cTAjxYZnfACfSLLtoaPu5Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782078099; c=relaxed/simple;
	bh=18fWd7CDs9ATtKFp3tkSjs04Zj8nl/XFyKUyvkpg2Wg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IOw9cNZ50WGgbSveWuIImhhuo2nnPZqbAErDWnSOcYZV3/JByfBwaPoCNCwyIOsHaADfADZk2fzaOIsmwbYJydovk1ZlE+ZXMBmJMdqAJSfYIlu1V+TVO8JhRq/wgTpd12G+WZC6dWr5ZfaUZGLbJapPQesFlw4kpEAYfOGX/Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cVHQBxje; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cVHQBxje"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-9159da9bba5so279839185a.1
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 14:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782078096; x=1782682896; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUxclwCt1AeWLXTJW70zHjVOqZZDagaPH5nxyqxh7kU=;
        b=cVHQBxje8Hm1xGW6ODKp9TajIv9UlWuAuZ8wuo6L5/HBUBHsbzX0UuGrbBpeO7h4aT
         ejGYqLxqWR0ZPmZ2wmIqgz0l5GuwwHD20BkzSWe1cwWHSeB31vgAgUrAxUENlJGonB1Y
         WK1U1RO9yFA6TOfLK7wJTeCyKvJiqpqQXn4riRABE1ouGNaIWtbskyDlCYoSt5SZ49Mn
         yTsICQBwJ986d7aqXgyHie+I0Be/HfUFcpa8nvwARQlCB7eh8Zt28I1tlnfSvcHtPpw3
         DqMpvctu6/B2ko2HdvS0OXw7IcDqrGKTGGAeevHeqpakGTbFd1fh/66HCxUlH5sFPUXV
         Wgqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782078096; x=1782682896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cUxclwCt1AeWLXTJW70zHjVOqZZDagaPH5nxyqxh7kU=;
        b=V0dM4lNNk306CbarH6prlMXpCI4Olh9xMAocX02M3TBAEEgHJd3qq3ktCmyzFsq06m
         1SeWZwzhYpSwtY68iCQELO/ktX+3FgQuoz6eOW0As5As0Xkts2A9W9kttBpBJG/RTwGW
         eQBYSO12cK8pRxYGb1G0PF8CcG3K/YKFendCZpozSbvmcxDBx5CAXrly3jvxUP8ChL6G
         ekXMhiau9bAUeSCXCQqn6qJN596L6gQWjFl3GjFcasULMtpZeUd47zPNjCX0Y8LjM9mk
         V+KGk0Obsh476t7rHeuXwBaPvrjBAiLzqhW7IIvVPEGy7+YeDMuqOPn+gAZ8YX2pBMh7
         ca+w==
X-Forwarded-Encrypted: i=1; AFNElJ8NoLOfr34BkEfkmXdlwMiXd+v0cC5Foz0HCSOHYneY3cIUue5EyeROA2Av3+jYNtoiokCqFRwI3df/@vger.kernel.org
X-Gm-Message-State: AOJu0YwBvBEWyb9oClXqlw95oD91SekdmUy+ZZeGH6lkhiqFbwXogNB1
	ieBo4i1QeqQCDyqMY9oRydbPtSxiG2eaIl8Pdedze8W8T1+FM+nC1+8Z
X-Gm-Gg: AfdE7cnFnsXSlEGX4gw7cJAOKHAnjFVPCqIk+Di45zmk7WR1jTeEtMt13pAqIEZBvWS
	XOT1mc2rvXEgSt3Ijt9RaO1lKt/1xJZzWFzISDLKewdvZM2FM/Cdmoq/AMXlTYoYbdvGg9cVb8Y
	qwItezq4wFrmjzUmPWZG5/8IMAoPOHcvbegawpdIhkKCqvmQ8Uubntt3SyvxAFiUM9AT2+M9Og2
	km9ig199v1Q3z2nN5ZYiQHjz9SIQLOho/ak+CDCRCc5tMa64Q3AerCFVYIL1niodwSOXBvhv0vD
	yZ0kGCWQznCYBxoB6VYS910on0gMMeVx6HwM2BKdBslSQ32BwhUNfMui5eAYIvzszzFOILUkusr
	PN1TiZi4VLl1xfDUNsYBLvIsAZVPY/A4kbvH81Im1ILq2B1+x4rOYkgOOhbCXhpVTcIHp11v2sv
	b2KHCxPAHArCWSWQ==
X-Received: by 2002:a05:620a:28d2:b0:915:675d:a2d with SMTP id af79cd13be357-9208d7e7a14mr1998933585a.51.1782078095835;
        Sun, 21 Jun 2026 14:41:35 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df81cde9ecsm76274676d6.24.2026.06.21.14.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 14:41:35 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Sun, 21 Jun 2026 21:40:58 +0000
Subject: [PATCH v2 5/5] dmaengine: sun6i-dma: Implement support for
 Allwinner A733 DMA controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-sun60i-a733-dma-v2-5-340f205891cc@gmail.com>
References: <20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com>
In-Reply-To: <20260621-sun60i-a733-dma-v2-0-340f205891cc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

This patch implements the actual support for the Allwinner A733 DMA
controller. It defines the new register offsets and bitfield mappings
required for the A733, which slightly differs from the older `sun6i`
series.

Changes:
- New register macros for A733 interrupt enable `DMA_IRQ_EN_A733` and
  status `DMA_IRQ_STAT_A733`.
- New `SRC_HIGH_ADDR_32G` and `DST_HIGH_ADDR_32G` macro to handle the
  32G high-address field in the LLI.
- Implemented `sun6i_dma_set_addr_a733` and A733-specific interrupt
  register accessors.
- Added `sun60i_a733_dma_config`, which ties all the refactored
  functionality together for this specific hardware.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 87 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 196a0d73b221..4808015934cc 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -52,6 +52,15 @@
 #define SUNXI_H3_SECURE_REG		0x20
 #define SUNXI_H3_DMA_GATE		0x28
 #define SUNXI_H3_DMA_GATE_ENABLE	0x4
+
+/*
+ * sun60i specific registers
+ */
+#define DMA_IRQ_EN_A733(x)		((x) * 0x40 + 0x134)
+#define DMA_IRQ_STAT_A733(x)		((x) * 0x40 + 0x138)
+
+#define DMA_IRQ_CHAN_NR_A733		1
+
 /*
  * Channels specific registers
  */
@@ -100,6 +109,8 @@
  */
 #define SRC_HIGH_ADDR(x)		(((x) & 0x3U) << 16)
 #define DST_HIGH_ADDR(x)		(((x) & 0x3U) << 18)
+#define SRC_HIGH_ADDR_32G(x)	(((x) & 0x7U) << 11)
+#define DST_HIGH_ADDR_32G(x)	(((x) & 0x7U) << 15)
 
 /*
  * Various hardware related defines
@@ -257,6 +268,23 @@ static inline void sun6i_dma_dump_com_regs(struct sun6i_dma_dev *sdev)
 		DMA_STAT, readl(sdev->base + DMA_STAT));
 }
 
+static inline void sun6i_dma_dump_com_regs_a733(struct sun6i_dma_dev *sdev)
+{
+	int i;
+
+	for (i = 0; i < sdev->num_pchans / sdev->cfg->num_channels_per_reg; i++) {
+		dev_dbg(sdev->slave.dev, "Common register:\n"
+			"chan num %d\n"
+			"\tmask(%04x): 0x%08x\n"
+			"\tpend(%04x): 0x%08x\n"
+			"\tstats(%04x): 0x%08x\n",
+			i,
+			DMA_IRQ_EN_A733(i), readl(sdev->base + DMA_IRQ_EN_A733(i)),
+			DMA_IRQ_STAT_A733(i), readl(sdev->base + DMA_IRQ_STAT_A733(i)),
+			DMA_STAT, readl(sdev->base + DMA_STAT));
+	}
+}
+
 static inline void sun6i_dma_dump_chan_regs(struct sun6i_dma_dev *sdev,
 					    struct sun6i_pchan *pchan)
 {
@@ -360,21 +388,41 @@ static u32 sun6i_read_irq_en(struct sun6i_dma_dev *sdev, u32 irq_reg)
 	return readl(sdev->base + DMA_IRQ_EN(irq_reg));
 }
 
+static u32 sun6i_read_irq_en_a733(struct sun6i_dma_dev *sdev, u32 irq_reg)
+{
+	return readl(sdev->base + DMA_IRQ_EN_A733(irq_reg));
+}
+
 static void sun6i_write_irq_en(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 irq_val)
 {
 	writel(irq_val, sdev->base + DMA_IRQ_EN(irq_reg));
 }
 
+static void sun6i_write_irq_en_a733(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 irq_val)
+{
+	writel(irq_val, sdev->base + DMA_IRQ_EN_A733(irq_reg));
+}
+
 static u32 sun6i_read_irq_stat(struct sun6i_dma_dev *sdev, u32 irq_reg)
 {
 	return readl(sdev->base + DMA_IRQ_STAT(irq_reg));
 }
 
+static u32 sun6i_read_irq_stat_a733(struct sun6i_dma_dev *sdev, u32 irq_reg)
+{
+	return readl(sdev->base + DMA_IRQ_STAT_A733(irq_reg));
+}
+
 static void sun6i_write_irq_stat(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 status)
 {
 	writel(status, sdev->base + DMA_IRQ_STAT(irq_reg));
 }
 
+static void sun6i_write_irq_stat_a733(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 status)
+{
+	writel(status, sdev->base + DMA_IRQ_STAT_A733(irq_reg));
+}
+
 static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
 {
 	struct sun6i_desc *txd = pchan->desc;
@@ -695,6 +743,17 @@ static void sun6i_dma_set_addr_a100(struct sun6i_dma_dev *sdev,
 				DST_HIGH_ADDR(upper_32_bits(dst));
 }
 
+static void sun6i_dma_set_addr_a733(struct sun6i_dma_dev *sdev,
+				      struct sun6i_dma_lli *v_lli,
+				      dma_addr_t src, dma_addr_t dst)
+{
+	v_lli->src = lower_32_bits(src);
+	v_lli->dst = lower_32_bits(dst);
+
+	v_lli->para |= SRC_HIGH_ADDR_32G(upper_32_bits(src)) |
+				DST_HIGH_ADDR_32G(upper_32_bits(dst));
+}
+
 static inline void sun6i_dma_set_addr(struct sun6i_dma_dev *sdev,
 				      struct sun6i_dma_lli *v_lli,
 				      dma_addr_t src, dma_addr_t dst)
@@ -1339,6 +1398,33 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
+/*
+ * The A733 binding uses the number of dma channels from the
+ * device tree node.
+ */
+static struct sun6i_dma_config sun60i_a733_dma_cfg = {
+	.clock_autogate_enable = sun6i_enable_clock_autogate_h3,
+	.set_burst_length = sun6i_set_burst_length_h3,
+	.set_drq          = sun6i_set_drq_h6,
+	.set_mode         = sun6i_set_mode_h6,
+	.set_addr         = sun6i_dma_set_addr_a733,
+	.dump_com_regs    = sun6i_dma_dump_com_regs_a733,
+	.read_irq_en      = sun6i_read_irq_en_a733,
+	.write_irq_en     = sun6i_write_irq_en_a733,
+	.read_irq_stat    = sun6i_read_irq_stat_a733,
+	.write_irq_stat   = sun6i_write_irq_stat_a733,
+	.src_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
+	.dst_burst_lengths = BIT(1) | BIT(4) | BIT(8) | BIT(16),
+	.src_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
+			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
+			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	.num_channels_per_reg = DMA_IRQ_CHAN_NR_A733,
+	.has_mbus_clk = true,
+};
+
 /*
  * The V3s have only 8 physical channels, a maximum DRQ port id of 23,
  * and a total of 24 usable source and destination endpoints.
@@ -1375,6 +1461,7 @@ static const struct of_device_id sun6i_dma_match[] = {
 	{ .compatible = "allwinner,sun50i-a64-dma", .data = &sun50i_a64_dma_cfg },
 	{ .compatible = "allwinner,sun50i-a100-dma", .data = &sun50i_a100_dma_cfg },
 	{ .compatible = "allwinner,sun50i-h6-dma", .data = &sun50i_h6_dma_cfg },
+	{ .compatible = "allwinner,sun60i-a733-dma", .data = &sun60i_a733_dma_cfg },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun6i_dma_match);

-- 
2.54.0


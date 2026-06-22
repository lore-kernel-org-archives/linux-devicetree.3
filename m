Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1769A25A2BB
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 01:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782092326; cv=none; b=lZK+/dOJIMhfr18horFKkVJ0lei2fknQNIjw6zeWNPFCOqOLOj+avKwFPiRyEJ4uI+EsTn3i1+pZqyHeIb8HUrU2KB4dUK+Xj2SweNae9E0jNzt5iQlVbhO5pepJXRSEWYmLoYwPwJAzLX8ATckLcRaaZ3gjVsB6imIYjgwJlJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782092326; c=relaxed/simple;
	bh=hOIAu9ZU7sDR6LHu1XxWL+8uH+7OBI7IStkTUGFa3j4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MWuBYnyCmAkpsKhRb7eQ7Yfyvlz7lvtJ6BwiaDq3uf2eRUyXybMIzwmpHnTIHNVKz+WxtrvujnNMrIR0k9qnL63d2nyGbOInsJhUmqmvt/rGJ0X+RXhADuoYmKpXJpw15SY9SV7pv6ndE9MUmcYuSJKaevBX2EHKu735O2n38yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U5rzaYAO; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U5rzaYAO"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51788280e71so44346411cf.0
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 18:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782092324; x=1782697124; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y1foQu9ZR0ZkXVncJfdfO5ydJpyzZO7HD2rH+AoeqgA=;
        b=U5rzaYAOrRYBQ0PNigsU8AFjWd3tSKfAArkkJ/DMtrBAjSKPXDWczupSciumGxk3SE
         oDpqeMPvZYmyIxgw0dQtCbJO4bDG75O/Qa4m8dUNRcouEeCL1MoTYJCGLX8S+CswrEZu
         utJeHImh1mnf89nU34FunjB6aPEj/E1Vb7I6+gildT+URGrlyOMqSYrhBziShQWeyfab
         31IoRRDi1r1h9EezAfXhTHBdMy+eqRGi/6BFZLnAf4pJY2xqezy7e5gxVlT9fk+7wMAw
         C2gvoQes9GmrMFX1cApdBxC26/EH/qWLT3/Wnhml4T1lmSimZSsRbx9R1HMfeoU0ckV9
         vA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782092324; x=1782697124;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y1foQu9ZR0ZkXVncJfdfO5ydJpyzZO7HD2rH+AoeqgA=;
        b=SWmkfwJpTPFCChvnu6o0QoEU7AZizaEkRBGttQtoCP7xpEL/lNm3slzpc008tTBaZz
         IKGNceU/+e1S3s/HpMSt0H03JUs6+gQSMRgEiAcsyzh7istD/FvWEsOf4ScZK+EnNC4i
         PF/t7zgNq3Tjbp7DledPAkPHAJq7F28DoaAec4tB0R2EyxtVMG6batOYYsjxIcahQ4he
         XijJZniNVgWSAClSnRjzjhiCgdf9YKkAh4iH0KK7enkcpN20s7Pbt3cTE7d0o1Go9WRm
         QX9yhygrEOzrvEWW6ygjOy2h3j06A3CA3os3L04j4T0G7Wbi8kbz6X1+CpxoeFzh4no7
         Jndw==
X-Forwarded-Encrypted: i=1; AFNElJ+L0VulDRig05xo7Jq0G9ZVzu6NG2Ib7V7Giba1kxl8l/2yZ09Zx283NjzfRMlh+w98qmK7qm/MspTH@vger.kernel.org
X-Gm-Message-State: AOJu0YykXpc3JSGZRQX6KKOnO6xu3NMF0X5uKWp5lREYTy92szsE1QBp
	zZ2X4D+O9QeWimA5hMd5jF3rtwQraPu1IcPz4KEPRZZhd9M4BwwTqAf6
X-Gm-Gg: AfdE7cl2ClTXwbs/I0R0w8G0s3r791fUewfXhG5JVREjfVtRW8nKtuiFFlfF0EpQtyo
	BW8GhnrNSecuW4q1+fNxGpinLhDc14cW9GQV3JKyC2ds3M8zTJRK7K/GGKcjvKdHL+J7YqhVMw9
	FxQmX7vqc77oZE+gJk+IMzJgQLf6gwztabCkUyAwzNNn3D0ldfLJUvthOUqAlvrcN3Ql5Yv+uPS
	I9auxNWTPqvVc9DVCtH90PF85O0E+BZlLWoXKrpr1upDKdLGiY1+XLWKLMv4fg203TpwFN0MkSe
	PedsUJSfcaByfjEwL7YfeETM5Yt0H1OX6FoQOAvzusnWw6SBSS8cejhNgRbtEhvsAVwxr7fTAYm
	/dy/k5SpA/yYaRwtvbgBDKkTAWbU1z/EwOz8phKUBKzkeafCkoh72old+YsNHUkr2AqjnK6Y8SO
	Nxb4nkTaduMKTFNw==
X-Received: by 2002:a05:622a:550a:b0:51a:348:87b9 with SMTP id d75a77b69052e-51a0693a1eamr125530191cf.29.1782092323963;
        Sun, 21 Jun 2026 18:38:43 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a098e287csm55778831cf.29.2026.06.21.18.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 18:38:43 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Mon, 22 Jun 2026 01:36:27 +0000
Subject: [PATCH v3 5/5] dmaengine: sun6i-dma: Add support for Allwinner
 A733 DMA controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-sun60i-a733-dma-v3-5-f697ef296cbc@gmail.com>
References: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
In-Reply-To: <20260622-sun60i-a733-dma-v3-0-f697ef296cbc@gmail.com>
To: conor+dt@kernel.org, mripard@kernel.org, krzk+dt@kernel.org, 
 robh@kernel.org, samuel@sholland.org, wens@kernel.org, 
 jernej.skrabec@gmail.com, Frank.Li@kernel.org, vkoul@kernel.org
Cc: Yuanshen Cao <alex.caoys@gmail.com>, dmaengine@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

Support Allwinner A733 DMA controller. Define new register offsets,
bitfield mappings and dma_config required for the A733, which slightly
differs from the older `sun6i` DMA controllers.

Changes:
- New register macros for A733 interrupt enable `DMA_IRQ_EN_A733`,
  status `DMA_IRQ_STAT_A733`, and channel count `DMA_IRQ_CHAN_NR_A733`.
- New `SRC_HIGH_ADDR_32G` and `DST_HIGH_ADDR_32G` macro to handle the
  32G high-address field in the LLI.
- Implemented `sun6i_dma_set_addr_a733` and A733-specific interrupt
  register accessors.
- Added `sun60i_a733_dma_cfg`, which ties all the refactored
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


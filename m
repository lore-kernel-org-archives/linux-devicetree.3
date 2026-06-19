Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D519B3321D4
	for <devicetree@vger.kernel.org>; Fri, 19 Jun 2026 04:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781844876; cv=none; b=VGXJJ5clEdyBzTki0dR0+QlTYoj+cKZGF2gZAjLyXFf/baNbkO3MPPh061jgiIO4yZqgXGK698I8dkFRaZSoPK+p/OAemAAQIpHtdHkwsCjN+32iLsC6PUw3iLZ67Mami9FM5XZHO7Pj81YAJWDsRA9XMFB80MVxMdwVSgun2dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781844876; c=relaxed/simple;
	bh=VOexrRFGp20ecE+6PIt5Ha4e+SrvSRe6cb3CbcfWHzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VrZsA9h9GjQb6b+y8I4kUwKFTi/XEzkOtK9oB9S8/ZG4TdBWIWsi8kXhyJ/mTi8gDKAIeJ8uLRm5lBWhvVeeYysSNPX5jGF1ZFOJThUjB4DwKsMH8eC4fsMWa0SjBMc/+ptN9uzx1YJ1Jqzy1NP/Z4EZjkdFi/i49qXjcNgNbUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I8BB2Mww; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I8BB2Mww"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-91587626ae1so191544185a.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 21:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781844874; x=1782449674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EN7WKbhfeumQPMyegObyH/92wLelx5H5tDsCdrLnzyo=;
        b=I8BB2Mww+vmjlgVrNvdGIOUanJytIdKEW3jjS2bof4Qs3XcmuNUNLvWJ4UGApvHj7E
         iP6IOB8Xb62S+tdOBSaI2CESNhMlnRgwqzVefvQP4ExC7yU4CEUxr179f5ENGEPdQLnw
         e/3cmv0jMhHW0825s2jENybcsgbx/WTVgboBULqREP/fjB60Q9GCcvbrs08sJzg8aKEp
         Oz13+/eGa7W/OQjUqod85m4Zs5hnsYXGXUgrVqkEDhOGtd8oU+M9b4ckZlW0kMFX0SNL
         LewN9l/3QCxglMHYXeMIqdHL/V2V+isaI8ZsELPSJZwG0b0W//zHvuXm7haiKeeRPj2w
         DZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781844874; x=1782449674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EN7WKbhfeumQPMyegObyH/92wLelx5H5tDsCdrLnzyo=;
        b=mzp0pJSumKvb19NyioHLVcq9trfSYimJHoaiXxrynma+BsxmSwXw6ALfFcH5ag9XCc
         j/SXb3u+87vhTGzypWlblw8+Y+y1aCtJquGNY+1/2MKCO39oOLflSAYO8ZwjrBPUiKO7
         aYOlVxo2BKRyYkhVcjbCHJJBMwL91hLzeDkgSE6IxNdHHR8nmahLuWMMzXkmopxNcThM
         E88+ilC0HBB6wY5TED7hkSRSpsVBu9xUBPsl3VhEadpfmM/G2iDHMMI0DPnK4uhKM+WA
         a5TpubPpiwWsy+CKngLNYkC5VCPXqWJPveHIdI3bPP/sdmj0Xvbfn9eFAjw97KfgmYyj
         AUuA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZGr9Pj6NcgFwXNY5UukhaluLG8pTkh0Vt/TLLs8yq4iuaMGYYGYadfRt39cgQ2hjD1jrFc+XBsVOw@vger.kernel.org
X-Gm-Message-State: AOJu0YxTSv+QfikAh7nSI7f3JAVdIpqowmJ9fwbHxTCjkQCVf3lqmPJQ
	HLWAKJCLiZJWAs8Jk9LFN5dwN/kSgtN9+nmzvfe4xy4s61YMs0QbMX4s
X-Gm-Gg: AfdE7ckAHPJJIq39mOd22gIornmFPKtakENGK2haJLs/XThqBHatr/X3v0PE7tDpuqY
	YnIU83VyvS2e3X8t25qwvDwWMhOcnIr7ukjZVjK/kI71TIb5J5Fn0iDRIkUeXJr+N6R/LNS/3Ct
	L7JnoXMbel2AJlEwrKQSbp0ddvN2MEpV6YcXOkzFX0wRdQoNyefdUbxUli/lY4uVscnakXvTHFA
	UdPi0e/eygY9hzpQcXDIUR2JZqzPXe8RgmOmwVoj7Hf6rVY6sZPxkwCaCTR5W3zwzXdk9D2CQGG
	MP21stYTMX2TWLos9ZiWGZgEUt+07TMyKlVP7kbkQN0JVc9M5SaMAB3x+uLk234wF29INM5Wpr6
	oO3vaDRvIR50Pse9qS3fQckR1YBy+Nd588s1MSwaEFKC+B5+GjquUHDf4DIdBL8ZXqbsuR0WRvg
	z9jUkLj88DlVO/Eg==
X-Received: by 2002:a05:620a:c45:b0:915:9f28:6748 with SMTP id af79cd13be357-9208ff01e88mr299770985a.23.1781844873790;
        Thu, 18 Jun 2026 21:54:33 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a425448asm134464485a.23.2026.06.18.21.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 21:54:33 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Fri, 19 Jun 2026 04:53:33 +0000
Subject: [PATCH 4/5] dmaengine: sun6i-dma: Implement support for Allwinner
 A733 DMA controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260619-sun60i-a733-dma-v1-4-da4b649fc72a@gmail.com>
References: <20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com>
In-Reply-To: <20260619-sun60i-a733-dma-v1-0-da4b649fc72a@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Yuanshen Cao <alex.caoys@gmail.com>
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
 drivers/dma/sun6i-dma.c | 88 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index fb1c1a28744b..9585b4a9e00d 100644
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
@@ -360,20 +388,41 @@ static u32 sun6i_read_irq_en(struct sun6i_dma_dev *sdev, u32 chan_num)
 	return readl(sdev->base + DMA_IRQ_EN(chan_num));
 }
 
+static u32 sun6i_read_irq_en_a733(struct sun6i_dma_dev *sdev, u32 chan_num)
+{
+	return readl(sdev->base + DMA_IRQ_EN_A733(chan_num));
+}
+
 static void sun6i_write_irq_en(struct sun6i_dma_dev *sdev, u32 chan_num, u32 irq_val)
 {
 	writel(irq_val, sdev->base + DMA_IRQ_EN(chan_num));
 }
+
+static void sun6i_write_irq_en_a733(struct sun6i_dma_dev *sdev, u32 chan_num, u32 irq_val)
+{
+	writel(irq_val, sdev->base + DMA_IRQ_EN_A733(chan_num));
+}
+
 static u32 sun6i_read_irq_stat(struct sun6i_dma_dev *sdev, u32 chan_num)
 {
 	return readl(sdev->base + DMA_IRQ_STAT(chan_num));
 }
 
+static u32 sun6i_read_irq_stat_a733(struct sun6i_dma_dev *sdev, u32 chan_num)
+{
+	return readl(sdev->base + DMA_IRQ_STAT_A733(chan_num));
+}
+
 static void sun6i_write_irq_stat(struct sun6i_dma_dev *sdev, u32 chan_num, u32 status)
 {
 	writel(status, sdev->base + DMA_IRQ_STAT(chan_num));
 }
 
+static void sun6i_write_irq_stat_a733(struct sun6i_dma_dev *sdev, u32 chan_num, u32 status)
+{
+	writel(status, sdev->base + DMA_IRQ_STAT_A733(chan_num));
+}
+
 static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
 {
 	struct sun6i_desc *txd = pchan->desc;
@@ -694,6 +743,17 @@ static inline void sun6i_dma_set_addr_a100(struct sun6i_dma_dev *sdev,
 				DST_HIGH_ADDR(upper_32_bits(dst));
 }
 
+static inline void sun6i_dma_set_addr_a733(struct sun6i_dma_dev *sdev,
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
 static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_memcpy(
 		struct dma_chan *chan, dma_addr_t dest, dma_addr_t src,
 		size_t len, unsigned long flags)
@@ -1352,6 +1412,33 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 	.has_mbus_clk = true,
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
@@ -1392,6 +1479,7 @@ static const struct of_device_id sun6i_dma_match[] = {
 	{ .compatible = "allwinner,sun50i-a64-dma", .data = &sun50i_a64_dma_cfg },
 	{ .compatible = "allwinner,sun50i-a100-dma", .data = &sun50i_a100_dma_cfg },
 	{ .compatible = "allwinner,sun50i-h6-dma", .data = &sun50i_h6_dma_cfg },
+	{ .compatible = "allwinner,sun60i-a733-dma", .data = &sun60i_a733_dma_cfg },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, sun6i_dma_match);

-- 
2.54.0


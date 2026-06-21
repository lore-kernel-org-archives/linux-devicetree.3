Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D2C258CD9
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 21:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782078094; cv=none; b=SCBzN1/MDurNI4DAhzuPGhyFu3zPs+WHsWTZUFuF15QEoerTJ7FfnCxLJZHVmxr0ZyopfNZC+MX1k+XtVr7LFBs7/3OhPVOirSGx4YV6kcXmg+FczlfilDM1zLrXXepQTwAhSN53pF0uiqyIGcNJp1FJjkrDbbC228r1z0yXNWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782078094; c=relaxed/simple;
	bh=sQ1wAjFR9295YnMlB9Sz4W7s2bJ8gyMgINXaeA5IRQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K4RGU/cgW+rh/7If4BEhw9qHDvYo/eqRj5gO8aO7GZmH4QzHosaB1Ab9F/UmHosDItib9d9FEAgvNmArhPGKx30Gc5YAnd8y0E5gV8tDiaBuJwrmcpibxE0sU1r5ocfxQkS53mo2Us6rTDJha7QKm8YI3z5d/FdsZxua9/K5OQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KsFfVJy1; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KsFfVJy1"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8dc87f7d68bso43494736d6.3
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 14:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782078091; x=1782682891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMh31ZzkY75rM1uCI6Py4J/7TBsM66ozEJNyE9b7Chg=;
        b=KsFfVJy1DpOeoigKY98IPPOXhnwfW0r5NnCs4CNfHw8DJfM8WS35k6SdHFElnbieaD
         x/ozn2YXulhv+aR0jlKYpXYZaMlXG3Xn4xdzWJGeu8Vt24vlF9QGR6pBizv7Yf//2NPG
         6l2E8+vskx1QC4678+J7byeKlgPN2UF7AMBtjyn81UtgM4xfYBaUgsx+Wphx1X8N+ykU
         kwnqpBz9+a4ZLePXFkEpEH5zWZGapfGBByWDePxMBBITu8YJxcxSUIl2+M9SknlCUzch
         aGh6cwQeKtOAlzMrNhVUA74mTJb33opsBwVcs3fRDHWZWLgVRXLMOIYqW4Mb2V3iK4Wi
         kVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782078091; x=1782682891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XMh31ZzkY75rM1uCI6Py4J/7TBsM66ozEJNyE9b7Chg=;
        b=EeGIry0MvLio9ttLpWKLUdC/xP9OF6fkgGTU1JPTGR13OCtUVKHQUdSRlYYb1k9s09
         Ny21VSd6ovdDDy8l9ey51BbieP1MwiM9v+5khmo970xDw7r20ep8JbbjEOib/7nl3iqL
         VBguwYgWHi3KpVRdSB+3/lHo0Vqb2xfGEpoxMma7yq288q1K0hY2JWpA+zUdn2q70RBi
         ZUgeyFAnP2BTlfmdkwGHvP1S+3Ps9oxRltmGHRiomztaFRTHTZLAlBEff3v3/3gO2+dM
         SNElrQTEKr2ah5tz2Z5yO3UuQvMO3d1ltLI8kyTVkTVvkKL0LMfMssaXTeo5DPLhH6Xq
         N3Mw==
X-Forwarded-Encrypted: i=1; AHgh+Rr1KPwAGdXCrj+z3LJb+dkUs0sum2yphd/no0CKfJGI4xnAt0m3EYNMx8sknJdEdfkhI7UGbRH3bUBK@vger.kernel.org
X-Gm-Message-State: AOJu0YwN7IIzHm1JpFhYcxNwP8qO/5IZLimmx48cBUuKYUJ/LRnMao5v
	AfsttFIUAgnHIvui3TnBEauKdSJjfDj0D0XLc9sFR+2woR3Imhjc4bp5
X-Gm-Gg: AfdE7cmDI2EIrg6s3D3VWYkVdRtkwyTaslhp6C7i841aF701oqz2+VSyXcSjV4Fd5ho
	3xS2FVMUPXe83RT4UppW5vvcpkYAItKlux9xDZwZvZ0KXdOrPXsMAPCIf4ipsWhRB0bg9KIyuFt
	D2lMChMNqhOIpS3R3Bfhq8JtTIAhJtISqMXkcUa/piVZZGgGxK2zqYk+emZkVeqkQMf1Sqtwgia
	bB2MW2s5s3R5ewi2vByJPmfnjbTa3RLJXWWLLb4RJMGYJPB06/jsqMvUnUUZ6UrrbreHSWob6j/
	/AaHpyj58yCwTaZ1Dl6F+WqWLj4NoW+gZdM4IUqrDf/30beezdcoOdMqHIGc6w17qsG6mEUT6EH
	SMsh6lqLopJiiRPd+8SKPppx6aUeSfsd2kEPF/CTGV2LT0s/SOr3pXlNIhC1DXo2MuAzypH5XHg
	sc/SKMcR4PGUTwhg==
X-Received: by 2002:a05:6214:1bc6:b0:8cc:ed49:bdc9 with SMTP id 6a1803df08f44-8de3b43e008mr217413546d6.5.1782078090586;
        Sun, 21 Jun 2026 14:41:30 -0700 (PDT)
Received: from [172.17.0.2] ([138.28.231.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df81cde9ecsm76274676d6.24.2026.06.21.14.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 14:41:30 -0700 (PDT)
From: Yuanshen Cao <alex.caoys@gmail.com>
Date: Sun, 21 Jun 2026 21:40:54 +0000
Subject: [PATCH v2 1/5] dmaengine: sun6i-dma: Refactor to support A733
 interrupt and register handling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-sun60i-a733-dma-v2-1-340f205891cc@gmail.com>
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

Refactor to support the Allwinner A733 DMA controller. Currently, the
`sun6i-dma` driver has several functions related to interrupt handling
(reading/writing interrupt enable and status registers) and register
dumping that are hardcoded.

To support the A733, which has different register layouts and interrupt
handling logic, these functions are being moved into the
`sun6i_dma_config` structure as function pointers. This allows the
driver to use a polymorphic approach where the specific implementation
is determined by the hardware configuration assigned during device
probing.

Changes:
- Added function pointers to `struct sun6i_dma_config` for:
    - `dump_com_regs`
    - `read_irq_en`
    - `write_irq_en`
    - `read_irq_stat`
    - `write_irq_stat`
- Implemented generic `sun6i_read/write_irq_*` functions for existing
  hardware.
- Added a macro and updated existing `sun6i_dma_config` instances (A31,
  A23, H3, A64, A100, H6, V3S) to use these new function pointers.

Signed-off-by: Yuanshen Cao <alex.caoys@gmail.com>
---
 drivers/dma/sun6i-dma.c | 50 ++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index a9a254dbf8cb..ef3052c4ab36 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -138,6 +138,11 @@ struct sun6i_dma_config {
 	void (*set_burst_length)(u32 *p_cfg, s8 src_burst, s8 dst_burst);
 	void (*set_drq)(u32 *p_cfg, s8 src_drq, s8 dst_drq);
 	void (*set_mode)(u32 *p_cfg, s8 src_mode, s8 dst_mode);
+	void (*dump_com_regs)(struct sun6i_dma_dev *sdev);
+	u32 (*read_irq_en)(struct sun6i_dma_dev *sdev, u32 irq_reg);
+	void (*write_irq_en)(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 irq_val);
+	u32 (*read_irq_stat)(struct sun6i_dma_dev *sdev, u32 irq_reg);
+	void (*write_irq_stat)(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 status);
 	u32 src_burst_lengths;
 	u32 dst_burst_lengths;
 	u32 src_addr_widths;
@@ -347,6 +352,26 @@ static void sun6i_set_mode_h6(u32 *p_cfg, s8 src_mode, s8 dst_mode)
 		  DMA_CHAN_CFG_DST_MODE_H6(dst_mode);
 }
 
+static u32 sun6i_read_irq_en(struct sun6i_dma_dev *sdev, u32 irq_reg)
+{
+	return readl(sdev->base + DMA_IRQ_EN(irq_reg));
+}
+
+static void sun6i_write_irq_en(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 irq_val)
+{
+	writel(irq_val, sdev->base + DMA_IRQ_EN(irq_reg));
+}
+
+static u32 sun6i_read_irq_stat(struct sun6i_dma_dev *sdev, u32 irq_reg)
+{
+	return readl(sdev->base + DMA_IRQ_STAT(irq_reg));
+}
+
+static void sun6i_write_irq_stat(struct sun6i_dma_dev *sdev, u32 irq_reg, u32 status)
+{
+	writel(status, sdev->base + DMA_IRQ_STAT(irq_reg));
+}
+
 static size_t sun6i_get_chan_size(struct sun6i_pchan *pchan)
 {
 	struct sun6i_desc *txd = pchan->desc;
@@ -460,16 +485,16 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 
 	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
-	irq_val = readl(sdev->base + DMA_IRQ_EN(irq_reg));
+	irq_val = sdev->cfg->read_irq_en(sdev, irq_reg);
 	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
 			(irq_offset * DMA_IRQ_CHAN_WIDTH));
 	irq_val |= vchan->irq_type << (irq_offset * DMA_IRQ_CHAN_WIDTH);
-	writel(irq_val, sdev->base + DMA_IRQ_EN(irq_reg));
+	sdev->cfg->write_irq_en(sdev, irq_reg, irq_val);
 
 	writel(pchan->desc->p_lli, pchan->base + DMA_CHAN_LLI_ADDR);
 	writel(DMA_CHAN_ENABLE_START, pchan->base + DMA_CHAN_ENABLE);
 
-	sun6i_dma_dump_com_regs(sdev);
+	sdev->cfg->dump_com_regs(sdev);
 	sun6i_dma_dump_chan_regs(sdev, pchan);
 
 	return 0;
@@ -549,14 +574,14 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	u32 status;
 
 	for (i = 0; i < sdev->num_pchans / DMA_IRQ_CHAN_NR; i++) {
-		status = readl(sdev->base + DMA_IRQ_STAT(i));
+		status = sdev->cfg->read_irq_stat(sdev, i);
 		if (!status)
 			continue;
 
 		dev_dbg(sdev->slave.dev, "DMA irq status %s: 0x%x\n",
 			str_high_low(i), status);
 
-		writel(status, sdev->base + DMA_IRQ_STAT(i));
+		sdev->cfg->write_irq_stat(sdev, i, status);
 
 		for (j = 0; (j < DMA_IRQ_CHAN_NR) && status; j++) {
 			pchan = sdev->pchans + j;
@@ -1101,6 +1126,13 @@ static inline void sun6i_dma_free(struct sun6i_dma_dev *sdev)
 	}
 }
 
+#define SUN6I_DMA_IRQ_A31_COMMON_OPS	\
+	.dump_com_regs    = sun6i_dma_dump_com_regs,	\
+	.read_irq_en      = sun6i_read_irq_en,	\
+	.write_irq_en     = sun6i_write_irq_en,	\
+	.read_irq_stat    = sun6i_read_irq_stat,	\
+	.write_irq_stat   = sun6i_write_irq_stat,
+
 /*
  * For A31:
  *
@@ -1132,6 +1164,7 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 /*
@@ -1155,6 +1188,7 @@ static struct sun6i_dma_config sun8i_a23_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
@@ -1173,6 +1207,7 @@ static struct sun6i_dma_config sun8i_a83t_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 /*
@@ -1200,6 +1235,7 @@ static struct sun6i_dma_config sun8i_h3_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 /*
@@ -1221,6 +1257,7 @@ static struct sun6i_dma_config sun50i_a64_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 /*
@@ -1244,6 +1281,7 @@ static struct sun6i_dma_config sun50i_a100_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
 	.has_high_addr = true,
 	.has_mbus_clk = true,
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 /*
@@ -1266,6 +1304,7 @@ static struct sun6i_dma_config sun50i_h6_dma_cfg = {
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_8_BYTES),
 	.has_mbus_clk = true,
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 /*
@@ -1289,6 +1328,7 @@ static struct sun6i_dma_config sun8i_v3s_dma_cfg = {
 	.dst_addr_widths   = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 			     BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 			     BIT(DMA_SLAVE_BUSWIDTH_4_BYTES),
+	SUN6I_DMA_IRQ_A31_COMMON_OPS
 };
 
 static const struct of_device_id sun6i_dma_match[] = {

-- 
2.54.0


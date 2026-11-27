Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781951;
	b=HSQa+6MNQgaKyLtKDy3PWtT9B+90IdVjijFkZtOeM8/edvEGdbtpuP7qLN5aVHcl+p5T
	 W9CFPO6Cq++/gLOdxURUNTbg4kR/ndRWBGh1N6gWOJM2MYQ9Xf5zMR7EhSmgoT6MGmQwm
	 Yir6J5qGqR48MQe88+wg9ToGHzYGV2JUOAM2GwzSch7ORvfn9pnqdk93HmigTZRJWJHEg
	 Jrc0udIVLUX95uR2IT369s8ec4fv+uGvXF/0WFjLmWTr0NNt4Bwo/fq7TNq0FXmmcyMsb
	 56RzVprYhDXpPgk7YQGx9UMGhZ+Kb+v/gYXJk77Zo2UhpovJUqs4UFbjKu6dWKJ6ODA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jDAcxjc/NLdfruGXejtq5CjFyH7icsEJFXVAPztuGkg=;
	b=MKIfvWnQYnxfNli7SNf4IPkJy/mVBHuLG8Q7UBpAr+cjXc8nJM8kgKk6jO7yzI7hkQVZ
	 3KlC9l7PxBG6V3s5K3qzGyl1p/MOMa+a/dJQViJk13m3mPRoeMafMdtgAXVoqdnvb5jnT
	 wExFtcc/wY6244kXU8KYNjw/b1PMPxUyjQ1c2VJnCExYs6E7oLP55hzAmMfJqvsAcPpWb
	 lZPQqkK6MoSwptnup0Eqt0r1KUM8cP2ucD/D/qumCRyNNdVSAM8pJbvO/rscUbtG6D8QF
	 0cj3BdEqY8/U37mbvWTOnqE2+HfMP1E3wVaXfRS+43knFgjWLrGqIz2sPHFtyV5nh1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QwHAvUEs;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9488A60A6F70
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 12:19:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9488A60A6F70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QwHAvUEs
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so102800015e9.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 04:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795781950; x=1796386750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDAcxjc/NLdfruGXejtq5CjFyH7icsEJFXVAPztuGkg=;
        b=QwHAvUEsw12xL16WMiii9FWI8EXvEz5OrNGIHF4zMZg/uJWDoisFrJmYe0qLa3XKrM
         ydGt14klz3Fd4hImeUtMMG06YftkIrp4ePdhKlYLioEhMmTja8TIzs6IXgBmDloCVT0z
         P31zuxVdupXCKvRPv6p8td2V8GbUZlSWh0eMO9GN03ImF9FBuxNNd5PVrJJYItmi8sDK
         th+oZqBBkE8DYusUHXIjzeyNmv66rnTFSVpkq7y7+nQ9mmYtsngg6wwdGjt1Ppqsbu/F
         OOPmLIV3Jk4FWTI/P27B3iMCTdk6XhD8yA+pK12ioQOZTm70ZiZu61hsnZqIDimvaSSO
         gWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781950; x=1796386750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jDAcxjc/NLdfruGXejtq5CjFyH7icsEJFXVAPztuGkg=;
        b=aqNUpwEjiWKSXDwFdowJ+cXkXo34tUpPkTd/p7u51aOUPLuPfCeiv5yXoDBsIjWi3z
         Geu3dKnWtOXPmw7s/PEjha6ql4QvqKGE3QtAKANG0JvrkPSyOgaZLmovEfbT3fvy1rJ3
         cV0jF2aW7Vljh60K+Re2x0wBlfTYOj5RPvzgBiMrMkdZCI/nz9rggeGBOfJ8sQzQAImV
         r2IEeFPpcjrssKG1SFecaqUubYWo8Zx1dzZN/DK9pNu4+Yh3HzKzdTt0wfsRcrhjABG8
         3oIOsNnaA0vfNe3OMlIwg6cQEdpZnx5hz5e0my3IflkdMYxzfYWHrniaUvQlTVilI1Yh
         Lh2g==
X-Forwarded-Encrypted: i=1; AL+hErFQDdMEQ35UXq5S/r6Bk9iBmPoDJ+h4ztqQNmksfLIY6XEFkUf/6lUy8mluk5QCo9TSxbDrCEmJ66/U@vger.kernel.org
X-Gm-Message-State: APuU4Z9Iab5PuZsCJj6AOuRSaKDIN2Yy1Nj+KMHJAp8EnB0bPmUR9YTZ
	PclB/+fCQZ6EjWDzUyHlcgCI+floiO8UEzhKM9wpXflKfs3WONtR6BYFITEqD286EWg=
X-Gm-Gg: AZFdTZfuR4JCUN/bSFtE7ughTgVXpOyH/T/3jwzCpA1w70oZnrW71LLwYt22tRzbf6L
	k7IOTmIAgKxHD9KFpHxX2LfQ5RM0u9Vq2eqpgt2WR9ruy+6vLB8buZIAQWWUTMe6I3ATqGNlfVc
	z1XAvkxOOgkVy7AXrnq2jKmQE7D0kFctTYFUg5/JBx0ItIXN6geK742AKlz2RrBXB4FwO98YKt/
	nqw3IcTCj305pmdgg2B6kjsHue0dE3iA94ISwuAqfKfRmwi0l9vOxCtI+0HFNA1pTrU1Y0P1Tlp
	+fvGJvxE6DVzfLKM9WMrbQT8QgmDAeXITQLLbfoqx3rbmVST/caFZVteAuR6Z1g3Z3aEas2qlev
	Gm4cbyi4Isytifl4CCzA2MuQYDC5+4mdwbrp57U9BH+madUuSP5uE93CzcGkjTtbFMh/Usu5nS4
	jooVF73PIcBvW91dPjqYzycHCfnUcgvXaFnKVrzAdkO0scEOkTpdp5zYblEBKisCNn6Vv3SB/96
	JLPyl/nUHUAga/42DFScdNuCa3n1gs4uGl9cAzM1kkeZ6OWMMjX4Ul5VfzzDLI5OodIf1oXJDKO
	thQfQ/K67cyACJtyWiHMMRSDdTpo
X-Received: by 2002:a05:600c:5901:b0:4bb:5e8a:7c9c with SMTP id 5b1f17b1804b1-4bb861467c8mr415882465e9.7.1795781949777;
        Fri, 27 Nov 2026 04:19:09 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf680fsm53811123f8f.14.2026.11.27.04.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:19:09 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	dmaengine@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>,
	Dom Cobley <popcornmix@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v4 20/28] dmaengine: bcm2835: Support channel subsets in a controller instance
Date: Fri, 27 Nov 2026 13:22:10 +0100
Message-ID: <20261127122236.4976-21-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261127122236.4976-1-andrea.porta@suse.com>
References: <20261127122236.4976-1-andrea.porta@suse.com>
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

On BCM2711 the last four channels of the DMA block use a different, 40-bit
programming model, and are going to be described by a separate DT node
whose reg property only covers those channels. The driver however
assumes that the register range always starts with channel 0.

Derive the index of the first channel from the physical address of the
register range, which is possible since the DMA block is 4 KiB aligned,
and only consider the channels covered by it. Channel numbers, and thus
the dma-channel-mask and interrupt-names properties, keep referring to
the whole DMA block.

Also describe in the platform data which channels of the block use its
programming model, and ignore the other ones: some device trees, e.g. the
downstream BCM2712 one, describe channels with different programming
models using the same compatible, and driving them with the wrong one
could corrupt memory.

While at it, initialize all the entries of the IRQ array, as the
detection of shared interrupts looks at all of them, and report the
number of channels actually initialized.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 drivers/dma/bcm2835-dma.c | 58 +++++++++++++++++++++++++++++++++------
 1 file changed, 49 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 42ec9be7a8f7..8379b26a80ae 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -45,6 +45,7 @@
  * struct bcm2835_dmadev - BCM2835 DMA controller
  * @ddev: DMA device
  * @base: base address of register map
+ * @chan_start: index of the first channel in the register map
  * @zero_page: bus address of zero page (to detect transactions copying from
  *	zero page and avoid accessing memory if so)
  * @cfg: platform specific description of the DMA channels
@@ -54,6 +55,7 @@
 struct bcm2835_dmadev {
 	struct dma_device ddev;
 	void __iomem *base;
+	unsigned int chan_start;
 	dma_addr_t zero_page;
 	const struct bcm2835_dma_cfg *cfg;
 	bool map_resource;
@@ -132,6 +134,7 @@ struct bcm2835_chan {
  * @abort: stop and reset a channel
  * @legacy_bus_addr: translate a slave address for device trees which do not
  *	describe the peripheral window in dma-ranges
+ * @chan_mask: channels of the DMA block using this programming model
  */
 struct bcm2835_dma_cfg {
 	u32 cs_reg;
@@ -166,6 +169,7 @@ struct bcm2835_dma_cfg {
 	void (*abort)(struct bcm2835_chan *c);
 
 	u64 (*legacy_bus_addr)(struct device *dev, phys_addr_t phys);
+	u32 chan_mask;
 };
 
 struct bcm2835_desc {
@@ -275,7 +279,8 @@ struct bcm2835_desc {
 #define BCM2835_DMA_DATA_TYPE_S128	16
 
 /* Valid only for channels 0 - 14, 15 has its own base address */
-#define BCM2835_DMA_CHAN(n)	((n) << 8) /* Base address */
+#define BCM2835_DMA_CHAN_SIZE	0x100
+#define BCM2835_DMA_CHAN(n)	((n) * BCM2835_DMA_CHAN_SIZE) /* Base address */
 #define BCM2835_DMA_CHANIO(base, n) ((base) + BCM2835_DMA_CHAN(n))
 
 /* the max dma length for different channels */
@@ -1189,7 +1194,7 @@ static int bcm2835_dma_chan_init(struct bcm2835_dmadev *d, int chan_id,
 	c->vc.desc_free = bcm2835_dma_desc_free;
 	vchan_init(&c->vc, &d->ddev);
 
-	c->chan_base = BCM2835_DMA_CHANIO(d->base, chan_id);
+	c->chan_base = BCM2835_DMA_CHANIO(d->base, chan_id - d->chan_start);
 	c->ch = chan_id;
 	c->irq_number = irq;
 	c->irq_flags = irq_flags;
@@ -1237,6 +1242,7 @@ static const struct bcm2835_dma_cfg bcm2835_data = {
 	.abort = bcm2835_dma_abort_chan,
 
 	.legacy_bus_addr = bcm2835_dma_legacy_bus_addr,
+	.chan_mask = GENMASK(BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED, 0),
 };
 
 static const struct of_device_id bcm2835_dma_of_match[] = {
@@ -1335,6 +1341,7 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	int irq_flags;
 	u32 chans_available;
 	char chan_name[BCM2835_DMA_CHAN_NAME_SIZE];
+	int chan_count, chan_start, chan_end;
 
 	if (!pdev->dev.dma_mask)
 		pdev->dev.dma_mask = &pdev->dev.coherent_dma_mask;
@@ -1360,7 +1367,19 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
+	/*
+	 * The channels of a DMA block can be split across multiple instances,
+	 * e.g. because they have a different programming model. The block
+	 * itself is 4 KiB aligned, so the position of the first channel of
+	 * this instance can be derived from the physical register address.
+	 */
+	chan_start = (res->start / BCM2835_DMA_CHAN_SIZE) & 0xf;
+	chan_count = resource_size(res) / BCM2835_DMA_CHAN_SIZE;
+	chan_end = min(chan_start + chan_count,
+		       BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED + 1);
+
 	od->base = base;
+	od->chan_start = chan_start;
 
 	od->map_resource = bcm2835_dma_mmio_in_dma_ranges(&pdev->dev,
 							  res->start);
@@ -1418,13 +1437,30 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 			 "Please update the DT, replacing brcm,dma-channel-mask with dma-channel-mask\n");
 	}
 
+	/*
+	 * Never drive channels with a different programming model, which
+	 * some device trees put in the same node.
+	 */
+	if (chans_available & ~od->cfg->chan_mask) {
+		dev_warn(&pdev->dev, "ignoring unsupported channels %#x\n",
+			 chans_available & ~od->cfg->chan_mask);
+		chans_available &= od->cfg->chan_mask;
+		if (!chans_available) {
+			rc = -ENODEV;
+			goto err_no_dma;
+		}
+	}
+
+	for (i = 0; i <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; i++)
+		irq[i] = -1;
+
 	/* get irqs for each channel that we support */
-	for (i = 0; i <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; i++) {
+	for (i = chan_start; i < chan_end; i++) {
+		int index = i - chan_start;
+
 		/* skip masked out channels */
-		if (!(chans_available & (1 << i))) {
-			irq[i] = -1;
+		if (!(chans_available & (1 << i)))
 			continue;
-		}
 
 		/* get the named irq */
 		snprintf(chan_name, sizeof(chan_name), "dma%i", i);
@@ -1439,11 +1475,13 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 		 * in case of channel >= 11
 		 * use the 11th interrupt and that is shared
 		 */
-		irq[i] = platform_get_irq(pdev, i < 11 ? i : 11);
+		irq[i] = platform_get_irq(pdev, index < 11 ? index : 11);
 	}
 
+	chan_count = 0;
+
 	/* get irqs for each channel */
-	for (i = 0; i <= BCM2835_DMA_MAX_DMA_CHAN_SUPPORTED; i++) {
+	for (i = chan_start; i < chan_end; i++) {
 		/* skip channels without irq */
 		if (irq[i] < 0)
 			continue;
@@ -1460,9 +1498,11 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 		rc = bcm2835_dma_chan_init(od, i, irq[i], irq_flags);
 		if (rc)
 			goto err_no_dma;
+
+		chan_count++;
 	}
 
-	dev_dbg(&pdev->dev, "Initialized %i DMA channels\n", i);
+	dev_dbg(&pdev->dev, "Initialized %i DMA channels\n", chan_count);
 
 	/* Device-tree DMA controller registration */
 	rc = of_dma_controller_register(pdev->dev.of_node,
-- 
2.51.0


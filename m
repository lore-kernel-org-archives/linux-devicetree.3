Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0E234041B
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 01:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780621277; cv=none; b=D8yA7mIy1EBT0ZPrau+819e/UBTFE8Pq+bLFLeoV5ACbQQk5um5sTCNbw1CxpAUG78A/gWtGLFPpsXOwjd5Pipw0+qAVVaeE0ka752v0OIvFloJr7ZJmaEiQM0HoGkxsxYGQ1hmGmFsCY9rzeZAnnxq63VQJ90oRvh/vCbCzJDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780621277; c=relaxed/simple;
	bh=rpLXgYSA9ynFB3Z3mEXcg+Fu+uSw2ie7fIqqWqhCqXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NVMMigfBOtwQLIwCDboja3tWF/phzMKHmJHdVkme0n12skh2IyJf9VYgE7CZ0Hki+HwlE+zDAh3MhtftvMSU8sDyGXpkcfMqCMB6VX/XdaDx+25T4zfG6kIYuLkrt+TQX03Knxtcc/bWegJhNbbOd9iRQbyVCr+6bMX3NiWtaPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=hg8jbsVK; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="hg8jbsVK"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-486852c7b68so546182b6e.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 18:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780621253; x=1781226053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuK6dXKBAsFNVUM3IcE6hxmCyNGfHV5JrrNTNHc8ejQ=;
        b=hg8jbsVKKDt6HQSVftMw9VZQcH5AJ+PHQMwDx3+Ym5jxtWlUXS9RI5WczFruEDwkcM
         N47+zcfrZ+QSlHHvAGFpFVxuZIhOYtYTSalNG+UIbSQTidg0r0lflImIGKFGe+lyOzN7
         +X/OzrrxUxafeDZqzEe986p+iXv8og5kq+/jC0QLY8bTBPCUhqWe5K++KbHk9P1E6g/x
         KirHj0Qf6PmmdakwjmR6fntZXmcSVixFlAW49Fs+huTHN5d8nyYqB6YkTeaNdqYGSYdU
         Dm5N8ssSC/ttPzmN4PWRX1OXVcJ8YHpHmZULd1L67C/1EAPyLjtyjvRKzgVBIVWoKG2p
         YvUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780621253; x=1781226053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cuK6dXKBAsFNVUM3IcE6hxmCyNGfHV5JrrNTNHc8ejQ=;
        b=YzK86XEkDVurvrF46WxDYH3kssM4ceik3l/rkbGWRLI0uI+oTvy9xuMaAagyY7e0/J
         hneYGDh6qabA6pY52o3Y2AZJDAX+R+ZdKhjRq4MWCOeRmCw6pi/DjuYqoBmQW848/Ovt
         7GYfrI/D2HVMrgWeaprES3badC7W3nSz3PcWo1aMnPjFX3QnKk2u4/qaWTRMK+qFLelF
         767rVpGPG11Y80T9k0i2Afefou6wjeNVIurMF4W2Qtp3t7/b/tQjtX7udyF4G98O0sIn
         O5jiyr3Czg8bHcdnQ4pPv13k8+FVI0GdPtE5ehbP7Tbkre/jZG+I49+FxAR55fI54BE2
         RvVw==
X-Forwarded-Encrypted: i=1; AFNElJ/WC/MO/31FQgDgyP51SsU6HVUgXSwzvaRqRs8C0RXb/4AvKitsNZHClMUZ/vfr45Y6PiN5N09x9eD1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+WaM/1MF6sxPFJ6lbnY6dtKbt1ykrnXVnsAFsgpYMsBPggwVa
	Zw0oyjiS9+LimctP8ZxrxljiH67iTrTUo8Sv45u3/VKqUHM6rr0hrtR9MU2No1ZMEqE=
X-Gm-Gg: Acq92OGOs1+gMrA0cOfope04zAuMeQTaaskUE31da0LkTmiw0u25jTszM4MEM1GtKoI
	sr24cXOkpeUVHeTrwXOk1CMaLzaYrHg9tnE7WBrfivy/yfMMJXU8DKKOfVJZKuxhIw6tU/WL9pS
	WNx4MyouhNc7zu3aPrHjUK29ONAC9cVEW05iuLT2PpSYlcVkpnq7KdSIyW28ZWGni6ExgDekiY5
	2Z9rKwsEOVXpddvnhXP3hfw547Y2rt/0zM/AJA3YOss/1aXxqPlxuTD5WffyPirV6k7wdvlj8tE
	Eripb7HHnJLMyD+cNaMP7l+zcVvx88AVN9zEJL3tciH2OK9Jzz7iPYO0skmYfHjHIA3NVoT5URx
	1N5yTbKae/LZAWnbWMsAXtm5cnrAJag6XeGcdZY/3OCM50AVjH7QMkQaVRYOQSodUk9iLRlqeap
	sB2CSVelrgeWybYPwaA0W8nKdqy82zwUbYaUTGkqcXidrXgfmK
X-Received: by 2002:a05:6808:d49:b0:479:e869:5424 with SMTP id 5614622812f47-4868dc7df9bmr777929b6e.19.1780621253368;
        Thu, 04 Jun 2026 18:00:53 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4865b6ec694sm5544631b6e.5.2026.06.04.18.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 18:00:53 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	rmk+kernel@armlinux.org.uk,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linusw@kernel.org,
	brgl@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	elder@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	a0987203069@gmail.com,
	alexandre.torgue@foss.st.com,
	ast@kernel.org,
	boon.khai.ng@altera.com,
	chenchuangyu@xiaomi.com,
	chenhuacai@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	hkallweit1@gmail.com,
	inochiama@gmail.com,
	john.fastabend@gmail.com,
	julianbraha@gmail.com,
	livelycarpet87@gmail.com,
	mcoquelin.stm32@gmail.com,
	me@ziyao.cc,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	richardcochran@gmail.com,
	rohan.g.thomas@altera.com,
	sdf@fomichev.me,
	siyanteng@cqsoftware.com.cn,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 08/14] net: stmmac: dwxgmac2: Add XGMAC 3.01a support
Date: Thu,  4 Jun 2026 20:00:15 -0500
Message-ID: <20260605010022.968612-9-elder@riscstar.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260605010022.968612-1-elder@riscstar.com>
References: <20260605010022.968612-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Thompson <daniel@riscstar.com>

XGMAC 2.x and 3.x are architecturally very similar.  That means that
for everything except one erratum we can simply use the XGMAC 2.x
callback functions in the stmmac_dma_ops structure.

Only the set_rx_ring_len callback is specific to XGMAC 3.01.  It
limits the number of outstanding write requests that can be serviced
per DMA.

The other erratum addressed in this patch is simply a comment to
ensure that a feature that stmmac doesn't currently use is not enabled
without contemplating the errata.

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  3 ++
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    | 53 +++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 9b0b5cc619556..bcf59ad8a1939 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -374,6 +374,8 @@
 #define XGMAC_DMA_CH_RxDESC_TAIL_LPTR(x)	(0x0000312c + (0x80 * (x)))
 #define XGMAC_DMA_CH_TxDESC_RING_LEN(x)		(0x00003130 + (0x80 * (x)))
 #define XGMAC_DMA_CH_RxDESC_RING_LEN(x)		(0x00003134 + (0x80 * (x)))
+#define XGMAC_OWRQ			GENMASK(25, 24)
+#define XGMAC_RDRL			GENMASK(15, 0)
 #define XGMAC_DMA_CH_INT_EN(x)		(0x00003138 + (0x80 * (x)))
 #define XGMAC_NIE			BIT(15)
 #define XGMAC_AIE			BIT(14)
@@ -463,6 +465,7 @@
 extern const struct stmmac_ops dwxgmac210_ops;
 extern const struct stmmac_ops dwxlgmac2_ops;
 extern const struct stmmac_dma_ops dwxgmac210_dma_ops;
+extern const struct stmmac_dma_ops dwxgmac301_dma_ops;
 extern const struct stmmac_desc_ops dwxgmac210_desc_ops;
 
 #endif /* __STMMAC_DWXGMAC2_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index a84601ac32153..584ab28d7f7f5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -38,6 +38,14 @@ static void dwxgmac2_dma_init(void __iomem *ioaddr,
 		value = u32_replace_bits(value, XGMAC_INTM_MODE1,
 					 XGMAC_INTM_MASK);
 
+	/*
+	 * A friendly warning to future adventurers. If Descriptor Posted
+	 * Write support, which is off by default, is ever enabled then be sure
+	 * to make it optional. This is required by errata for at least XGMAC
+	 * 3.01A... and the XGMAC 2.x and 3.x are architecturally similar so we
+	 * use dwxgmac2 support for the 3.x family as well.
+	 */
+
 	writel(value, ioaddr + XGMAC_DMA_MODE);
 }
 
@@ -490,6 +498,20 @@ static void dwxgmac2_set_rx_ring_len(struct stmmac_priv *priv,
 	writel(len, ioaddr + XGMAC_DMA_CH_RxDESC_RING_LEN(chan));
 }
 
+static void dwxgmac301_set_rx_ring_len(struct stmmac_priv *priv,
+				       void __iomem *ioaddr, u32 len, u32 chan)
+{
+	u32 val = FIELD_PREP(XGMAC_RDRL, len);
+
+	/*
+	 * Reduce the number of outstanding write requests to 3 (from default
+	 * of 4). This is an errata workaround for XGMAC 3.01a.
+	 */
+	val |= FIELD_PREP(XGMAC_OWRQ, 3);
+
+	writel(val, ioaddr + XGMAC_DMA_CH_RxDESC_RING_LEN(chan));
+}
+
 static void dwxgmac2_set_tx_ring_len(struct stmmac_priv *priv,
 				     void __iomem *ioaddr, u32 len, u32 chan)
 {
@@ -619,3 +641,34 @@ const struct stmmac_dma_ops dwxgmac210_dma_ops = {
 	.enable_sph = dwxgmac2_enable_sph,
 	.enable_tbs = dwxgmac2_enable_tbs,
 };
+
+/* All but one field are the same as dwxgmac210_dma_ops */
+const struct stmmac_dma_ops dwxgmac301_dma_ops = {
+	.reset = dwxgmac2_dma_reset,
+	.init = dwxgmac2_dma_init,
+	.init_chan = dwxgmac2_dma_init_chan,
+	.init_rx_chan = dwxgmac2_dma_init_rx_chan,
+	.init_tx_chan = dwxgmac2_dma_init_tx_chan,
+	.axi = dwxgmac2_dma_axi,
+	.dump_regs = dwxgmac2_dma_dump_regs,
+	.dma_rx_mode = dwxgmac2_dma_rx_mode,
+	.dma_tx_mode = dwxgmac2_dma_tx_mode,
+	.enable_dma_irq = dwxgmac2_enable_dma_irq,
+	.disable_dma_irq = dwxgmac2_disable_dma_irq,
+	.start_tx = dwxgmac2_dma_start_tx,
+	.stop_tx = dwxgmac2_dma_stop_tx,
+	.start_rx = dwxgmac2_dma_start_rx,
+	.stop_rx = dwxgmac2_dma_stop_rx,
+	.dma_interrupt = dwxgmac2_dma_interrupt,
+	.get_hw_feature = dwxgmac2_get_hw_feature,
+	.rx_watchdog = dwxgmac2_rx_watchdog,
+	.set_rx_ring_len = dwxgmac301_set_rx_ring_len,	/* Only 3.01 */
+	.set_tx_ring_len = dwxgmac2_set_tx_ring_len,
+	.set_rx_tail_ptr = dwxgmac2_set_rx_tail_ptr,
+	.set_tx_tail_ptr = dwxgmac2_set_tx_tail_ptr,
+	.enable_tso = dwxgmac2_enable_tso,
+	.qmode = dwxgmac2_qmode,
+	.set_bfsize = dwxgmac2_set_bfsize,
+	.enable_sph = dwxgmac2_enable_sph,
+	.enable_tbs = dwxgmac2_enable_tbs,
+};
-- 
2.51.0


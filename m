Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B039A344052
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 03:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792378903; cv=none; b=mfteAeT3ymMeYJVDTQ2xv/Tqr6nhYxJvTNsmFsHqGp7HAcswQ1bRoMLQGTbOXvZmegzHx2KyhhosE9UsU8BfWtkkOr1bXfvaxpsXi6gNdGU4QKXylb13ZhwNPhjWSq86kz5cfFkfZaGvdiaro4CzqdPNDK+2ibXdZFCN00/mLIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792378903; c=relaxed/simple;
	bh=KUzDfA55VWCYv71Z2RlGmJ55hfO3CvJRsnX0M0VB284=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=goL8KCtqR76Pdy3WTpmd/O6WSVbA8N3rP7YZgKyKavc93Yoe6ZpAtlw5Zsn31LeXhbJFAbo6lr5bDKsGMDsdq9nxINyoEm6uP7kb1GY1Ae9QFalVHnaDNJ2Vn/r20YDrJzaPOnuFiVT+StIfaKqWMeFmG8BVGVDjyB31ixnFOqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=vYXQOgsU; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="vYXQOgsU"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91ba702cceaso20653386d6.0
        for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 20:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792378901; x=1792983701; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kvw4syNS+titZXjd+BAVQh8BZuoN5qywIcBOPbcEmbk=;
        b=vYXQOgsUFDsETREu1vRdeFWfTTg8rLfPS7m7M8AaJw9Z4WSz9R4I2LLVJhjE2INXsT
         XAHiImTM2zYgTFsZb98gzfK8synF40Fcs+NZ1aOlXlyLQEQu2usUIUJd7wX2VqnMQ1dx
         njo8vmUgzGWu5CL4LcI9jYSkNIGSDEP7tKU0SkPFAmejG5IOE5KATi24OaUv9KnTZWLZ
         bRNt5X+HVU82qkGDUdWsR1rZN37+BIb8B7wkjt8nUozkoULGdyWS7TO4UKgqsZB7i+fU
         LZFY0xLd5uIjL/QkZlCs+qmGpyKIZ35yOFOVTPzaWXrd9p+gb/wTe+FedUxCNHkVPjvg
         ARGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792378901; x=1792983701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kvw4syNS+titZXjd+BAVQh8BZuoN5qywIcBOPbcEmbk=;
        b=vFXXZxsJFD+ZGfVCNxuzI6tZtAzpk5GjbaH7mCJ9KqPXosKKLy7qyY+tQCOnxYWgNS
         VwhzA/33S1Mhxtn2qXqBrv4tIoQoogPPC/e3StyCUn/c1M0H3wxZx6MEyUG/o66CIzan
         34tSx5754Itanf97j/OUSBruogea9g9NkZBg+tF0jFXpteBD1T+8WDTno0U7tvTEAY0K
         savfxmhtwHiOG2vRbBXo4E91aVSvgArtv18fXp4Cy4r4tjybxKGkLpgS1qx5NkTeEGL9
         Dk9CvMZydZ4prdVRNgM5ygrM60LN+1GBQOj3ljB9HyeWCfiZucWxQ5KYGtd6VKhqT+Ra
         M+xQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJgwvbBo8lR8t4F2p9ihDWQ++y2au1aJ2pEa5jXJnYGS3ZFoK0C2t8jeiw6OJeF8CV37hdwFZkzvMl@vger.kernel.org
X-Gm-Message-State: AFq9FYLx19t6IXMoRGBpipO4rVqOE1xpwowPlxqJeb418191Or1z3cQM
	jV5XfytTTvefMlqcibaYs/t0+lFjXAX1i25d5t7u1IHTDwr0vdb7+T1PZ84Uz22OWLs=
X-Gm-Gg: AYBFou0B1fCcRHDlAmIRVM/i0Z/ueX1k9RsOS2+MgIj+Ijd+ZmOAi8TVua0ROnSt05w
	3P46zi9FA3dmrq4KIJr1hNXJh98De+o9AceImShBo89W4eWN9ABVfbzP6l/nUI0T6GklNqfqU4z
	1TPH6q1w1nsDHIH/z8QQnNkZxQX6GBmLJGyxexoxo6rZuQ8G4f/xJ1c/TtZbzlVAVbQe/1NvaEO
	8PLz5lGwzMqvCp44Ewm29iIk8qKnOQ2gWum31G+M8A9sYDcRzfIX9H3ej7xdD3pSm+VP14dvV9C
	SrL8SjG2GlEs9N0+WgllX3QbSyaiOzSmQpggN69Lf8rFs7h4MCqskM/1rrdEu2BOYhTatpnFSeo
	k+75kPt9pPl37jPyXiAIneOyoN7/Wsa25l3H/OUJFjnUznsMiQw4muWbyQiGeFcWx7coaFDgH5E
	B4D52ZaX43QYs6EDoTRJiHZfyNUwiFfy6ft7wXk7CmJrVul3+nkdBGDSpwZtfQivvZ0mC8vjDKA
	Ule
X-Received: by 2002:a05:620a:394c:b0:93e:c12c:4416 with SMTP id af79cd13be357-93f29df8910mr1058004285a.82.1792378900653;
        Sun, 18 Oct 2026 20:01:40 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f3c61c440sm216840185a.10.2026.10.18.20.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 20:01:40 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: Daniel Thompson <daniel@riscstar.com>,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	peppe.cavallaro@st.com,
	joabreu@synopsys.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 4/5] net: stmmac: dwxgmac2: export symbols for XGMAC 3.01a DMA
Date: Sun, 18 Oct 2026 22:01:27 -0500
Message-ID: <20261019030129.1470307-5-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019030129.1470307-1-elder@riscstar.com>
References: <20261019030129.1470307-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daniel Thompson <daniel@riscstar.com>

Toshiba TC9564 is an Ethernet-AVB/TSN bridge and is essentially a
small and highly-specialised SoC. Ethernet on this chip is provided
by a DesignWare XGMAC.

One consequence of the SoC-like design is that the internal AXI bus
(used by the XGMAC for DMA) maps the PCI DMA space with a non-zero base
address. This requires a translation step (happily just simple addition)
to convert the PCI DMA address to the hardware DMA address.

This is pretty funky so rather than push that translation logic into
the core driver we intend to keep that logic inside the TC9564
platform code. In order to do that we need to export a few symbols
to allow us to override some of the DMA and descriptor op tables.

FWIW this approach to overriding the ops tables is similar to the
mechanism currently found in dwmac-loongson.c (with the exception
that we have also exported a couple of functions so we don't
have to replicate their content in the TC9564 platform code).

Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Co-developed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h |  7 +++++++
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c    |  1 +
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c   |  1 +
 .../net/ethernet/stmicro/stmmac/dwxgmac2_dma.c | 18 ++++++++++--------
 4 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
index 0fe86e9942334..1b32d14c37440 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
@@ -470,4 +470,11 @@ extern const struct stmmac_dma_ops dwxgmac210_dma_ops;
 extern const struct stmmac_dma_ops dwxgmac301_dma_ops;
 extern const struct stmmac_desc_ops dwxgmac210_desc_ops;
 
+void dwxgmac2_dma_init_rx_chan(struct stmmac_priv *priv, void __iomem *ioaddr,
+			       struct stmmac_dma_cfg *dma_cfg, dma_addr_t phy,
+			       u32 chan);
+void dwxgmac2_dma_init_tx_chan(struct stmmac_priv *priv, void __iomem *ioaddr,
+			       struct stmmac_dma_cfg *dma_cfg, dma_addr_t phy,
+			       u32 chan);
+
 #endif /* __STMMAC_DWXGMAC2_H__ */
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index 1a88cbaed70ca..0effdd6969d65 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1542,6 +1542,7 @@ int dwxgmac2_setup(struct stmmac_priv *priv)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(dwxgmac2_setup);
 
 int dwxlgmac2_setup(struct stmmac_priv *priv)
 {
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
index 6719ac6e395bc..f0e7b8ee48ac7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_descs.c
@@ -374,3 +374,4 @@ const struct stmmac_desc_ops dwxgmac210_desc_ops = {
 	.set_vlan = dwxgmac2_set_vlan,
 	.set_tbs = dwxgmac2_set_tbs,
 };
+EXPORT_SYMBOL_GPL(dwxgmac210_desc_ops);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
index f9a77d641eb65..2f9334d7cb922 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_dma.c
@@ -63,10 +63,10 @@ static void dwxgmac2_dma_init_chan(struct stmmac_priv *priv,
 	writel(XGMAC_DMA_INT_DEFAULT_EN, ioaddr + XGMAC_DMA_CH_INT_EN(chan));
 }
 
-static void dwxgmac2_dma_init_rx_chan(struct stmmac_priv *priv,
-				      void __iomem *ioaddr,
-				      struct stmmac_dma_cfg *dma_cfg,
-				      dma_addr_t phy, u32 chan)
+void dwxgmac2_dma_init_rx_chan(struct stmmac_priv *priv,
+			       void __iomem *ioaddr,
+			       struct stmmac_dma_cfg *dma_cfg,
+			       dma_addr_t phy, u32 chan)
 {
 	u32 rxpbl = dma_cfg->rxpbl ?: dma_cfg->pbl;
 	u32 value;
@@ -78,11 +78,11 @@ static void dwxgmac2_dma_init_rx_chan(struct stmmac_priv *priv,
 	writel(upper_32_bits(phy), ioaddr + XGMAC_DMA_CH_RxDESC_HADDR(chan));
 	writel(lower_32_bits(phy), ioaddr + XGMAC_DMA_CH_RxDESC_LADDR(chan));
 }
+EXPORT_SYMBOL_GPL(dwxgmac2_dma_init_rx_chan);
 
-static void dwxgmac2_dma_init_tx_chan(struct stmmac_priv *priv,
-				      void __iomem *ioaddr,
-				      struct stmmac_dma_cfg *dma_cfg,
-				      dma_addr_t phy, u32 chan)
+void dwxgmac2_dma_init_tx_chan(struct stmmac_priv *priv, void __iomem *ioaddr,
+			       struct stmmac_dma_cfg *dma_cfg, dma_addr_t phy,
+			       u32 chan)
 {
 	u32 txpbl = dma_cfg->txpbl ?: dma_cfg->pbl;
 	u32 value;
@@ -94,6 +94,7 @@ static void dwxgmac2_dma_init_tx_chan(struct stmmac_priv *priv,
 	writel(upper_32_bits(phy), ioaddr + XGMAC_DMA_CH_TxDESC_HADDR(chan));
 	writel(lower_32_bits(phy), ioaddr + XGMAC_DMA_CH_TxDESC_LADDR(chan));
 }
+EXPORT_SYMBOL_GPL(dwxgmac2_dma_init_tx_chan);
 
 static void dwxgmac2_dma_axi(void __iomem *ioaddr, struct stmmac_axi *axi)
 {
@@ -673,3 +674,4 @@ const struct stmmac_dma_ops dwxgmac301_dma_ops = {
 	.enable_sph = dwxgmac2_enable_sph,
 	.enable_tbs = dwxgmac2_enable_tbs,
 };
+EXPORT_SYMBOL_GPL(dwxgmac301_dma_ops);
-- 
2.53.0


Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C50489862
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 19:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933549; cv=none; b=KRlGQ5BWclaz/Zde9QPh/xHfnhCK3pd+JmThZ5R9eIarHgSvtRcAcl2Gt/b9YYq3QmxXpPxV9uoUG5NOfUVc3k4QYO/zdxBNZjARP5uULQI0G8hq5jp4OQs5uF/mbYCmZyf10LpUIhod6fC/g4krFMtNyl/TFOxZUgh7S5zjPJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933549; c=relaxed/simple;
	bh=oaAEJTR2oPaosC4rO8wk6R7DRnuHixWUfvmmuYgJ1eA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t6/2bXTRT0Q5s15sFMozDONoGJnD1ADF4CDfvIiblAYuAJ0jS99J0+yiMydOOBnIfQwDEgfoiP2Oaf5XTtDiDugiMBFtTBNS2vaGOwDLszv32AnVp8B8cBHr6Jl8SI3ej0gFpwdsn1AK2CVW5KEKGiqgCp3XzdhfNltMfjvIcqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ToNWCfYE; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToNWCfYE"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c2c08ff3f8so1679312b6e.1
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 12:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789933546; x=1790538346; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDQtWEdo07Gt04m/i2o6WCXb5iRKSj/hWaaSYGuPoFk=;
        b=ToNWCfYEJqD4Kf0819oEweAReMris2GXt3UmMsTPb0C57kG3hhz5YnIdF4c37+Sx40
         k+KhLR7vILOLa4H7mmkkqXSJi3IVm6r6lxs4OkhzHpP2X//DxprU5Nf+V/H7k1j64lV+
         1PxL/2P8F3i7KLVBOtyBjTPd5neRsrPa8lLNHU0GSWLfAwjTTvw+GgGqEOtE7Tnufn3p
         iQpGjyaYM+4MFZre64NLpgV/pb7vH7m8Z7TDoNAbeNE2x6H+MHtaI28S4IIg3MVMFvRO
         aak64uoNXQVZwh2AvMnM/HGfxGctmEimecbo4gY41LkoNtFqJOLgyU39WN1faBKXW2u/
         dSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933546; x=1790538346;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDQtWEdo07Gt04m/i2o6WCXb5iRKSj/hWaaSYGuPoFk=;
        b=eyPrcqT2OGS7muDbrQ1anZhXqyuJRd8D8hpUN4rcKUJrNJYVVxWEFsJG54rYrmKIx5
         MifTML6517HZXLPALR5uD8lv8qpPtIuvOncLGOc4E6hv55PPtHPxrL9y6MLVTCYi8TDy
         a5BnYAnge3A2ySMGlooLwXZ3+9nLmTeNhe4E4w6n4KuiGbLMmWlMQF/ens9neszY41yq
         /oRZFVuLOzgsPAF5/T/iFCkVD7s9f3gWBFN4GNWWwolMkUm21WwkqYJtjoVHqY+BS4Si
         n2z6875/hIE6F4pLYrA9I4SvPkE9YWgRaMToREhdaR7suC7Ib9RzrpZ2a+uM14JKbYAZ
         /PHw==
X-Forwarded-Encrypted: i=1; AKwUvBwpc9fDhZv3E0isAsDIUW932RBvyGU7DF50PiDGItgCqaG7VujXV0VBhrD9USZwS3URgRviP5cblGxi@vger.kernel.org
X-Gm-Message-State: AFuF++nxGtl3JlisOwkGmADZQQDO0cN73V0kyf8JVcsKpEarUyBeI0Rt
	OdVCBY00euDQrYHIPwq2m5ShcfYFRXQpgMlugn/LBO2D178yu7d4u4KA
X-Gm-Gg: AYBFou1tKIK3fAa1U0/PBsLhlVZZ63xAGUvIfEMDvQPihGXfefVgCNLzCXGybz0Z8N1
	VF02LpGdosO6HIcQACGDuxIh0trffpAIR57MNnaIpP8vMMKWgTAD++ADqmPstlX775w0MbQ1rzO
	zbE0CdoGetDw88w8GQIdFtBLIwI8JLi7fm+0wPHqvQYpM1+e+qrD4eaWyqIvqZ7sOHyOqH4CSj1
	aHQ0jVBxlBVDGUuTsvtTyd1ERzlpx/34Ayi56tAP2hjgzLLYg5VEZWOCXB5JYRrGXLp1DAPwde9
	Z74qkROXLgc3/IDSW9vTWam/FZDHoq6finwM9Z0W82LBVFhX1Riy7xaU6PKUv4vFxZjNoD0c4t5
	fYJ4rljHmCd6i6gd9Y9N7ikV7cwXDqvMAd45KIxAMusjf5BKXmduOp/3c3CC+tkfGfZYBhdayDZ
	YXRVZpZeecNxpFf5Ku/dcAbuC1mcGI0P9phtODQ/hqf4owVvq73mdwIe2HRSOIK49gyR6DXm81u
	Ro8inWajVtr0pkrUfGUoVLj0+3YPp7o8P2DuyjOt60gyUWwepUmhr+mthTuESjA6gpynj2nbfqc
	uXoi8y5dPfnRGjqkkjrITntnNLd6sJkOv3Fs4vQPxh2I0+vLF5vKtEZILe6hYN5r1p2lqYiU6ij
	mWj207HrZ3+y3j/3Vs6Bn
X-Received: by 2002:a05:6820:160d:b0:6b1:535a:eb8 with SMTP id 006d021491bc7-6ca9a132f99mr8497407eaf.2.1789933546360;
        Sun, 20 Sep 2026 12:45:46 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4881f4d7861sm6103834fac.1.2026.09.20.12.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:45:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 20 Sep 2026 13:45:30 -0600
Subject: [PATCH net-next v4 4/6] net: stmmac: sun8i: reset the MAC after
 PHY initialization
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-submit-h616-emac1-v1-v4-4-8347dfe2eb7d@gmail.com>
References: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
In-Reply-To: <20260920-submit-h616-emac1-v1-v4-0-8347dfe2eb7d@gmail.com>
To: Richard Genoud <richard.genoud@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Alastair D'Silva <alastair@d-silva.org>, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The MAC software reset needs a running receive clock from the PHY.
Resetting the MAC at the end of probe therefore fails when the PHY driver
has not been loaded or its probe has deferred on a missing supplier. The
failure removes the MAC and its MDIO bus, so loading the missing driver
later cannot recover the interface without reprobing the MAC.

Perform the software reset in the DMA reset callback instead. The stmmac
core calls it during hardware setup after attaching and initializing the
PHY, and resumes a suspended PHY before reopening or resuming the MAC.
Mask interrupts before requesting the reset and retain the existing
DMA and interrupt-register clearing even if the reset times out. Return
reset errors through the normal hardware-setup error path.

Remove the unconditional reset from probe. Keep the separate H3 MDIO-mux
reset after switching the mux and powering the selected PHY, since it is
needed to latch the selected interface before MDIO accesses.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 53 +++++++++++------------
 1 file changed, 26 insertions(+), 27 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 48c52eb96233..9598c386bb21 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -269,11 +269,33 @@ static const struct emac_variant emac_variant_h6 = {
 #define SYSCON_ETCS_EXT_GMII	0x1
 #define SYSCON_ETCS_INT_GMII	0x2
 
+static int sun8i_dwmac_reset(void __iomem *ioaddr)
+{
+	u32 v;
+
+	v = readl(ioaddr + EMAC_BASIC_CTL1);
+	writel(v | 0x01, ioaddr + EMAC_BASIC_CTL1);
+
+	/* The timeout was previously set to 10ms, but some board (OrangePI0)
+	 * need more if no cable plugged. 100ms seems OK
+	 */
+	return readl_poll_timeout(ioaddr + EMAC_BASIC_CTL1, v,
+				  !(v & 0x01), 100, 100000);
+}
+
 /* sun8i_dwmac_dma_reset() - reset the EMAC
  * Called from stmmac via stmmac_dma_ops->reset
  */
 static int sun8i_dwmac_dma_reset(void __iomem *ioaddr)
 {
+	int ret;
+
+	writel(0, ioaddr + EMAC_INT_EN);
+
+	/* The PHY receive clock must be running for the reset to complete. */
+	ret = sun8i_dwmac_reset(ioaddr);
+
+	/* Leave DMA and interrupts disabled even if the reset timed out. */
 	writel(0, ioaddr + EMAC_RX_CTL1);
 	writel(0, ioaddr + EMAC_TX_CTL1);
 	writel(0, ioaddr + EMAC_RX_FRM_FLT);
@@ -281,7 +303,7 @@ static int sun8i_dwmac_dma_reset(void __iomem *ioaddr)
 	writel(0, ioaddr + EMAC_TX_DESC_LIST);
 	writel(0, ioaddr + EMAC_INT_EN);
 	writel(0x1FFFFFF, ioaddr + EMAC_INT_STA);
-	return 0;
+	return ret;
 }
 
 /* sun8i_dwmac_dma_init() - initialize the EMAC
@@ -738,27 +760,6 @@ static void sun8i_dwmac_flow_ctrl(struct mac_device_info *hw,
 	writel(v, ioaddr + EMAC_TX_FLOW_CTL);
 }
 
-static int sun8i_dwmac_reset(struct stmmac_priv *priv)
-{
-	u32 v;
-	int err;
-
-	v = readl(priv->ioaddr + EMAC_BASIC_CTL1);
-	writel(v | 0x01, priv->ioaddr + EMAC_BASIC_CTL1);
-
-	/* The timeout was previously set to 10ms, but some board (OrangePI0)
-	 * need more if no cable plugged. 100ms seems OK
-	 */
-	err = readl_poll_timeout(priv->ioaddr + EMAC_BASIC_CTL1, v,
-				 !(v & 0x01), 100, 100000);
-
-	if (err) {
-		dev_err(priv->device, "EMAC reset timeout\n");
-		return err;
-	}
-	return 0;
-}
-
 /* Search in mdio-mux node for internal PHY node and get its clk/reset */
 static int get_ephy_nodes(struct stmmac_priv *priv)
 {
@@ -895,7 +896,9 @@ static int mdio_mux_syscon_switch_fn(int current_child, int desired_child,
 		/* After changing syscon value, the MAC need reset or it will
 		 * use the last value (and so the last PHY set).
 		 */
-		ret = sun8i_dwmac_reset(priv);
+		ret = sun8i_dwmac_reset(priv->ioaddr);
+		if (ret)
+			dev_err(priv->device, "EMAC reset timeout\n");
 	}
 	return ret;
 }
@@ -1217,10 +1220,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "Failed to register mux\n");
 			goto dwmac_mux;
 		}
-	} else {
-		ret = sun8i_dwmac_reset(priv);
-		if (ret)
-			goto dwmac_remove;
 	}
 
 	pm_runtime_put(&pdev->dev);

-- 
2.53.0


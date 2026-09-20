Received: from mail-oa2-f17.google.com (mail-oa2-f17.google.com [74.125.231.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3554847A88E
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 19:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933546; cv=none; b=NHqCIC3hrCr6Dq7MY4brNHiYxVWlayDaWoWxDOFZzOKOm2GzfhXoaV26VB1hzZeTRcBPbiwEObl/ojSfcV+L4UTJZRBIaoRyGQfj07FK+Ifrh59rY6XpMV4+tmib7nYrd6UyePmLClKNrwy+B2xDD9ltgVuAqXsaNC7Xmsf0pTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933546; c=relaxed/simple;
	bh=k5FoGW0DAM2X+E/ozmN4JjC/wwwbNR5mhWy/pmNOyns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X7Qqt3VbuT8mFVhMeeASekrR4ryw7LH5SzWc66Fe1uD7tlcCusn4u0dwRjEQ0UYvw+8JeSJ9Eururv5fIPJPk5CHi3auqfElUeCD0x6gSRTbL9dOcHWte7jwKsILMsuKCEEO0xycoUPqU1xru1eVS0Ke1Ohk7iFI22PX6irwFCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KChtIWAD; arc=none smtp.client-ip=74.125.231.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KChtIWAD"
Received: by mail-oa2-f17.google.com with SMTP id 586e51a60fabf-466cc88a0d7so1629527fac.2
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 12:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789933542; x=1790538342; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z7+d1aoXBtF7Wx/9KwAupq2tjY1ApF1IdNz1vfPutVo=;
        b=KChtIWADyQPy1o8x3Vf6QSEP9nxAhcpg4xaQ7MrHkeo1s8eq2DqjsoIqHdpqhVqkeG
         EIlXoeKUxJ9V9NbBOqOv4lYJe22qe6HVSlmzLr/+c9bAMFDDwYSL8vaALmTxiQyooQ2b
         XRXL7mulZZUPuXgwJAjsmAXQguVwvquRlZLTO+0mDJ7XfTLKGe9061QEyhHGGoc8shw2
         EsvKkq/4AeXYgaW8ljOzuhmdM/KaZMER7iI3YL52kAH5GhJprD1v2aSrt18JGRUC25pU
         8ye4/SOw5kqy7volQjHvm5lWXTHjF04zDWthI3COTHk/OqlGmj2AxdU4YIMqSDh0hF3w
         vjwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933542; x=1790538342;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z7+d1aoXBtF7Wx/9KwAupq2tjY1ApF1IdNz1vfPutVo=;
        b=H8UHT9/ZgiN+iOk7FQ7qepzT5lD4QUHBvSxn/ofhxUIff272RnkgfGHIefe5p3V6+C
         Jo96wmFzgxEhgxOC6mabZR06E3M8AinMG0wit1ztobRL0PFIoU5eJJpy3TbngoqFAPlJ
         LoC6Yefcw604Zm2/50BHMVCgB2kLTtQsivPcvxDi1W2zLwo5i8HwQdjBNoE8F9BSkk4m
         Kw3jTm2f4NAHuoxBr6deAQLBt2BLyFHTybbMOKQOhmWtr2nVbThOC7N8KPaARQJkKFUa
         PzuYP/oRsNYjgJGEqAy9daANvBRLD4t4UBpmgfbV3sZkz1GFJp4w+XrliDc739GjdbPB
         ezcg==
X-Forwarded-Encrypted: i=1; AKwUvBzvocxNHC0UFQQR4PydexWLgby32kwjZAq5QtiAbqUv04IhkWbfim0UrYvceqWd5rWQLpUOluydra/a@vger.kernel.org
X-Gm-Message-State: AFuF++k7FLGTZlSQBjl0Z4a1GJaadxE2VcUXZZEUcKlGilVAhPuBwm9K
	Aww7B5DIo4nl93S2f6tFygfujLm4PJ6EzZ5McB1sgIQ2+TeaHWwhWnAS
X-Gm-Gg: AYBFou1dSOie4YlrPVIg+3osuZ4EBlLETTrWcT7vlqHxKWQr3/WTESnsH4OSFssTR82
	PJ7iXFw8sqdJmSb43bNcN4EcYK4KjETGWbiUS+/aX/7ZQ05hV3FnOrdliTaVYgHSLWHqLCQtM0Z
	k3swLp1SmiN9SpwM4w4JUVi5nCBv4fp+8qH5HoyWyK3ZjHjjOhNu7qDh6WB6O1ZgHuUMeNENNaM
	ybOeaNI7S3Y2JyozAQfi6XrovBwSzKG/yMHUuGrjh51xFWphCt8klw51puTygluFo387Asgs721
	sj6pkWFptXB/FsQlH5NsWUgFFYHG6OcLePAQPaC/cGMQyK7sJVQE6YvYb659gCm6ebtJWD6S/uV
	DYgOoXcf2sII6XXPhVJJQ/pY502AK8TxCu3CG+C1AhVLqiO70yYb65UyQoiRanIrp1BDdoWKRpr
	9DAH+scPCCPU9jdJBxFPojaiytk7bX3JNZ7ZdC6k2W4H5uV/ZiUQlvj9kP9jvY9hrQbdDYzNx/l
	7L/F043ghKrcZidrCC74PDDrYJgnEN94lqSQoHTKweH2UWE6ieDLc56f4505DKRcFCKzauvWqar
	Pu5qjXfy/kMhEPciX8zjSkmH8zVr5TY6IqKJAkls6lsboGS105pB2hAfSchYnhjOsfy/+5004Nn
	bPdofdWJ3n/N1pWPS3Em3
X-Received: by 2002:a05:6820:1c8f:b0:6cd:3ffc:acf6 with SMTP id 006d021491bc7-6cd3ffcb603mr4885791eaf.70.1789933542612;
        Sun, 20 Sep 2026 12:45:42 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4881f4d7861sm6103834fac.1.2026.09.20.12.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:45:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 20 Sep 2026 13:45:28 -0600
Subject: [PATCH net-next v4 2/6] net: stmmac: close the interface after a
 failed MTU reopen
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-submit-h616-emac1-v1-v4-2-8347dfe2eb7d@gmail.com>
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

An MTU change stops the data path and then reopens it using a newly
allocated DMA configuration. If reopening fails, the new allocation is
freed while the netdev remains up and priv->dma_conf retains copies of
the freed pointers. A subsequent close repeats NAPI disable and IRQ and
DMA-resource teardown. It can hang in napi_disable() or access resources
which have already been freed.

Track successful opens of the data path separately from the netdev's
administrative state. Clear that state when releasing the data path and
skip a second release after a failed reopen. Close the netdev through the
network core on the MTU error path, so the PHY attachment and runtime-PM
reference are released and the interface is marked down. A subsequent
open can then allocate fresh resources and retry normally.

Keep successful MTU changes on the existing path, retaining the PHY
attachment and runtime-PM reference. Allocation failures before stopping
the original data path still leave the running interface unchanged.

Fixes: 3470079687448 ("net: ethernet: stmicro: stmmac: permit MTU change with interface up")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 4fc96b317d79..363872ff00d6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -281,6 +281,8 @@ struct stmmac_priv {
 	struct mutex lock;
 
 	struct stmmac_dma_conf dma_conf;
+	/* Paired __stmmac_open()/__stmmac_release(), serialized by RTNL. */
+	bool opened;
 
 	/* Generic channel for NAPI */
 	struct stmmac_channel channel[STMMAC_CH_MAX];
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index bf9e7e4cb1c3..89b773370894 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4212,6 +4212,7 @@ static int __stmmac_open(struct net_device *dev,
 	stmmac_enable_all_queues(priv);
 	netif_tx_start_all_queues(priv->dev);
 	stmmac_enable_all_dma_irq(priv);
+	priv->opened = true;
 
 	return 0;
 
@@ -4287,6 +4288,11 @@ static void __stmmac_release(struct net_device *dev)
 	struct stmmac_priv *priv = netdev_priv(dev);
 	u8 chan;
 
+	/* A failed MTU reopen has already released the data path. */
+	if (!priv->opened)
+		return;
+	priv->opened = false;
+
 	/* Stop and disconnect the PHY */
 	phylink_stop(priv->phylink);
 
@@ -6212,6 +6218,10 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 		if (ret) {
 			free_dma_desc_resources(priv, dma_conf);
 			kfree(dma_conf);
+			/* Finish closing the PHY and PM state, but do not repeat
+			 * the data-path teardown after the failed reopen.
+			 */
+			netif_close(dev);
 			netdev_err(priv->dev, "failed reopening the interface after MTU change\n");
 			return ret;
 		}

-- 
2.53.0


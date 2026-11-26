Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654562;
	b=5p6ncl4FtkxP6Ect89hl9mPY4oyD2DK9sS780QvUzlHbnp81b2dz/Tkwmoeg3lnL5UYJ
	 1W21r7uPxoFZW0AijoJdcPHcZ0+xtTAHJHS7whHxUJ42UVUp08K3zZ4gFuH7AVC2l7tm0
	 69Zr5SPUhQSjULdCOXTvPWkLOXAKKIhTKp0GsdIPWl73STUrV8ttUm1KthPkrz5oDnIa+
	 EqFUGYyHOaIDeBhet8BAWo8uIu1kz860rr8Vt3JOxvbKaAvG4WGKXv6kT+31+zL656hgZ
	 kEJmzTBX34J2UpMFLAZvkJxWKyZb3TngroAp8+Gv8YY52strN0E0Do6MFX5CTHyg+Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t9uV/UiNsvqmbpW3BJYPZA8Jxpgub2khhaxa5D2aBAo=;
	b=vUcKq0hUuhfbIPKhqhohIMm9UbEjzkjN/zp9w36bixhRjH35ZmgqytlXxdm4ckH3p/iQ
	 71gKxuKE7hT05VoCLSzRPPD2vcSxamG/Iv67Y+isz2nNnPGGmjHsmnxX/RIv1Kg8CJAFv
	 Gaoul6iuQZLgoUWiLxAAHZ2wmSjcF/7LGzRvYOXCP+3lM6K5v851rVSlSYW4fzhxKmAV1
	 AW4s748+tRnWRQZ1vKfzsxI2JBQN+gfh9+PrXTUBtt/Sxg8CFDwIV83Z0xHmO9gKXEawP
	 UrH5A7+CMyrlrTVMOHcM6YDIrupkdNTa5dTzMKQTHhGPswtm7GoSsKGNkFLEzO0xQ8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Izx3fCQL;
	arc=none smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B33B606A321
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B33B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Izx3fCQL
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8cf79c02fb8so833868b3a.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 16:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795654562; x=1796259362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t9uV/UiNsvqmbpW3BJYPZA8Jxpgub2khhaxa5D2aBAo=;
        b=Izx3fCQLyXhXWsIA15fzrTJl0ajhXvLYMoOAASIiQMtT5ml5g2VLow/ZbQ4Ills2sW
         HjJwyi29DNCXjj8Z4C/Sxsy62Fs7YP0wL8L3GAGFr8klQfLJ+wj1KQdkrukmNGpnz8M5
         qMaCRi/FVrrcaXZE0PthACw9YmW+hTWMZku0sE+MdvdwRjMsa4EMhI2nXNIzeySyMxjd
         ysg7UCCFsZAtF3oO6UxymE7NMRTeNj+GI2f3w8r6052lP1n9I+piqGLuC575+lCMAQUG
         BfD1hMgAuZ0uFmteAm4ncj1fzh9TfGLSAD+6nToZ0Y5zlLyFY0FHAKCuA2WulBaq8s6C
         srCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654562; x=1796259362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t9uV/UiNsvqmbpW3BJYPZA8Jxpgub2khhaxa5D2aBAo=;
        b=vx2KEdKeG0EqDDjWkteAAi83x4j72hVtXjBYJnQ7ymqorAbEZ7jO2KdizjO/H4O+S2
         O1fOJ3gU4KsBIeYYDYtvPzjuehpLE1cX8xERbc137iCh0Fm7bm/bRi5gV66THU07gHxw
         0fCXvR3j/IzFrENPBgetHnm87lCUYVIcfCyYBB3cBCWzUoRxOurq4JVpdm6d5TSHR71P
         AxWHT3mjzMxICC2l/2qirs6ALFLZ6hNIdUN54r5KMJYrYp/FQm8Nqau5yWQSXJ022n0Q
         Kv182tr/arE6kJQ/22gGGCowUr387cgiEcNYKXgyKlLMnqOJ/Xm5Tf5D8CPeamqPx616
         kuXQ==
X-Forwarded-Encrypted: i=1; AL+hErG+5k+HIk8KVpCPGUoHxOnVKgvx6ostRKK863xqDr34FoRGZvktePN6U+8NTmRQwNoGZ2u9XAHP7/I+@vger.kernel.org
X-Gm-Message-State: APuU4Z+lssyL+2sIKxqK3map7jjHcVyB/LTd40q6LTZCfuz7bOfuVB97
	Ng4v2xQOD1mjwj9sz0rhORffkqjoG4nfvI/xX52X8AwAd73yAnkAmGbJ
X-Gm-Gg: AZFdTZfPF0ayzMBgrSpPAhx6kH9+j/icKxAtPCOP5HGFt41b+jhPZ9d9UwZdAxbNvqe
	zvEsfkLIGAK4A71bY/AUe23Lgrr8Q2zlLXF59ATyPJWaaVjZoBzRJy8mwd0MHHAcMCntRkYTjN6
	NrDXcD8KM3cWT3Oh6odLTrksTv1efTlzKj5o14DTitrtPh+NfoOLQXzq7FIZHzjA7WtVdVTuHjW
	KSYpa+hP4WRlpWcJZZQg44/UFV9wfZKm9LK2WS5PSsKNC+LMBN1jWnUZOerF5ShYVpzkUuVyiwP
	g1ggJFzOWy7q8BrcKWOMJBdfgfAZD4U9KTav0IDJ0PRXdnsxeMU1Z7mm11H1qsFc4SCSKaVtUbM
	6SW9bnVdWcbsbXXVQ7qvELW4lsd8MHJdKJzfKZCQgeiO0jaC6Fa5S23eiakJKSUP22qP16mH6tz
	l6b4u8Z2iIwRw3g0ZME+NMieJZ9Kp2rZONZFd+XNeuuqzTnojHdt06sRi/zSxUVEiu8/pXIN/1M
	04Fl9WGWnzod1oZenK4ZM01BN1J0X8suMHJKVF0nGGoBApi/zvFFAFhW/55zeAlDvGbtQ9+z/N3
	jm0Cy/iICteBn8JKZ2EN92ULG2wVTDO2AKt4H+p8fWMN8lvek0P7IEQ=
X-Received: by 2002:a05:6300:8188:b0:3e1:d99a:8e82 with SMTP id adf61e73a8af0-40148fc2d80mr20598496637.3.1795654561732;
        Wed, 25 Nov 2026 16:56:01 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe9bb9sm9472217a12.12.2026.11.25.16.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:56:01 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	devicetree@vger.kernel.org
Subject: [PATCH net-next v4 5/5] net: hix5hd2_gmac: Support fixed-link
Date: Thu, 26 Nov 2026 08:55:17 +0800
Message-ID: <20261126005524.4156940-6-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261126005524.4156940-1-mmyangfl@gmail.com>
References: <20261126005524.4156940-1-mmyangfl@gmail.com>
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

On Hi3716cv200 hix5hd2_gmac is found directly linked to another MAC
without PHY. The driver didn't take fixed-link into account and failed
probe when the node has no phy-handle. Register a fixed PHY from the
node in that case.

With a fixed link declared on the MAC node, of_mdiobus_register() treats
the reg-less fixed-link child as a PHY candidate and walks all 32 bus
addresses, printing "scan phy fixed-link at address X" for each address.
Skip the MDIO bus registration for a fixed link, unless devices are
described under an "mdio" child node, like
commit d0c3601f2c4e ("net: macb: Avoid 20s boot delay by skipping MDIO
bus registration for fixed-link PHY").

of_phy_is_fixed_link() also returns true for managed = "in-band-status";
give phy-handle precedence over it, like fec and gianfar.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 70 ++++++++++++-------
 1 file changed, 46 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index b3b2aa1b7698..eeb7221c0cde 100644
--- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
+++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
@@ -1176,37 +1176,55 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 		hix5hd2_phy_reset(priv);
 	}
 
-	bus = devm_mdiobus_alloc(dev);
-	if (bus == NULL) {
-		ret = -ENOMEM;
+	priv->phy_node = of_parse_phandle(node, "phy-handle", 0);
+
+	/* In the case of a fixed PHY, the DT node associated
+	 * to the PHY is the Ethernet MAC DT node.
+	 */
+	if (!priv->phy_node && of_phy_is_fixed_link(node)) {
+		ret = of_phy_register_fixed_link(node);
+		if (ret < 0)
+			goto out_disable_clk;
+		priv->phy_node = of_node_get(node);
+	} else if (!priv->phy_node) {
+		netdev_err(ndev, "not find phy-handle\n");
+		ret = -EINVAL;
 		goto out_disable_clk;
 	}
 
-	bus->priv = priv;
-	bus->name = "hix5hd2_mii_bus";
-	bus->read = hix5hd2_mdio_read;
-	bus->write = hix5hd2_mdio_write;
-	bus->parent = &pdev->dev;
-	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii", dev_name(&pdev->dev));
-	priv->bus = bus;
-
+	bus = NULL;
 	mdio_np = of_get_available_child_by_name(node, "mdio");
-	ret = of_mdiobus_register(bus, mdio_np ?: node);
+	if (mdio_np || (priv->phy_node != node &&
+			!of_phy_is_fixed_link(node))) {
+		bus = devm_mdiobus_alloc(dev);
+		if (!bus) {
+			ret = -ENOMEM;
+			of_node_put(mdio_np);
+			goto out_phy_node;
+		}
+
+		bus->priv = priv;
+		bus->name = "hix5hd2_mii_bus";
+		bus->read = hix5hd2_mdio_read;
+		bus->write = hix5hd2_mdio_write;
+		bus->parent = &pdev->dev;
+		snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii",
+			 dev_name(&pdev->dev));
+		priv->bus = bus;
+
+		ret = of_mdiobus_register(bus, mdio_np ?: node);
+		if (ret) {
+			of_node_put(mdio_np);
+			bus = NULL;
+			goto out_phy_node;
+		}
+	}
 	of_node_put(mdio_np);
-	if (ret)
-		goto out_disable_clk;
 
 	ret = of_get_phy_mode(node, &priv->phy_mode);
 	if (ret) {
 		netdev_err(ndev, "not find phy-mode\n");
-		goto err_mdiobus;
-	}
-
-	priv->phy_node = of_parse_phandle(node, "phy-handle", 0);
-	if (!priv->phy_node) {
-		netdev_err(ndev, "not find phy-handle\n");
-		ret = -EINVAL;
-		goto err_mdiobus;
+		goto out_phy_node;
 	}
 
 	ndev->irq = platform_get_irq(pdev, 0);
@@ -1271,9 +1289,11 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	netif_napi_del(&priv->napi);
 	hix5hd2_destroy_hw_desc_queue(priv);
 out_phy_node:
+	if (priv->phy_node == node)
+		of_phy_deregister_fixed_link(node);
 	of_node_put(priv->phy_node);
-err_mdiobus:
-	mdiobus_unregister(bus);
+	if (bus)
+		mdiobus_unregister(bus);
 out_disable_clk:
 	clk_disable_unprepare(priv->mac_ifc_clk);
 out_disable_mac_core_clk:
@@ -1294,6 +1314,8 @@ static void hix5hd2_dev_remove(struct platform_device *pdev)
 	if (HAS_CAP_TSO(priv->hw_cap))
 		hix5hd2_destroy_sg_desc_queue(priv);
 	hix5hd2_destroy_hw_desc_queue(priv);
+	if (priv->phy_node == pdev->dev.of_node)
+		of_phy_deregister_fixed_link(pdev->dev.of_node);
 	of_node_put(priv->phy_node);
 }
 
-- 
2.53.0


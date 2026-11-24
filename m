Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479931;
	b=TUBUI3p9oVUh50ELwN7AJvTOw3+Q41W46WBC2wmhEgwuo6kcvRLdPppnwCRRadSrmNMD
	 Z+U9c2fTzRf4f7yqwU5/Zjom7ajWZDd6xP893Prefkzzo76cZSKfjVYcvisllqCJE0bsu
	 JiNTrxq00dauBewgIlLREMy25fpEBDiCwXvGTxm0z1XSYFqp4yDUKZUZKD9BpHlpKQkW6
	 5fAmx2xcv4iiBak11UZwEQJ75rplHoYJFWtiOP3laVH5fEWQ7vwBPaIlmj6KJRKVtsik5
	 3fj8IHpkkwv60Hxt9fwy0PXD5YFRmASHPjKpGBtNSETxRqzyHH2Dxt/gelB2rmud7ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479931;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lUZ99bv3FccQMUlBSwl8XHxRByJyMiSRsybQv7SO/cE=;
	b=1hHi3uwcR3ZOQ/6HYKrdH1FNYB1ATZDWb7GLNuosjGd8Dskq/nz3eEbaXc1EVdDYwqZt
	 00sb4aN7Hf8x/zW5+r5xKVjsNk6+m1QEfafp1aFuRxOsqKtU1eb6cSGdDQczrYUxJ1vXa
	 hGKeSnzzK0K4mFzvYaHpVUMJ4m6B3Dq26+6H3r53fkbmoLXM76xSsD+sjwDBnVZcsrG4I
	 IPbaXSrGTR9iy9TgUSChbEeO+6p+AYnjk7R1HNSxzgzAbN3TyDXAFN0FqRRBOefwaBhwK
	 zVcLb43+L21DdFS29SnGs1lgM+9/oXvJ+46RwmxDkjUb0/dkl6zYdJbvoJFNPv8ebag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fLsl6FJh;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9487D606A327
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 00:25:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9487D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fLsl6FJh
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd69954c755so2803064a12.3
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795479930; x=1796084730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lUZ99bv3FccQMUlBSwl8XHxRByJyMiSRsybQv7SO/cE=;
        b=fLsl6FJhkrbXVe2IgbsFujG07M2gt9KrPNa8sa+lnBcqpVWJKL3wvToKaen72ZYyQZ
         ud89LxL4kc7QB6c9tS102AIggqvTQp90ZmheruKMIVf8xuPdhBCcXRAGBilSPFdMcDpD
         drjgDiDyH5Z4HTRLgIcRzsNO2VH6DAjdu5qJlkoA9KMOHPPWngNVHEOuOzSTigwWASGp
         dO0QGg/YCQcCxz1q+20yhX8RcgvKKaKL7y5ckJNwHKD1NjZv4e040Q09nosVKkxtnXP/
         6JEIUto5GdBIXekSdstJbg1IPNSmAq7qoQgBY5ykOys2PMcLOVykI3HyxK6L1touVzSD
         3B9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795479930; x=1796084730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lUZ99bv3FccQMUlBSwl8XHxRByJyMiSRsybQv7SO/cE=;
        b=K99OWeXUancZDSe/jltj34BVi9/JOmxyHYq5+7aU9lqVgGaaiMTTLRzeZZrNqbQ60e
         Gtz46jbYnnPb1c+jTZb0NCUr12dF217x3iAvXBv/HY2K7aK8FwGQ/rqXxdA+8wnsEvWf
         +HOt2t1rcojjfwP855TzI1NOhYALS7l4QvTMAkW3B3VzkJxmwQiseR3Q5ah7kCjq16sl
         RYJzD/kPl1sEtfIZTLOTbwBoLHuHztjYELyHqZW/aaK4aLYHKGt2euLJxnCt7yeyk2Kr
         XTq7w2R+eWldR6ygfCQt3umhdo+9/yfjaoCfXhD0a4A6ImLBLP+8L2ZA1GGDJoJD1AGk
         xR9g==
X-Forwarded-Encrypted: i=1; AL+hErESY1zIpFSr+I6M5GyAvpOimMch8Z2eoR1iUxps18ESvXfYPcW4VPLvYUrujVvNa2yg7wG15vM24WZN@vger.kernel.org
X-Gm-Message-State: APuU4Z9QGmxb9Nzi60o7ZLR3uKz3Pr6SBEvk2GsboepSBw3gVRr8KqOE
	tW2mvFNiWklZKfEgU1spKo7HO4O39vU1UwsNSnoXEFFpNNV2BLPa4ioQ
X-Gm-Gg: AZFdTZcJHBFSk88pwFZa3iAvjIxIdGKqvTgWx1aW9WP6HxEF+1gw1xaIsrV9UcNoMNh
	KMdCiWC4LYfrP1p3rKlSXEC7IHmoGkh2PB9dngAhhf8miBrCiRhSNgu6g0seG5R6/biZ42q4Uyl
	hYS8TXfm7kicRnynLxnM+sL5IfYpbjZzRZuPDuDnnsb3lbS+ObkXOwAkdaIAUDHHiILgwLVrwhp
	5MbD/hC1f/V9sdkBF+ONdnoQ43xOsDrm8xGURlIALWt+Rwd9RqnEytUiTYWeCSJKdLUo3SmfZI9
	RCSfM737PiH5hckpg5DXfb5CQpWkaRYav5EFsKpaN6x525Oo/Er0OsyNimzGQzYYcXN4UYnhY6c
	P3MFmI2ggl1At599pfihY4u/NxQ1yU/+tnHh1Tzf92E4jz5qKtDo5dEQOJbomKGhtYJdeyOGQ5L
	vwovRSTjnWWzXsiF2YbNUa/8QyVpMv0702T1UXb3i8wBMouz5r/4AMYPL5byIWb90KmzAu94JpU
	y+lDB4BxG4WnHcqkPH0vu1sejLgsFtjG4EKzLkLYR1LJ08jMLtgo0V4Oyb7gGcO5Lt6ADDo6c7+
	JVNPP5VjAuxL9pGMHbGDSOeJXZ6UBXYAb7R6ft0gY/z0mHqrH9uDp71id4MZvxf0gM4=
X-Received: by 2002:a17:90b:4c07:b0:3b4:f92:ade7 with SMTP id 98e67ed59e1d1-3b41cb20eb8mr12513381a91.52.1795479929903;
        Mon, 23 Nov 2026 16:25:29 -0800 (PST)
Received: from d.home.yangfl.dn42 ([104.28.201.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm7302480a91.0.2026.11.23.16.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:25:29 -0800 (PST)
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
Subject: [PATCH net-next v3 5/5] net: hix5hd2_gmac: Support fixed-link
Date: Tue, 24 Nov 2026 08:24:39 +0800
Message-ID: <20261124002442.19414-6-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124002442.19414-1-mmyangfl@gmail.com>
References: <20261124002442.19414-1-mmyangfl@gmail.com>
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
give phy-handle precedence over it, like fec and gianfar, so nodes with
a phy-handle keep MDIO management.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 63 ++++++++++++-------
 1 file changed, 41 insertions(+), 22 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index a176870079e9..b787b7777e92 100644
--- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
+++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
@@ -1176,37 +1176,52 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
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
 	mdio_np = of_get_child_by_name(node, "mdio");
-	ret = devm_of_mdiobus_register(dev, bus, mdio_np ?: node);
+	if (mdio_np || priv->phy_node != node) {
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
+		ret = devm_of_mdiobus_register(dev, bus, mdio_np ?: node);
+		if (ret) {
+			of_node_put(mdio_np);
+			goto out_phy_node;
+		}
+	}
 	of_node_put(mdio_np);
-	if (ret)
-		goto out_disable_clk;
 
 	ret = of_get_phy_mode(node, &priv->phy_mode);
 	if (ret) {
 		netdev_err(ndev, "not find phy-mode\n");
-		goto out_disable_clk;
-	}
-
-	priv->phy_node = of_parse_phandle(node, "phy-handle", 0);
-	if (!priv->phy_node) {
-		netdev_err(ndev, "not find phy-handle\n");
-		ret = -EINVAL;
-		goto out_disable_clk;
+		goto out_phy_node;
 	}
 
 	ndev->irq = platform_get_irq(pdev, 0);
@@ -1271,6 +1286,8 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	netif_napi_del(&priv->napi);
 	hix5hd2_destroy_hw_desc_queue(priv);
 out_phy_node:
+	if (priv->phy_node == node)
+		of_phy_deregister_fixed_link(node);
 	of_node_put(priv->phy_node);
 out_disable_clk:
 	clk_disable_unprepare(priv->mac_ifc_clk);
@@ -1291,6 +1308,8 @@ static void hix5hd2_dev_remove(struct platform_device *pdev)
 	if (HAS_CAP_TSO(priv->hw_cap))
 		hix5hd2_destroy_sg_desc_queue(priv);
 	hix5hd2_destroy_hw_desc_queue(priv);
+	if (priv->phy_node == pdev->dev.of_node)
+		of_phy_deregister_fixed_link(pdev->dev.of_node);
 	of_node_put(priv->phy_node);
 }
 
-- 
2.53.0


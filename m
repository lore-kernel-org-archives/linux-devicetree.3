Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795388562;
	b=1MIMcuk6PVBXyXMMw88ZnDjreFSE3ie30ZDSzUFD7+HDDAb1Nl6HUNy2yqLdTqDxWbKF
	 sgInAo+QsR64RBN9Nb9QNkL/yCVpdHVkQTyyomS01zyiPFxbVUz44ne8WA9bi4ltYfP7s
	 yONJRfgL/FUuxe7B2acKrzMp9QGArSJ/OpUzcf5eXfqjhyOi2NkyYvMsyHs/QBMdNHZaO
	 RJgZqvBpYJBzmyfEJ622F4h+jLyncNanwtcPzzataC1RFWs9ScGagQUbqHoT+retnY+XP
	 Gt1NZGwsRmDYPcbmDSzRWu+xU0DH+R+StgCbDdX0H56ewK4IMoXW29yoOu2uL+1CKbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795388562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=35eWM7wVYoUx5OG+LeQqHc77f7TZQ1S5r9Qaw/6zkq8=;
	b=hSDB2TLTwA3P8lLPlPCrEWpNknTmYrXFi947rrxvWmeZu09Q4bdYZJzJk6dfGnecYk5F
	 sp/ipcgsl/KLxPSkG4wj3P5W71eNJFZxYzTTJdoqtI7sz51EIs2tj/9dmysFltu8C70XE
	 6zA3vX5Z5G+arrkxNxYi/0yxsva3l0uQ8xyvSERVSgQO+T0aa0L+J0W1OHfIKfKTVcSsY
	 S9ahzW9XwTiIGeFjhRT/sBhzRIB8d6gRUaqa0vTgmd3ZbVx6pW2py4bRXtSKCUVPWdW8a
	 QPR5rpts4ZnXOfDZ27gACchWA4XhVxs8C8mWYVpbExOib6FyYDaiRpfFCdABZtT4x3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SDXUX6mR;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA4B606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 23:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FA4B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SDXUX6mR
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so1050318a12.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 15:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795388561; x=1795993361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=35eWM7wVYoUx5OG+LeQqHc77f7TZQ1S5r9Qaw/6zkq8=;
        b=SDXUX6mRwXNbi9Btvjdt8Uj5Yaw6Fac+HXrmyDol5e0uxxJb372QAV78w29XqwH5wA
         UldPFUrRdG37+eMUf5asQkpXrCDNglnNwr6cwclXnsXT84Ks1+H+YwxhU0uR6aAbE4Ca
         2V4ENeEpc3P1NC2bDxParBYsojBY/mL6Y16rI5LXK8zAEVnHKnsQFLtGAnO82tQzZeyt
         ZWus1i7tdEnEMvUdWoMmIe/0muJOVh7REdehUzuGPyFEabzqAM+W0kjzxuN3Xz5K5pAW
         zeR+jAHLURWXi7yYfyEXjTtxzRg1l0RKY2M9JUSX0lXsYzz8/FbvWcXIE6T9/lFR07jM
         WEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795388561; x=1795993361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=35eWM7wVYoUx5OG+LeQqHc77f7TZQ1S5r9Qaw/6zkq8=;
        b=jmVzKmqrO16tHRMZel/Obrwwjg/m+7Xn9C1rglLWXDi+37HVWXfGHbfHQy4cxB8T6X
         jnWrGl+e91evlJ9ca+2J2cjRj8gXxXBl4zEbEm7GjUMRLZDiBhoiCRaqy6FNRpHeAyXt
         Rh20bxtnJGNks7IglXizXI1N/dC3pwbmjd+4ks/sbt7u2LwRgL//OCQW9NynPn1gjomN
         Qp5WnK6Hm1Jv1CmSvM+BkimmaG1Rdhz1OjJ/1xN+ZWs4s8oPPXkeL6Rw1g9zctZWQL0h
         Ao9Ujz0KwFPioqP9pWhTwGGvIrTORVqqgteZeDVivfzwOsRN9ic1HjqyCjXTjDGmIa5z
         J48w==
X-Forwarded-Encrypted: i=1; AL+hErEFBwcuaFCV7v+A7EvjLnLZH6SYViUOqR9FZJYIwvZPlXZX2cmA7YnogDCw6eJqe3Yyput6kXhpAiat@vger.kernel.org
X-Gm-Message-State: APuU4Z/c1ZjIlmdOwxEEhsdrdzmbNmUSb6AMKB3BIf8p5zR78ipyVSvs
	Nhjdonel0sZA81Atizytghm2xLgPklbXtAzq1w8QCgkVYWnzi/IPfT+A
X-Gm-Gg: AZFdTZcZRQMRlvIpYbENGJADHBuh17vFO9cuBTiyEWmPzc9/RzP7xufyiM3JiTx0rgl
	sn+3g7BtcRlaHb919lwk4eur2iVIklwSdoyK/h4Q+swvlm8OIl7J5A7Kee3mJbJ7wogDOUt8gcc
	pmvbt0QMvHpyIuncr73Ph/u1JboP4L4y9JWfs1G8fJIOb5xwJkPmUeFwjgCNVYfhzHPQw7O5E1s
	ufhrf/dEXcq69KYyt7DXiWnQ7yEsrnRByyAoA8YeYKs9ucApTHhoFiqO2v93PQYFilECpBeViVn
	URjlsF8xvKgu1HMggZG4g0AMmKax/bfAJ6QGUEw3W7laY1d+aHoAGJ20bKcO9emvX5P0ZV4Fs5X
	zs2bpYF9JwZFkcRYX1g+LchiecOQ6QaOdUGnnZoWkBGldLO6OXDqTV2w7a4QjwAaAbWPgmwhR2W
	TJMVMUWQZWqHgzfYQX8X+/RLatxLx9Y/2ZKurE15gAIzfVLHhY3vvYmT0od+APO6PlUPq3+b+Fv
	N4qS1jKnMeqyYXTT5v8E9BESqpL7UjQTZ9692dIeH8Xl8serxYwguG36rrV3AyJLyZpk6BDORkG
	55yKp18GZz+aXX+oM3Vjxk0emWdF4DcxaZ1Q25NhYO9p54a+Uz68mKNp6cb+NkrVQ00=
X-Received: by 2002:a17:90b:3890:b0:3b3:8094:3221 with SMTP id 98e67ed59e1d1-3b41c981a3cmr8815078a91.59.1795388561315;
        Sun, 22 Nov 2026 15:02:41 -0800 (PST)
Received: from d.home.yangfl.dn42 ([104.28.201.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm17663215a91.15.2026.11.22.15.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 15:02:41 -0800 (PST)
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
Subject: [PATCH net-next v2 2/2] net: hix5hd2_gmac: support fixed-link and mdio child
Date: Mon, 23 Nov 2026 07:01:31 +0800
Message-ID: <20261122230134.3366017-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122230134.3366017-1-mmyangfl@gmail.com>
References: <20261122230134.3366017-1-mmyangfl@gmail.com>
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
probe when the node has no phy-handle. Add support for fixed-link.

With a fixed link declared on the MAC node, of_mdiobus_register() treats
the reg-less fixed-link child as a PHY candidate and walks all 32 bus
addresses, printing "scan phy fixed-link at address X" for each address.
Register the bus based on if the PHY attached to a given interface is
described in the device tree or not, like commit ef8a2e27289e ("net:
macb: fix probing of PHY not described in the dt").

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 78 +++++++++++++------
 1 file changed, 53 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index 12a5657653f8..9a2a3fa1455f 100644
--- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
+++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
@@ -1101,6 +1101,7 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
+	struct device_node *mdio_np;
 	struct net_device *ndev;
 	struct hix5hd2_priv *priv;
 	struct mii_bus *bus;
@@ -1175,23 +1176,35 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 		hix5hd2_phy_reset(priv);
 	}
 
-	bus = mdiobus_alloc();
-	if (bus == NULL) {
-		ret = -ENOMEM;
-		goto out_disable_clk;
-	}
-
-	bus->priv = priv;
-	bus->name = "hix5hd2_mii_bus";
-	bus->read = hix5hd2_mdio_read;
-	bus->write = hix5hd2_mdio_write;
-	bus->parent = &pdev->dev;
-	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii", dev_name(&pdev->dev));
-	priv->bus = bus;
+	bus = NULL;
+	mdio_np = of_get_child_by_name(node, "mdio");
+	if (mdio_np || !of_phy_is_fixed_link(node)) {
+		bus = mdiobus_alloc();
+		if (!bus) {
+			ret = -ENOMEM;
+			of_node_put(mdio_np);
+			goto out_disable_clk;
+		}
 
-	ret = of_mdiobus_register(bus, node);
-	if (ret)
-		goto err_free_mdio;
+		bus->priv = priv;
+		bus->name = "hix5hd2_mii_bus";
+		bus->read = hix5hd2_mdio_read;
+		bus->write = hix5hd2_mdio_write;
+		bus->parent = &pdev->dev;
+		snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii",
+			 dev_name(&pdev->dev));
+		priv->bus = bus;
+
+		if (mdio_np)
+			ret = of_mdiobus_register(bus, mdio_np);
+		else
+			ret = of_mdiobus_register(bus, node);
+		if (ret) {
+			of_node_put(mdio_np);
+			goto err_free_mdio;
+		}
+	}
+	of_node_put(mdio_np);
 
 	ret = of_get_phy_mode(node, &priv->phy_mode);
 	if (ret) {
@@ -1199,11 +1212,18 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 		goto err_mdiobus;
 	}
 
-	priv->phy_node = of_parse_phandle(node, "phy-handle", 0);
-	if (!priv->phy_node) {
-		netdev_err(ndev, "not find phy-handle\n");
-		ret = -EINVAL;
-		goto err_mdiobus;
+	if (of_phy_is_fixed_link(node)) {
+		ret = of_phy_register_fixed_link(node);
+		if (ret < 0)
+			goto err_mdiobus;
+		priv->phy_node = of_node_get(node);
+	} else {
+		priv->phy_node = of_parse_phandle(node, "phy-handle", 0);
+		if (!priv->phy_node) {
+			netdev_err(ndev, "not find phy-handle\n");
+			ret = -EINVAL;
+			goto err_mdiobus;
+		}
 	}
 
 	ndev->irq = platform_get_irq(pdev, 0);
@@ -1268,11 +1288,15 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	netif_napi_del(&priv->napi);
 	hix5hd2_destroy_hw_desc_queue(priv);
 out_phy_node:
+	if (of_phy_is_fixed_link(node))
+		of_phy_deregister_fixed_link(node);
 	of_node_put(priv->phy_node);
 err_mdiobus:
-	mdiobus_unregister(bus);
+	if (bus)
+		mdiobus_unregister(bus);
 err_free_mdio:
-	mdiobus_free(bus);
+	if (bus)
+		mdiobus_free(bus);
 out_disable_clk:
 	clk_disable_unprepare(priv->mac_ifc_clk);
 out_disable_mac_core_clk:
@@ -1290,12 +1314,16 @@ static void hix5hd2_dev_remove(struct platform_device *pdev)
 
 	unregister_netdev(ndev);
 	cancel_work_sync(&priv->tx_timeout_task);
-	mdiobus_unregister(priv->bus);
-	mdiobus_free(priv->bus);
+	if (priv->bus) {
+		mdiobus_unregister(priv->bus);
+		mdiobus_free(priv->bus);
+	}
 
 	if (HAS_CAP_TSO(priv->hw_cap))
 		hix5hd2_destroy_sg_desc_queue(priv);
 	hix5hd2_destroy_hw_desc_queue(priv);
+	if (of_phy_is_fixed_link(pdev->dev.of_node))
+		of_phy_deregister_fixed_link(pdev->dev.of_node);
 	of_node_put(priv->phy_node);
 	free_netdev(ndev);
 }
-- 
2.53.0


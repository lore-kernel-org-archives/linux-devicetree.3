Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479915;
	b=4WB7RUD9+D6tJm90hktP+7ZTOuU9vlhj0/PJqmDMPxJSj6an+y15a6ZitOEFcrSN/Fnp
	 zy0jhdomDHI4eD8mEbjwQYON5ogvfeAswxT98zBzPDdVmZvtua1XJqf6FQIT+4IZEitXr
	 Y5/f3Kc1GVi62uf8dYEDo48nN8IsQC0WSsdPcPtehwAz8nEigtS9hqknwVSBKmhXkUrxn
	 EArBvyH1Xc+iQhHedT3Q0w0mdc8yy0m+j6Bt+t/xgIpvr2aOKAJAaHkghGVbhJx6Ao5ow
	 N64dLWutXDyVNIa8nNX5rh/YJXTKIIS/maQMKzpgPnwv4kOCf4Y+getAOsJbSCWwrhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FOyRwHhm8VFnbImA8JFYhK90oJhgE++ql8WYIs5C/+E=;
	b=xDkyoAhZtutdBKu7LOBI6Xf1fr8HC3egghqY/Y8e72TkdHDxgnLG7PRJ2dR3nOXpZ/fZ
	 qYLDI/6z1J3fF7+UXQgtibSAJovOK/6gvN0eY2jIkoerAO8H3wrQX/l/rmsrTcv/6C5Bq
	 /A1znTC5iQm6KMRPfLsSAWz9ZZc8k6MrTQnpTsLh0hVOUJhd0KNKQ4gTQRRN6eowbbY3K
	 bXDjGRpQSmsYR0EBzL5dFLFTuNr4u7/DDZ7lMNIW6WlvR7lJ8zYJooYPZpE6LsV9yeY/F
	 lywQgE9+0VAvzRGOLlFDNVIs1e9CpduklcHIAgLOVxGE6mvekYkHGQysaNTl9kk/WIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="A/OMcI3b";
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C652B606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 00:25:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C652B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A/OMcI3b
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f04e3bf46dso27207175ad.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795479914; x=1796084714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOyRwHhm8VFnbImA8JFYhK90oJhgE++ql8WYIs5C/+E=;
        b=A/OMcI3blVmeZrYlv6jJTDVY5+SduQmqRX7v9sv10XZ2qTYuVNjpTc17qqmwOvoGr6
         /AZMXlmDF9Giz/1N6SJXJ2OtcG/WRhFCHOagRYZO8nsPjiVv9/f2lj04r1rdX1MJwCoz
         CKRctMlZMVePMiKWr/WvkSAqFWpEHdFIwcq0askxGSeBLmDSSuxyiWoeGir2Q3zF4WMh
         Pz/b0JB2mWvBzwm5rFkASAHZClSjcW6jMVbt2BthQBuMfMUirPf9H8ErFANI1WBoK5s7
         X/u/bR7lPjrrp8X0jfLGcYjVbwD7oUskGFToc+mR/0RGPDc6vWkUDmuwvNh29DODRbNQ
         bV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795479914; x=1796084714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FOyRwHhm8VFnbImA8JFYhK90oJhgE++ql8WYIs5C/+E=;
        b=RHPxbXIkKKM5X9UCbid5k46vrZEHA6jj+ADy3/cqdiyTBIJbMNo/eYXDA+dRH75pTm
         hxrqlc4Yo/NtRjil+QYcluYNuvGETzEA74REbzAhX8XxwMa6HeCWx0ap7UnNaODcee/i
         k/r//7xGv+VyAB4aLabmbkuU5glxT3vIbKV1FH/gPbN8dNKJmOuM7Kjkq1Uw0r5X0wEa
         CDAza6Ib9xguWu8jqgCycOq2Lk5ISYRJOwJm0IHo30uNyDI1DPj1mnLzn4/RdPDsN4ea
         yl9I5lmgxuPNl2cMz7JWmSFFwwnNXDNMoD+7ML5T0acGvFtuxDKF9Y2pOnlIaDw+rc/J
         kU8g==
X-Forwarded-Encrypted: i=1; AL+hErGmuh5x4qqfnSA667vwI2NrovPDUhG2pfXtd2B9gkvXfwuZh+0B46ufG5Rsd5GgAmTG08NU7Bu76pNb@vger.kernel.org
X-Gm-Message-State: APuU4Z9Zh9GaESs8M/n8dgSCaWzUECgddZCU8kKU+ClTMKR0qwX4WtQo
	rAOPqTqmt9RyANCGNl9sjA+T8ztZ0abyBx+5q+aTL6JjkSqIP3Vj590u
X-Gm-Gg: AZFdTZe2VVq8xVgC/DqO+86Lu/6zRNpW9bXmFuSXsR4cmJMcbjSVZODUfXqShJrJoJr
	13tSS1hMZcruyrlOI0keOqxjWVTqSckf2D9mf4L2GHeMXbDHFZXRzzWAoukTibsTOYOkfi/q7CA
	lMhW71I46kIv1f3g7e4IDfUUolv4Vhmj0+2/97OQ8p0gy+YVFxoJq6UWOfTEYz7wd7S/DJLx/Si
	uUvj9PWL9zJbyxr6aZnJIDKSwnJFXAR9QGOS4jfhTCiwBFkppSoGoi9EXwh489wzOSIqvr6MWKL
	kJturoGbDDF9v9E7w7jindRLwiBa9crn7UL3LO1WXLQ6db/xR9A6wwikzWhG7AtvuubhPPsLoFr
	HPUuG5w1ELxHzJvLJW6GUkbHi3UUdMvRxwYYEZlMD2F3Iao1L+sXdm1inX36KWZCSmzrnHTNInx
	yMv/CDEWVFlSH93401qC1sgXRnD1bWvxyS19UMJvt84X5fB2s66Xv6Fq75KZMTa0xX6tDXwcbrc
	I2F9Bmi1lxawwgXbV5K+apN2kYxdim8Qiynrbe17Igz6qjWeStf0kxHojOHYFkPdvrd3t43qmf8
	RwSgKVnJEY/y6J5h6FTX6aM8ajZ3wPkB2qIv8Q/6X32roz0Vx4WVxUTSeR1+FG3QCjQ=
X-Received: by 2002:a17:90a:ec86:b0:3b4:889:883a with SMTP id 98e67ed59e1d1-3b41c9bacbbmr12826574a91.66.1795479914061;
        Mon, 23 Nov 2026 16:25:14 -0800 (PST)
Received: from d.home.yangfl.dn42 ([104.28.201.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm7302480a91.0.2026.11.23.16.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:25:13 -0800 (PST)
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
Subject: [PATCH net-next v3 1/5] net: hix5hd2_gmac: Use devm_ managed netdev and MDIO bus
Date: Tue, 24 Nov 2026 08:24:35 +0800
Message-ID: <20261124002442.19414-2-mmyangfl@gmail.com>
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

Let devres manage the netdev and the MDIO bus, so that neither needs
to be released by hand in the error path and on remove.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 29 +++++++------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index 12a5657653f8..d129aeceb641 100644
--- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
+++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
@@ -1106,7 +1106,7 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	struct mii_bus *bus;
 	int ret;
 
-	ndev = alloc_etherdev(sizeof(struct hix5hd2_priv));
+	ndev = devm_alloc_etherdev(dev, sizeof(struct hix5hd2_priv));
 	if (!ndev)
 		return -ENOMEM;
 
@@ -1121,26 +1121,26 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base)) {
 		ret = PTR_ERR(priv->base);
-		goto out_free_netdev;
+		return ret;
 	}
 
 	priv->ctrl_base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(priv->ctrl_base)) {
 		ret = PTR_ERR(priv->ctrl_base);
-		goto out_free_netdev;
+		return ret;
 	}
 
 	priv->mac_core_clk = devm_clk_get(&pdev->dev, "mac_core");
 	if (IS_ERR(priv->mac_core_clk)) {
 		netdev_err(ndev, "failed to get mac core clk\n");
 		ret = -ENODEV;
-		goto out_free_netdev;
+		return ret;
 	}
 
 	ret = clk_prepare_enable(priv->mac_core_clk);
 	if (ret < 0) {
 		netdev_err(ndev, "failed to enable mac core clk %d\n", ret);
-		goto out_free_netdev;
+		return ret;
 	}
 
 	priv->mac_ifc_clk = devm_clk_get(&pdev->dev, "mac_ifc");
@@ -1175,7 +1175,7 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 		hix5hd2_phy_reset(priv);
 	}
 
-	bus = mdiobus_alloc();
+	bus = devm_mdiobus_alloc(dev);
 	if (bus == NULL) {
 		ret = -ENOMEM;
 		goto out_disable_clk;
@@ -1189,21 +1189,21 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii", dev_name(&pdev->dev));
 	priv->bus = bus;
 
-	ret = of_mdiobus_register(bus, node);
+	ret = devm_of_mdiobus_register(dev, bus, node);
 	if (ret)
-		goto err_free_mdio;
+		goto out_disable_clk;
 
 	ret = of_get_phy_mode(node, &priv->phy_mode);
 	if (ret) {
 		netdev_err(ndev, "not find phy-mode\n");
-		goto err_mdiobus;
+		goto out_disable_clk;
 	}
 
 	priv->phy_node = of_parse_phandle(node, "phy-handle", 0);
 	if (!priv->phy_node) {
 		netdev_err(ndev, "not find phy-handle\n");
 		ret = -EINVAL;
-		goto err_mdiobus;
+		goto out_disable_clk;
 	}
 
 	ndev->irq = platform_get_irq(pdev, 0);
@@ -1269,16 +1269,10 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	hix5hd2_destroy_hw_desc_queue(priv);
 out_phy_node:
 	of_node_put(priv->phy_node);
-err_mdiobus:
-	mdiobus_unregister(bus);
-err_free_mdio:
-	mdiobus_free(bus);
 out_disable_clk:
 	clk_disable_unprepare(priv->mac_ifc_clk);
 out_disable_mac_core_clk:
 	clk_disable_unprepare(priv->mac_core_clk);
-out_free_netdev:
-	free_netdev(ndev);
 
 	return ret;
 }
@@ -1290,14 +1284,11 @@ static void hix5hd2_dev_remove(struct platform_device *pdev)
 
 	unregister_netdev(ndev);
 	cancel_work_sync(&priv->tx_timeout_task);
-	mdiobus_unregister(priv->bus);
-	mdiobus_free(priv->bus);
 
 	if (HAS_CAP_TSO(priv->hw_cap))
 		hix5hd2_destroy_sg_desc_queue(priv);
 	hix5hd2_destroy_hw_desc_queue(priv);
 	of_node_put(priv->phy_node);
-	free_netdev(ndev);
 }
 
 static const struct of_device_id hix5hd2_of_match[] = {
-- 
2.53.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784900;
	b=FHlRrJBIoWLaVsilSCreaZAMlgqQN+OJf8FNTAIqPrhtK9XebFuXKg7RRUriL/Gp2KVV
	 sUVcP7B2pdM4QFvo9pGFztw1As27vDofsQ2RgEgAzRk0ko2ZAJuqnSu8rpeTwfpc2hcQJ
	 LMS19f/Y7HaFk88oi4E7eBvqiohVzcUPsRI0d5QWLoujJUIpZuAExvbz4AbnIK8Bm4rnq
	 S186KgltDbMtCgj3rFPxmyVO3xkfCVdf6tLhaprUZC/P34oe1bWQogtEcRLHr4KqsHTFo
	 yS2kNU+GjBhiceG5dHIWtDePXm27KbihwLko9UerzItdbKF6XNe30WWSlhmpK+LVvvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=27jijJXTaPOAC8WqjWZiCuwobey/QH5o1iDWRvx7HR0=;
	b=PDjs8v7vqKa3fC/DtODz9D8Wi6hihN3ifb4ryP0GvMI8toq2wZu15ms1FF4J7iJjXX+s
	 EuLwhUjBkzDNv7X8LZ96mCKzfl6fnwX8zYe2vI2TDnt6ZytW2D8EDDPC5+eg1YqPQ0f1r
	 yUckG3g6p5oUSooAab/p/J36fQgpd7kyITjrwBLa55VTDTn4YettIfjdTI33a4KTPnjnc
	 AheSWOu9X3ffv9l9M4P5lTH+qV0zmUj9teFpuqo3TyWEYvHHpMYjb5NP0jQjs129tVkP6
	 4BesSbsu3leMyy9Qr6O4xINwwIcd46YQFTlhf2EKt0QxNfsp93s164TBFw7CxeVEHuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZP+YTFuK;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE8C606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAE8C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZP+YTFuK
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b2382bf051so4334160b3a.3
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795784899; x=1796389699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27jijJXTaPOAC8WqjWZiCuwobey/QH5o1iDWRvx7HR0=;
        b=ZP+YTFuKnDyRWsmmUBxPcO09JC3wH8D+yx+Y2MEKaSJlg9urqKJbXrACSxEyNoaUNZ
         qWqG6vPlTcsKvjGvKihpTgKpsOzRoswTuTzhSaOGesE1z5Ta/m6Rh4gRCNVGRkf5LjGQ
         ocWq3OwrNLbVWAQ1PKb9V1WXsdRHWkAIAX1kk7m7+S7X9i4HC1DZxmwtENqYLzZKrHsq
         whPgD/1oGDEbaW5cyhaJ0g/yTE7ObBAfkKv42eZGclmEWbQ880R5L6+bqv3KFgG1XwKT
         93WGorLLpiXd+4osPHlRkPeHGYWSawqgk0XHEbnSqTrDmQppZKYmrJ8LdfWFQHtoF74p
         Vm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784899; x=1796389699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=27jijJXTaPOAC8WqjWZiCuwobey/QH5o1iDWRvx7HR0=;
        b=CrM5dmnnpSO9rAUHLm56mUFx2qOlNBIsB2HJtb2v20sRPJBnB5AUIP1CnmVgj0kF1p
         5cOW6pwIn36yO++1u3LEFVt69PxqqKdOmV+X4BXxLWKHKYRf/FD/c0PIowV2uaxFPJxf
         8MBP/XAIHAxejmZTwa/qgXitNAhOt3cfN3AiIv/o9TOkO0njFla3zc3toDwEVTDXecNh
         JFvWtNCoC/Do1/QmPydOK1k1nTEE5WQKhmVJuHjfTZzEN4uw3qh/6QITOnCom6kZX2Wc
         nBnJYb7zJL+U3+BvedmX8vIImWYs3LhgjdWQ1lwwm41KS4b30xxmXdNi/1jr2PdeFZdC
         WVlw==
X-Forwarded-Encrypted: i=1; AL+hErEz2KmkoSGOsvhPNvq+/3G5/dXvw5mS9RdmTWVmEjMe5v7pPjPzkHRIOi11Iw1T8RjnoFyoDV7F7bpU@vger.kernel.org
X-Gm-Message-State: APuU4Z/55bMrCEf/BAWQntEYBT7yrs0qpXcdr045sEFbefLIMeHvNbpK
	AsrPEbf9CKXCqdIQLbwx+RhtcHdkVQqSBVF4vqScdQjSWvUKz+W/3kdD9KWzEA==
X-Gm-Gg: AZFdTZewEzTquLXut0/HmABNGENrzhzx/9C7qOD5DN0aYCXH8G/3TgmPNSOUgXooJ4T
	kcUBouLfj465zfFvI5id7bUphjG+fu8L3H4DPPZP4uokeubdbSHG93m3sU1u35+YGTLjnC/rzIS
	FSY8hSE2ZEUBBxGoTJLBlrJc3rMYsjSjZBGeURvjauFciZA/fiPWURgqwxZd3wzKmgHkDtXTRuC
	FD1xS6aYSSlTljkJN0lULU75ovtTSqKf/dK3qGQr4MPPhZrvFtDpvFhYSbjVdzodD8u8rSVMTeH
	11POWZJft2LiLyc7unwE27LeOV13KyUy62q/l02E6Fz9DnfZdrkNr94EWBFc+zlqYog8eKf9gPX
	TOQ0D9Ppya+EeCyB8xhX6md15AIsHA8A/L4NSUrlCGr6t6cB38SMyZwEVCrqpW8gXFAerlbwGqD
	atMTE5uCZ32pRVkNHRfXO1lgGikNdJrhpBVPZMQYfNhs9tIv2hzNOndg40O3CnKLWm8LT9pwGr0
	CymZZ3Rv4GvQ5IcTHBMDrxeD8uZHIgMNaHfuDAjq9TVKqPXlg5eyOSaL5srBCEhBX1PT4qwskXO
	jEbZ0gs+240i/nMy47HfRdVBb7PjZfL9N/Y5Sswzgq1Ifsb1QPFbkug=
X-Received: by 2002:a05:6a21:3b8d:b0:3eb:2f53:bdc6 with SMTP id adf61e73a8af0-4014b564525mr29171561637.23.1795784898836;
        Fri, 27 Nov 2026 05:08:18 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm11860795a12.18.2026.11.27.05.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:08:18 -0800 (PST)
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
Subject: [PATCH net-next v5 5/5] net: hix5hd2_gmac: Support fixed-link
Date: Fri, 27 Nov 2026 21:07:28 +0800
Message-ID: <20261127130729.1263920-6-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127130729.1263920-1-mmyangfl@gmail.com>
References: <20261127130729.1263920-1-mmyangfl@gmail.com>
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
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 72 ++++++++++++-------
 1 file changed, 47 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index b3b2aa1b7698..42c539d172b7 100644
--- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
+++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
@@ -1176,37 +1176,54 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
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
@@ -1271,9 +1288,11 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
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
@@ -1289,11 +1308,14 @@ static void hix5hd2_dev_remove(struct platform_device *pdev)
 
 	unregister_netdev(ndev);
 	cancel_work_sync(&priv->tx_timeout_task);
-	mdiobus_unregister(priv->bus);
+	if (priv->bus)
+		mdiobus_unregister(priv->bus);
 
 	if (HAS_CAP_TSO(priv->hw_cap))
 		hix5hd2_destroy_sg_desc_queue(priv);
 	hix5hd2_destroy_hw_desc_queue(priv);
+	if (priv->phy_node == pdev->dev.of_node)
+		of_phy_deregister_fixed_link(pdev->dev.of_node);
 	of_node_put(priv->phy_node);
 }
 
-- 
2.53.0


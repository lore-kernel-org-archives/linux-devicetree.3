Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654545;
	b=VMucRpIaA0pw4AHRf6xxH2qxQyIyQLKeUfIDNmIGLx0+avCKijMb/PRVeeTsYufZSANk
	 pL+zX0C5pvo4uRexHHyjbHXR5wGctRj0V8MtcIHOnpGh+nI1Cwc4Hm8MQYdb4sPHtYSTn
	 7bc9imZRPdglw8cNV6Fq4z6G1Gu60GD2TjGm/qUBhhdWBcpohKJP40LYBvY3tHyaDQJlJ
	 9duYTQ1gumL0oF4M3x3jprmsTWoh/eg+QUYuPxP0/Huz3sHWSNNwXYCLe7H0Bf2r2WhUp
	 3MIGpv7KBNMRiZFPz6077cozwAxTY+NHP2UhwACdjEK+gGa8DlLrs/y2MODcVw6YyhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q7pXSodQ3oxakxZGu05XNTUl2qeE/DKNBEL1VNjhFJs=;
	b=NZ041Y+mFdieoJMjuSRMci6j3Lp4WBi5qMgMoVVcDtIrrLhj/JSA2ZFCEQYZStihAsHa
	 Juy6oTkItFzmrtqAbfP0lKG3v0tshywdCPWkx9wF/OVpf8VpNHVf4Cg+SkcIGzYIzXPk4
	 KlTAwc6b6IYSz7NGmIxRIfi81t8QUZ1r6FeQzBzyRt5kgiab5aVcnNrM0gU4X/TZelQLK
	 abmy3wkjuG+HCd/9nJz/VvPAPl9bhMnHX3jS668nWD0aVZTIjaN6EHM9b64BXR4aUpSJP
	 iYJnqpkZyVmAf9sCoZ3bVSnwiqlr3GwVfiEjcJGjYmWjSDFXswGvLdjYSbz6MvGmHkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ebyd8DkW;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259AC606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 259AC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ebyd8DkW
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ada4c06b7bso3485640a91.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 16:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795654544; x=1796259344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q7pXSodQ3oxakxZGu05XNTUl2qeE/DKNBEL1VNjhFJs=;
        b=ebyd8DkWqsBUX4vFE2ubtaCAyVC3nqZiezSYpp+6gGLEkuaOFaJJm16bRb/JBoL/2G
         JpPxNrzNHDeJRnlS0xHMLjtbpr/6VDh9X+F6LITOIeIUEXfStkMORc+H5cCt/tguME7q
         J/zx6KYuUgG9s//9ud9HZJ3OVMQpJ+GUMMzkpe2DLWX0OmKBm8Cp8g/PGOq3QGo3ktiJ
         UovGSsKBaOjYQduJk5ubHYKYmMSUnHvDIrAaAp3bNsEqJhOnbkgO1a6YUdPxy5s8/eF/
         VIcjXUy6zGLvxiir8JvFKH6pv3utkj5SngX7WlirsQfTbqRfm3y77qsXt9z1Mra5aQ3x
         wgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654544; x=1796259344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q7pXSodQ3oxakxZGu05XNTUl2qeE/DKNBEL1VNjhFJs=;
        b=RhYYOA3VFUmEc0jSTAwlIXIBm/Q2B/BNuX9eImi+81zZLxzG1eEzq5ySuEaKHvxIZP
         SxdQdh8olN+wwLf86lB37Gtfz8pGipxNNwD1RdPNyiUGRIJ1hfYaLojdzpNF6hHg8713
         iSswm2t44RI9Qjq2jwhDLf1fCVBMvtZYB7EV7m3J34cr91MvVhp1J1xd+BgK6lz/soGG
         B/m3ilbbQu4p8D2hhgIjPxWJ7+4aw+aEtALi1K0E+tlqGOWtbeaCNIuaxuRNM/1RP87B
         uOkj1QZDXYDvh+eGI1ATGRCn7hsMrwRO2xn3SKZOqoP1cqbc3yVEiJ4fe+42YwhQDlR3
         8lfg==
X-Forwarded-Encrypted: i=1; AL+hErExwrYkeRp8X63MbQerW3rB5IIqNqwA1aIsKcA7F/lyf5chuKkMhf6/udkSgck+d0rKaddoALQwAVSM@vger.kernel.org
X-Gm-Message-State: APuU4Z9M5pN2kt7bBigIEd8clVbNFa+WwN0NA7OtLMaSEccOxveh3cPu
	aBsMPVw8VkXU+f8yBTSc+oBBOR0fiOASkkMSefyCTfc/XG0dxep9Z8Lb
X-Gm-Gg: AZFdTZdajBw8NCQL7zO1IWFd2NHaRvY59QoJs54Yl835/mqsXXQP/nwyc2YOZkLfsPv
	bJWoUXanmkpVp7aYL77vr8MNZeHx/p+jBOtW+FRnoGmQ+EoqYuzdH7uidr220NuBbtv8Q4Ivdtl
	4fl9vR+vkWhE909cZP37vu+d43qIbfAshDK9uJUOIfyAp17S4LANeIStSnZz0wxq7adWG1Ld9N6
	OLvj99ny5/pAwl5rSJQ2/SpsXE0R91Q35EeW8oMFEVjQjHpp3/gh19JXQc8GfMxsrN5ucNoCVBz
	0+94NSuj7oSwXjy/VkehzpArDviZMK+DQTNCaXLUTTvpA9Dq9IycMYPtmVKs8dAuyVjImByK53S
	Ce3+CITAxn6xeSiiKHBvO14O+NB/bINasyOl5SknUZxf3nbfCaJG9Azfau9JEhRpPyTt70hZFAq
	Wp0Es6pPh4GcWhwkkaEqnJRfPzzeE299Lg7IECnIEqWb8cKIAEQWhVPHdPBc2D03Bo8EvZUvK0J
	mY9SVazb0b+GTMIv7zuUvJ2b71pnjvnh59fQscGPvC8XlDs2mI/i+ZUSpuykAIMrLqwxUtHd3KY
	E4Iedj8jcHVyFDWEzWqdFVyV2Cs7bNXa+WnMq8udeHXNyyyy1OBDIqw=
X-Received: by 2002:a17:90a:d2cf:b0:3aa:f2c4:12e9 with SMTP id 98e67ed59e1d1-3b41c7c22b4mr16856224a91.3.1795654544274;
        Wed, 25 Nov 2026 16:55:44 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe9bb9sm9472217a12.12.2026.11.25.16.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:55:43 -0800 (PST)
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
Subject: [PATCH net-next v4 1/5] net: hix5hd2_gmac: Use devm_ managed netdev and MDIO bus
Date: Thu, 26 Nov 2026 08:55:13 +0800
Message-ID: <20261126005524.4156940-2-mmyangfl@gmail.com>
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

Let devres manage the netdev and the MDIO bus allocation, so that
neither needs to be freed by hand in the error path and on remove.
The MDIO bus itself is still registered and unregistered by hand, so
that it is torn down before the MAC clocks are disabled on the probe
error path.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 20 +++++++------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index 12a5657653f8..44b05d41cb95 100644
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
@@ -1191,7 +1191,7 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 
 	ret = of_mdiobus_register(bus, node);
 	if (ret)
-		goto err_free_mdio;
+		goto out_disable_clk;
 
 	ret = of_get_phy_mode(node, &priv->phy_mode);
 	if (ret) {
@@ -1271,14 +1271,10 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	of_node_put(priv->phy_node);
 err_mdiobus:
 	mdiobus_unregister(bus);
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
@@ -1291,13 +1287,11 @@ static void hix5hd2_dev_remove(struct platform_device *pdev)
 	unregister_netdev(ndev);
 	cancel_work_sync(&priv->tx_timeout_task);
 	mdiobus_unregister(priv->bus);
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


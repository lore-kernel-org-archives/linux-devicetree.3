Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795654553;
	b=mhQpqVHB4fHVdosThg99GIoF5rtWnk85WenogSSG3pBxGmhGPEoaXkkD49g7If+VnSfd
	 wThWC7aznyJV3CmuDymXwBTNQSYD1fqAnT18561AmhIWeg7GuKM+GaVqBtBEW1N+7kf1e
	 NPPb7lxNe7jvVTlyhfPdGwImMYeuqBaNPTXkdfwSSWQbImXm5nQLU1cxmFRWR581nSt+f
	 mUb6RbdgdnnRz0KRv0sH/3DD85hA1yBFdgwRRXyayRQZHBtxhC0BBW0cl6Z62yTGqJ3IB
	 mtbR6ADtMvYOxE/V+8opMdO10Y7NM/Ay4czYEv6EH0sW6BWeyj7AAiGh6EI6yWiRBQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vU9PPw/AI53jAU5wmvH6jGspA5SK2M7ZDo7YzMi4F+w=;
	b=dFna3ZOSnYfJgSxYqzdTbqZ39Gp8WQfFo1RPVKiolXRs5tyTaqD/1BbPfntV6IYBUXYF
	 jA62gfJI1z451q92rqbY6PBpSHCj/dH6dMNgi6ifAtCN9itBLfOUh+cLw0gMlaB6QbZsb
	 fBWvIRZ5Vve7tDyXm3GO1ASQJDfihHkgCGPyMvg+0rkynjqeVwBLSsmCd1Y42ccNyMM2q
	 9adDq42SWuC1zy8XElS4fHQAM2dk06gSIOTBKt5hq4jH9AgrEhNrG8a1hRz5teCG/SSaf
	 UzsPLHJdNVlXkkgTIkdZC4EL8JIT1n+WyI9RsJ8FwoZV9RJDePUFxjSE+U924Zq9ZAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=raa7NQJe;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E405606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E405606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=raa7NQJe
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so5242041a91.3
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 16:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795654552; x=1796259352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vU9PPw/AI53jAU5wmvH6jGspA5SK2M7ZDo7YzMi4F+w=;
        b=raa7NQJeOEy+wc0CJ7VFo5lE7I1zAEUo1T/vZQedRxqtjrQoNaLrmTQIuwEN3AwtFj
         lBw0MAsY4VwXYQQb0RuZyJFVLsFTpJE/FQ4579DYKK81ePStObtkpc3+uBgtAFtPWM6w
         nigVeqsFz7CXb0Wy30RuBoF0a3rZemXtduvrgXDYQVa9Wc1ypfPd0D+40e52l2KubBke
         ZNx1ONdThKexYo6ShKk+JCdP2EXCZ53n/edIvJVfiCaep0RLA+gIkQMUx+sFzURqiJKQ
         voDhHJ+4YRyaK4JiKVmSnVD4d1+MDxA8OBD8Ueh7jUaT21G8zcVsgrNy2fpSoLeLx9v0
         0dZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654552; x=1796259352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vU9PPw/AI53jAU5wmvH6jGspA5SK2M7ZDo7YzMi4F+w=;
        b=bIx8m4/CIUPGw/7wk+kEXqpR8Tvj8xcyDzKNKZqhvHmcwJbTCuMETqpo+N4QqAA0qb
         HorsFMAW0/4xTkB2TXfcRuK0uN4QrXUdWfsK7oypkuCgKwUTMnqgGCXV4VUcZcNv91Oq
         0y+FED7xtefD8xLe54GI6YvZn/rtSLoZVIXaydgASgF9o1vhk4abDkX1eWt121Y9z95H
         81X7QvHytbTJkObNVdJseZT0StSsn+ZaxuK69U0ZjU1UK0pYo0oS0yY2IAp2ww9U1iVd
         JtctjwOTtdhTHuAC7swE6SVgIWhASuo1wrB/Aa6s3uy1Que4R35Ms8HeoJA4f6kkahrD
         arWA==
X-Forwarded-Encrypted: i=1; AL+hErFGrcrC38yDRAHJc4FNm0u+kkPYgfPql+/FHOiP5RwhSxjAZXcrYoNKCBGm2pbxVZhsLO+JYc6lXnqx@vger.kernel.org
X-Gm-Message-State: APuU4Z8iF7mlRzmiwNM3mTluw6BGMk6tsq8455NQEw7gf36Cr4RD/rNp
	VhoBCtHQdEBsYfQYNh5p9hQeo71gv4rEJf+m4ACGS24pOVheLwhZ9SHY
X-Gm-Gg: AZFdTZfg5q2Yeax1pvjj6H2VnMoVkSAo5xlOnAJ0lncWCl4nx0kXZY1S48E79U33VZj
	Mr+l3Tv9urx3JUmNBGPZR7IiXfUoM+R3kGqi7QZzmk+o8GchhjN48Hi6s6jl/CgCJdP9H1VKU7f
	CbXHRu6BUcKaFzzvnaO6Yfcd8Fng5XFEyltMomxKlY7e7WZuqRgSZrFYuYYR0dBVO0FmrNTdddk
	5Lpr8O+AKQRNGDytjwh2u2pmI4NcwMB2hlYxK3qNfIdDpLNIZAv8VqucQ9Zftlj2SSllwzWt8rF
	lj18ixoivo+fllN8QMGEumJgaTAzR3eBT3hhAvpgyryyk1xc2CR4Q0kQsSaKFcilRh73t4F5h+U
	AHMhkhELn9y0PTBzzx+89WDUCbRC57q5uo5RGjf38D3PuwbFKnP4wkZH0Hr4+0m+9DE3Qgz+556
	7cTQxPkQDsuuN99Ma+UQlN647FBBtVuOGjoFzjSYTKxHBz6LoEMG0vR8uQSMSdkixp91kFEWTTR
	qMzjsUaC15eP6t9gtBdugAJCmvRcPkGVhNoK8jSwn2Il0/4sWl3VcLUInJW62J7YrVMMaZbDjSR
	4uMy84mHXWXN7qf69qBTDKqpVbEHz4s0ekL2MUzHbi3FPgYkmX8BdkGykuFGh+WhxCWgayZIFhS
	9
X-Received: by 2002:a17:90a:e7d0:b0:3b4:a90:7f3b with SMTP id 98e67ed59e1d1-3b41c97c98amr18942187a91.56.1795654552437;
        Wed, 25 Nov 2026 16:55:52 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:8e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe9bb9sm9472217a12.12.2026.11.25.16.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:55:52 -0800 (PST)
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
Subject: [PATCH net-next v4 3/5] net: hix5hd2_gmac: Use mdio child node for MDIO bus if it exists
Date: Thu, 26 Nov 2026 08:55:15 +0800
Message-ID: <20261126005524.4156940-4-mmyangfl@gmail.com>
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

This allows explicitly specifying which children are present on the mdio
bus, like commit 4d98bb0d7ec2 ("net: macb: Use mdio child node for MDIO
bus if it exists").

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index 44b05d41cb95..b3b2aa1b7698 100644
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
@@ -1189,7 +1190,9 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii", dev_name(&pdev->dev));
 	priv->bus = bus;
 
-	ret = of_mdiobus_register(bus, node);
+	mdio_np = of_get_available_child_by_name(node, "mdio");
+	ret = of_mdiobus_register(bus, mdio_np ?: node);
+	of_node_put(mdio_np);
 	if (ret)
 		goto out_disable_clk;
 
-- 
2.53.0


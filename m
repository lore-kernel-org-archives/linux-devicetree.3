Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795784891;
	b=GQG7UBM1GXAe8y/wUCV9Ni97ZtIhAl0TgmYChw8CqK5SuNQca2GgjcIeXgTTtWUNxeTb
	 hPSMAUEnAxb8yKYxe/ko9GGRZpO371Odb1hRjD/0qzoxE7XAyrsY3DAiJON3MXpMPcvHQ
	 YCgpYiFY4aXq/PGxlmFzXlj0r8OmVFFojDVR339ofCl8n4D/kGPFYNfHARKeSXjyGWvit
	 yDfgBVmbkM7hqKrHdU7n/6IJ6kD3Ra1CYZE6O4lrVtaMennQIlX3dzvYBxbJdP1XyqZeD
	 dg9VQEyQX0QuyAJz9Wcd3w+hqiiovl0H8nD2/HY4tmcl9Hks7c3Hhxq4OwCshPfzpZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795784891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vU9PPw/AI53jAU5wmvH6jGspA5SK2M7ZDo7YzMi4F+w=;
	b=lS1H+O/rC5gPC3Y5UuUue1QqWwWlqvIPzkppImZIeFhib/S/axlAr1GTL2RvORdcerd7
	 u2phIYguc+jy002tptvA9pvMkVWb6LBdKUjs35D7lZWWVToll7/BSnhzMkSMaY9jNfsp7
	 wxEw/Q4aLsBinyKQx3LJN1fzBlOtE0R7+hDEeLpKItQDdft9IZHzPWtjrHN0yQJDYQur3
	 58/9OYBB6DWuxcgwjUSfaY+q7FL9o1ELF+XYRv/nXrmfw1pjESHdmM8R+zty3hhzN2VgU
	 dnzqRo1XAgJlVQ85TxzL02d0d+2yNTCehYsQ1WiDV9x8NqNNE6GHsjNdXykMaNrAwAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rpMj4PMJ;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41D3606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B41D3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rpMj4PMJ
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a07078200fso4267409b3a.2
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795784890; x=1796389690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vU9PPw/AI53jAU5wmvH6jGspA5SK2M7ZDo7YzMi4F+w=;
        b=rpMj4PMJ9cSYUw+lSVf0BIvzWYC0SJvTLMJMVOf5cLzKKPpWrSjPQ15LH5iBmH05tW
         SgGQ2i+XmDEpsjeYXx6Ko4HTIGq2MECfFlR9etF5tHd/aNdaGbu9LrJ9zxwKCb2qybYg
         7WX8CuP5cZ/Po7A/bKOZwAhTvRlyHLoTeUnlC8QKGFOAyXNtgOhD/MMI8hdzrg5ysVL5
         gcf3uvzYce+zoICfxQg/44hY81D+r4VDA5UbN17GOJ6u2+ewcsSgV00MXhM5lfzmtWde
         s6GscGSfUM6d5eWk7lfK4MAbpTbsu6elK9yWVIjYYMd548ew1KkUVewkMM4JgBTULBsK
         UraQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795784890; x=1796389690;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vU9PPw/AI53jAU5wmvH6jGspA5SK2M7ZDo7YzMi4F+w=;
        b=I05OWjn9ViLZqVAOnhcwoCEg6OS+gr1zegdRsi9v01CIhDpkn7OuA9lZS7QbpcNqr8
         n0f10Pv8TUIv2Hy7iAeVFLVynhyYhbiN0jZMv7Vk2DnND4adW20qNblm6b9fmB+s9yXa
         1U5XO67/mUu3sVypjt1KqoiEnOU2fFWHkpDtg6qygRF31GfO/B9HlAasP1Gx4PmyTtM4
         xrst5P8Cjb9hAjbuXPqNB7z8Y82L4U9Zo0rVIfcQyHKXZsY9A9s84hfjhGIMqEVyn7Ov
         sjXuHcV35BnsipVNE0hWKf8mJBgQAVZHUgenQ97yxMXMECiY0qLwgYpJ34/XhHpq2LlS
         N8ZA==
X-Forwarded-Encrypted: i=1; AL+hErEmlHqPuqX6aL4zgoloQzA7lszbWHNQwRVOckzgG1L9Z8MpjCqUVWLnkrxAlPNxL73a9XchaaRpBXmc@vger.kernel.org
X-Gm-Message-State: APuU4Z8xUO2dyjMiQAnt42tSyV7nKExTg10Eia6J39A/3ETmSje1RmTB
	2dVARdCr63m9/+beARRhbgQwn6ntCXp6YUesygnaUPsbAS3HC3/bin58
X-Gm-Gg: AZFdTZcWZDu6OObhJBoOtdohLhaYag1gBXToGGXf72Qe3Wz8Ww18HXvO29A/5ixDMuz
	lWCI/FmsvaAXQKeIkcrURgLQJaCOCFWiVl8NXLZjIVl9g3yOTmlpCQaYEuHKny7K/u7aKv4EPht
	IfQOVuCW6BLQ5N7duxebM3hQwrrOiw9zZxQRqZGWjzJJehni8lfRmORkYP8zn3f9HTQXcmUTM5R
	gg0BHESQqXlu9fm0fBJJBehD5zgEBC1Uko0HdB+iGQ0UJFTPlLL7nUOnAml9u8Nn54ZLOWfeuQZ
	mf2mvlCkSiXLLAk5n2F8svXfDn7uPKiYBLCCKOki+NTrRxzzdav143HpT2tu6ZtJpqRvWne7lTu
	GkBO9AWTpt7lznGjdPHLKNBdkk9atAikDVcKqz+xH6LcMO+fgT8fvmn5YTpRvOfAbvZ2EV4e+EB
	sxh7q0OXi4I0scRPFveARHHfAYPrPeG+aEOqUhD+ZabKrvzIka86j54DYajs4qK3OJFdh+A2GbJ
	ZP8KyskhFc+AmAHfcuMnUMQz1kNEZsygQW+j/fh5GyWdNtB/xJEGft/0ED3sRWjHfwnE5qQFq16
	JaLvVkt2thYYs1F3v2Rdva7IGzO+0vS4/xgsXXe1AAVkRwfBm8ecqXo=
X-Received: by 2002:a05:6300:8941:b0:3e1:e757:205e with SMTP id adf61e73a8af0-4014da5ea9dmr25631676637.42.1795784889837;
        Fri, 27 Nov 2026 05:08:09 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:d30::4d0:13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm11860795a12.18.2026.11.27.05.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:08:09 -0800 (PST)
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
Subject: [PATCH net-next v5 3/5] net: hix5hd2_gmac: Use mdio child node for MDIO bus if it exists
Date: Fri, 27 Nov 2026 21:07:26 +0800
Message-ID: <20261127130729.1263920-4-mmyangfl@gmail.com>
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795479923;
	b=ijz7XXbFpa/0hst5JXeZsIxL5wpH8jiFHDNSaUwrumsOqzocdg3lMtrLzpUrVxDj3fa6
	 UFKH0hA+wrzK+Xd07DdSBsgxV0B4Sj7mqF43jHTyWIBirsDj9cT9CbVkqLVnoVFtk8PpL
	 +b7OV7ZybETlkMOsWax/zc8I01Rn6Un+tvTNwxDOfODM2Mahs2iqvddBcCQygQp3P/5nn
	 PDWL7Eora/cOiHoE9Wpk6whg3Lg9kvH/eEQeZQLld6URMkGj6fClD36EAHs32TlnLIr5x
	 yT9/f9qexLtjncln3wJUpCuxGJEOEhCI8lWj8t79F/cQR2BuVWntTpTfU9LYOqVbvCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795479923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VkojyYriic4Da497QN7cYASwpTnjHM3O/vAEejM2Syo=;
	b=AinEDD/aniXL6L8efx2hFlNXL2+jAjNZbKGT80NSmVpmRY/Q5CUNDMzwiwRzWhGd8trP
	 j+EI/OOxv869Djt279nK10MXJYQehGuwlfVhBhm3lCkQYD65DcnPuw6DOuwY50j3FIKxI
	 2qCZVo6eSpW0CmkoVVsuq0W912AUAjlpP3y4LESFDHwDBVlr0PT/tYDPKsEAjWZ83VM26
	 +jAzKKwLQ47QrkGy2VU+U/MPokFak/ksYlAsDjrsWIe/OHN6yRkhOc/3TyNIRed+rOF3K
	 dlF1qNlcvpfxJB20dh85HN8TisnDr5i+NWc+Wtc263B0vEYG0zM2jNzh9vZbLf58ovw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OALplhhG;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EACF606A32A
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 00:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EACF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OALplhhG
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so1993153a91.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 16:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795479922; x=1796084722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkojyYriic4Da497QN7cYASwpTnjHM3O/vAEejM2Syo=;
        b=OALplhhG/xDso0JO0f8MAMqx0CTpmUMkDF1pnd4Hx3sVIAeieDtsDFoa7EgEuWXLGY
         3+/psVPtRA6DfueT+fsG9eTHHMh4bczcHkjf79xhiE6TtdOnYbwZ+/AJP1U2NQ/UNL2K
         2OmWR/8/OkEDeOyn7r6LOPqijwp+rqfC75eY8ZDI4plUwxiNDZqgEw09n4ZiISzgJ8p9
         bIFj0dn9IwK5GY5XovCaTIB1Kcu4TsJsdtkUEewC594cGJvRpVKk0ZZyluwCzJlN26z0
         Oh0iEe8Ih3O7vaL6DRHFYWjSx5y+HS0z7ggjokcRfEqLZB2ozD3loU3JYJsEgebGUG9W
         kZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795479922; x=1796084722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VkojyYriic4Da497QN7cYASwpTnjHM3O/vAEejM2Syo=;
        b=vpDOm9O7wb5rKoj55uVYCZPt2E2lumwR4lmnCKAJZEBPoDfP9F9NS3YrWqMol5LOCD
         0acN2e/eyqqN4Py2GgOpDQEEF9sEXULYRinuCruxus/tENLo/e+muPWl41acNTJr0Xxi
         TUjyD4ny3sDouuDrAaE/OXLDJN7ZDfLoQGh4XguzhsmhMhyU7K9iHNOrPVh9+aE40nLy
         qT8aTr9lvgpruh8rhPotkrRn04LNtV232lCu2kr98RwLlxhiVauWEylmjz7AzeBgZPjY
         UxKLSJM+Gdcxxx8OIl2xTMvsIS8TQICKIHuSSSbPpJzOy+4pLL1xVhhOspLxKqh36Ey1
         eypA==
X-Forwarded-Encrypted: i=1; AL+hErHjNOxp/MGBPnNgDw9corF0cxwv9b11un74bLq+OQRA0Eb6f3SICxYos7PuZMSkZ4aV9yCgKc4AVMkL@vger.kernel.org
X-Gm-Message-State: APuU4Z/dixhSVq7Gew8wPPglaQ82HqplV14im5XoHkta+SQhjfh5UBMV
	97hUyRyI6t7Ll3SnU7WZbJlpLXeFJJct0h+8qm7OwfQ4KWrOKTTOj3tI
X-Gm-Gg: AZFdTZcWHpcQQlfLBziHm+SUwX/sG2M5DLTDVmVrqDF9BZ8yZn7ageVlGSXTLm8OPO2
	ub887F/AVav0Hga9dfI57KV3/864QObnosI3+2Q8A0GBtOy3pyM6o8kD0p9hjPJHKQA2RrrP195
	yxSw2nng6FsRb5zSxLApvJKQNA9eNDhIbUZA0WZKS3jMWMzNKi6C+mfGelef5V1BnqkY8R9X4Rx
	El/95xSLpYFyFC45Hcj5KoDzW3A9qTiWbsaZ58CFtLnnWhNuxx76DIlUtZClS+3nqEvN4QU9R0F
	LrqG7UAHbSeuKQpoycPyr/cA7YFE9pAUH+jGKGDYfJSe2rp2eLdiVAKbxqyP4HahAZwrA0qcW72
	iJbD5f1VwcEzkiOvXz0SdGM1PytefrywxX9btDBdgbbumqha4mQS17LKYH3+ZSjVblcSUliwBfV
	N1xiSnkY0sLdO1GnTgjosKHkuF+bGMHhh75IwNF5kW1OlQBwyJGXDzHEh3F5iRpxHbGhgsp25Wu
	lEkElkSL6UayLUhciDG/cOtTHgS6FtKaFJp13t38Tcpu73doxGqM147CCgqZN1updE3/GaKCxyz
	+OjibASHfcXf0WN5ghsbm1U+STgOlcICYkLy4JiI0nr89lb2cQWldV656ZEfcc7BCXPk5k/tKG1
	kEYzQAO5fCgf+
X-Received: by 2002:a17:90b:1dcd:b0:3b0:bd53:8e5d with SMTP id 98e67ed59e1d1-3b41cb3e4b9mr9742816a91.58.1795479921884;
        Mon, 23 Nov 2026 16:25:21 -0800 (PST)
Received: from d.home.yangfl.dn42 ([104.28.201.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b495035339sm7302480a91.0.2026.11.23.16.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 16:25:21 -0800 (PST)
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
Subject: [PATCH net-next v3 3/5] net: hix5hd2_gmac: Use mdio child node for MDIO bus if it exists
Date: Tue, 24 Nov 2026 08:24:37 +0800
Message-ID: <20261124002442.19414-4-mmyangfl@gmail.com>
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

This allows explicitly specifying which children are present on the mdio
bus, like commit 4d98bb0d7ec2 ("net: macb: Use mdio child node for MDIO
bus if it exists").

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index d129aeceb641..a176870079e9 100644
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
 
-	ret = devm_of_mdiobus_register(dev, bus, node);
+	mdio_np = of_get_child_by_name(node, "mdio");
+	ret = devm_of_mdiobus_register(dev, bus, mdio_np ?: node);
+	of_node_put(mdio_np);
 	if (ret)
 		goto out_disable_clk;
 
-- 
2.53.0


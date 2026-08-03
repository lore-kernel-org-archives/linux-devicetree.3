Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B17738E8C9
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 05:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734136; cv=none; b=as7SJZuHITRDjZKqaHjOWGeXv84+DZ5YojBYDhKH1f4/Mtu2R+0rz/8ZV49rBAJKmyiPDBdRNvW9LUbENzR3IC0aem3nVJVESMXuVNtgzhIRCiCFWenzeGZExl4+Didzv05Ei6g5FX6Ts15EvwN+IcvzXeg6RELDMALKWT71VgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734136; c=relaxed/simple;
	bh=APfgpJTVA4pOI91gbDaanL4SMg80qg6DwGibNA5NVGQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bISQBjtAIZRlBqDRu9PKYyCKfWJ53XbNZXFR1EA29csGJ8oTPxWfHSPrPuMKC483AbbdS/4K5UCX+80r5dtKtCl15pfpywecxJLlQJPRveHdX+Usrv8u4CCS2wmO907QJuK43KDo8v8OPBPSSYsUXpQU70qsP0R0xQO1Rl8n54g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVr583p/; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVr583p/"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7ee4399c423so1835915a34.0
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 22:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785734130; x=1786338930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkDHET87UFExhpdvkNx3ant78q307rzdUT3zfbIoItk=;
        b=eVr583p/EV2w+llKvPRjUz08cRWvKAdD42qyb3fpyH2gjytz3WNdtN95A68PgLT8Fn
         atLgknpxtC0mCcHEwGl/1cEk9mMWPSqRj8kZIFsyo81x+gxtVgZMoeMKoS5gAjjDaWqr
         15lDbFlx49AoEVJsXmVZKdhi35YyuusaeSKeLKTPgeWV4Lsf027ScpaDKSKQspagaEA8
         gQ37rOozh/jGC6yuFjRySeJ3diXIVwQKL8fITFv9g6mAWN8Zdpp4jKvtoRywQBUL3Lso
         MmcTAYoa2bqxrp3Q2ywIPgFec5/gY58ODGT5JiekPv0GAgRXe3YVJ52USxa6HSkdBbgD
         b8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734130; x=1786338930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkDHET87UFExhpdvkNx3ant78q307rzdUT3zfbIoItk=;
        b=ECdcMqNJCE2Ngj2FhDuEr5nGyk1GynKvd+KH5++6VoceITxFAstXulVxL1+nVj+09M
         mBYfNQ87JzR4FXYGt+njNsT78nn9A/fWz5Ac0VoIjxkiVmK05sAR0iWn/1lnFl9spaZC
         4A/Sn8h+p+co61ZkYvRtnXgHWNNAv0ZvTKL+TzbN1c4apttdaPVii+9NUoWLDy/s5Re4
         mGVbSkZOR2MpwxAsv00qWM/8u2AAjyruiXT397hHbM6J3g++nBLcWn95RhjZjLO160Ka
         FVRhY+ECG0znakDoEBA8oW4INCWKShoF1QEkAT+puwlkfTSEM8fy6piKpeEvKjst/0MA
         7SNg==
X-Forwarded-Encrypted: i=1; AHgh+Rp0zAH6cHu/q8LGFRR7pyOQes1lHccyVXYY7zr5PnwkajAkrq0rNrQ1OByfAp509ca24NsFff58jk8D@vger.kernel.org
X-Gm-Message-State: AOJu0YyXJb/mAeSFoeR3me+QBB/RekcO+ky9phWEZvWHwlmY8/HgOz2M
	Vl9BqqxBqELfIMShJUEezKjAugxyfVZT8IJBF5r5TYuUUgFSenvmdKvc
X-Gm-Gg: AR+sD12Lo6IwdTBCpzPr82LSm+bAuG1o4uK7v20+zbnT0h7iFrONJfaYqo0mrUeAQkc
	BWkshd1NoSHGGWq5s23WwsBJ2Up8xGDXYASKgx5G+hNZoq7Xf40jIpLl3mqJpPqVnYzqzg6jT3g
	TivmsmhXRcAYbeI26XH/G6VCAAGyeLUkilsz9Tae0MgUiwb1vuKb+a2KwTIdpBTnf9PoA9SwH8W
	i/89TciuUe4pBJAUrtleHD85ZcDAHu8+VvQeWpx5AJMd2ZFhPCQNiYYI49j3sxGX/SoFHow4ZFd
	L6egylPoPNzLhptk3CZjgrraRLsTth4r2otVEj80ymdkxAai0XNRLWEI7O3uXoEkfjy2u/1ClN9
	pipv+cQb/vFjFJFmfPT5Bahwp/6WAtalhBK52Aygqp/MdzG7to2N46bBPvFQGaOV+s6in8Zfir4
	A7xLpoEtYLP0gGrLnfqQDsNyiVdfuLsyWMeAjGuImCdmvBh6xnub4PyzVKZ2bY3/1XE2eN1CSws
	pYYyBRqoNlfzYVzXaWAffU/d6zHD34DcnDmYJzcowoitNic7J6YSSVixdqrjcZGTjw3pISntPqC
	YPGXH2Kcnj8LMfkzY1fbExJmhOsHS7I5z23JzZ1u8X2YulzwsjvbCUvfz30AXY+iOG9TeSMP4MU
	IqJb7LJMCrM7xOnKEoAPszzqo4OoOm4JXCDBI5w==
X-Received: by 2002:a05:6830:8389:b0:7e9:e709:44f6 with SMTP id 46e09a7af769-7f196ea3b40mr13694676a34.12.1785734125552;
        Sun, 02 Aug 2026 22:15:25 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f07a5e3sm6787108a34.15.2026.08.02.22.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 22:15:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 02 Aug 2026 23:14:14 -0600
Subject: [PATCH 04/21] net: mdio: factor out OF child registration helpers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-submit-acx00-of-dynamic-v1-v1-4-0a53cd9e21cc@gmail.com>
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
In-Reply-To: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 mfd@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Live OF reconfiguration needs to create the same PHY and generic MDIO
devices as initial bus population, including legacy PHY nodes that need
address scanning.

Factor fixed-address child registration and PHY address scanning into
helpers. The old scan loop also visited every free address for a child
without a reg property even when the child was not a PHY. Reject that case
before scanning while preserving enumeration of valid PHY and generic MDIO
children.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/mdio/of_mdio.c | 66 ++++++++++++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 26 deletions(-)

diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
index b8d298c04d3f..051e449bbe7c 100644
--- a/drivers/net/mdio/of_mdio.c
+++ b/drivers/net/mdio/of_mdio.c
@@ -77,6 +77,15 @@ static int of_mdiobus_register_device(struct mii_bus *mdio,
 	return 0;
 }
 
+static int of_mdiobus_register_child(struct mii_bus *mdio,
+				     struct device_node *child, u32 addr)
+{
+	if (of_mdiobus_child_is_phy(child))
+		return of_mdiobus_register_phy(mdio, child, addr);
+
+	return of_mdiobus_register_device(mdio, child, addr);
+}
+
 /* The following is a list of PHY compatible strings which appear in
  * some DTBs. The compatible string is never matched against a PHY
  * driver, so is pointless. We only expect devices which are not PHYs
@@ -136,6 +145,32 @@ bool of_mdiobus_child_is_phy(struct device_node *child)
 }
 EXPORT_SYMBOL(of_mdiobus_child_is_phy);
 
+static int of_mdiobus_scan_phy(struct mii_bus *mdio,
+			       struct device_node *child)
+{
+	int addr, rc;
+
+	if (!of_mdiobus_child_is_phy(child))
+		return -ENODEV;
+
+	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
+		if (mdiobus_is_registered_device(mdio, addr))
+			continue;
+
+		dev_info(&mdio->dev, "scan phy %pOFn at address %i\n",
+			 child, addr);
+
+		/* -ENODEV means that scanning should continue. */
+		rc = of_mdiobus_register_child(mdio, child, addr);
+		if (!rc)
+			return 0;
+		if (rc != -ENODEV)
+			return rc;
+	}
+
+	return -ENODEV;
+}
+
 static int __of_mdiobus_parse_phys(struct mii_bus *mdio, struct device_node *np,
 				   bool *scanphys)
 {
@@ -164,10 +199,7 @@ static int __of_mdiobus_parse_phys(struct mii_bus *mdio, struct device_node *np,
 			continue;
 		}
 
-		if (of_mdiobus_child_is_phy(child))
-			rc = of_mdiobus_register_phy(mdio, child, addr);
-		else
-			rc = of_mdiobus_register_device(mdio, child, addr);
+		rc = of_mdiobus_register_child(mdio, child, addr);
 
 		if (rc == -ENODEV)
 			dev_err(&mdio->dev,
@@ -197,7 +229,7 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
 {
 	struct device_node *child;
 	bool scanphys = false;
-	int addr, rc;
+	int rc;
 
 	if (!np)
 		return __mdiobus_register(mdio, owner);
@@ -238,27 +270,9 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
 		    of_node_name_eq(child, "ethernet-phy-package"))
 			continue;
 
-		for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-			/* skip already registered PHYs */
-			if (mdiobus_is_registered_device(mdio, addr))
-				continue;
-
-			/* be noisy to encourage people to set reg property */
-			dev_info(&mdio->dev, "scan phy %pOFn at address %i\n",
-				 child, addr);
-
-			if (of_mdiobus_child_is_phy(child)) {
-				/* -ENODEV is the return code that PHYLIB has
-				 * standardized on to indicate that bus
-				 * scanning should continue.
-				 */
-				rc = of_mdiobus_register_phy(mdio, child, addr);
-				if (!rc)
-					break;
-				if (rc != -ENODEV)
-					goto put_unregister;
-			}
-		}
+		rc = of_mdiobus_scan_phy(mdio, child);
+		if (rc && rc != -ENODEV)
+			goto put_unregister;
 	}
 
 	return 0;

-- 
2.53.0


Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EA83D1A82
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 17:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785952167; cv=none; b=WgJ6NCOo65UM9urUOSB2bdBwAVWkZiyvOG/zrGHUPi0hFDkpJelEEn6nbC73+fJ1PyHXnk+hofudOb+L1goBz0IzXS/YzNIPuHA5qY4mnw4LGujTVDzPoIKI27yV8YlEyTzt5xYntgtXaNi55heRkkpkvbmarFv96Ld13IPZXQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785952167; c=relaxed/simple;
	bh=PTx1xmaBWvPevkP6ZbmwzZ7YY+06PmbkiJMfuow2Mow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YJ2inEqzgwLaHwL2rUo7YXqTwNcSIOpDNV/ppENxnbRmfqEDqJhROXtt/Gvoyvu/mA1H8tN0KAkkhhLL1gT/MKRE7CoaYef7EEYk5mWr04nVx3QGhV5XK+4dTKVemyK2bCiqa2YrQU/GDY89JBPcpumUiMbpXRlYzXrg5q1wQqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ez79dmKZ; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ez79dmKZ"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-448b89f700fso1208942fac.2
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 10:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785952165; x=1786556965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=387qnwbkMAAVcWYZO25x2XelYHqPuaJgYNRgF/uAO2o=;
        b=ez79dmKZNnevR49ifg1M8Cr4vLNpMwDtsWZQhqWy6eRnGZlr6+VjtF5xEPnFWWkt/0
         ExbEDCWepI9doJCzDrL85jXYLBAB119w4XD7IgmU0WmespRqHfES9Nar/NeaCwir7bCJ
         szJ33hZIX+4cgH6Uh8MUhRBVpLMwx/KnMeFAtt2mUTf//IEWBXkrJObnUt9WHFHZ9cJQ
         RTCIDM75+0GCW+jBt8kvr7b26Y+LxmruiRrWCnmwwJGYG3Kc6I4w+TfY6A/df3aMHHm9
         ahzRfpBPf0OZ/dBeaXcB/4rSNiDSg09+cCZeWr0uwf+YwVC+qf+pQYKPePaETH87w2ZW
         Y24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785952165; x=1786556965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=387qnwbkMAAVcWYZO25x2XelYHqPuaJgYNRgF/uAO2o=;
        b=ARv//BBfFRwCouVzE7w+zM5Lp+rwquj/gWCnEjQ6BcvCtptdmhzkqnnoEfUSFWH15b
         4Gfw9t8H7hkAWutiQbe0AhWAVivp7w6x41y013dn5mrfZdRIhLibkJDJePZSpk8RKthK
         +pQy0A8r1RqMbWzD3rItShlwgxXdtJrjK15O19c3PN9bT6/KQjt7WHbEtDgTc1tbr95q
         2TZra+N2k0a95T2MFlA/xOeqxWEcdn19BkS3CYypAQybhY8QPdFR00qLx9erhU57/Kjk
         fRrxbnIySuhCe1VH1advHGZYD473Wc8GMzOPr5dEUHc4fMzNnjigUiXqDdxyiDIr9L4J
         IlMA==
X-Forwarded-Encrypted: i=1; AHgh+RpaH4ASSiHjdd9Ac8QJBLcVCuCeAGWvCjSz37reWbtEfhTF+t6wkDpzdh2bsf1xxw8ExhKergvpaXIZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz46YkiLM/Twef1ZnaHSsrEjDjRvSaby4NCEt3DzDG3itE9q3oU
	Iu5dUKZS3M6dC235KNGu9+b1Z6O9OcA2wsFTCH2AJVM3tB+nE0ra6mae
X-Gm-Gg: AR+sD13w9uMiYyGrODasi69qypwkUGjS/9d2gCldGY0IG0Nv0Vo2AaLqzj+bwZKrT42
	ou9Sn3hYfvdPHZs1DK8/KLvITigk5Rp7yPTE7a1tY/FdLbsbBZXkUGEMx2OlQciknaeeVDQS7ga
	DQRO88N81ow21hLZO1boJACwhpoV9Mb97inO97MKK6503AGRQ+nrXuWEiaG2w6YJQeZlAjnTpzX
	Byd+lDexmj2pT/mq5rAMewf95FevXCGhprAvjUfuzwOQcpSijCi0ExOtheZIAuDTEeeGht9/yZz
	0ExksMesJuZx8CcLUim4yMSYzwp2GjXYXn6Z2OksTFB6tAQo3RBx04HsWmozrIvPnz4d+OxBMzO
	IRQTR7NFUIQjKxYHarQpzM2cmYLBcudbFLO+RY8vN3c1JaXIXJtK5K7t8tewIpEybzQbXJ3aDpy
	jzYD6a9UGLCnEfJBEs6eiLmm89Iw12VwFqYPXL1Ev4+7ifDbChykvzOj9yOdExQ7VwQXsHBm/Hp
	8A2AOOMpsiVjh0ikmblImxg/DH1RqMMqN+Ol2oaZHtzoSY8XeoqbZT6HtBX49S59hoZ2Llk2DCy
	HvsoGIOtC5ikHcEN0EmDd2ysvHYwxFTNGAuQ36PbKy0s6T8c5a8vLWwirHTh/c8mKU1NaBwqFLa
	XqYbjoiO5UUboe6rz
X-Received: by 2002:a05:6870:f146:b0:447:2ad0:b36 with SMTP id 586e51a60fabf-4599f0eed12mr4304641fac.20.1785952164722;
        Wed, 05 Aug 2026 10:49:24 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4599dd615ecsm3281704fac.0.2026.08.05.10.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 10:49:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 05 Aug 2026 11:49:13 -0600
Subject: [PATCH net-next v3 2/4] net: mdio: factor out OF child
 registration helpers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-submit-mdio-of-dynamic-v2-v3-2-16f3cc893b0e@gmail.com>
References: <20260805-submit-mdio-of-dynamic-v2-v3-0-16f3cc893b0e@gmail.com>
In-Reply-To: <20260805-submit-mdio-of-dynamic-v2-v3-0-16f3cc893b0e@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh@kernel.org>, 
 Saravana Kannan <saravanak@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
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
Changes v1 -> v2:
  - split from the ACx00 series without code changes
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


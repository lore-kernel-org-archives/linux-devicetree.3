Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0913C9EED
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 23:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785800947; cv=none; b=IxTeSoOvkrXyqW89RR59RiEsWEjwln1iwqsJ0oR0dK3pyzg+ncEtHiy77CUn0SsLNN/tZtKtJWcAMdJ6o31JxVt8wlxumlqU576PeDrqs857RJtCtSByq8mwst3j+EJIrYBq6+SlUekrOlKXSYmv8dYYBjIPJt30O2Xwv0H9GQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785800947; c=relaxed/simple;
	bh=ogWjVsC0piNCM1RMDl8iOUVmObHs+/XyhZHhwtft7dk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RNtrnNMY0detkG+LjxbOJHhXLptfdKDkkdC9NGxCmA7sf0qkGOHALj71zKeJiCvHnlLz+lOVNYX4GBTE8zx3po5BgFbJNdyfvqaMsGYhW1EzN1o+kmSTqvlIv0k8Q/0fJ7Yulf62d9aedrHkkPrKggar8F6HYslwmGGavBX23vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2f7tzTU; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2f7tzTU"
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-456395f4e7bso2810161fac.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 16:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785800936; x=1786405736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7P9WtlFAtBc8WNPSV8TlVSYdZS3/m6Toes+rUug0Yrk=;
        b=R2f7tzTUEzN3uKK3a7SE2qqpIQi8+zCwS5QQwxTY+qNeqDlNMRDWiyOh4mwZ9KEKmn
         LlOubLU/kR5nWMOqgIC9zWekbbVNAxgusBA59282WCfDSQQFtAoKnB0CQK1rxdeUewft
         OPVhtgoNZ90JKvK2OwT8qa/0WIwVmNMsIb0TWfq4RjD4fEDpDK/KxRBhI3V/uT7VDejN
         vCSGJw1RpREnL899iZE4biP7439Mhe9PIoqQxxyIxwWuUIinDJkwsPPtnkASeGE02ZbQ
         6htdd9niXuiG1gzmtraDrfmAUlzK0aUvZBtF/OVFdxmNbZCj3TKfGGQSkiYmny5xoX8D
         2Ilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785800936; x=1786405736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7P9WtlFAtBc8WNPSV8TlVSYdZS3/m6Toes+rUug0Yrk=;
        b=Vx7EPW/6ZfsJrswlT8/akLVfLHGmwnX6exjRSGfigWUN2axcs02uICEGutnUnrKA/J
         GmbtCxf9W/zJn8pFLH7dgxdVAulZxnYl0GntFKrSfY/BpHbO/OcVVwVR8P25hs6eITEA
         d4BlTiIom6EhXokz3Seim3Q6Lff6WWxvnCnpea2290G3A2re6m5J+ll0RTozqBj2CoA7
         SZi6Lhd0jSdtYpEA59pqJcVFpdK92up1gq2ITWXZ3mxsF7nC5f6Zy1QOrnHSDbVbkMMk
         h3XegDJ+zxhturpAabsZ3wl4D+dww3ZTJFoK20565s4qf19qo5kPhbS8Fh/dYJ5IgWfS
         s+tA==
X-Forwarded-Encrypted: i=1; AHgh+RokLx9+iWDYiPKOukj2km2sMUS1vHipRcXs9HKwn3Uy0gAVjfvxlytU8tRETU7RS0tK4yu7LKMZ8N0Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzJOP44TC7huzVHk18LjDEsdIyv0VLACSiFQ3NR6zeB1PJ3ZneV
	oSt/nmRnhbwfhVhFt67Byi9LaiDNJW+2F5pwC8WoNcatt8KuCUEVWfxuT9yMqwda
X-Gm-Gg: AR+sD125BmDxnNKAwTmgbWzGlIJlKoMYLmAXTiOKcSiDuaZPeA8QDots17m4sYE0xTm
	05RDOGHsWXmLn+APu2U2r11kQ2N5h/bsJtWf7Si9Uh5y+C4/fHWY5A/nz4XTVvNPQCbEKjisdeq
	oUP4212aYE7MAwEb7ABtxTxSaIU2oE/EkuDeRLHSZ/DTX/VbL99qFqaZSJ5fUdvO3Uoa94J2CQQ
	riJZ0gjcLHJ967DW12uS3WcT3idNZl8aUUw8kSUV9u1o/TyZb6Ab3T7+nTH5Klhe5nYkx1Xd0+U
	vOOVKx7yzdDasxE7GGY5WBndjwhYNICNHjE+DQrp3oSf1NcS/jBNYnnuUvBIFnX7gI/6bRjam+h
	lGCB5jfmJe7RZZEvx2jJ77jCbgvfwbbmQUS5yilAqRlfqCmGFnU6kRBFWPntzrwfN5te6TcuzZY
	5tHXfZ30Wpn3LNpUFscLOGNIiADonSZ+VlTB5rvjTknmHskXifrx6FSlui3aIw1kCM+jE7htsfv
	Zr8xNUiWInTF0x64sEy7U4w4rl5P8I7iLaqzj0tOr5DdSPeW6lmYxuByN5t5nBET90LVIQ/F9vn
	MICZpJvREoLJDp8LWbRiKrg5fqdnyzremOFRBx9+7a1XkilKY/86OyjB48n/scA4+95lxoLEex2
	V/1f3rfit17JvC1Or
X-Received: by 2002:a05:6870:4686:b0:456:f9b5:b422 with SMTP id 586e51a60fabf-4590573146emr18925674fac.3.1785800935522;
        Mon, 03 Aug 2026 16:48:55 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f60ea539sm10452201fac.8.2026.08.03.16.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 16:48:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 03 Aug 2026 17:48:10 -0600
Subject: [PATCH net-next v2 1/3] net: mdio: factor out OF child
 registration helpers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-submit-mdio-of-dynamic-v2-v2-1-f8841f3124d7@gmail.com>
References: <20260803-submit-mdio-of-dynamic-v2-v2-0-f8841f3124d7@gmail.com>
In-Reply-To: <20260803-submit-mdio-of-dynamic-v2-v2-0-f8841f3124d7@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
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


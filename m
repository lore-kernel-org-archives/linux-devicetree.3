Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70EC3CF05D
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 17:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785952166; cv=none; b=j0Tgii7V4sDFZQhq4kKUgk1/AG7QIR4Sm8nEgduzZNRs3CTypY8y31/qsz08pp2k8fBP+BKrf5WtI4VvnhmPep690u8bd150BpRcZsjcLrvruW6Y8IyTDeVhNsjS5LH5DSwxn8sME0ztLGR/FBovZ+V9b7wI4xfJ1uqwA718KDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785952166; c=relaxed/simple;
	bh=X5btDcfQTdSHcpvlsmHeLvFsZZ7Fot+driL4QSWR/S8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WE1LKEA2gI4eZ7Ujy/lN7rmg0GYPKxFpGc3cHwhLl7b8Zu9k61dSluE9uuEBcdelu43wMPSP5LtWYSdBc9yRxE1t7ptuhHc28MnzkukazOuv8vsQ6/ympVHVVyls0TqhwYA5XCac13bhSfNc13gjA45EPHt07pnHodHuy+zKtys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+acojAo; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+acojAo"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4472500e25fso510411fac.1
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 10:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785952164; x=1786556964; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNdkQ7aeXS5MjicAGAJeJZ2Ggh2c8nR9nvPFAS2N1c8=;
        b=Y+acojAor+hsyzhnx5PUipQaOk8Spjy42Z38oRQxRawJ+d3a89RdkO3H6WOBA/dHmx
         S9W9WTqz2qx/6gYNsFq2BrHImbpKFybzE9r4WPbtG2UWDtK6337jnxWdRsDXOLz0/iC2
         SPtKuym/NDpLZ3SzkpAWdWESZP1UCjNxu6cXaaj5teYsPyrwxdK0g7Vr9tVQJG2oUuX1
         quHsluiVvS5V4wapN1c1YOrua7wic4IHthZX+CeEVjTOCzJzM8ZOqG8qDDoV3ebUOBUN
         xkxXnAG1YRS7DN11hSkraNrJsUMxPZp0us/L2RbCfdLh8YuHEQh/Bw3iJWzVEi+KucNO
         SVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785952164; x=1786556964;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RNdkQ7aeXS5MjicAGAJeJZ2Ggh2c8nR9nvPFAS2N1c8=;
        b=hHJzPdY3dCN0QSvkM8hnY1fGXCkv5q8/vWIrY+IeP8afsjjlTtAE35+8wjRU07iLL9
         7CHnaylPW1P/tQjzCimJ06ICw4lTLyuboeKTc3A400NvWC9owfUTiT8DPfYbaEokC5Vo
         s1VMCpGVgwrD76D1tMs+KZVJu5FeceAF8vn5D/Ra5gGcs0KCT3p0l88o/kGB3tpQ2dvS
         EIV43KCaVadIKMlA+sp5SUVB6P5afz8Li0psdamcXoRSVGrqF7fmQTiEVSC0B4CWqQLi
         90ELxCBKwSR0rU9v1TCaduQds8b9iZflpMZ1RLZv1TBGOyyZKXH5d9LcL3QBSe+5oFfN
         hz8w==
X-Forwarded-Encrypted: i=1; AHgh+RrPrtZGP/40L2TRP7cHHWcqD6X0aRVwtzi1lCXQQaBwHRru0QRN+zb1QSvY2Tl9jOSVXJ8DlVqvWD/H@vger.kernel.org
X-Gm-Message-State: AOJu0YytmdG1DuZZJ3CnIrp3w3cHToY5r3kAcTR+QD46dJK8urgJmVX/
	BXlWm7/t3l2BPxHHqnSAL77yYUFnslf/fyBC26szsTIvJ1XFk7qLpE78
X-Gm-Gg: AR+sD12y/a6dGGVE69pDSaJ+MIDhsn+1lVUlGf8i4TgEPY2q5pve7HbW4wBQllmPw2+
	D9Igqfhd8YFZM5BN2z4yFFqROls6Pjc9HHfKJ1Xha/6cACpj8gN/PZqSzmr+lAL8+0U3loqfFdJ
	hkWYeNqyV9fZLNejSHuS+aEZTmWMEwaMUi6lm1pus2BIpBn38BExEEcH8mmYCQ8IbzqlhN0NMuY
	2n8e61WFBeLnK/UPSK8SppUG0auLFldHOkfqAtWHhzjmh2s/3SPv0OM1dUobkdAyxRtpfkn5jgS
	iCgtF1lkbvIk2d3HDp/2JT24Pps4ql/HCf0qTS3lOWE+lUmrYRmxUWoCn39p9z3L7GbUT5AF2Kq
	w5HZ3Fn1ih1ypTNoY4+LRdJEvI8Mywb59nOefr9XP2ocRmrbPsWTPpoZaGMZvM8NPyfDh3gp6AV
	NdCmXX59g46c9I6YRh8NY3wDDfRxhqpiLmc4F9+iEBds6KmhDA/FACg5f4/kXEKE0d9IfuWQjWC
	VfbVl2e0GDVhCY3JAPR/b5M0ymjXoypjPiVXEAdqDDQyoWEWNEmB6wF91iO1DY1FnmFQ7ra3583
	Xg/qCVA+UCj1ogI/DUQZckFKiICjmWoyOhpeXzUJzbDmpF7Glsj3LwTpceSuT4qCdwKIoVszKDl
	QLO28jVUHS3fUglVH
X-Received: by 2002:a05:6870:a40c:b0:456:3973:5a89 with SMTP id 586e51a60fabf-4599eda5c51mr4077499fac.8.1785952163618;
        Wed, 05 Aug 2026 10:49:23 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4599dd615ecsm3281704fac.0.2026.08.05.10.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 10:49:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 05 Aug 2026 11:49:12 -0600
Subject: [PATCH net-next v3 1/4] net: phy: cache MDIO bus owner before
 dropping PHY reference
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-submit-mdio-of-dynamic-v2-v3-1-16f3cc893b0e@gmail.com>
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

phy_attach_direct() and phy_detach() cache the MDIO bus pointer, drop their
PHY device reference, and then read bus->owner. If the put releases the PHY
during concurrent teardown, the cached pointer does not itself keep the
parent bus alive.

Cache the module pointer before dropping the PHY reference. The existing
module reference protects the cached pointer whenever the MDIO bus and
network device have different owners.

Fixes: ec988ad78ed6 ("phy: Don't increment MDIO bus refcount unless it's a different owner")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/phy_device.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 94b2e85e00a3..d65f28dd5773 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1752,7 +1752,7 @@ static bool phy_drv_supports_irq(const struct phy_driver *phydrv)
 int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 		      u32 flags, phy_interface_t interface)
 {
-	struct mii_bus *bus = phydev->mdio.bus;
+	struct module *bus_owner = phydev->mdio.bus->owner;
 	struct device *d = &phydev->mdio.dev;
 	struct module *ndev_owner = NULL;
 	int err;
@@ -1764,7 +1764,7 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 	 */
 	if (dev)
 		ndev_owner = dev->dev.parent->driver->owner;
-	if (ndev_owner != bus->owner && !try_module_get(bus->owner)) {
+	if (ndev_owner != bus_owner && !try_module_get(bus_owner)) {
 		phydev_err(phydev, "failed to get the bus module\n");
 		return -EIO;
 	}
@@ -1900,8 +1900,8 @@ int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 	d->driver = NULL;
 error_put_device:
 	put_device(d);
-	if (ndev_owner != bus->owner)
-		module_put(bus->owner);
+	if (ndev_owner != bus_owner)
+		module_put(bus_owner);
 	return err;
 }
 EXPORT_SYMBOL(phy_attach_direct);
@@ -1917,6 +1917,7 @@ void phy_detach(struct phy_device *phydev)
 {
 	struct net_device *dev = phydev->attached_dev;
 	struct module *ndev_owner = NULL;
+	struct module *bus_owner;
 	struct mii_bus *bus;
 
 	if (phydev->devlink) {
@@ -1972,17 +1973,15 @@ void phy_detach(struct phy_device *phydev)
 	/* Assert the reset signal */
 	phy_device_reset(phydev, 1);
 
-	/*
-	 * The phydev might go away on the put_device() below, so avoid
-	 * a use-after-free bug by reading the underlying bus first.
-	 */
+	/* The PHY and its parent bus may be released by put_device() below. */
 	bus = phydev->mdio.bus;
+	bus_owner = bus->owner;
 
 	put_device(&phydev->mdio.dev);
 	if (dev)
 		ndev_owner = dev->dev.parent->driver->owner;
-	if (ndev_owner != bus->owner)
-		module_put(bus->owner);
+	if (ndev_owner != bus_owner)
+		module_put(bus_owner);
 }
 EXPORT_SYMBOL(phy_detach);
 

-- 
2.53.0


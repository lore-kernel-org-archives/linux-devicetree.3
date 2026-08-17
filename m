Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566753515D1
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 00:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786924842; cv=none; b=oxCVL2M5lsu4Gbq161aBmTxc4IrjSdzYRN+Sbmaj57cTo5tBpYdfkUFf6yd2D96cVf82Dy61vVkGN5HkLJiwDZXKvshUgZG37Y1//haJJH1TyZOtE+G5PbmLvX61C5N3/4m01LFZ3fFtrGRf7Whyns1Wk5glR+hDOmH402NtR8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786924842; c=relaxed/simple;
	bh=LS22LcmEJj8e3kqN7yGg2uzjNvP+oUDHt1HXDKQHKRw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mFDiQFAPLRBoXvu39Je4jA4/fIJ0o04EbIXPRqz4Bt5yfWBTo+S3j7phY7sSJajI9xI3CY+4SkxMp1RExwF2ANKWoBYCauVLalorhIpJY226DQmNnJkg2fDyhyo4krcVsp8KUGzLFNM2S8oPDhHzdrSiXhMrxkkGUjOaTqZRta4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLkgRSgf; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLkgRSgf"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-49c38a4f110so1757849b6e.1
        for <devicetree@vger.kernel.org>; Sun, 16 Aug 2026 17:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786924839; x=1787529639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhr9mz2HpwDudTQs8av6vCMLVNHxqCHiSdPs5GamCT4=;
        b=nLkgRSgf5Bb6kUfn8dcHmpYI4d8N0GDLAeC7Dy0aWJrlA/NxYHFoqL6U7aGgIvPXDI
         IrQ04lspld8VengPH58ajHI1FG/KoXUesSP/kKexZP+y+EXLnBDBL1gLcFxOxWDlPx2N
         dF7JxF1qHOAik150kxEuirx3OI3fAy/kCt7SKNLLb04aR4frqJ5jCRU+goxl6kLygwns
         s8yjr8XmGfQ+IhRfOYmdimrx5IuPUJytiVs6XrujpHEg4jk272JJwttyAxjiYrnviED5
         b4Aebv9L6EsoMuA7Kdr0M24uLduvFZ6vKKpzT2j7P9/Rr/1ngNa1tc74BeoaLKhnLyaz
         whJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786924839; x=1787529639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yhr9mz2HpwDudTQs8av6vCMLVNHxqCHiSdPs5GamCT4=;
        b=UHOmDG/4j5sA7jw3HaTTgaNjhTnd5D2WcjTthzAyULjQnvRpzQhDyT1vO9khVxk5tu
         JIb4i/EGmDxR2CiM8IwirgPpvP+6FoEWodEutmgaYP14/LWlcOsv0f5h0q4VOAhElp6e
         +NbC+00SGHzM8muEqWdrq/D0c+rvcdM3V6/2AN6tHlBL6+pBhSaRWPq7Rztx+/2LWzd1
         VcX7toNDp8JbfdwHZ54A9NM5mWUMvb0/lRrK7DYOX5A/veGNwRggba3HWH+PeW68jUrW
         e/7VQgD2GWBDeGfbyXBCAkQMYf1W1kvCzlhWXj6AKfVEyZTDe27reS6RI/Hkl0fhxpB3
         z61g==
X-Gm-Message-State: AOJu0YzqUjrTWZe/biydK86kEBImRZ1talVVgs33VDqTlvBHixm0o2aL
	NFpXBUi7szW5pj0ILfkc7UHsWhOThusmt6gxjNZfN/ZAIvvn2OFzZaUi
X-Gm-Gg: AR+sD121Qwl0bhFFQcUdXUYIacYLCVxxH4hHhqRfgg4WwkIWENtS0THhYOc8NcjIOw/
	jZcffpHryKR/KQe7iFA0a9nd1wM8YHrZkJdxa91qfDWWb2XV3vzasIDKzN3fxbd35ZtHDxYq/PH
	pFoX6L6RGaP+n7T+v2UvU/jHLXDLFqtJwRFLQ29h2L3JDkWpMFG7V0e5W1kRdgWL3v2XOUl4H8l
	zjI/99bflVpnMJeKR51Tnn3vIUbC8dhICmhv1EQkEbgrucpAKubxXjkqhEg1wK3OY1OzoGHJMwL
	bZY+ZWm7XlaRVaDDEueERUymNds+bzEInnvJZ5EIbJIHSU1DSDtxmvSmXZWX/3rRD1d6z7LGNk2
	Kw7VIuO8VEpnWqBNloYhzIuL1lr9rhBo/5eSBY4+aS7vrR0oniUbczDkugG0luhoSsCWQ2itFtA
	UPICvhouUp4YumgBIXWgQHeAAgHUUvBSW5uN/aFAIAkCpP+iLtt6Goqx28M3RJM9aqFUbCjWwuX
	jO4QBxgs3JWl5SXQTwkdaTvWccgFIzqSO5ZM8DmJjJ215H9Rmv1eSg3qBpSffEjt/oQ79T/NxKF
	CZJoCu5JGtL9WR8gcGWkeL0lAiicAUY+Ilibe8oklmp8AwqgBw+ex8RUO0/EOSV4R66sbN/rCXf
	lu2rZdICrYB51RkpP
X-Received: by 2002:a05:6808:1486:b0:48c:4c00:596a with SMTP id 5614622812f47-4b2414ef9ebmr23059139b6e.5.1786924839124;
        Sun, 16 Aug 2026 17:00:39 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2714dc18asm2556802b6e.17.2026.08.16.17.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 17:00:38 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Aug 2026 18:00:30 -0600
Subject: [PATCH net-next v2 3/4] of: property: link PHY package suppliers
 to member PHYs
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-submit-phy-package-fwdevlink-v1-v2-3-23e55dd59fad@gmail.com>
References: <20260816-submit-phy-package-fwdevlink-v1-v2-0-23e55dd59fad@gmail.com>
In-Reply-To: <20260816-submit-phy-package-fwdevlink-v1-v2-0-23e55dd59fad@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Christian Marangi <ansuelsmth@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, netdev@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Ethernet PHY package nodes describe shared resources for their member
PHYs, but are not populated as struct devices. fw_devlink consequently
represents the package dependencies with proxy links to the closest
ancestor device.

The MDIO bus is a class device without a driver, so such a proxy can
remain available indefinitely and prevent a supplier from receiving its
sync_state() callback even after every PHY has probed.

Treat every enabled member PHY as a consumer of the common package
suppliers. The links can then be converted to links for the real PHY
devices and retired through their normal driver lifecycle.

Fixes: 385ef48f4686 ("net: phy: add support for scanning PHY in PHY packages nodes")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/of/property.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 38c0c7dc428a..d59bcb1f29de 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1272,6 +1272,20 @@ static void of_link_to_phandle(struct device_node *con_np,
 		tmp_np = of_get_next_parent(tmp_np);
 	}
 
+	/*
+	 * An Ethernet PHY package node describes resources shared by its member
+	 * PHYs, but is not populated as a struct device. Link every enabled
+	 * member PHY to those suppliers so fw_devlink can use the real consumer
+	 * devices instead of leaving a proxy link on the MDIO bus indefinitely.
+	 */
+	if (of_node_name_eq(con_np, "ethernet-phy-package")) {
+		for_each_available_child_of_node_scoped(con_np, child)
+			fwnode_link_add(of_fwnode_handle(child),
+					of_fwnode_handle(sup_np), flags);
+
+		return;
+	}
+
 	fwnode_link_add(of_fwnode_handle(con_np), of_fwnode_handle(sup_np), flags);
 }
 

-- 
2.53.0


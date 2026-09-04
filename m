Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01C0521228
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 19:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548611; cv=none; b=PrmYX0AKyhSYznwVVSqpUOredjkqTZwqhPwXm7RQqY47vDGEZ6n9kCigwGQHcXT+B3exy/B1QFeqXFFEiRrUMI2c6vzG6uy07fiM2jnnSkLifBwP6HxX6BInmRB/hBXEh13YlDoFxbjl3s+YoDFgaXonAy/e7geEgLcrqFlBjFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548611; c=relaxed/simple;
	bh=yfXfFA1c3vQG1+Ye7UxWHbvarQ+1G95ouDiPWPxXcDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XdQpHwxWDTr65vRp9GtonLz2mLgm16kcDGJiuRa05uDxV11iCrIw6dOD7PlFRso9Aj/gHdX3UxCE/Ajw9pSALRpnxhIyLRubOHJHta7rACxKYjXHnccXpYYTnvn1qnSdTSD7EtuGy4pafJA/41UoVluRxjX9KKJpceiUNWIMAmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=REvQzaHS; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="REvQzaHS"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso15409795e9.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 12:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788548601; x=1789153401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CMh5lYeH3aGg59+QPJC3P1Oz0qgidcMVPi+b3gENV5I=;
        b=REvQzaHSJtV3hEBDt0Zye8R4e1GhaX3CB5shzqz/lZhvQXG+J4PxnVyoKbZFmAD64k
         NZ40P2MeQLhrnOdpPvM2Ym/lb0LLFBbQNAJmLZ4kg/npdsWD0sIAiwyxOq6dAfupXGlb
         vESAxdyUmmNHCKeVCp566frDoJld/t+TgG3+W55VlmdZmEMkPhQo5pbHI34o+fKvZldi
         kl0WeSs8T/R5pselR0H2HYy6bFcWWAKQvuck5i0jioLJmzwMgNHH/dwguhRrnOwM4Cvc
         lc+oc0fxf5nkBYEildoOGcx7bKXwSNU7m0psAOlZF/Tk2+1k/rNWEyOIMbpD/WD9xMa6
         E3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788548601; x=1789153401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CMh5lYeH3aGg59+QPJC3P1Oz0qgidcMVPi+b3gENV5I=;
        b=UlspfJIOy1Vw+6VRQHCy4uVuHjZp1nxb2H/CiM8XMhNWmSRrgIEnRdnUuxIBsa61tb
         mfkWBGZd5bmMw0vN8alSKagGaNkTSYAD8klWVmzSThURf6ZgpCEEl9fIM0y2BBBTILcY
         /ky+X/nW+1ARda+lXZB++KS+7m+ccIaKc1YLB9zymj8QvojJd8EnenbLqfKlPTl27NFP
         MaF5tqvAc7ICNQTJ2QUiCYtq4S/L7osiPhaQT2gsQt1+xnnIjgTV17r42OSoi1f+XaPA
         hSww6WGjR9Ota+rg7trUp7e2hhlfIw5ItpFGxov4XGah9Ehp7pMDDeqHcuhhxSsUoajA
         3Htg==
X-Forwarded-Encrypted: i=1; AKwUvBx3aZN7s/qnL3mkLlXX5m1WQD3m0QXEiYFGmLAx3b05PIfQpYtvuct1UUAECdaHHE8I73i/PjGuU9X1@vger.kernel.org
X-Gm-Message-State: AFuF++nyP7hhxwDa7w2+QcStgwYxTJFrcqMI1knmo84obYQq3XJ/eHyX
	TbspmCkZwkida3WzuRkysQf2fJ3/P/fpoOr0UlpvMZCJZdYPGn5e78y3B48Comkg488=
X-Gm-Gg: AYBFou16FTZv9Dq7lRbHsmABR5AfZ/jjORI7wUd/KV0HoPHMbie5eM1IHSxTN6C6R/R
	MXN/Q89GXj6KgQoKtKHB9fctwtgcyHaiElxeTBPAby+AatvZf/o3FUi6pU+3f52YOgX3QuAl2SE
	pzcXUPvkDK7CsM5CSMfJC5wtjklI6uZOHvLUutDkaPmA3LyCPQfmHGb9HeHc2o3ZPFXwNo6n4Wb
	8vGTLwdJ6fQcRmmJvqax+NuvqqY9NjWLUeYzeIXs75BGF+gtX4QN76Nqyyvt3Uj8zvQooSzN2le
	M9niyDcX/mnzil9UwFcjKsGJEGNHt+QOwHihFZl6XH+pAM8sQlNRRpGq+Et73MHrtrYXDRG9aJh
	UXj4AmAD38KoYQXyAbgWW9X3iOcjXcwtZOEn9FxRRZ8jXcPr5N422RH9ZpBrHvmBaXG4ocJnuqs
	VlJEsSc5CxylqEZ5BCZCxZXDoEKksRZ+pHl4SCu1s=
X-Received: by 2002:a05:600c:4e11:b0:49c:f2f4:eddd with SMTP id 5b1f17b1804b1-49cf8268795mr95772385e9.16.1788548600659;
        Fri, 04 Sep 2026 12:03:20 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d8a6sm172195485e9.10.2026.09.04.12.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:03:20 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Eric Woudstra <ericwouds@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next v2 10/10] net: phylink: report no link modes while a late PHY is missing
Date: Fri,  4 Sep 2026 19:03:04 +0000
Message-ID: <dd73c57289fb07fef0da931709ae4a957b5fdf69.1788548229.git.f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788548229.git.f@lex.la>
References: <cover.1788548229.git.f@lex.la>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A port waiting for its PHY reported the MAC's full set of link modes and
accepted settings for them, which describes a link that cannot come up.
Report an empty set and refuse to configure until the PHY arrives. Every
path through net/ethtool/ zeroes the reply before the get op, so the
pending path only stamps the unknown speed and duplex.

Setting pause parameters needs the same guard, because it is gated on
the same MAC-derived mask; reading them does not, since it reports the
configured request rather than a capability. The EEE calls need no guard
either: they already return -EOPNOTSUPP when no PHY is attached.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 drivers/net/phy/phylink.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index bceeac954779..942d5fe943a1 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2290,6 +2290,11 @@ EXPORT_SYMBOL_GPL(phylink_connect_phy);
 #define PHYLINK_SLOW_PHY_WARN_MS	60000
 #define PHYLINK_SLOW_PHY_POLL_MAX_MS	30000
 
+static bool phylink_slow_phy_pending(struct phylink *pl)
+{
+	return pl->slow_phy_fwnode && !pl->phydev;
+}
+
 /* Bound, not drv: drv is published before the driver's probe runs. The
  * device lock cannot be taken under rtnl, and losing this race costs a
  * generic-driver attach, not memory safety.
@@ -3087,6 +3092,14 @@ int phylink_ethtool_ksettings_get(struct phylink *pl,
 
 	ASSERT_RTNL();
 
+	/* No PHY yet: the port supports nothing, not what the MAC alone can. */
+	if (phylink_slow_phy_pending(pl)) {
+		kset->base.port = pl->link_port;
+		kset->base.speed = SPEED_UNKNOWN;
+		kset->base.duplex = DUPLEX_UNKNOWN;
+		return 0;
+	}
+
 	if (pl->phydev)
 		phy_ethtool_ksettings_get(pl->phydev, kset);
 	else
@@ -3159,6 +3172,10 @@ int phylink_ethtool_ksettings_set(struct phylink *pl,
 
 	ASSERT_RTNL();
 
+	/* Would configure the MAC alone, for a link that cannot come up. */
+	if (phylink_slow_phy_pending(pl))
+		return -EOPNOTSUPP;
+
 	if (pl->phydev) {
 		struct ethtool_link_ksettings phy_kset = *kset;
 
@@ -3373,6 +3390,10 @@ int phylink_ethtool_set_pauseparam(struct phylink *pl,
 	if (pl->req_link_an_mode == MLO_AN_FIXED)
 		return -EOPNOTSUPP;
 
+	/* pl->supported still describes the MAC, so the test below passes. */
+	if (phylink_slow_phy_pending(pl))
+		return -EOPNOTSUPP;
+
 	if (!phylink_test(pl->supported, Pause) &&
 	    !phylink_test(pl->supported, Asym_Pause))
 		return -EOPNOTSUPP;
-- 
2.53.0


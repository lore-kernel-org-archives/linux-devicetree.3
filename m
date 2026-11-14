Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794653076;
	b=Ku3IZ6xMQOsyGprnGkR4iaJOWy9jca67nH2N38yHvyrC+fGRyJu2SUcLnbTJ46nPd3wP
	 J86G6tpbR8R6WsPPNPqqbPJNr1wh8gDFmw+MBIvzaYCllY1mClN/1av1M70wc2JDDQn77
	 2pVq0VRiq/XyzWw/NBiuWf8wa/FrPsKCgEH+6BHix+UNQ8KqRAPmpbrVr6OdOkxiGYPeu
	 6+XkLmYVX9fCaMgmQxkoO4uXJwU7dnWWtIhlXoJIioP227ODgsnpRW2ndwKloCBNy0TRs
	 Vi0V548CVfSBlVTb6R3kGfbOOMnmE6WITlAPUybf5hAhV9dmsUh/8gSZ2iAYiyC0cQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794653076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TeLAZiZGj+97MWa7ReJZxgbnws7A1jvXyF4Ap0n10zw=;
	b=cxKo6oLbmfq4W7p+8meWhL2+z+HEqCa+nJCrAL9ZALPm+I51dDlLOB7AtYHkJnLjIo5J
	 tzGSN12IAWSg2HW8qerarIcs1/4mb8w/xs/UF0Wye7MAmrX7douEXb3DVJEIJkO1GKiBF
	 ZZ6ExQ10bQqAxcXiRsFKhYUZcwSCwhWa45RINvEUZGFIfktlxNRg2Cua+WR6kErbMnvlg
	 HapvCG5pZi/poA6r5GYNSensTAFJvPvPm9qwjP16MvStUuLzw358k0+RDEfUA3M8jrXwC
	 b4NompQZuqxMhHqeC6Mnre2JW8Ov96MVZiC4BmUTt8Fc0AcrTc/ViMB/Q4NyqbQVlQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZpaORhkx;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C5D606A33A
	for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 10:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87C5D606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZpaORhkx
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so25241375e9.0
        for <devicetree@vger.kernel.org>; Sat, 14 Nov 2026 02:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794653075; x=1795257875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TeLAZiZGj+97MWa7ReJZxgbnws7A1jvXyF4Ap0n10zw=;
        b=ZpaORhkxfgHskmS7Tyg/sZApKd0c4evYnbZ+R70mFfFkAQczDt4xteRVZ0bknhasjr
         +rO8uBnEzWnrrfBVR60b4mE50aJJDUqZ8Ohx4z6O4UU+saGPasWRVOJDnRnwfbv9bVov
         +88JqW21RAEJxnuzsT9Sh62pTF5OPMBgzB5n8/CquLut72d8GRe/vopnvQjiTUzcuzjU
         H2Cm3l4j2Lk7g4yY5COGFUjv658BG2QkV9n3wUWW/CYqJ0hs0CYb629OQbpVzMJP5sAY
         4O8PryyHCsf5bMKvOrxo6xKUMNSeR899I4Y8YFQtyJ5mgtX80If7Ws92dHQsvcLrW3QS
         TRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794653075; x=1795257875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TeLAZiZGj+97MWa7ReJZxgbnws7A1jvXyF4Ap0n10zw=;
        b=lH9mbpr3DViDClMMea9R8EtcZaJfmNaQ8LIFYzYXHg3L8Pp7GqDRld73oWiDVNlfqV
         s+g5BU7uFp1VolZflm0KIPDzpIylozz4cCxqcjqnzVAKr6S0s9i5aNsqF2WbSgQKISwI
         JTClHVxI25pTRvc0MY3MyWr47sEhs8HHkNacfC7XHoEdP77lkmubczpbl6TMNmnnBnHg
         u1NcCs7cbTcgO8ttt8l+h1myiac2tFAAS4vGx5RYNYtAacMS2p+EynhpGLahtDrxXBiA
         t1ZxtAERsjl9jwQAQCVBDa4WSKilmj2DXB2IvLWEQawytRcZkmhsWbPmozP0jfXDQJd2
         pQ3w==
X-Forwarded-Encrypted: i=1; AL+hErF3aIdIiigu4LtvtL1Tft9BLSXx0LkkuuxCYV5sG15MExx64Kwo4wpGu0hCGf/cNmyvs7yDpV6Qoxrk@vger.kernel.org
X-Gm-Message-State: APuU4Z9jsU7qEt+0ZagphOAbbQOHgfj8n32qZ6q+VFLUl9CJgsF1azL+
	L7qFfM6UuyZ2s1EjKDjPeS7Xv7pRYqnpZ74y1irLXQUC9QWEQncdt+hr
X-Gm-Gg: AYBFou1FyOC2UnRKfN1viz+4P/7MsAayTjX4ladn5rwbD4P15KPaV1lTLn2YjAafwiH
	mtJRHpM7bUJmDshCpC+35Vmtt5vwQgZ/UjjlZpXWsQ1bNzmNLrwXdFtxrJJ433rESQEGjv6AfWF
	Dvp2D0uQSUBv5GqQ3mxrGkNIxAOJpeJ+U/ruje8Jg71v6i6enLq5XaXoDx2tuyzjYQsSsyDHr3r
	PRt8dyFwHe9LIzaNnzZGgQ/M49dzn96hVs3EQlwERNqkeKedXSnX+kDsphR1MiHHkmYeEPhPQ1O
	NGbqliAhs/RICVkOje/mxhuDg37ybsNR/kRzlCTVxnR4dDBVuxhBet2vE67tWJiGZ0GSC/5NP5A
	5zjrxO7J7e7u1euhgC7+svhkrf5i9NIJlWN+yOMjJhRZugaQ3H4mtRcCpkhHOld/9iZvsf+7P7l
	d6aavBAlqGo198dGBZrnzKRH3ZoL8sP+EONS/lX/yviGzHCGGqqFSTvh9aVRB8zjkp7zEHcvZgN
	fWt6tzyA1uwCCSa0y96UJZbfJxuyRCkCod8yzOuILS8QvokQuh87YyeyU6zCmYICEJgA5Y1qNzl
	vFIEOK4Nmf6K3g/PDUPgmCRKzSIbl/g70yu/W+GMLAzMqi2WCRM5dyu1Z7J3nA9kOth59OwxkqG
	V+RXdzbOfQVHXwyKwsOLJ+QDHBa/cXhljUKw=
X-Received: by 2002:a05:600c:3495:b0:4bb:6847:7943 with SMTP id 5b1f17b1804b1-4bb68477c73mr8647025e9.26.1794653074802;
        Sat, 14 Nov 2026 02:44:34 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb56719391sm52858285e9.1.2026.11.14.02.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 02:44:34 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v20 01/15] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Sat, 14 Nov 2026 11:43:40 +0100
Message-ID: <20261114104426.235620-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114104426.235620-1-ansuelsmth@gmail.com>
References: <20261114104426.235620-1-ansuelsmth@gmail.com>
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

Add in phylink struct a copy of supported_interfaces from phylink_config
and make use of that instead of relying on phylink_config value.

This in preparation for support of PCS handling internally to phylink
where a PCS can be removed or added after the phylink is created and we
need both a reference of the supported_interfaces value from
phylink_config and an internal value that can be updated with the new
PCS info.

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index e7734e45376c..5d649903be9e 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -62,6 +62,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -632,7 +637,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -2090,6 +2095,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2212,7 +2220,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -3026,12 +3034,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
 		return interface;
 	}
 
-	if (!test_bit(interface, pl->config->supported_interfaces)) {
+	if (!test_bit(interface, pl->supported_interfaces)) {
 		phylink_err(pl,
 			    "selection of interface failed, SFP selected %s (%u) but MAC supports %*pbl\n",
 			    phy_modes(interface), interface,
 			    (int)PHY_INTERFACE_MODE_MAX,
-			    pl->config->supported_interfaces);
+			    pl->supported_interfaces);
 		return PHY_INTERFACE_MODE_NA;
 	}
 
@@ -3910,14 +3918,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
 	phylink_dbg(pl, "optical SFP: interfaces=[mac=%*pbl, sfp=%*pbl]\n",
 		    (int)PHY_INTERFACE_MODE_MAX,
-		    pl->config->supported_interfaces,
+		    pl->supported_interfaces,
 		    (int)PHY_INTERFACE_MODE_MAX,
 		    pl->sfp_interfaces);
 
 	/* Find the union of the supported interfaces by the PCS/MAC and
 	 * the SFP module.
 	 */
-	phy_interface_and(pl->sfp_interfaces, pl->config->supported_interfaces,
+	phy_interface_and(pl->sfp_interfaces, pl->supported_interfaces,
 			  pl->sfp_interfaces);
 	if (phy_interface_empty(pl->sfp_interfaces)) {
 		phylink_err(pl, "unsupported SFP module: no common interface modes\n");
@@ -4155,7 +4163,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	phy_set_upstream_port(phy, pl->sfp_cage_port);
 
-- 
2.55.0


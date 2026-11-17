Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919214;
	b=2vW4Ga6GUyD5PO8n4L5H2XcaFdenkTdm2gBfhcvL+zL0uWRsvrkWSvRbuao5/nJa1WAQ
	 JlXKYXu8/k6ao9qI2RPiNKKCYjCRfQkeZnpjCbCpaqqRUzTc6Q8dvvt9DumyK/DV6+/nv
	 AKsV5grJWoumQxwVI2MTx5K3MFJCSfpdW5ObTnjpsS8So+FhPfMsL40HAucXWqRoJYr6h
	 MKdS4HJRYeK2zDMsa+8EepeYbf+iYuzS4FOh29Zh4hUsQzCtwuMNIgvi3spjMSYityEur
	 gonuIRuALLcKhsEqNGMnJgTcOVbeopdOqFWYkZPA3x+1eaEbc+8ng1Cq2WYAzMSFjKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
	b=OAcDr3Cps5FAO8O1hb0USMDEf8JI3lR829NnfFfhyiP6o2cU1cshr8Llf9CgbqFY7wFi
	 BijW4U5wfvJGtmtb+zhxjZqjdT7mUrIN+peFL43D5TnhpPkm0JUPZ3aPJq3tvZOWQKsGA
	 H/vrtGg2fqLpw++xRxCsJy15JxAdu5Nm3KQ9qgEI7J9gDv5RWPdCEqVTBU5FU5HYsF6jq
	 0xWSEfABpZwCapkwGBXTh5IbJzSDCLRtFIsejwfs+YIYtHFaTI3Pc/PmguawIM2+T0zEW
	 1NxOW7+lABUj0CAJAAri/V945awragWyefXxpzvbH8+rnU1pcwsU3F6hSngcwGh1T4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fh2bEDIR;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31B460A3829
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 12:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C31B460A3829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fh2bEDIR
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so33278625e9.1
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 04:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919212; x=1795524012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
        b=Fh2bEDIR/d4uWsXPkBfajsg5Nj7BImqYBDcRS4r+K6kCFwgeO+dcKNai4X+1/lmKmc
         1gISntCorZBotrgw7gWmMS29Ac1jNLiXIbTNJJci4zTdvWCsrgMm7m0aKIk9NHFx1UJP
         QHP770xVZniMTDC45tVGF2RNJERWAAfLIMPoV9QmQvL0citbFzUX90QPouysWgIJ/f1n
         AXgfs7Aj60F2QXBV2EB1MZy6FXJkE72sj2yoZFtNwX2brRbnryjsuoMBIHhotID6UXRj
         nxUHsoTME3V609QEQcv8buE5iT8roh1KFQUJ/X0GjBiThB/lsqoBJcrO9xvw26IercKs
         pcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919212; x=1795524012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l3AZy4riXXi7OLtUVBY6GfrY+Mq1552Tq5et+9Ive2c=;
        b=IjVP3RBV9DSLI3XIKvPrcYBzIGxGdnPE1Mrz9DWheArigUCBGzSxv4exj8NAcC8LmY
         CgUaPofo1KqbMaL/HrKha/qjYjrsmuYRIIea+r74R3wC4STaW5HS+pLnxV7IBzdsig3n
         v+dOjZN0Lb6Em2U8FADdFeDg/jock3fyO4DbJDNQeC2od7TSQteMqwnytJi7rIqaDCGC
         /LDwK9AWMmGbgdc4DvFNlInlJcvwAASEgruocuZV3Nd28Ef78CTx5vzyhQs2gjd2liim
         phU4O2xD9sLHWGEtYsl4SNPeVOJQDkHfywpYhN+tyef4m+e2elgT12SzShbirZJtZCkV
         llvg==
X-Forwarded-Encrypted: i=1; AL+hErFf7QvcIMxbAjcQI3tSll9oupygaMudH4HaGVeollHBfodsRsQGhANHwz+wUPquHYjdtvKJQGywIiCC@vger.kernel.org
X-Gm-Message-State: APuU4Z/z2g9fCkwQRKF+bbr4ZnSarT8/sYKE+y4at5t8+kHo0TYNijqP
	fXVntYcDcFhpdTLKX/fYSmObd25VeLumZtsczzGIebfMinzETSO3Vgrs
X-Gm-Gg: AYBFou2DkXe6ay2IkMcLbVAeNYCnqLK10SI+IhgdSCSOanZjBehmpdotwbox3oUHuTu
	9O3yTbDj6n+KTwVui40bub7FxSw5zcNwToU9ZAfwwMu3u/e1XMgRRCjX8uWMfJa2ZYEeOaRvbqQ
	6qHBe0GT2zIWhGjz6ivx6e1X5kFRJ78QZB+8lwp/t9J4RFxrHO75zfJcA01QSnweEucl0CVLpxT
	19SgG69SdEpYDm9j3FvwaMZphqFCHZVbkoOmowdr+w5jT4UfOKYiK0QvXcVHJFz6im5TYBC86uM
	0ScpgI3lljPuhs603QaM4v255ku3TJs/s+3R6u/GmUxxymmquJWMrQOeBA1A6AtHDphqXPxWePv
	vhRdR2AwrD+0Q1FiTIXLVhajbsSYNzlGfIvwtjwHxnqHffLHtb2NIbUCOc6S9RVKgJuBceIw7h0
	+jUTpVZl79QMeT0JW8OAPqd5ZKluGM/ZN+A8weKw4I9UM8JyQcebN/f/tTH1933VwIqNsXR2OG7
	6Z6UO6zPSs/jHytLq/l2O+xf8QtnhXTExma/sMQZTRVyVliS5TuGiOb8Mi1XdLxqeTkLKLx7Zii
	wYG35vjW9ltaqY16EPBAF9s1ov1wllDqoGV6ob1FLDws7MxDgcsd2LuAw5PHacbSK6ZerX1xIvW
	2thBWGJfl2eln14HGLAB1O304q8IexthU3u81N6yBvqeE4ABoqN3iFG0=
X-Received: by 2002:a05:600c:4f07:b0:4bb:6a5a:7834 with SMTP id 5b1f17b1804b1-4bb6a5a7a48mr183926425e9.20.1794919212027;
        Tue, 17 Nov 2026 04:40:12 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb78386902sm73367065e9.1.2026.11.17.04.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:40:11 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
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
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v22 02/15] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Tue, 17 Nov 2026 13:39:42 +0100
Message-ID: <20261117123956.11981-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117123956.11981-1-ansuelsmth@gmail.com>
References: <20261117123956.11981-1-ansuelsmth@gmail.com>
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
 drivers/net/phy/phylink.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index d9d0ace2042e..f482dc608810 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -63,6 +63,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -633,7 +638,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -1788,7 +1793,7 @@ static int phylink_create_sfp_cage_port(struct phylink *pl)
 	port->is_mii = true;
 	port->active = true;
 
-	phy_interface_and(port->interfaces, pl->config->supported_interfaces,
+	phy_interface_and(port->interfaces, pl->supported_interfaces,
 			  phylink_sfp_interfaces);
 	phy_port_update_supported(port);
 
@@ -2091,6 +2096,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
 	phylink_validate(pl, pl->supported, &pl->link_config);
@@ -2218,7 +2226,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -3037,12 +3045,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3921,14 +3929,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -4166,7 +4174,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	phy_set_upstream_port(phy, pl->sfp_cage_port);
 
-- 
2.55.0


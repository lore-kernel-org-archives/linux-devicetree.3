Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438F04ADD8C
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 18:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005650; cv=none; b=b/4j5E9uWY9w9G+hd5IHRzocutzYR8HRSLJwY/wY7yWyH9ttCV8YOLMYfJ9Touo46gwe6RVn8pDwNRb7xd4irRaf5im2WdaE6JcNCFmeyRArg9bNp2RJvabAtl7FyivOQ6JSZZv5yrnzv878w84K9cPS1ygHI/eT6Esp+TqrtB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005650; c=relaxed/simple;
	bh=ZcRVlQJeNRXK2M0MgaksgKzLa1cJRySbcnQ11oZN5aQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kz5BvpANvzBLR3H/jMzKlozmaUvMSMauFZHihZwzbqjGFN0GeDQgwMNAaBgYgH5rxwVCoz1zXubAKpW3dTkWSiEPxUs+C1/MMhtUbJUKDvNZhYSuOV/dCHKjDug4IucDbfeKJ0U3ntPUJtFsHr0aoy3ojAX19zX0YbjhECcPSko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvDXuRF+; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvDXuRF+"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso42572955e9.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 11:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005647; x=1778610447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=SvDXuRF+lFDJDRyv0I8OXmIcdJARFI1sg6o7DOVddSkaL6GUdT6tVYmoXfv+reMhFY
         rAIDvjbmAxK502EY8vB6qfY3hnwzclVxM8R2D9lNBiIDwDd127gZQ5TLG5WWL2HS542v
         cNmdOHwJ+AYPV/cgr9rKU3ewukdgqOkSRwcidOJP4XE1rz32VzM4jDd+CBqBpXRkZ/ss
         E8QFTUO99VIgUVCdMM6EjwmBogtd3PwKDrc8RS6mS1AMi8AdYhMP2xfxWWoGO6Zakvfl
         Bm6XmkZYH63uSC9BoBELc/1RTtQ2EyNFApjxDMK5OE1Kz7Z+D9CiIJqs7vMa/nJsNlVh
         7jww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005647; x=1778610447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0DEjqI/MjSZk63smQxo8R3imVIUNR3yg/nfskjDHjk=;
        b=boFO3D8tdELP31srRW4m6Nokcb1yRBid9oOH9fwc0FOkwFtXc4HhS81E0WC8ib2AEf
         7PD9L+VbvlJjiI8eSK3buPtoERXHe0BMyoO7VSeaqZk2bkFDqGsHGYQJvzoXHetrtXK7
         cqulD29jM9BL9mvV+eqV697vF9HQddttC1mOFT3ZZMiB5RmW6zASj+clH/kzzX8269Nk
         hyVwvHYEWWuabDJ2K8Fh2DI1T+EaAeNFl7gBtzTeZD7GCkwcOhvNN1V8wGpGjlH7al18
         0lVmP7OXPZ4mwugJNNHtBE9ZTE8qu7OMP84LGp2fMvUfQ+DpMq18vdwXPMHuaovIlq6b
         rTLA==
X-Forwarded-Encrypted: i=1; AFNElJ85zw+jumvHVquQ1+9D3lVJG1JPEz1dISz2tYPhgQh45TGHnSWtdgOo9oeHEsBL31Wv0hYtdnEyl/Xo@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+GXqMaPqktit1CYuXWkjUOLtKq8m2xym1mGZotxFoHZGEejTH
	Zcz2I4hpBag8HYMmOwP4hTgVN42bL0KnmS5WAvCjEb1mqYe7rb8KjP1W
X-Gm-Gg: AeBDieuftRs4uT8uo0ZUkTqPZ/V0zVuOmRHh/szXoWkqSltY51PzIRKNhJEyZxjrk3H
	nImeJJN6TgpvcqW8UUo6mQ8NsgFpVintH/vYseQ8htoJl0cfO3R8YywKErWGREKf/eobmvA1TGv
	vyZj39Cl/2gr8EVimlut36GyXEJiDkJ/ABCEKr7w8m7NO6todKwTCF+wJmbbSmSiCnmMS5sKDRL
	xMOLUKmI8skl2eANVgrSueT+AAQ9RCB0eaL5rHHtpAukdcN7XWEXVlcCrfyOEFLanhsqCfpxbD4
	UK6/CcNSLdUx/LYZuM1x9kzBoNC6/7nIQFpPCrMGRmiurUi+N1YHNOXgiqCMUGfrdV/q8XfJe/z
	9jzEF6v18oa9MQEus/erbNYOytJnrh+3tI3ln4q9XKJ7xziFNGQDspMGFSnGMlX03XqEcf2J8/T
	LcSEOfPDJno2hSCu4eyNVuX3dbP7b/cBxVj4NRbHeix4kwy3FRb9A+DdxQee7uKdHsNxuvsb6ab
	USLDyM=
X-Received: by 2002:a05:600c:a412:b0:48b:339:73cf with SMTP id 5b1f17b1804b1-48e51f184ebmr5001945e9.1.1778005646464;
        Tue, 05 May 2026 11:27:26 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:26 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next RFC PATCH v5 01/10] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Tue,  5 May 2026 20:27:02 +0200
Message-ID: <20260505182713.27644-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505182713.27644-1-ansuelsmth@gmail.com>
References: <20260505182713.27644-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add in phylink struct a copy of supported_interfaces from phylink_config
and make use of that instead of relying on phylink_config value.

This in preparation for support of PCS handling internally to phylink
where a PCS can be removed or added after the phylink is created and we
need both a reference of the supported_interfaces value from
phylink_config and an internal value that can be updated with the new
PCS info.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 087ac63f9193..4d59c0dd78db 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -60,6 +60,11 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* What interface are supported by the current link.
+	 * Can change on removal or addition of new PCS.
+	 */
+	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+
 	/* The current settings */
 	phy_interface_t cur_interface;
 
@@ -629,7 +634,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -1868,6 +1873,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	mutex_init(&pl->state_mutex);
 	INIT_WORK(&pl->resolve, phylink_resolve);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   config->supported_interfaces);
+
 	pl->config = config;
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
@@ -2026,7 +2034,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2828,12 +2836,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3761,14 +3769,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -3939,7 +3947,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.53.0


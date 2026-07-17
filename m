Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F8C3CF1FC
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 06:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271314; cv=none; b=hwyXPzPk8IZvhEqhw+GdxqPhGpF/xybCRquuZk/HaC7weGHvf9GRrvZWpknhajoZ7vWW4z1QYs3GBo887qFOvDhF+nTPbBVbILNb6ZiT5+J5k1bcq8AfwAjKXdLKtBsqdLIW4bzpcuOMBbb4nwF177OMBN6CxRDcD3D8x2AaJQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271314; c=relaxed/simple;
	bh=CJvqDLmPG24fOFkd+XITnf0C1yZg7Dy1/8JZEY/tTGY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UHNz2/4kX/2kQx5H9L/3RfhqaX4rtkxdZ7h96DHCqp7PGEc//cic+OsYBTpwwZs/NPc8cECmh8L31ebCo0EDXOsrOsrbiD/3g95/bTm+HbkKWqhLimN01qeam/ZQ2yhmS+zQfzWV9Ly3/rnE02zIwm7t6pnVAzNH90KqQlIRch8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCzExuBw; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCzExuBw"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-495437bb891so8431625e9.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 23:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271310; x=1784876110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z0uRZpPkHTFGQEhRIP55ce7iIYoUNOFMFnyc5qdnNIQ=;
        b=NCzExuBw4t94AXqZENzfcDW+JjAVn3t9S6dFw2i8hkdLyFVsFHTGg86vymG52fb9By
         kb2sGDxlioN/zLVOPGpt3trY1nDZyRoXK9t5OlqR6f5RhyuQmVkqb6Flxq0lmIoP0JQk
         S6o6LJjlODf761azulKh4XydJFIp2t2iT4o32BXi2cBrekYQ8N0PskmOcdXAtkc9JV3t
         yBO5Bmbjw2YoDrufcuVkbpo1F4HsX76or8PPuEJ95j0PRfad6FxvjXhKyI51ayZC7AiC
         VpIabpFyIeO+CYZ8ntF6wJMOgB0f23OAWqO//FS2qKNrXNWsWOFzPtQUYcpXSlb+8+sD
         JJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271310; x=1784876110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Z0uRZpPkHTFGQEhRIP55ce7iIYoUNOFMFnyc5qdnNIQ=;
        b=M/ZVaEYH+jhZfB5IglcMUqhwn1rBWSs8kyjdmuN+LS361tRzfSH+PfkjpF5Zhu0FLF
         OUX6K61LoT+C0GTzso8fF7WoBO+r+JEA9okoI5xpNkOxV1i/S3UiAiKbwK6bSwl847bM
         ojq0+hY8XrF48MexS6ADSWtPKeCHRi9qknPcDrnO8A+RM5KSIZXM6FZnCx0bcMj9+ETu
         EaG5mgqERS6xKMhlqYImGhyZ8zled9xFCF0ReC0lSuGyxV+Hh+czqv9uOrSnWGQcEeHn
         jKC6/4dVEqGeaS5XfZLF7Qenv95/5k1NKTE1Bwz1OBPrm6zJbTi4dND3N6jZl2x2G+Ls
         mjLg==
X-Forwarded-Encrypted: i=1; AHgh+Ro5ZgAUWGH7pJnsKgGRHAaJshGIM569jrxewCesh1PnzcLchpQ7U2+0FRhPCrt5GkiZZa1btX+AEUEl@vger.kernel.org
X-Gm-Message-State: AOJu0YwBp9SlFnxBeVZPrKlcVjz4OAYY1+QABGnHuqanSXE1zozmTluW
	9nPixEksjrVQjXfDKCWPDCtdFG91fdWWihWcvwmw59uiyINGlRdCC9VF
X-Gm-Gg: AfdE7ckBK1FlNNt4KyVubDjfKGUGczxL/erJfV0DSZ+llWNDecpfCUxxjdzzZ1LQKZ6
	h7echYFyd7Cu5d4yLfkEadoyqnsAuLNub+F4cG3eWLozB1Qvs1NFdzQq6Ts8P2ztToSrD0Cr37K
	6ckmYWJDffSJoEVk8GMeT3XtCni0bvsTr/laUQZo14v378t4kLJptU00JNWRY0NH0TXqTd1W860
	pJ5QgPDO5skWyiyfx64AjCj6Nx8qaKmvGebpgHMt15ZJUemaEgAAuOu4WFbaeD5G0dImt34SUPU
	9d65+6DV7GXWAi5qHFlwq1VXWmCSXyMIGoXvA1T9vrCP3zUdydHPXNNGPT+vh0fjU89DNCUMTCI
	x7Vq9q4W+DlxFRxI0cthBGOsqAOfTaUI9cr/vGfoh2xpjdgO2MNgtWHjN5SbOesKbUoug8dhF7Y
	dZN67i10VX9N07xompSBV6spRl9fTgJcUMlPol2KPk/ZbSieBhDa5ggGxyEopZFyTYRR4+PQ==
X-Received: by 2002:a05:600c:a210:b0:493:c566:7bd6 with SMTP id 5b1f17b1804b1-4954a341bcdmr7403935e9.18.1784271309770;
        Thu, 16 Jul 2026 23:55:09 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm24260835e9.0.2026.07.16.23.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:55:09 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v9 01/12] net: phylink: keep and use MAC supported_interfaces in phylink struct
Date: Fri, 17 Jul 2026 08:54:01 +0200
Message-ID: <20260717065448.1498335-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717065448.1498335-1-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
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
index 59dfe35afa54..3464e3ec5699 100644
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
 
@@ -628,7 +633,7 @@ static int phylink_validate_mask(struct phylink *pl, struct phy_device *phy,
 static int phylink_validate(struct phylink *pl, unsigned long *supported,
 			    struct phylink_link_state *state)
 {
-	const unsigned long *interfaces = pl->config->supported_interfaces;
+	const unsigned long *interfaces = pl->supported_interfaces;
 
 	if (state->interface == PHY_INTERFACE_MODE_NA)
 		return phylink_validate_mask(pl, NULL, supported, state,
@@ -1867,6 +1872,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 	mutex_init(&pl->state_mutex);
 	INIT_WORK(&pl->resolve, phylink_resolve);
 
+	phy_interface_copy(pl->supported_interfaces,
+			   config->supported_interfaces);
+
 	pl->config = config;
 	if (config->type == PHYLINK_NETDEV) {
 		pl->netdev = to_net_dev(config->dev);
@@ -2025,7 +2033,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
 		 * those which the host supports.
 		 */
 		phy_interface_and(interfaces, phy->possible_interfaces,
-				  pl->config->supported_interfaces);
+				  pl->supported_interfaces);
 
 		if (phy_interface_empty(interfaces)) {
 			phylink_err(pl, "PHY has no common interfaces\n");
@@ -2827,12 +2835,12 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
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
 
@@ -3760,14 +3768,14 @@ static int phylink_sfp_config_optical(struct phylink *pl)
 
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
@@ -3938,7 +3946,7 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
 
 	/* Set the PHY's host supported interfaces */
 	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
-			  pl->config->supported_interfaces);
+			  pl->supported_interfaces);
 
 	/* Do the initial configuration */
 	return phylink_sfp_config_phy(pl, phy);
-- 
2.53.0


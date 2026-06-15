Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950663EB10E
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 12:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526646; cv=none; b=CwIedinKvQxE+PKYtCYG9tv5rvQGm93Ry723jZSOW8qixuAWjZVSLvkAlEbD88Qpzt5tpgHxx0vEz0j+Yh6Xra0YLRH4n/2GAEIW9q9Llwa+PqLke7oBMYBpYjmAMRWFlridqIO6lPzSc2R3hyPYZbOu+eC4pbEaGqw6jjmqfy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526646; c=relaxed/simple;
	bh=LiGJAO0/VUutQ0zWhOKOU6ESlza0YssOsxbuxpLi/68=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QR0BgCS8+slH2Cw4NaR4qj6Bfp+C2gf/nnzacBCsamZbQM9lUVdYUEMTzaAvDceyvsPMSjfzGMKCHAV4/15XBG4H6S8pHYLLC/8YXNUX+ImIUjADszU4E3rv9z/K/yUt/i1D59QNVwAxorlVPCwCJoAclZ18KtQNuMBUsUtM0TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUj7679Q; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUj7679Q"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso42920275e9.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 05:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781526639; x=1782131439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LeREqKwyBL2tZifBDIM4b8FY1VqpNjyArTkAWxSLkSU=;
        b=JUj7679QAhKQy9liM0ZUDJxZDiorzbE3AQnB7jRP+WS/UfXqFu8LWqH7HapAU0W0Ql
         hfq2MeIAatms7DTfxiU0v0LANMzaV4Eu3aSmIE6z9jVQEIxK1aZZ3lK0KDGZj9qKylEy
         BxPFVGJ99MfPvSSo+vGllmY1HxcgzUJv5N1gDp9t/COvoUzOBkABLsqdl4H7PcM9GwDa
         cojVNi4bqYWRExTyHzH0N4ku36m0MSPoDqq4W7BzwrplMFUH03Glm7aROHDNtBlvUj++
         dP6y7Xx+jOY9qRumEVi6cjNYIP2w5fyJM93bL3FMPX1GD4IgWpnsUSiTmntjLI2n/VhR
         XCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526639; x=1782131439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LeREqKwyBL2tZifBDIM4b8FY1VqpNjyArTkAWxSLkSU=;
        b=SHCotOhHEesq+Eb+KWpSLuAv5K8SoMtHNNw41C0NXADo4J5MHvnDkmsoJ5LZdptoc/
         IplTF6f5Uqxdjz6+gG+o5pe8o3XveQgeAaAL5BgqLKEw2W8h2QdivdncvJRz9FgQMBcG
         xijvHn0/YK1YxGcPC8LvhQOF00HbE38v+ugcRs+lqFp2zaMXvxVsAXXB3PYWTQwSXUTx
         XbFvIyvAbx9sV1qK9Izsp6S45mrB2w2EUEb7ay//GAnofp0m/3CMrOBrfvNLLdY3JuT1
         RB5LY0SCOSnmu1QqUDojk3zoD1u//V3F23ozHW7xJ2LRloKXcElVjuH5WJK297aU0qvw
         eG1A==
X-Forwarded-Encrypted: i=1; AFNElJ+ve8lnvACyjbTXedAnp5JI2yCcoi2DgInCNsBFHO2/7HfEPyJE6J59FDVOUfiYM0/iE6Px9obIitSA@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx3MH2adxV8CkyuwPuRwdfhdLBbVDJGFSdkaqixnkKtZ+zl+pq
	BsZJzyao0CcwXdxfjv2nZ4ni3WD+xRRa3QW7lQT0Ekc2ygCigu2qAcyl
X-Gm-Gg: Acq92OHMJIVodOGdScVm32WaUYnDFlwoxk4q2QQ6WPltCLatyc7vMzoA7kBnrxqwJIW
	eb/8NBxoA+qyZNKTQ5Da2BFxScWII2JMK2Vzhmk4FpXfJnzczM1/ImZVZ1YzEhBRyf8pNTgIo57
	Jyg2wLLz59v+3XYkLZzFiPjr6JIorr0ootqNMlK/rRPW7+0jIvhC/Iki7+VfpRVOfFCEpKluNlN
	S0yaMh/CJI9TY54WRVVwOXpW9W7KJZB0OM9rjWNvLZ84dMN2RKj4TMmKeIYvma+joHQQIIVLihE
	kb+adB14gacztWOqe/+VFo8KAU/XIqcELK9xIorkUu/j/10vbYQMr9VtMhjTwni45n2EIpPZI/0
	lYBNZ4VRZE5ExiqQSrsbnb9dt2BoK+BS187yulEnOspeyQcXm1W3x2GLJU1+SfEx1MlUh7KVei3
	ukk8OYaSh7Okm4VAWw9qmVtuMqI4m/ddT3qyfpAu02OlFjK8/tpoxg68TY4s/XA1oEPA==
X-Received: by 2002:a05:600c:3512:b0:491:9969:739d with SMTP id 5b1f17b1804b1-4922011393fmr139236575e9.29.1781526638312;
        Mon, 15 Jun 2026 05:30:38 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-490ea95c512sm191426435e9.2.2026.06.15.05.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:30:36 -0700 (PDT)
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
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v7 03/12] net: phylink: add phylink_release_pcs() to externally release a PCS
Date: Mon, 15 Jun 2026 14:29:39 +0200
Message-ID: <20260615122950.22281-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260615122950.22281-1-ansuelsmth@gmail.com>
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add phylink_release_pcs() to externally release a PCS from a phylink
instance. This can be used to handle case when a single PCS needs to be
removed and the phylink instance needs to be refreshed.

On calling phylink_release_pcs(), the PCS will be removed from the
phylink internal PCS list and the phylink supported_interfaces value is
reparsed with the remaining PCS interfaces.

Also a phylink resolve is triggered to handle the PCS removal.

The flag force_major_config is set to make phylink resolve reconfigure
the interface (even if it didn't change).
This is needed to handle the special case when the current PCS used
by phylink is removed and a major_config is needed to propagae the
configuration change. With this option enabled we also force mac_config
even if the PHY link is not up for the in-band case.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 53 +++++++++++++++++++++++++++++++++++++++
 include/linux/phylink.h   |  2 ++
 2 files changed, 55 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index cb07184ce82f..ca4dad4b140a 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -158,6 +158,7 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
 static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
 
 static void phylink_run_resolve(struct phylink *pl);
+static void phylink_pcs_disable(struct phylink_pcs *pcs);
 
 /**
  * phylink_set_port_modes() - set the port type modes in the ethtool mask
@@ -918,6 +919,58 @@ static void phylink_resolve_an_pause(struct phylink_link_state *state)
 	}
 }
 
+/**
+ * phylink_release_pcs - Removes a PCS from the phylink PCS available list
+ * @pcs: a pointer to the phylink_pcs struct to be released
+ *
+ * This function release a PCS from the phylink PCS available list if
+ * actually in use. It also refreshes the supported interfaces of the
+ * phylink instance by copying the supported interfaces from the phylink
+ * conf and merging the supported interfaces of the remaining available PCS
+ * in the list and trigger a resolve.
+ */
+void phylink_release_pcs(struct phylink_pcs *pcs)
+{
+	struct phylink *pl;
+
+	ASSERT_RTNL();
+
+	pl = pcs->phylink;
+	if (!pl)
+		return;
+
+	list_del(&pcs->list);
+	pcs->phylink = NULL;
+
+	mutex_lock(&pl->state_mutex);
+
+	/* Check if we are removing the PCS currently
+	 * in use by phylink. If this is the case,
+	 * force phylink resolve to reconfigure the interface
+	 * mode, disable the current PCS and set the
+	 * phylink PCS to NULL.
+	 */
+	if (pl->pcs == pcs) {
+		phylink_pcs_disable(pl->pcs);
+
+		pl->force_major_config = true;
+		pl->pcs = NULL;
+	}
+
+	mutex_unlock(&pl->state_mutex);
+
+	/* Refresh supported interfaces */
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
+
+	phylink_run_resolve(pl);
+}
+EXPORT_SYMBOL_GPL(phylink_release_pcs);
+
 static unsigned int phylink_pcs_inband_caps(struct phylink_pcs *pcs,
 				    phy_interface_t interface)
 {
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index ca9dfc142388..15e6b1a39dfe 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -751,6 +751,8 @@ void phylink_disconnect_phy(struct phylink *);
 int phylink_set_fixed_link(struct phylink *,
 			   const struct phylink_link_state *);
 
+void phylink_release_pcs(struct phylink_pcs *pcs);
+
 void phylink_mac_change(struct phylink *, bool up);
 void phylink_pcs_change(struct phylink_pcs *, bool up);
 
-- 
2.53.0


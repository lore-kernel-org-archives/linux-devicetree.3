Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529971;
	b=SN0CaxiDlLRB1bQDVRXown07SAAXF814rSkbKiR6f2WmGTvobuNWj94WG6cLMDoaQxjZ
	 Q6Ry6Z0ugG7KeZzOd5iz4dP5FLn4ZueWNhwTl4/XFnPz8JY5O9qDE6IjIjK1zTsTz7NaF
	 VZDUfRCXej0c0kPMTg1oAPc4pVjNp1nb7HCiGkBAnXxEIXRJstHIkEu/P5FHrbwCPoKW5
	 +eUTrZZkH1B6eyi6BW71qpDMg1F5hjQKey1ifP07H0TRis/s/YxAanGSM2nqWvsD3PFbF
	 qRc2wdSqJM8zbn+lbV2rMs3Hbs4DhLq0b4fK1LtCCR5fSF3BvygX/dIgWjUslsjRMhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BylUWaZtzobgFvG9Lv3FkvatnnkiGcmTY5l9wyJzphw=;
	b=dhJhYPH8LcjEzkD+vpXUk0FMhIyloyi9bTddKzCbBC9c2VLqkz2JB7xJxGy11q4YgNMj
	 nXs4AmUklrovFYRRgLdp5iUht02KJhUJ0wUH/Q8Y7TxyYj7o9/ADu0YOanoUuyYYlo7PR
	 N14PxCalFDZ5sWfpVmbie+g2UJo6/rW0vUHqcP0AposcVtj2hRdU7FVpE4Z6n0l4ei87h
	 JE3Kv51l9YQNTs35KtYpGc3HyjpyM3yXLYH5r7oTOneSyBArCQ1qPFG1iTanZqVqGpCOK
	 ZHp8993pq8vqoZM4jE7kK+1gVo3+8kkRiQwXhB4TXi/ddE3wc8JqZ+bIhmQ3HfLA7HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="u9/MU1bq";
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55FE60A5BFD
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E55FE60A5BFD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u9/MU1bq
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4919a880834so157476f8f.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529969; x=1795134769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BylUWaZtzobgFvG9Lv3FkvatnnkiGcmTY5l9wyJzphw=;
        b=u9/MU1bqj4Z50CRxFR84KsnORAsZIt9G+4SIm3Obix7YXoLBolicoErmQcJPpSgEMP
         9RdboAAwZx2CallhXqdFuVV05ht8x7QCX26jqqQDWUaOifhTPShLRTbBT3l4CnX+FnRt
         gdMcaueqk59JUfp/o1DYVj3Lm00esKIeLtCw40clG4mgVv1kOx7rWZpFd8Mopamm/CG8
         J5zZMSA2BAjzM8a1kl1Ut3z8iG94l59anoRZb+gInhJO/vrQH6ClNNyuiVf5dyD0/16F
         HoQkTScQtTKZ9LieWVgp464GyURttG9LS9XUr3FS4c4bkIA3ywg6/CCV0SL3qTBmwqPE
         2g2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529969; x=1795134769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BylUWaZtzobgFvG9Lv3FkvatnnkiGcmTY5l9wyJzphw=;
        b=vSYJzp1FlJdrdSVtCTs1+yqscoQa28Nwm0NZonNqiI8ZbhAqHUOlq75AkgMVGcbEsn
         Vr9KIVlRrf5J0itShNhKIfJ8Q7HlLrPgjce5W4V+Whmypx+C0SflhlkJI7ZLYH9x+uyj
         GNh4hMsmcuPd/3IMK9UrXOufcGFhojoVeZzrpZBtoC/aJomE1CxsteXNU8VFhsQGxfFR
         aGFVpKsAjGnLmpMx8+TojZaTQb70H/WiQR8g1g9a9e5CnVIrG+P3go6J0xnWooGj7Wij
         e/y1zNtjzpwhScfsUsf9uKsQ0MiP6yRGAp4RwXhznYvj0FOTkslMgiYcrwVAzRKY+WcS
         m4Lg==
X-Forwarded-Encrypted: i=1; AL+hErEphh8hH7w1baLyOeJMMHN/90wwrjoQz1aB0NCAvaOrH2Oen8GqyOnkxlNi86sMUwkwrBnZyudIDFs0@vger.kernel.org
X-Gm-Message-State: APuU4Z97ZmoLbHOKkdz6YtQf3Ix7evFfvF+UDrBRUV19nCPO9ubq3+Sb
	InTppa06kM+9zCstVzyLnq49E2Xt841ZM9qGyDdfVXsNDbJPy3ZQwpIj
X-Gm-Gg: AYBFou338Xw89NNQXTvQscKNpGjh6je043o7OSVyp+7JC6Zpu2+MiILIIAhYfK7MZIp
	JTk/yOf/Xeeg720qhaAuos3OteYD+VbMSr6TWe3s9td7tavTu+SJ3+1lNbwKkI7YqnYJYlhsp70
	LR1ztdxMVCJk601eanyU/y69TkDybQvRXoieiFdxeJwrLPwYOA+CKjTP+jec93NbQ1eb+FbuRS7
	F1Hhx8UWWi3UkU0bqI0/cBeZFbXjGOkD3SjMvcKIx2uCbMyeVPBPBA39hOl5zjJuXSGDVVUNVpg
	8WHkDxJk7/JeofZu1vhRc6ir1vMPTBBPX8Q1qzcZ6PeJaacCQNtE5WUJrOoYBm/jjt/QUYCwu2X
	rPjLKfR1TeXrkq2zJrKWS2yr0tRiovi2qYg0/6XUGgHr/Z67C9Efyq1zWrKd24RCf454sy0rNDZ
	Eqfcn0U6Bov7GY7cuPzpkc1zvATzWH46V3DoQtW/PUBOtjlNSrNlOZvMbDH6KNn9+mP2wrxfuB4
	oUv1S01Ko7c0Y9pTGzz3OgVxRFdVb+kWY8CClIXqlujDydI8TdasncHl1G01g1yX6Uxc5nO70lg
	8MjF6GlDC95WRDyrKYYiKdtXBfo7S1aAMmDh4FV8m+U73Z79jKcJkqOfDcNn+K370T9HgS7tcvg
	y8l29Ua9ln9IktgpNYlIdyfx5jkP0kxMuz33YT/hIjImsQYONmPGeMC6CNRrHJS2sIk1m/QKHiA
	U=
X-Received: by 2002:a05:6000:26cc:b0:499:978:251a with SMTP id ffacd0b85a97d-49c73259d9bmr2290543f8f.54.1794529969317;
        Thu, 12 Nov 2026 16:32:49 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:32:48 -0800 (PST)
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
Subject: [PATCH net-next v19 08/15] net: phylink: support PCS provider release
Date: Fri, 13 Nov 2026 01:31:58 +0100
Message-ID: <20261113003217.197757-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
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

Add support for release of fwnode PCS from a PCS provider.
This works by creating a global notifier for the PCS provider and
making each phylink instance that makes use of fwnode subscribe to
this notifier.

The PCS notifier will emit the event FWNODE_PCS_PROVIDER_DEL every time
a new PCS provider is released.

phylink will then react to this event and will call the new function
fwnode_pcs_matches_provider() on each PCS of the phylink instance and
will check if the PCS is provided by the PCS provider that is getting
released.

If a related PCS is found, then such PCS is removed from the phylink
instance PCS list and the supported_interfaces value is updated.

The flag force_major_config is set to make phylink resolve reconfigure
the interface (even if it didn't change).
This is needed to handle the special case when the current PCS used
by phylink is removed and a major_config is needed to propagae the
configuration change. With this option enabled we also force mac_config
even if the PHY link is not up for the in-band case.

Finally a phylink resolve is triggered to handle the PCS removal.

Protect every access of phylink pcs_list with state_mutex to handle async
PCS provider release.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/pcs/pcs.c     |  47 ++++++++++++
 drivers/net/phy/phylink.c | 148 +++++++++++++++++++++++++++++++++++---
 include/linux/pcs/pcs.h   |  69 ++++++++++++++++++
 3 files changed, 254 insertions(+), 10 deletions(-)

diff --git a/drivers/net/pcs/pcs.c b/drivers/net/pcs/pcs.c
index 39550d9a12a2..25b3248e8b93 100644
--- a/drivers/net/pcs/pcs.c
+++ b/drivers/net/pcs/pcs.c
@@ -22,6 +22,19 @@ struct fwnode_pcs_provider {
 
 static LIST_HEAD(fwnode_pcs_providers);
 static DEFINE_MUTEX(fwnode_pcs_mutex);
+static BLOCKING_NOTIFIER_HEAD(fwnode_pcs_notify_list);
+
+int register_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&fwnode_pcs_notify_list, nb);
+}
+EXPORT_SYMBOL_GPL(register_fwnode_pcs_notifier);
+
+int unregister_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&fwnode_pcs_notify_list, nb);
+}
+EXPORT_SYMBOL_GPL(unregister_fwnode_pcs_notifier);
 
 struct phylink_pcs *fwnode_pcs_simple_xlate(struct fwnode_reference_args *pcsspec,
 					    void *data)
@@ -74,6 +87,11 @@ void fwnode_pcs_del_provider(struct fwnode_pcs_provider *pp)
 
 	mutex_unlock(&fwnode_pcs_mutex);
 
+	/* Signal phylink to release any PCS from this provider */
+	blocking_notifier_call_chain(&fwnode_pcs_notify_list,
+				     FWNODE_PCS_PROVIDER_DEL,
+				     pp);
+
 	fwnode_handle_put(pp->fwnode);
 	kfree(pp);
 }
@@ -183,6 +201,35 @@ struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode, unsigned
 }
 EXPORT_SYMBOL_GPL(fwnode_pcs_get);
 
+bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
+				 const struct fwnode_handle *fwnode,
+				 struct phylink_pcs *pl_pcs)
+{
+	struct fwnode_reference_args pcsspec;
+	int index = 0;
+	int ret;
+
+	while (true) {
+		struct phylink_pcs *pcs;
+
+		ret = fwnode_parse_pcsspec(fwnode, index, NULL, &pcsspec);
+		if (ret)
+			return false;
+
+		pcs = __fwnode_pcs_get_from_pcsspec_provider(&pcsspec, provider);
+		if (!IS_ERR(pcs) && pcs == pl_pcs) {
+			fwnode_handle_put(pcsspec.fwnode);
+			return true;
+		}
+
+		fwnode_handle_put(pcsspec.fwnode);
+		index++;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(fwnode_pcs_matches_provider);
+
 unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
 {
 	struct fwnode_reference_args out_args;
diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 9f9715403215..243110e21e4b 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -11,8 +11,10 @@
 #include <linux/gpio/consumer.h>
 #include <linux/lockdep.h>
 #include <linux/netdevice.h>
+#include <linux/notifier.h>
 #include <linux/of.h>
 #include <linux/of_mdio.h>
+#include <linux/pcs/pcs.h>
 #include <linux/phy.h>
 #include <linux/phy_fixed.h>
 #include <linux/phy_link_topology.h>
@@ -68,6 +70,7 @@ struct phylink {
 
 	/* List of available PCS */
 	struct list_head pcs_list;
+	struct notifier_block fwnode_pcs_nb;
 
 	/* What interface are supported by the current link.
 	 * Can change on removal or addition of new PCS.
@@ -557,8 +560,10 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 	/* Get the PCS for this interface mode */
 	if (pl->mac_ops->mac_select_pcs) {
 		pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
-		if (IS_ERR(pcs))
+		if (IS_ERR(pcs)) {
+			mutex_unlock(&pl->state_mutex);
 			return PTR_ERR(pcs);
+		}
 	/*
 	 * Find a PCS in available PCS list for the requested interface.
 	 *
@@ -582,6 +587,7 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 		 * error and backtrace rather than oopsing the kernel.
 		 */
 		if (!pcs->ops) {
+			mutex_unlock(&pl->state_mutex);
 			phylink_err(pl, "interface %s: uninitialised PCS\n",
 				    phy_modes(state->interface));
 			dump_stack();
@@ -591,6 +597,7 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 		/* Recheck PCS to handle legacy way for .mac_select_pcs */
 		ret = phylink_validate_pcs_interface(pcs, state->interface);
 		if (ret) {
+			mutex_unlock(&pl->state_mutex);
 			phylink_err(pl, "selected PCS does not support %s\n",
 				    phy_modes(state->interface));
 			return -EINVAL;
@@ -599,8 +606,10 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 		/* Validate the link parameters with the PCS */
 		if (pcs->ops->pcs_validate) {
 			ret = pcs->ops->pcs_validate(pcs, supported, state);
-			if (ret < 0 || phylink_is_empty_linkmode(supported))
+			if (ret < 0 || phylink_is_empty_linkmode(supported)) {
+				mutex_unlock(&pl->state_mutex);
 				return -EINVAL;
+			}
 
 			/* Ensure the advertising mask is a subset of the
 			 * supported mask.
@@ -610,6 +619,8 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 		}
 	}
 
+	mutex_unlock(&pl->state_mutex);
+
 	/* Then validate the link parameters with the MAC */
 	if (pl->mac_ops->mac_get_caps)
 		capabilities = pl->mac_ops->mac_get_caps(pl->config,
@@ -720,6 +731,8 @@ static void phylink_calculate_capabilities(struct phylink *pl)
 {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(disabled_advertising);
 
+	lockdep_assert_held(&pl->state_mutex);
+
 	/* Get user-disabled advertising modes */
 	linkmode_xor(disabled_advertising, pl->advertising,
 		     pl->link_config.advertising);
@@ -727,7 +740,7 @@ static void phylink_calculate_capabilities(struct phylink *pl)
 	/* Calculate the full supported advertisement */
 	linkmode_fill(pl->supported);
 	linkmode_copy(pl->link_config.advertising, pl->supported);
-	phylink_validate(pl, pl->supported, &pl->link_config);
+	__phylink_validate(pl, pl->supported, &pl->link_config);
 
 	/* Save the newly calculated full advertisement */
 	linkmode_copy(pl->advertising, pl->link_config.advertising);
@@ -1056,6 +1069,9 @@ static unsigned int phylink_inband_caps(struct phylink *pl,
 					 phy_interface_t interface)
 {
 	struct phylink_pcs *pcs = NULL;
+	int ret = 0;
+
+	mutex_lock(&pl->state_mutex);
 
 	if (pl->mac_ops->mac_select_pcs) {
 		pcs = pl->mac_ops->mac_select_pcs(pl->config,
@@ -1072,9 +1088,14 @@ static unsigned int phylink_inband_caps(struct phylink *pl,
 	}
 
 	if (IS_ERR_OR_NULL(pcs))
-		return 0;
+		goto exit;
+
+	ret = phylink_pcs_inband_caps(pcs, interface);
+
+exit:
+	mutex_unlock(&pl->state_mutex);
 
-	return phylink_pcs_inband_caps(pcs, interface);
+	return ret;
 }
 
 static void phylink_pcs_poll_stop(struct phylink *pl)
@@ -1615,7 +1636,9 @@ static void phylink_mac_initial_config(struct phylink *pl, bool force_restart)
 	phylink_apply_manual_flow(pl, &link_state);
 	if (phy)
 		mutex_lock(&phy->lock);
+	mutex_lock(&pl->state_mutex);
 	phylink_major_config(pl, force_restart, &link_state);
+	mutex_unlock(&pl->state_mutex);
 	if (phy)
 		mutex_unlock(&phy->lock);
 }
@@ -2045,6 +2068,9 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 	if (!pcss)
 		return -ENOMEM;
 
+	/* Lock state_mutex while filling to handle PCS notify */
+	mutex_lock(&pl->state_mutex);
+
 	ret = config->fill_available_pcs(config, pcss, config->num_possible_pcs);
 	if (ret < 0)
 		goto out;
@@ -2064,11 +2090,91 @@ static int phylink_fill_available_pcs(struct phylink *pl,
 	}
 
 out:
+	mutex_unlock(&pl->state_mutex);
+
 	kfree(pcss);
 
 	return ret;
 }
 
+static void phylink_del_pcs(struct phylink *pl, struct phylink_pcs *pcs)
+{
+	lockdep_assert_held(&pl->state_mutex);
+
+	rcu_assign_pointer(pcs->phylink, NULL);
+	synchronize_rcu();
+	list_del(&pcs->list);
+
+	/*
+	 * Check if we are removing the PCS currently
+	 * in use by this phylink instance. If this is the case,
+	 * tear down the link, force phylink resolve to reconfigure the
+	 * interface mode, disable the current PCS and set the
+	 * phylink PCS to NULL.
+	 */
+	if (pl->pcs == pcs) {
+		if (pl->old_link_state) {
+			phylink_link_down(pl);
+			pl->old_link_state = false;
+		}
+		if (pl->cfg_link_an_mode == MLO_AN_INBAND)
+			timer_delete_sync(&pl->link_poll);
+		phylink_pcs_disable(pl->pcs);
+
+		pl->force_major_config = true;
+		WRITE_ONCE(pl->pcs, NULL);
+	}
+}
+
+static int pcs_provider_notify(struct notifier_block *self,
+			       unsigned long val, void *data)
+{
+	struct phylink *pl = container_of(self, struct phylink, fwnode_pcs_nb);
+	struct fwnode_pcs_provider *pp = data;
+	struct phylink_pcs *pcs, *tmp;
+	bool resolve = false;
+
+	rtnl_lock();
+	mutex_lock(&pl->state_mutex);
+
+	/*
+	 * Loop all the PCS for phylink instance and check if
+	 * this notification is relevant for some of them.
+	 */
+	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list) {
+		if (!fwnode_pcs_matches_provider(pp, pl->fwnode, pcs))
+			continue;
+
+		phylink_del_pcs(pl, pcs);
+		resolve = true;
+	}
+
+	/* Exit early if nothing has changed */
+	if (!resolve) {
+		mutex_unlock(&pl->state_mutex);
+		rtnl_unlock();
+		return NOTIFY_DONE;
+	}
+
+	/* Refresh supported interfaces */
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
+
+	/* Recalculate capabilities */
+	phylink_calculate_capabilities(pl);
+
+	mutex_unlock(&pl->state_mutex);
+	rtnl_unlock();
+
+	phylink_run_resolve(pl);
+
+	return NOTIFY_OK;
+}
+
 /**
  * phylink_update_pause_state() - Update the phylink pause frame configuration
  * @pl: a pointer to a &struct phylink instance
@@ -2279,10 +2385,18 @@ struct phylink *phylink_create(struct phylink_config *config,
 	__set_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state);
 	timer_setup(&pl->link_poll, phylink_fixed_poll, 0);
 
+	/* First register notifier for hotplug PCS events */
+	if (!phy_interface_empty(config->pcs_interfaces)) {
+		pl->fwnode_pcs_nb.notifier_call = pcs_provider_notify;
+		register_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
+	}
+
 	/* Fill the PCS list with available PCS from phylink config */
 	ret = phylink_fill_available_pcs(pl, config);
 	if (ret < 0)
-		goto free_pl;
+		goto unregister_pcs_notify;
+
+	mutex_lock(&pl->state_mutex);
 
 	/* Link available PCS to phylink */
 	list_for_each_entry(pcs, &pl->pcs_list, list)
@@ -2299,9 +2413,11 @@ struct phylink *phylink_create(struct phylink_config *config,
 
 	phylink_calculate_capabilities(pl);
 
+	mutex_unlock(&pl->state_mutex);
+
 	ret = phylink_parse_mode(pl, fwnode);
 	if (ret < 0)
-		goto unlink_pcs_list;
+		goto unregister_pcs_notify;
 
 	if (pl->cfg_link_an_mode == MLO_AN_FIXED) {
 		ret = phylink_parse_fixedlink(pl, fwnode);
@@ -2320,14 +2436,18 @@ struct phylink *phylink_create(struct phylink_config *config,
 release_link_gpio:
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
-unlink_pcs_list:
+unregister_pcs_notify:
+	if (pl->fwnode_pcs_nb.notifier_call)
+		unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
 	list_for_each_entry(pcs, &pl->pcs_list, list)
 		rcu_assign_pointer(pcs->phylink, NULL);
-
 	synchronize_rcu();
-
+	/* PCS notifier might queue a resolve, cancel it */
+	cancel_work_sync(&pl->resolve);
+	mutex_lock(&pl->state_mutex);
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
+	mutex_unlock(&pl->state_mutex);
 free_pl:
 	fwnode_handle_put(pl->fwnode);
 	kfree(pl);
@@ -2353,6 +2473,10 @@ void phylink_destroy(struct phylink *pl)
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
+	/* Unregister notifier for late PCS attach */
+	if (pl->fwnode_pcs_nb.notifier_call)
+		unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
+
 	/* Remove phylink instance from every PCS */
 	list_for_each_entry(pcs, &pl->pcs_list, list)
 		rcu_assign_pointer(pcs->phylink, NULL);
@@ -2365,10 +2489,14 @@ void phylink_destroy(struct phylink *pl)
 
 	cancel_work_sync(&pl->resolve);
 
+	mutex_lock(&pl->state_mutex);
+
 	/* Remove every PCS from phylink PCS list */
 	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
 		list_del(&pcs->list);
 
+	mutex_unlock(&pl->state_mutex);
+
 	fwnode_handle_put(pl->fwnode);
 
 	kfree(pl);
diff --git a/include/linux/pcs/pcs.h b/include/linux/pcs/pcs.h
index ef2134c578c7..83e0a2ad4b09 100644
--- a/include/linux/pcs/pcs.h
+++ b/include/linux/pcs/pcs.h
@@ -4,7 +4,38 @@
 
 #include <linux/phylink.h>
 
+enum fwnode_pcs_notify_event {
+	FWNODE_PCS_PROVIDER_DEL,
+};
+
+struct fwnode_pcs_provider;
+
 #if IS_ENABLED(CONFIG_FWNODE_PCS)
+/**
+ * register_fwnode_pcs_notifier - Register a notifier block for fwnode
+ *				  PCS events
+ * @nb: pointer to the notifier block
+ *
+ * Registers a notifier block to the fwnode_pcs_notify_list blocking
+ * notifier chain. This allows phylink instance to subscribe for
+ * PCS provider events.
+ *
+ * Returns: 0 or a negative error.
+ */
+int register_fwnode_pcs_notifier(struct notifier_block *nb);
+
+/**
+ * unregister_fwnode_pcs_notifier - Unregister a notifier block for fwnode
+ *				    PCS events
+ * @nb: pointer to the notifier block
+ *
+ * Unregisters a notifier block to the fwnode_pcs_notify_list blocking
+ * notifier chain.
+ *
+ * Returns: 0 or a negative error.
+ */
+int unregister_fwnode_pcs_notifier(struct notifier_block *nb);
+
 /**
  * fwnode_pcs_get - Retrieves a PCS from a firmware node
  * @fwnode: firmware node
@@ -19,6 +50,27 @@
 struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode,
 				   unsigned int index);
 
+/**
+ * fwnode_pcs_matches_provider() - Check whether a PCS belongs to a provider
+ * @provider: PCS provider to check
+ * @fwnode: firmware node containing the PCS references
+ * @pl_pcs: PCS to check
+ *
+ * Parse the PCS references from the "pcs-handle" property of a firmware node
+ * and use provider to determine whether pl_pcs is one of the PCS provided by
+ * provider.
+ *
+ * This function is intended to be used when handling provider removal
+ * notifications, where the provider is already known and its PCS need to be
+ * identified among the PCS associated with a phylink instance.
+ *
+ * Returns: true if pl_pcs is provided by provider and referenced by fwnode,
+ * false otherwise.
+ */
+bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
+				 const struct fwnode_handle *fwnode,
+				 struct phylink_pcs *pl_pcs);
+
 /**
  * fwnode_phylink_pcs_count - Count PCS entries described in firmware node
  * @fwnode: firmware node
@@ -52,12 +104,29 @@ int fwnode_phylink_pcs_parse(struct fwnode_handle *fwnode,
 			     struct phylink_pcs **available_pcs,
 			     unsigned int num_pcs);
 #else
+static inline int register_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int unregister_fwnode_pcs_notifier(struct notifier_block *nb)
+{
+	return -EOPNOTSUPP;
+}
+
 static inline struct phylink_pcs *fwnode_pcs_get(const struct fwnode_handle *fwnode,
 						 unsigned int index)
 {
 	return ERR_PTR(-ENOENT);
 }
 
+static inline bool fwnode_pcs_matches_provider(struct fwnode_pcs_provider *provider,
+					       const struct fwnode_handle *fwnode,
+					       struct phylink_pcs *pl_pcs)
+{
+	return false;
+}
+
 static inline unsigned int fwnode_phylink_pcs_count(struct fwnode_handle *fwnode)
 {
 	return 0;
-- 
2.55.0


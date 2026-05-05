Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841334ADDAD
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 18:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005653; cv=none; b=crN0IATMvv/uGTJ16e+oXPItogkQuGaLPWrr+TQvE9tcjGhnwFAjkxYk+rw2WJ/+LVGb7ytxf1bBj0fPJ5rfFcX4E+1Q91GFSMWDPUA93wUxoyzpVX+vfkRqGmZHLsTurRoDC2Xs+ZUZCtj10nk8C4JmxzPdGfM53p54MqHjxag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005653; c=relaxed/simple;
	bh=aFRqyiAxjvIZM7lOlAQkd+sco4gznl4kCsTPHLjT4YM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cOqC2OHb4bDmmgbCy7uR4KCFLuTRpbltiDT8IIAjT1y+8tRkNUDmgIBxT+OGMQEecoVnsNC8N1Fcpi/0+ZuPa0zQaGPqlkNVAqGlb3g4tO/IT/dBROTV/GFrWnZQgn+inT00PMdxLJym3y+wEq34OlkBo1rQuSUBmZGPIvS0WcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aE2haDa5; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aE2haDa5"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ad135063so53093675e9.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 11:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005649; x=1778610449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1xB6kfSssin2iCS0jgzSw2Kk68sCL72sL40Zd4Pfxg=;
        b=aE2haDa59vaKFv5n7NZ8WFJehfRYFdypaNWx9jza4MudYNK4BSxxA8+6nM+9OjYhnB
         Qugy2mhYlBo5v9WwhcB0zNeqfejLefzyb1MyWtd22kqepbgX+HIqMbf1kGmzVcz1cOE1
         4LqLvnGCFpw9uq7F2tmBqa/v/+4edNRcbjuJ/eSH0JYwmiEqW3XOV/W1IG3mDcCgGsDo
         5wOy0OIkXp92/vOJBFUTj1xxlxM08sTOc9m7+MlJVeoBGUcIh5FgOo+i773czyyXOFaq
         WQf8lFJa69w/TiAOWyWuzbDmY4yvnGEdn5zWT/M1lgyd/Paal2XiBQE8fecF3P8sHN/5
         1T9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005649; x=1778610449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j1xB6kfSssin2iCS0jgzSw2Kk68sCL72sL40Zd4Pfxg=;
        b=cu7q4oN1uJwqkaqSDfmFUCpokNf4ZmaFdKVnPCaGy2F9EbxIDJHKO66oNIj9TbwNDG
         9VTqUs5NpFlsjoU2C0/BMEqNAjdf5uoA8ZRa9U2CJ6B/M0cFpXbkNvsnKlXZq9Nq25qZ
         9XbD5MqBe22Av/U6Q26aiCJNSqRnc4KzjshpQQlqfTKEsb8Kl/XJLfxr6OIGfLXdUpt1
         ON4o8JPw29NBFxip3fihXKXr5uPTWdPCCOYwlvH624BdIFXKS8+Pw+CaY1n7kjUTaa0p
         fU177A2AgXw3ADJaILhkfjL4ikkDn6x72lpqi9LcFK0KuC7v23VpU0tYUEDZ2BIiN/ud
         Hfag==
X-Forwarded-Encrypted: i=1; AFNElJ/qnAdXmT5dw/Q3G4VcTuFzCtQ7CBKKrTHW8apibWyRQMCPnkVem7xql4FDI4LFg/Ez7PGdG/BVEpkr@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz6c5bHorOLgYmG3EOgEzbQYzoM09MFC9SYa7DPEO8eX0RV2N6
	WBm1L1gvBdjM7PmeA67fKaQhPoiUl5LxqV9ObRSsIqLKqJkf1yN+qyAD
X-Gm-Gg: AeBDies7HP60rJ5HTCgXMZQ6eQS89Uo2wFVCvEKsKXvf4bjaPWQKg3T7DF6P/jBJVBY
	wN2RGlkfoiTskaqfDDWJChgF474JUHwSi0xfGYd7Z0iha7pEQoBLMrEiCqu09vY4D4mQKEuxBvP
	I2mD5JqNj8TlgWBPnUFPJUiJkJ12P80yV0TlIIkZlZAvAVglZ2r5CTkjVAjUOeunIJAVWTr7KTB
	kkO7TMIkPwh4t9ey9WPz3OQNkkYyl/FAAhLPYeAN36V2eRrfMk7JOzpmV1pz2iWjo5UZE4WJQb8
	3ZmpRFWcX8uMzZSLe64IxC5/u1+oHfmnSUi2sOFJcBc9EXPc8VtkZjbP58PEUryGlbi6XLisqSa
	B58vOs1ZtkAlCHKvotlL6HUdeO6m1CmjsYjfWf9XUm1P6swww2Wm3K3sISV6Tqth6RRD3wSfOZj
	nf9Vey9ctjza2+AOK+/Bz3/j4yx55Eh72MWwRo0GP1BpcOTg1OTJPv/xeuze5CzijFFFYIcM+VC
	j1pfiM=
X-Received: by 2002:a05:600c:8011:b0:485:35d3:ce59 with SMTP id 5b1f17b1804b1-48e51e1a545mr6615225e9.10.1778005648639;
        Tue, 05 May 2026 11:27:28 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:28 -0700 (PDT)
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
Subject: [net-next RFC PATCH v5 02/10] net: phylink: introduce internal phylink PCS handling
Date: Tue,  5 May 2026 20:27:03 +0200
Message-ID: <20260505182713.27644-3-ansuelsmth@gmail.com>
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

Introduce internal handling of PCS for phylink. This is an alternative
to .mac_select_pcs that moves the selection logic of the PCS entirely to
phylink with the usage of the supported_interface value in the PCS
struct.

MAC should now provide an array of available PCS in phylink_config in
.available_pcs and fill the .num_available_pcs with the number of
elements in the array. MAC should also define a new bitmap,
pcs_interfaces, in phylink_config to define for what interface mode a
dedicated PCS is required.

On phylink_create() this array is parsed and a linked list of PCS is
created based on the PCS passed in phylink_config.
Also the supported_interface value in phylink struct is updated with the
new supported_interface from the provided PCS.

On phylink_start() every PCS in phylink PCS list gets attached to the
phylink instance. This is done by setting the phylink value in
phylink_pcs struct to the phylink instance.

On phylink_stop(), every PCS in phylink PCS list is detached from the
phylink instance. This is done by setting the phylink value in
phylink_pcs struct to NULL.

phylink_validate_mac_and_pcs(), phylink_major_config() and
phylink_inband_caps() are updated to support this new implementation
with the PCS list stored in phylink.

They will make use of phylink_validate_pcs_interface() that will loop
for every PCS in the phylink PCS available list and find one that supports
the passed interface.

phylink_validate_pcs_interface() applies the same logic of .mac_select_pcs
where if a supported_interface value is not set for the PCS struct, then
it's assumed every interface is supported.

A MAC is required to implement either a .mac_select_pcs or make use of
the PCS list implementation. Implementing both will result in a fail
on MAC/PCS validation.

phylink value in phylink_pcs struct with this implementation is used to
track from PCS side when it's attached to a phylink instance. PCS driver
will make use of this information to correctly detach from a phylink
instance if needed.

The .mac_select_pcs implementation is not changed but it's expected that
every MAC driver migrates to the new implementation to later deprecate
and remove .mac_select_pcs.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phylink.c | 149 +++++++++++++++++++++++++++++++++-----
 include/linux/phylink.h   |  11 +++
 2 files changed, 141 insertions(+), 19 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 4d59c0dd78db..1a261060d78e 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -60,6 +60,9 @@ struct phylink {
 	/* The link configuration settings */
 	struct phylink_link_state link_config;
 
+	/* List of available PCS */
+	struct list_head pcs_list;
+
 	/* What interface are supported by the current link.
 	 * Can change on removal or addition of new PCS.
 	 */
@@ -154,6 +157,8 @@ static const phy_interface_t phylink_sfp_interface_preference[] = {
 
 static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
 
+static void phylink_run_resolve(struct phylink *pl);
+
 /**
  * phylink_set_port_modes() - set the port type modes in the ethtool mask
  * @mask: ethtool link mode mask
@@ -518,22 +523,59 @@ static void phylink_validate_mask_caps(unsigned long *supported,
 	linkmode_and(state->advertising, state->advertising, mask);
 }
 
+static int phylink_validate_pcs_interface(struct phylink_pcs *pcs,
+					  phy_interface_t interface)
+{
+	/* If PCS define an empty supported_interfaces value, assume
+	 * all interface are supported.
+	 */
+	if (phy_interface_empty(pcs->supported_interfaces))
+		return 0;
+
+	/* Ensure that this PCS supports the interface mode */
+	if (!test_bit(interface, pcs->supported_interfaces))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int phylink_validate_mac_and_pcs(struct phylink *pl,
 					unsigned long *supported,
 					struct phylink_link_state *state)
 {
-	struct phylink_pcs *pcs = NULL;
 	unsigned long capabilities;
+	struct phylink_pcs *pcs;
+	bool pcs_found = false;
 	int ret;
 
 	/* Get the PCS for this interface mode */
 	if (pl->mac_ops->mac_select_pcs) {
+		/* Make sure either PCS internal validation or .mac_select_pcs
+		 * is used. Return error if both are defined.
+		 */
+		if (!list_empty(&pl->pcs_list)) {
+			phylink_err(pl, "either phylink_pcs_add() or .mac_select_pcs must be used\n");
+			return -EINVAL;
+		}
+
 		pcs = pl->mac_ops->mac_select_pcs(pl->config, state->interface);
 		if (IS_ERR(pcs))
 			return PTR_ERR(pcs);
+
+		pcs_found = !!pcs;
+	} else {
+		/* Check every assigned PCS and search for one that supports
+		 * the interface.
+		 */
+		list_for_each_entry(pcs, &pl->pcs_list, list) {
+			if (!phylink_validate_pcs_interface(pcs, state->interface)) {
+				pcs_found = true;
+				break;
+			}
+		}
 	}
 
-	if (pcs) {
+	if (pcs_found) {
 		/* The PCS, if present, must be setup before phylink_create()
 		 * has been called. If the ops is not initialised, print an
 		 * error and backtrace rather than oopsing the kernel.
@@ -545,13 +587,10 @@ static int phylink_validate_mac_and_pcs(struct phylink *pl,
 			return -EINVAL;
 		}
 
-		/* Ensure that this PCS supports the interface which the MAC
-		 * returned it for. It is an error for the MAC to return a PCS
-		 * that does not support the interface mode.
-		 */
-		if (!phy_interface_empty(pcs->supported_interfaces) &&
-		    !test_bit(state->interface, pcs->supported_interfaces)) {
-			phylink_err(pl, "MAC returned PCS which does not support %s\n",
+		/* Recheck PCS to handle legacy way for .mac_select_pcs */
+		ret = phylink_validate_pcs_interface(pcs, state->interface);
+		if (ret) {
+			phylink_err(pl, "selected PCS does not support %s\n",
 				    phy_modes(state->interface));
 			return -EINVAL;
 		}
@@ -965,12 +1004,22 @@ static unsigned int phylink_inband_caps(struct phylink *pl,
 					 phy_interface_t interface)
 {
 	struct phylink_pcs *pcs;
+	bool pcs_found = false;
 
-	if (!pl->mac_ops->mac_select_pcs)
-		return 0;
+	if (pl->mac_ops->mac_select_pcs) {
+		pcs = pl->mac_ops->mac_select_pcs(pl->config,
+						  interface);
+		pcs_found = !!pcs;
+	} else {
+		list_for_each_entry(pcs, &pl->pcs_list, list) {
+			if (!phylink_validate_pcs_interface(pcs, interface)) {
+				pcs_found = true;
+				break;
+			}
+		}
+	}
 
-	pcs = pl->mac_ops->mac_select_pcs(pl->config, interface);
-	if (!pcs)
+	if (!pcs_found)
 		return 0;
 
 	return phylink_pcs_inband_caps(pcs, interface);
@@ -1265,10 +1314,36 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 			pl->major_config_failed = true;
 			return;
 		}
+	/* Find a PCS in available PCS list for the requested interface.
+	 * This doesn't overwrite the previous .mac_select_pcs as either
+	 * .mac_select_pcs or PCS list implementation are permitted.
+	 *
+	 * Skip searching if the MAC doesn't require a dedicaed PCS for
+	 * the requested interface.
+	 */
+	} else if (test_bit(state->interface, pl->config->pcs_interfaces)) {
+		bool pcs_found = false;
+
+		list_for_each_entry(pcs, &pl->pcs_list, list) {
+			if (!phylink_validate_pcs_interface(pcs,
+							    state->interface)) {
+				pcs_found = true;
+				break;
+			}
+		}
+
+		if (!pcs_found) {
+			phylink_err(pl,
+				    "couldn't find a PCS for %s\n",
+				    phy_modes(state->interface));
 
-		pcs_changed = pl->pcs != pcs;
+			pl->major_config_failed = true;
+			return;
+		}
 	}
 
+	pcs_changed = pl->pcs != pcs;
+
 	phylink_pcs_neg_mode(pl, pcs, state->interface, state->advertising);
 
 	phylink_dbg(pl, "major config, active %s/%s/%s\n",
@@ -1295,11 +1370,13 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 	if (pcs_changed) {
 		phylink_pcs_disable(pl->pcs);
 
-		if (pl->pcs)
-			pl->pcs->phylink = NULL;
+		if (pl->mac_ops->mac_select_pcs) {
+			if (pl->pcs)
+				pl->pcs->phylink = NULL;
 
-		if (pcs)
-			pcs->phylink = pl;
+			if (pcs)
+				pcs->phylink = pl;
+		}
 
 		pl->pcs = pcs;
 	}
@@ -1855,8 +1932,9 @@ struct phylink *phylink_create(struct phylink_config *config,
 			       phy_interface_t iface,
 			       const struct phylink_mac_ops *mac_ops)
 {
+	struct phylink_pcs *pcs;
 	struct phylink *pl;
-	int ret;
+	int i, ret;
 
 	/* Validate the supplied configuration */
 	if (phy_interface_empty(config->supported_interfaces)) {
@@ -1872,9 +1950,21 @@ struct phylink *phylink_create(struct phylink_config *config,
 	mutex_init(&pl->phydev_mutex);
 	mutex_init(&pl->state_mutex);
 	INIT_WORK(&pl->resolve, phylink_resolve);
+	INIT_LIST_HEAD(&pl->pcs_list);
+
+	/* Fill the PCS list with available PCS from phylink config */
+	for (i = 0; i < config->num_available_pcs; i++) {
+		pcs = config->available_pcs[i];
+
+		list_add(&pcs->list, &pl->pcs_list);
+	}
 
 	phy_interface_copy(pl->supported_interfaces,
 			   config->supported_interfaces);
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		phy_interface_or(pl->supported_interfaces,
+				 pl->supported_interfaces,
+				 pcs->supported_interfaces);
 
 	pl->config = config;
 	if (config->type == PHYLINK_NETDEV) {
@@ -1953,10 +2043,16 @@ EXPORT_SYMBOL_GPL(phylink_create);
  */
 void phylink_destroy(struct phylink *pl)
 {
+	struct phylink_pcs *pcs, *tmp;
+
 	sfp_bus_del_upstream(pl->sfp_bus);
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
 
+	/* Remove every PCS from phylink PCS list */
+	list_for_each_entry_safe(pcs, tmp, &pl->pcs_list, list)
+		list_del(&pcs->list);
+
 	cancel_work_sync(&pl->resolve);
 	kfree(pl);
 }
@@ -2437,6 +2533,7 @@ static irqreturn_t phylink_link_handler(int irq, void *data)
  */
 void phylink_start(struct phylink *pl)
 {
+	struct phylink_pcs *pcs;
 	bool poll = false;
 
 	ASSERT_RTNL();
@@ -2463,6 +2560,10 @@ void phylink_start(struct phylink *pl)
 
 	pl->pcs_state = PCS_STATE_STARTED;
 
+	/* link available PCS to phylink struct */
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		pcs->phylink = pl;
+
 	phylink_enable_and_run_resolve(pl, PHYLINK_DISABLE_STOPPED);
 
 	if (pl->cfg_link_an_mode == MLO_AN_FIXED && pl->link_gpio) {
@@ -2507,6 +2608,8 @@ EXPORT_SYMBOL_GPL(phylink_start);
  */
 void phylink_stop(struct phylink *pl)
 {
+	struct phylink_pcs *pcs;
+
 	ASSERT_RTNL();
 
 	if (pl->sfp_bus)
@@ -2524,6 +2627,14 @@ void phylink_stop(struct phylink *pl)
 	pl->pcs_state = PCS_STATE_DOWN;
 
 	phylink_pcs_disable(pl->pcs);
+
+	/* Drop link between phylink and PCS */
+	list_for_each_entry(pcs, &pl->pcs_list, list)
+		pcs->phylink = NULL;
+
+	/* Restore original supported interfaces */
+	phy_interface_copy(pl->supported_interfaces,
+			   pl->config->supported_interfaces);
 }
 EXPORT_SYMBOL_GPL(phylink_stop);
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 2bc0db3d52ac..9c5a43febde1 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -151,6 +151,8 @@ enum phylink_op_type {
  *		     if MAC link is at %MLO_AN_FIXED mode.
  * @supported_interfaces: bitmap describing which PHY_INTERFACE_MODE_xxx
  *                        are supported by the MAC/PCS.
+ * @pcs_interfaces: bitmap describing for which PHY_INTERFACE_MODE_xxx a
+ *		    dedicated PCS is required.
  * @lpi_interfaces: bitmap describing which PHY interface modes can support
  *		    LPI signalling.
  * @mac_capabilities: MAC pause/speed/duplex capabilities.
@@ -160,6 +162,8 @@ enum phylink_op_type {
  * @wol_phy_legacy: Use Wake-on-Lan with PHY even if phy_can_wakeup() is false
  * @wol_phy_speed_ctrl: Use phy speed control on suspend/resume
  * @wol_mac_support: Bitmask of MAC supported %WAKE_* options
+ * @available_pcs: array of available phylink_pcs PCS
+ * @num_available_pcs: num of available phylink_pcs PCS
  */
 struct phylink_config {
 	struct device *dev;
@@ -172,6 +176,7 @@ struct phylink_config {
 	void (*get_fixed_state)(struct phylink_config *config,
 				struct phylink_link_state *state);
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
+	DECLARE_PHY_INTERFACE_MASK(pcs_interfaces);
 	DECLARE_PHY_INTERFACE_MASK(lpi_interfaces);
 	unsigned long mac_capabilities;
 	unsigned long lpi_capabilities;
@@ -182,6 +187,9 @@ struct phylink_config {
 	bool wol_phy_legacy;
 	bool wol_phy_speed_ctrl;
 	u32 wol_mac_support;
+
+	struct phylink_pcs **available_pcs;
+	unsigned int num_available_pcs;
 };
 
 void phylink_limit_mac_speed(struct phylink_config *config, u32 max_speed);
@@ -497,6 +505,9 @@ struct phylink_pcs {
 	struct phylink *phylink;
 	bool poll;
 	bool rxc_always_on;
+
+	/* private: */
+	struct list_head list;
 };
 
 /**
-- 
2.53.0


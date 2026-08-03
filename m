Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB053AEB2C
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 23:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785800951; cv=none; b=MsreBTtR2Y1FJRO4PM6Pj2nOJ7gAjhQgc+m+iOa0rJtFDE7C6whRkQquRpG8p1ccZM1Y38QfqsBrZQWT/Gfz9MuUzmC5c38DCkl8moupQhYIKyEL/vf3ULJfNoAIh6F93tZXJPx0fxwF73venyBM1ycZWrHSEMEWnHIfRk6gweI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785800951; c=relaxed/simple;
	bh=grXQKNe0w+OJju9ewydN5GE7QXdhO9GdUWW29RXPp8I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uQLhE8wIF/ABh8zwQStGqXtj98vUNeEFa1PR17EoLsDS5qjWGjTDMPdY5TIMn2M+0daKDfCnq3sc18G/NyAlFg4qhQjLhFoAP00h3TF7fo2cQ20kPH5cgKO5PfyThkfWtqkp+vToyTohjRT1ek3k3p/kpytIC/fkO8kWSn44gIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLQ60Ndv; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLQ60Ndv"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6ae45c58003so1755994eaf.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 16:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785800939; x=1786405739; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jdxDECJ7VkmFlnPEleTjH+xT2i4EwQ2PC/v7KEOQM2Y=;
        b=iLQ60NdvYW5X02d3QBZx6qe8PnFwlMIFLsMYzVDOjyIutadgTCw6igIA/xidsD7vJt
         cfzpeNKs0YtDkqA3lmDd9Z7TErf3LzVKvLMB67PxIsBQ8mBckytvwwal3Cj9Rzz1sUyi
         Rtr0LynM8MTJD/BWHJ/tlutDMa3b/k1PkfdfOI0p1hQcoUOwCJUeeh4bPI/K9u+7MaNj
         OOfGm8D+wK+LfaF8ZvGNqF3upFECxD29Ad05JcITEX9J5OlXj1npvToR+J3qmmWzlfXd
         clOg8MOJct10D1nkmM+m24E7p5ejVmhdmLCeRsOZUehj5FRSh50n3gBbSzy8LwetAjkG
         ahtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785800939; x=1786405739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jdxDECJ7VkmFlnPEleTjH+xT2i4EwQ2PC/v7KEOQM2Y=;
        b=Ro4bHw1Nvt+H26RqoG6IAYenO1UGcgCkaQtapsI42eoZW1yroVLof5UIPxCzyrfuvY
         lXOrTmAyLLXyhGWwOn9wbBhf1bsn6LQnDToeydw3HkLnUL0OwHLBdcUVOJErQdU4TS5d
         E/ZSw0td2tPKm+IbX4ayuyFsMWxODfVSxNSdf509UZl4yoxz4ESdfhfgv/SWxco2M/jm
         JkrjSmMqGAfmYPHTMlwZcS/DmSmKIX6KXH7L3IL84MPcLzGjQ5u90F4qG3jNQV4mALAm
         3GAlpchRwtuphoJDZ1cBbGM4tk94MLuX7/1gL2GJ8CH8894dFk88iMecQ4QY/4LFO2E9
         6UPQ==
X-Forwarded-Encrypted: i=1; AHgh+RoDsHx7s0tz0lYNritzT6Gt0k0rJWDJAibX78wa/BPWz4U6xi/n0VhfVBGownqgb7LFWV2+2RtWOB/P@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc4zWhAn4XLro+PRgF2ZBH1qggDgVvvDvx48I4BcZganP4F++K
	9Djc1yyFKRpwPikF+WFDO/HpwD+uhxyP6m733gshbCs94UbxbyS7Vrd7
X-Gm-Gg: AR+sD13Mfu4Tp5zT/VpRQcSaC4Dit0SmoGPlBk77gYQ9byRNnuD1tg5eEc4B40bC7ej
	jdQCDsasS0dbWn7IaUTHzSl7cuBLhFC6daynNIoReDyAxdlSt5ftqshXakNwvJVMI1lph/aufzp
	mcpgiZWEB3Xe9E1nbY+O4bIOlRWizjGNhuO0HxOpR1SbxeTm3iA4l4dInA38TXuJcngx+7IgD1J
	m9LDYPK7RG1AXmPlarkHj7wtkssLk8hwaEYBYxCNiyj1O030qa8kpyHtxbljQQsKP3l77gYxnYt
	rYQ5nobYrfC0sR8MX3VSlZRBvWGjl9/4wrQQlgJGsYyNFjkawr4kqpUnPdLRDT2a35mzNXATrvR
	Igr9ZwA9cSXV7HSmlcJeFWq882lojcAJ8DegCl2DjEhIhB1+b0qfEcthPWm8xdDO9LO8eejRM2L
	Kk59NoyMaEf1wJZhG6eVtZWDXaKe3SVxjdbn5Sr7+HwzYr5cnoKwZ5tMSO5OjcvXzomVGZaHQ/L
	9NMqsLwUIHIi9cARzZfKJIFrN5G0oCvGkhIjvL8vSJYi4gT2AzGJMIGQkAWNJ1h1LUy4j5lvZD1
	Ed6MBLbLh1DiGAOMOHWuHRRZseDYhd4aQ+52pg8SoQsGhgOD6spvub+a62OtRAnbETT0Yi1hAcT
	xkCxIJwgNRB0H5HZW
X-Received: by 2002:a05:6820:2010:b0:6ae:648d:9ff9 with SMTP id 006d021491bc7-6ae648dac2emr9965860eaf.26.1785800938544;
        Mon, 03 Aug 2026 16:48:58 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f60ea539sm10452201fac.8.2026.08.03.16.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 16:48:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 03 Aug 2026 17:48:12 -0600
Subject: [PATCH net-next v2 3/3] net: mdio: support dynamic OF device
 changes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-submit-mdio-of-dynamic-v2-v2-3-f8841f3124d7@gmail.com>
References: <20260803-submit-mdio-of-dynamic-v2-v2-0-f8841f3124d7@gmail.com>
In-Reply-To: <20260803-submit-mdio-of-dynamic-v2-v2-0-f8841f3124d7@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

MDIO buses enumerate firmware children only when the bus is registered.
A later DT overlay or status transition is ignored, unlike I2C and SPI.

Add an OF reconfiguration notifier. On addition, create fixed-address
PHYs and generic MDIO devices, scan free addresses for legacy PHY nodes
without reg, and recurse into Ethernet PHY packages. Track populated
nodes so static enumeration, address scanning and notifier-driven
enumeration cannot create duplicates. Walk every package child and report
the first population error without undoing devices which may already have
acquired consumers.

Serialize static and notifier-driven population while allowing a PHY
probe to enable another node on the same bus. Check the node's current
state after taking that lock so an older notification cannot override a
newer status change.

On removal, reject attached or in-flight PHYs and unregister the object
found by its OF node. This also covers PHYs found by address scanning.
Treat all PHYs in a package as one removal scope, so removing one member
cannot invalidate state used by an attached peer. Preflight overlay
removal while it can still be refused; normal changeset errors are
propagated so the caller can restore the previous state.

Hold a core MDIO change transaction across discovery and registration so
bus teardown cannot race the MDIO reads used to identify a PHY. Compile
the notifier only with CONFIG_OF_DYNAMIC and the overlay preflight only
with CONFIG_OF_OVERLAY.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - split from the ACx00 series
  - move the PHY declaration to function scope for netdev style
---
 drivers/net/mdio/of_mdio.c | 448 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 438 insertions(+), 10 deletions(-)

diff --git a/drivers/net/mdio/of_mdio.c b/drivers/net/mdio/of_mdio.c
index 051e449bbe7c..c89f88aacd8d 100644
--- a/drivers/net/mdio/of_mdio.c
+++ b/drivers/net/mdio/of_mdio.c
@@ -13,6 +13,7 @@
 #include <linux/fwnode_mdio.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/netdevice.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
@@ -20,6 +21,8 @@
 #include <linux/of_net.h>
 #include <linux/phy.h>
 #include <linux/phy_fixed.h>
+#include <linux/sched.h>
+#include <linux/string.h>
 
 #define DEFAULT_GPIO_RESET_DELAY	10	/* in microseconds */
 
@@ -27,6 +30,52 @@ MODULE_AUTHOR("Grant Likely <grant.likely@secretlab.ca>");
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("OpenFirmware MDIO bus (Ethernet PHY) accessors");
 
+#if IS_ENABLED(CONFIG_OF_DYNAMIC)
+/*
+ * OF changes can nest when probing one MDIO device enables another node on
+ * the same bus. Serialize independent changes while allowing that nesting.
+ */
+static DEFINE_MUTEX(of_mdio_reconfig_mutex);
+static struct task_struct *of_mdio_reconfig_owner;
+static unsigned int of_mdio_reconfig_depth;
+
+static void of_mdio_reconfig_lock(void)
+{
+	if (!mutex_trylock(&of_mdio_reconfig_mutex)) {
+		if (of_mdio_reconfig_owner == current) {
+			of_mdio_reconfig_depth++;
+			return;
+		}
+		mutex_lock(&of_mdio_reconfig_mutex);
+	}
+
+	WARN_ON_ONCE(of_mdio_reconfig_owner);
+	WARN_ON_ONCE(of_mdio_reconfig_depth);
+	of_mdio_reconfig_owner = current;
+	of_mdio_reconfig_depth = 1;
+}
+
+static void of_mdio_reconfig_unlock(void)
+{
+	WARN_ON_ONCE(of_mdio_reconfig_owner != current);
+	WARN_ON_ONCE(!of_mdio_reconfig_depth);
+
+	if (--of_mdio_reconfig_depth)
+		return;
+
+	of_mdio_reconfig_owner = NULL;
+	mutex_unlock(&of_mdio_reconfig_mutex);
+}
+#else
+static inline void of_mdio_reconfig_lock(void)
+{
+}
+
+static inline void of_mdio_reconfig_unlock(void)
+{
+}
+#endif
+
 /* Extract the clause 22 phy ID from the compatible string of the form
  * ethernet-phy-idAAAA.BBBB */
 static int of_get_phy_id(struct device_node *device, u32 *phy_id)
@@ -44,7 +93,7 @@ int of_mdiobus_phy_device_register(struct mii_bus *mdio, struct phy_device *phy,
 EXPORT_SYMBOL(of_mdiobus_phy_device_register);
 
 static int of_mdiobus_register_phy(struct mii_bus *mdio,
-				    struct device_node *child, u32 addr)
+				   struct device_node *child, u32 addr)
 {
 	return fwnode_mdiobus_register_phy(mdio, of_fwnode_handle(child), addr);
 }
@@ -80,10 +129,20 @@ static int of_mdiobus_register_device(struct mii_bus *mdio,
 static int of_mdiobus_register_child(struct mii_bus *mdio,
 				     struct device_node *child, u32 addr)
 {
+	int rc;
+
+	if (of_node_test_and_set_flag(child, OF_POPULATED))
+		return 0;
+
 	if (of_mdiobus_child_is_phy(child))
-		return of_mdiobus_register_phy(mdio, child, addr);
+		rc = of_mdiobus_register_phy(mdio, child, addr);
+	else
+		rc = of_mdiobus_register_device(mdio, child, addr);
 
-	return of_mdiobus_register_device(mdio, child, addr);
+	if (rc)
+		of_node_clear_flag(child, OF_POPULATED);
+
+	return rc;
 }
 
 /* The following is a list of PHY compatible strings which appear in
@@ -255,13 +314,21 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
 	if (rc)
 		return rc;
 
+	of_mdio_reconfig_lock();
+	rc = mdiobus_device_change_begin(mdio, false);
+	if (rc) {
+		of_mdio_reconfig_unlock();
+		mdiobus_unregister(mdio);
+		return rc;
+	}
+
 	/* Loop over the child nodes and register a phy_device for each phy */
 	rc = __of_mdiobus_parse_phys(mdio, np, &scanphys);
 	if (rc)
-		goto unregister;
+		goto out_change;
 
 	if (!scanphys)
-		return 0;
+		goto out_change;
 
 	/* auto scan for PHYs with empty reg property */
 	for_each_available_child_of_node(np, child) {
@@ -272,19 +339,380 @@ int __of_mdiobus_register(struct mii_bus *mdio, struct device_node *np,
 
 		rc = of_mdiobus_scan_phy(mdio, child);
 		if (rc && rc != -ENODEV)
-			goto put_unregister;
+			goto put_child;
+		rc = 0;
 	}
 
-	return 0;
+out_change:
+	mdiobus_device_change_end(mdio, false);
+	of_mdio_reconfig_unlock();
+	if (!rc)
+		return 0;
 
-put_unregister:
-	of_node_put(child);
-unregister:
 	mdiobus_unregister(mdio);
 	return rc;
+
+put_child:
+	of_node_put(child);
+	goto out_change;
 }
 EXPORT_SYMBOL(__of_mdiobus_register);
 
+#if IS_ENABLED(CONFIG_OF_DYNAMIC)
+static bool of_mdiobus_node_is_available(struct device_node *node)
+{
+	return !of_node_check_flag(node, OF_DETACHED) &&
+	       of_device_is_available(node);
+}
+
+static int of_mdiobus_add_node(struct mii_bus *mdio,
+			       struct device_node *node)
+{
+	struct device_node *child;
+	int addr, rc, ret = 0;
+
+	if (!of_mdiobus_node_is_available(node))
+		return 0;
+
+	if (of_node_name_eq(node, "ethernet-phy-package")) {
+		if (!of_property_present(node, "reg"))
+			return 0;
+
+		for_each_available_child_of_node(node, child) {
+			rc = of_mdiobus_add_node(mdio, child);
+			if (rc && rc != -ENODEV && !ret)
+				ret = rc;
+		}
+
+		return ret;
+	}
+
+	addr = of_mdio_parse_addr(&mdio->dev, node);
+	if (addr < 0)
+		rc = of_mdiobus_scan_phy(mdio, node);
+	else
+		rc = of_mdiobus_register_child(mdio, node, addr);
+
+	if (rc == -ENODEV && addr >= 0)
+		dev_err(&mdio->dev,
+			"MDIO device at address %d is missing.\n", addr);
+
+	return rc;
+}
+
+static bool of_mdiobus_node_is_busy(struct mii_bus *mdio,
+				    struct device_node *node)
+{
+	struct mdio_device *mdiodev;
+	struct phy_device *phydev;
+	bool busy = false;
+
+	if (of_node_name_eq(node, "ethernet-phy-package")) {
+		for_each_child_of_node_scoped(node, child) {
+			if (of_mdiobus_node_is_busy(mdio, child))
+				return true;
+		}
+
+		return false;
+	}
+
+	if (!of_node_check_flag(node, OF_POPULATED))
+		return false;
+
+	mdiodev = of_mdio_find_device(node);
+	if (!mdiodev)
+		return true;
+	if (mdiodev->bus != mdio) {
+		put_device(&mdiodev->dev);
+		return false;
+	}
+
+	mutex_lock(&mdio->mdio_map_lock);
+	busy = mdio->mdio_map[mdiodev->addr] != mdiodev ||
+	       (mdio->mdio_map_pending & BIT(mdiodev->addr));
+	if (mdiodev->flags & MDIO_DEVICE_FLAG_PHY) {
+		phydev = to_phy_device(&mdiodev->dev);
+		if (phydev->attached) {
+			busy = true;
+			dev_warn(&mdiodev->dev,
+				 "cannot remove an attached PHY; remove its consumer first\n");
+		}
+	}
+	mutex_unlock(&mdio->mdio_map_lock);
+	put_device(&mdiodev->dev);
+
+	return busy;
+}
+
+static struct device_node *
+of_mdiobus_get_removal_scope(struct device_node *node)
+{
+	struct device_node *parent;
+
+	if (of_node_name_eq(node, "ethernet-phy-package"))
+		return of_node_get(node);
+
+	parent = of_get_parent(node);
+	if (of_node_name_eq(parent, "ethernet-phy-package"))
+		return parent;
+
+	of_node_put(parent);
+	return of_node_get(node);
+}
+
+static int of_mdiobus_remove_node(struct mii_bus *mdio,
+				  struct device_node *node)
+{
+	struct mdio_device *mdiodev;
+	struct device_node *child;
+	int ret;
+
+	if (of_node_name_eq(node, "ethernet-phy-package")) {
+		for_each_child_of_node(node, child) {
+			ret = of_mdiobus_remove_node(mdio, child);
+			if (ret) {
+				of_node_put(child);
+				return ret;
+			}
+		}
+		return 0;
+	}
+
+	if (!of_node_check_flag(node, OF_POPULATED))
+		return 0;
+
+	/* The OF node lookup also covers PHYs found by address scanning. */
+	mdiodev = of_mdio_find_device(node);
+	if (!mdiodev)
+		return -EBUSY;
+	if (mdiodev->bus != mdio) {
+		put_device(&mdiodev->dev);
+		return -ENODEV;
+	}
+
+	ret = mdiodev->device_remove_dynamic(mdiodev);
+	if (!ret)
+		mdiodev->device_free(mdiodev);
+	put_device(&mdiodev->dev);
+
+	return ret == -ENODEV ? 0 : ret;
+}
+
+static struct mii_bus *of_mdiobus_find_parent(struct device_node *node)
+{
+	struct device_node *parent, *bus_node;
+	struct mii_bus *mdio;
+
+	parent = of_get_parent(node);
+	if (!parent)
+		return NULL;
+
+	if (of_node_name_eq(parent, "ethernet-phy-package")) {
+		if (!of_device_is_available(parent) ||
+		    !of_property_present(parent, "reg")) {
+			of_node_put(parent);
+			return NULL;
+		}
+
+		bus_node = of_get_parent(parent);
+		of_node_put(parent);
+	} else {
+		bus_node = parent;
+	}
+
+	mdio = of_mdio_find_bus(bus_node);
+	of_node_put(bus_node);
+
+	return mdio;
+}
+
+#if IS_ENABLED(CONFIG_OF_OVERLAY)
+/* Overlay entry notifier errors cannot stop removal after the tree changed. */
+static bool of_mdiobus_live_node_is_busy(struct device_node *node)
+{
+	struct device_node *scope;
+	struct mii_bus *mdio;
+	bool busy = true;
+
+	scope = of_mdiobus_get_removal_scope(node);
+	mdio = of_mdiobus_find_parent(scope);
+	if (!mdio)
+		goto out_put_scope;
+
+	if (!mdiobus_device_change_begin(mdio, true)) {
+		busy = of_mdiobus_node_is_busy(mdio, scope);
+		mdiobus_device_change_end(mdio, true);
+	}
+	put_device(&mdio->dev);
+
+out_put_scope:
+	of_node_put(scope);
+	return busy;
+}
+
+static struct device_node *
+of_mdiobus_overlay_target_child(struct device_node *target,
+				struct device_node *overlay_child)
+{
+	const char *name = kbasename(overlay_child->full_name);
+	struct device_node *child;
+
+	for_each_child_of_node(target, child) {
+		if (!of_node_cmp(kbasename(child->full_name), name))
+			return child;
+	}
+
+	return NULL;
+}
+
+static bool of_mdiobus_overlay_node_is_busy(struct device_node *overlay,
+					    struct device_node *target,
+					    bool added)
+{
+	struct device_node *overlay_child, *target_child;
+	bool busy, child_added;
+
+	if ((added || of_property_present(overlay, "status")) &&
+	    of_mdiobus_live_node_is_busy(target))
+		return true;
+
+	for_each_child_of_node(overlay, overlay_child) {
+		target_child = of_mdiobus_overlay_target_child(target,
+							       overlay_child);
+		if (!target_child)
+			continue;
+
+		child_added = of_node_check_flag(target_child, OF_OVERLAY);
+		busy = of_mdiobus_overlay_node_is_busy(overlay_child,
+						       target_child, child_added);
+		of_node_put(target_child);
+		if (busy) {
+			of_node_put(overlay_child);
+			return true;
+		}
+	}
+
+	return false;
+}
+
+static int of_mdiobus_overlay_notify(struct notifier_block *nb,
+				     unsigned long action, void *arg)
+{
+	struct of_overlay_notify_data *nd = arg;
+	bool busy;
+
+	if (action != OF_OVERLAY_PRE_REMOVE)
+		return NOTIFY_OK;
+
+	of_mdio_reconfig_lock();
+	busy = of_mdiobus_overlay_node_is_busy(nd->overlay, nd->target,
+					       false);
+	of_mdio_reconfig_unlock();
+
+	return busy ? notifier_from_errno(-EBUSY) : NOTIFY_OK;
+}
+
+static struct notifier_block of_mdio_overlay_notifier = {
+	.notifier_call = of_mdiobus_overlay_notify,
+};
+#endif
+
+static int of_mdiobus_notify(struct notifier_block *nb, unsigned long action,
+			     void *arg)
+{
+	struct of_reconfig_data *rd = arg;
+	struct device_node *scope;
+	struct mii_bus *mdio;
+	enum of_reconfig_change change;
+	bool removing;
+	int rc, ret = NOTIFY_OK;
+
+	of_mdio_reconfig_lock();
+	change = of_reconfig_get_state_change(action, rd);
+	switch (change) {
+	case OF_RECONFIG_CHANGE_ADD:
+		/* A newer change may have made this notification stale. */
+		if (!of_mdiobus_node_is_available(rd->dn))
+			goto out_unlock;
+		removing = false;
+		break;
+	case OF_RECONFIG_CHANGE_REMOVE:
+		/* A newer change may have made this notification stale. */
+		if (of_mdiobus_node_is_available(rd->dn))
+			goto out_unlock;
+		removing = true;
+		break;
+	default:
+		goto out_unlock;
+	}
+
+	mdio = of_mdiobus_find_parent(rd->dn);
+	if (!mdio)
+		goto out_unlock;
+
+	rc = mdiobus_device_change_begin(mdio, removing);
+	if (rc) {
+		if (!removing)
+			ret = notifier_from_errno(-EPROBE_DEFER);
+		goto out_put_mdio;
+	}
+
+	if (!removing) {
+		rc = of_mdiobus_add_node(mdio, rd->dn);
+	} else {
+		/* The node may already be detached from its parent hierarchy. */
+		scope = of_mdiobus_get_removal_scope(rd->dn);
+		if (of_mdiobus_node_is_busy(mdio, scope))
+			rc = -EBUSY;
+		else
+			rc = of_mdiobus_remove_node(mdio, rd->dn);
+		of_node_put(scope);
+	}
+
+	mdiobus_device_change_end(mdio, removing);
+	if (rc && (removing || rc != -ENODEV))
+		ret = notifier_from_errno(rc);
+
+out_put_mdio:
+	put_device(&mdio->dev);
+out_unlock:
+	of_mdio_reconfig_unlock();
+
+	return ret;
+}
+
+static struct notifier_block of_mdio_notifier = {
+	.notifier_call = of_mdiobus_notify,
+};
+
+static int __init of_mdio_init(void)
+{
+	int ret;
+
+	ret = of_reconfig_notifier_register(&of_mdio_notifier);
+	if (ret)
+		return ret;
+
+#if IS_ENABLED(CONFIG_OF_OVERLAY)
+	ret = of_overlay_notifier_register(&of_mdio_overlay_notifier);
+	if (ret)
+		of_reconfig_notifier_unregister(&of_mdio_notifier);
+#endif
+
+	return ret;
+}
+module_init(of_mdio_init);
+
+static void __exit of_mdio_exit(void)
+{
+#if IS_ENABLED(CONFIG_OF_OVERLAY)
+	of_overlay_notifier_unregister(&of_mdio_overlay_notifier);
+#endif
+	of_reconfig_notifier_unregister(&of_mdio_notifier);
+}
+module_exit(of_mdio_exit);
+#endif /* CONFIG_OF_DYNAMIC */
+
 /**
  * of_mdio_find_device - Given a device tree node, find the mdio_device
  * @np: pointer to the mdio_device's device tree node

-- 
2.53.0


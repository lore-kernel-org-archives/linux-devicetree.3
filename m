Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8713C0A17
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 06:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271326; cv=none; b=edwNXymtJ4z4u8O6TF8eWjyVK+9nwM/xnph09l81QReWkZnZ2cmJvjjs+Wa8GA+oRZRYGHxZnTOQsNUQC8cJyDha3kEa0A9fNrazQbE4Ccyoj801IIKBcA8L95WS9fXg76DEDEyTHh3+qfzIL2dNWolDl01awwenxXgorQeTMLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271326; c=relaxed/simple;
	bh=G2FXsp8rc8X6cn3GN9/7ENRjhOMTdXRbI6ic9QN690w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fh2NyjfUhxc9mz0pLQbam1S04WxpR+BFXVPTXCqiNeSV5cXvFvKwbSxEvSES8ZZ2LG4dTraskLJ7bjEiw47YlxOGI1aeavL7H5+PfveWAS9/OoJ+6efnK5b618CrbzAl8J/V8T98U7gGiA5qRswncwZ1+Q8zy6FSECW9CYZKz7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=On5Qfv8h; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="On5Qfv8h"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493f60208a5so62053765e9.3
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 23:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271320; x=1784876120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aWBKkXCPnVX9y0NE85TytOyaJugeSr3Fnil+IDh5DbM=;
        b=On5Qfv8h8OHEQcuvzjeSGScjmiaVmUhB6/hCbhKYyHpmvkIBQOYLCYlX9ctPgOxH3m
         YznfbrpUt+CPLyNqEZiv2wwbMEumVMLTRuLb7LdbpqJTCTQRNl7ypBUtIhTJJ7BYuF1U
         /5vaT9T4bx5/nYa5NNHPM0D57zH7BJj4Hl8agnBF8G+XDRt5aDPNDSLqNEPB0N7C2jPb
         adYTpLISuYgzudc2upHVPfYknJzGWCo3XjeAGDPPjzCDSZxC+IKDpE5TS4sPUzjBJhMk
         Ag1QPuuEunCUP/XAwTf1o5h9L+92vPC4YZUe3wHN2ENs8vA248eVwhTEaLjEt0tvPXj7
         QiCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271320; x=1784876120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aWBKkXCPnVX9y0NE85TytOyaJugeSr3Fnil+IDh5DbM=;
        b=NbLJfsj4Mt5dGss3OdMzMugTcVv8ag7IBqJ/HFPpMz58k10gcW0/N+37gQPn8ZNYGS
         a1CsCbNN2t+LTFK++wpgXEI9T8uIXC2s1y74GklH+vgdgs8q/NMK52fXJ2ZUtpDVZEPD
         vHTWF2b9fyw1qnK38yufFJdY19n6+jENjs/q+2bBoPwPx3h0lBthNteLqdO8bCRjvfTO
         KLfDSAVnKry72djKcDyH0jJZGq34ENGPmG3ZYNdAc7S7udr7r6DDAUibY62PEedExgtQ
         P/cOS+40IUndM1+29d06KYvXzooYSnoMhhZjPNMLrRA+CDNjrDbMZutXSIL/9RHPdTO8
         SGUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1Q8/QEoJm1HOgs9eDfShZlUmFEkNQR2UktK6zuJqJ5zWUjuU5j6PW1/Tl/jEyzT+YotNyT1Szr7M5@vger.kernel.org
X-Gm-Message-State: AOJu0YyQfhy62265E9lE/5cDJ5cPPIa6eHn6npIuFaKYCG5kmOjjFass
	v2gjzMlcUy4uv+J9Mhzibrfyd/dlRepf9CLFwJADAe9T3LjZnQPr2kIq
X-Gm-Gg: AfdE7cnQu8FE9ke0helYhvvQ6Dh/KCGxHzLalbv3HfuqYWTkwhIjJO72ka/Yr622RV6
	CMugw4MFZjb8W1vlRMLy/56JE5kBqAvfX1cLSVxBN/97pLdHs6MS8wyB3/0TtFc6TNeDBfBni4l
	YQ60KeV43iKVo4mv7tX9FCjFlw0cgAIuGsblm4cxBRnJwQxYLPMZ0MNDe7M98VKSlWxcB6TOUD4
	7DOBc995At1dwegIcfEirelMOD7rEpQLs6TfPOTe/PoEwCwzaJ1LlrDod4siGbeJfcFjdjd+kj2
	VMEJbcyP8rZZJ2eb3EL64FYU3nQWryxTRNziewV+IcrmNAlPEtrU6QLYiszudgIax9ak/s2pr3C
	sqOaM3CPlzpqzxkGdINljtLMiSLKHTPdNzixSop+4yW7BKr482Ymmo5iSFrCsdmCeaH4ID/5FyO
	/936W1JK+ra4aCa2eG3IDUT4haDzBKFWoqu9tFOSqSzhNHm2X2RdjoTo7fRjVWWQ5B+B0AVQ==
X-Received: by 2002:a7b:c4da:0:b0:493:bd71:6084 with SMTP id 5b1f17b1804b1-4954a50bcd9mr8537915e9.31.1784271319600;
        Thu, 16 Jul 2026 23:55:19 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm24260835e9.0.2026.07.16.23.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:55:19 -0700 (PDT)
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
Subject: [PATCH net-next v9 06/12] net: Document PCS subsystem
Date: Fri, 17 Jul 2026 08:54:06 +0200
Message-ID: <20260717065448.1498335-7-ansuelsmth@gmail.com>
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

Add extensive documentation of the new PCS subsystem and the fwnode
implementation with producer/consumer API.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/networking/index.rst |   1 +
 Documentation/networking/pcs.rst   | 229 +++++++++++++++++++++++++++++
 2 files changed, 230 insertions(+)
 create mode 100644 Documentation/networking/pcs.rst

diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index 44a422ad3b05..3fce8f6ac089 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -28,6 +28,7 @@ Contents:
    net_failover
    page_pool
    phy
+   pcs
    sfp-phylink
    alias
    bridge
diff --git a/Documentation/networking/pcs.rst b/Documentation/networking/pcs.rst
new file mode 100644
index 000000000000..98592cdee3ef
--- /dev/null
+++ b/Documentation/networking/pcs.rst
@@ -0,0 +1,229 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=============
+PCS Subsystem
+=============
+
+The PCS (Physical Coding Sublayer) subsystem handles the registration and lookup
+of PCS devices. These devices contain the upper sublayers of the Ethernet
+physical layer, generally handling framing, scrambling, and encoding tasks. PCS
+devices may also include PMA (Physical Medium Attachment) components. PCS
+devices transfer data between the Link-layer MAC device, and the rest of the
+physical layer, typically via a serdes. The output of the serdes may be
+connected more-or-less directly to the medium when using fiber-optic or
+backplane connections (1000BASE-SX, 1000BASE-KX, etc). It may also communicate
+with a separate PHY (such as over SGMII) which handles the connection to the
+medium (such as 1000BASE-T).
+
+Remark on usage of .mac_select_pcs and fw_node PCS
+--------------------------------------------------
+
+There are generally two ways to look up a PCS device.
+
+1. MAC OP struct .mac_select_pcs (considered legacy)
+2. firmware node (fwnode) PCS entirely handled by phylink
+
+Implementation 1 leaves the entire handling of the PCS to the MAC
+driver with the selection of the PCS driven by .mac_select_pcs.
+Custom implementations are required if the PCS is external to the MAC
+and needs to be handled by a separate driver.
+
+This implementation is considered legacy and it's suggested to
+switch to the new fwnode PCS.
+
+Looking up PCS Devices (fwnode implementation)
+-----------------------------------------------
+
+The lookup of a PCS device follows the common producer/consumer implementation
+used by similar subsystems with a ``#pcs-cells`` on the producer and a
+``pcs-handle`` property on the consumer::
+
+    pcs: pcs {
+        // ...
+        #pcs-cells = <0>;
+    };
+
+    ethernet-controller {
+        // ...
+        pcs-handle = <&pcs>;
+    };
+
+On :c:func:`phylink_create`, phylink will use the ``num_possible_pcs``
+value and ``fill_available_pcs`` helper function in
+:c:struct:`phylink_config` to compose the list of available PCS that can be
+used for the phylink instance.
+
+Phylink will then internally handle the selection of the correct PCS for
+the requested interface mode based on the interface modes configured in
+``pcs_interfaces`` in :c:struct:`phylink_config` struct and
+``supported_interfaces`` in :c:struct:`phylink_pcs` struct.
+
+A PCS is considered eligible when the requested interface mode is present
+in both ``pcs_interfaces`` in :c:struct:`phylink_config` struct and
+``supported_interfaces`` in :c:struct:`phylink_pcs` struct.
+
+``supported_interfaces`` describes all interface modes supported by the MAC,
+whereas ``pcs_interfaces`` identifies the subset that require PCS selection.
+
+For the special implementation where the PCS is internal or part of the MAC
+and a dedicated driver is not needed, it's possible to leave the implementation
+of the PCS to the MAC driver and just implement the ``num_possible_pcs``
+value and ``fill_available_pcs`` helper  function in
+:c:struct:`phylink_config` referencing the local :c:struct:`phylink_pcs`
+struct allocated from the MAC driver.
+
+Using PCS Devices
+-----------------
+
+It's mandatory to either implement the ``mac_select_pcs`` callback
+of :c:struct:`phylink_mac_ops` or ``num_possible_pcs`` and ``fill_available_pcs``
+of :c:struct:`phylink_config` to use a PCS for a MAC.
+
+The fwnode implementation exposes simple helpers to parse the PCS from
+the fwnode :c:func:`fwnode_phylink_pcs_count` and
+:c:func:`fwnode_phylink_pcs_parse`. The :c:func:`fwnode_phylink_pcs_count` helper
+takes the fwnode where the ``pcs-handle`` should be parsed and return the
+number of PCS entries described in the fwnode.
+The :c:func:`fwnode_phylink_pcs_parse` helper takes three arguments,
+the fwnode where the ``pcs-handle`` should be parsed, an allocated array
+of :c:struct:`phylink_pcs` pointer where to put the parsed PCS from the fwnode
+and the maximum number of PCS to parse.
+Contrary to :c:func:`fwnode_phylink_pcs_count`, :c:func:`fwnode_phylink_pcs_parse`
+helper fills the allocated array with ONLY the available PCS and return the
+number of available PCS found. PCS that returns -ENODEV will be skipped and
+won't be inserted in the allocated array.
+
+A phylink instance may use multiple PCS devices. The maximum number is reported
+through ``num_possible_pcs``.
+
+It's mandatory to specify for what interface a PCS is needed. This can be done
+by filling the ``pcs_interfaces`` in :c:struct:`phylink_config` struct.
+If the requested interface mode is not present in this bitmask, phylink does
+not search for a PCS for  that specific mode. (example MAC doesn't need a PCS
+for SGMII but require one for USXGMII)
+
+With the use of the :c:func:`fwnode_phylink_pcs_parse` a common implementation
+is the following::
+
+   static int mac_fill_available_pcs(struct phylink_config *config,
+   				                      struct phylink_pcs **available_pcs,
+					                      unsigned int num_possible_pcs)
+   {
+   	struct device *dev = config->dev;
+
+   	return fwnode_phylink_pcs_parse(dev_fwnode(dev), available_pcs,
+						                    num_possible_pcs);
+   }
+
+   static int mac_setup_phylink(struct net_device *netdev)
+   {
+      struct phylink_config *config;
+
+      // ...
+
+      config->dev = &netdev->dev;
+
+      // ...
+
+      // Parse possible PCS and fill num_possible_pcs.
+      config->num_possible_pcs = fwnode_phylink_pcs_count(dev_fwnode(&netdev->dev));
+      config->fill_available_pcs = mac_fill_available_pcs;
+
+      __set_bit(PHY_INTERFACE_MODE_INTERNAL, config->supported_interfaces);
+      __set_bit(PHY_INTERFACE_MODE_SGMII, config->supported_interfaces);
+      __set_bit(PHY_INTERFACE_MODE_1000BASEX, config->supported_interfaces);
+      __set_bit(PHY_INTERFACE_MODE_USXGMII, config->supported_interfaces);
+
+      // PCS required only for USXGMII
+      __set_bit(PHY_INTERFACE_MODE_USXGMII, config->pcs_interfaces);
+
+      phylink = phylink_create(config, //...
+
+It's worth to mention that it's phylink code that takes care of allocating
+the array of :c:struct:`phylink_pcs` pointer for ``fill_available_pcs``
+callback based on the value set in ``num_possible_pcs`` for
+:c:struct:`phylink_config` struct.
+
+The ``fill_available_pcs`` callback must not write more than
+``num_possible_pcs`` entries. The third argument may be used to validate
+that there is enough space to fill all the available PCS in the passed array
+of :c:struct:`phylink_pcs` pointer.
+
+The ``fill_available_pcs`` callback is called only on :c:func:`phylink_create`
+and is used only to compose the initial available PCS list. Ownership of PCS
+is held by phylink and :c:func:`phylink_release_pcs` should be used to release
+them.
+
+Writing PCS Drivers
+-------------------
+
+To write a PCS driver, first implement :c:struct:`phylink_pcs_ops`. Then,
+register your PCS in your probe function using :c:func:`fwnode_pcs_add_provider`.
+The :c:func:`fwnode_pcs_add_provider` takes three arguments, the fwnode where
+the PCS provider should be registered to, a get function to return the requested
+PCS based on ``#pcs-cells`` and a pointer to reference private data for the get
+function.
+
+The PCS will then be registered to a global list of PCS provider that the
+PCS fwnode implementation will use to parse it.
+
+For the simple case where the PCS driver expose a single PCS,
+:c:func:`fwnode_pcs_simple_get` can be used as the get function.
+
+You must call :c:func:`fwnode_pcs_del_provider` from your remove function and
+release the PCS from any phylink instance under RTNL lock with
+:c:func:`phylink_release_pcs`::
+
+   fwnode_pcs_del_provider(dev_fwnode(&pdev->dev));
+
+	rtnl_lock();
+
+	for (i = 0; i < data->num_port; i++) {
+		struct pcs_port *port = &priv->ports[i];
+
+		phylink_release_pcs(&port->pcs);
+	}
+
+	rtnl_unlock();
+
+Late PCS registration handling
+------------------------------
+
+It's possible that a PCS becomes available after the MAC finished probing.
+Contrary to the usual producer/consumer implementation, when a PCS is not
+registered and can't be found, the fwnode parser helper returns ``-ENODEV``
+instead of ``-EPROBE_DEFER``.
+
+This is to prevent race condition with particular devices that register
+MAC and PCS with USB or PCIe and require the MAC to be registered before
+the PCS.
+
+The phylink logic correctly handle this special case and keep the phylink
+instance in a fail condition.
+
+The PCS fwnode implementation provides a notifier to which each phylink
+instance with a non-empty ``pcs_interfaces`` in :c:type:`phylink_config`
+registers. When a new PCS provider is registered, the notifier is called
+triggering the :c:func:`pcs_provider_notify` function.
+
+Function :c:func:`pcs_provider_notify` will check if the just added PCS
+should be used by the phylink instance. If it should be used then,
+it's added to the internal list of available PCS and a phylink major
+config is forced.
+
+If a phylink instance was in a failure state, with the just added PCS
+now part of the available PCS internal phylink list, provided all other
+conditions are satisfied, the configuration is retried and the failure
+condition is cleared.
+
+API Reference
+-------------
+
+.. kernel-doc:: include/linux/phylink.h
+   :identifiers: phylink_pcs
+
+.. kernel-doc:: include/linux/pcs/pcs.h
+   :internal:
+
+.. kernel-doc:: include/linux/pcs/pcs-provider.h
+   :internal:
-- 
2.53.0


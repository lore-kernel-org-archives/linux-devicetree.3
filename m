Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117783C345C
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 11:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076645; cv=none; b=jdHhrzeqSpV05Ye+YfL0erdHllKeAFHljvnAMD6DknEbQc6qHrM2u4WOeSwmodsku/v+EcrWJ/ElawQsJhRRz3wflMtJnaUBQvNbcWoLskSLsQn5xV5pXrjcESRUANt6iH56fUU7G4jW6ESdITo6/Qm3fiki67ii4fCYu2C+zKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076645; c=relaxed/simple;
	bh=w4vzxOXOy9hhvavKl72p+0ZNQOP9ilFm/bOhh+IgREQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NE9b3ITKghskWTcF+GZWIPX6iRfiJEHMBYZnLbZcgmE8n9OBAelc4DkzzpYmEoZGlgMYP1UGn0Ljr/MmPoqpFqJWvcsskUkTlm54GFAksNhOQvaKQZjOatxfWpTpWTXwNvZWgI5/G25R3mNQfC7hKUlysa/MHEtptFuk4uz/J/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RD5HGHTh; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RD5HGHTh"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c99672293cso5075595ad.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 04:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076639; x=1783681439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIxmxw1Kc/t3Umgh8QydrzRuQr9VX/i5qTBJkOJPnng=;
        b=RD5HGHThJyE0lLrJ7vdOQemo+OjFzSm2KDwovhjH/5l8yGPX/Xb9hcDY6AQXJu3rHf
         Bta0XHTSwZJVdAGXrWOMy2uVCLCLWgcZ5vEpk/lR7p42hubZXPPbIsY2Hk+nDOnZsa2f
         Ns6SuFrCK64nEC3hhnAOIMCdJL0up7qwgkuJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076639; x=1783681439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gIxmxw1Kc/t3Umgh8QydrzRuQr9VX/i5qTBJkOJPnng=;
        b=Hvb3Ecox2cslJevu1iqRJCwGPQORje0pPUiUz73pcATbTJfe5IYpXjXb8EjiA3nYdF
         ewyKBD5bPfqj/4ZUerDcn7Y1q8CEj78b6bKwQ56iJJrYETF1FWEIRCtn+o+4wC+jmnty
         bBLK87WTRNPTlwdb9Gj/+xOcJkODAZ05/FHAPGJsCkskJnbCl4+qa9mQJQfdfp1FhOf/
         u0O8rMsniiAPQtXhfIdzygqZRv595aAUFBMRrdPptpea/m2784lfcsz1zZd9oFaNjbug
         mej6HrFKBMVE1icw/ouVzTQtUHqyHr+W3exVKMR3geHx3sdQJshcOrTuGv84amBKuUBu
         kwTw==
X-Forwarded-Encrypted: i=1; AHgh+RresZPO2fCq3iH3Lf0n0AQEIWdb7G6UkQDs5sRZGbSHHTgLC7jLpaLw8AEteRmBr4o+y8pYRHPXLaym@vger.kernel.org
X-Gm-Message-State: AOJu0YwJjNWS1INw8RL1Nd5rt9mg5RgyaShSn5Eo8zACZe7CzCBSvaCV
	dCUlwsZxIWdo8XCgfYVX8a5UsIQKGJYGyPcKS38U6FCLxD+ExnR/T+1Gn8SsmSyfnw==
X-Gm-Gg: AfdE7cld7Xrn+cZhGMdHJAgkG4fgrLEeYAvoX6mq19yqCwIV0UISBw1YVJg8SrPuAJt
	0TDuZ9Gj+EYfFbhvrLFVTBX91iLtNklNWmD5fFFrw2ZSkoDYdMBmkjJi42TjSiInHHYJuEI4+2O
	KctoFeexajS2pNNv4WsLkwl6dg/TLk31d2x9CysBT4R+RTBBaIG229hwqAd8jnE4eHtA1k3D7qF
	XqADeTtlVR/7s1QfrWfgVSbabvwwXolGfKth7i/tvVG05RfBP6pTLcioU7se3hg+/+s1WHbv6Yw
	rbNcxcu+1uERfxBxinvd8okTx8/VBi3N0O7b78vkZrYDMInH4Q8NEwfXpTRY5yTzCmdP9PdZ4lJ
	UO2d+c1wihlZicviB89TeaHVFpVfQV0ahI6QkVlzRTpqz8YrjOVvsbDxzQ9X3uAsJh0MKF3Ks31
	xNgU+OB9vMgJDjW8SGmh4jzsqPpV5lth2leCF6KBxej3JAkOFwgAQ9LmSWqa+WktSZWjiJCA==
X-Received: by 2002:a17:902:e5c4:b0:2ca:d874:c6de with SMTP id d9443c01a7336-2cad874c884mr19763035ad.26.1783076639217;
        Fri, 03 Jul 2026 04:03:59 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:03:58 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 05/13] usb: hub: Associate port@ fwnode with USB port device
Date: Fri,  3 Jul 2026 19:03:06 +0800
Message-ID: <20260703110317.1283411-6-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a USB hub port is connected to a connector in a firmware node
graph, the port itself has a node in the graph.

Associate the port's firmware node with the USB port's device,
usb_port::dev. This is used in later changes for the M.2 slot power
sequencing provider to match against the requesting port.

To avoid potential conflicts with ACPI firmware nodes and then causing
power management issues, only assign the firmware node if the hub's
firmware node is not an ACPI firmware node.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Skip assignment if hub firmware node is ACPI node

 drivers/usb/core/port.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b1364f0c384c..1088776ef750 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -7,6 +7,7 @@
  * Author: Lan Tianyu <tianyu.lan@intel.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/kstrtox.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
@@ -780,6 +781,13 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	port_dev->dev.driver = &usb_port_driver;
 	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
 			port1);
+	/*
+	 * ACPI FW nodes are associated later when device_register() happens.
+	 * Skip assigning one here to avoid potential conflicts.
+	 */
+	if (!is_acpi_node(dev_fwnode(&hdev->dev)))
+		device_set_node(&port_dev->dev,
+				fwnode_graph_get_port_by_id(dev_fwnode(&hdev->dev), port1));
 	mutex_init(&port_dev->status_lock);
 	retval = device_register(&port_dev->dev);
 	if (retval) {
-- 
2.55.0.rc0.799.gd6f94ed593-goog


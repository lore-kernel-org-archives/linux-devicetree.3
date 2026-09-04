Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21123D88F6
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 08:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511438; cv=none; b=X02X4KE7VLqLJCPk2pvPUne5uvBQcahRp0qRKmwMGRYj3cPPi5WhyG6DSpv5rPvHZostMjLoTdUgUSXEAFO07y0zdhlx86LBTgaH2RqjPGNp7qoacwsjbybjnZ5zCIX+NWl12U0T+ThBvzkYZxLMrjRm+n98ongUlaqjwophIQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511438; c=relaxed/simple;
	bh=iO3DF4u+63xTtKP4FxOejaFf7KwQ2Ou9YoxBchLW4e0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nsGkt3cGzWqOy5CmzwsLBcw+OvY98LJPrannsDF52x8Z3sL+q7wSCesCBUmziy1LaaeNY+AT+Sbm5r5EzAd7Ce8CuD6ZQtHJ9xQZBKX+zfrU9Tg0ejUr8ZazKXNS+CIMK0QC3qXqsTr/tZRlOdiNeaf3t/BM0UNundHawQb2wu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dYjq7UOt; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dYjq7UOt"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so6257495ad.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 01:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511431; x=1789116231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FkHDnS01ZrIUIFEZvu4Ez5qiW1Xnkoau5FbL5ZwNaU=;
        b=dYjq7UOtAqLocf3FOvhgglj1glz1QpzT+8NmUIjHKDL4o6bznah3F3Mk8Ewh3I4OVU
         CK5SfApSRvz/kDQILfkZEKqIhoMGNyT8MWsmRnnc4Xit0tFZlnI/O5JT1hk6R/HecQ4G
         hTa1DZ834h4gkzwAGuYleNwW7+MoqXk0F47t0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511431; x=1789116231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7FkHDnS01ZrIUIFEZvu4Ez5qiW1Xnkoau5FbL5ZwNaU=;
        b=Va2AkMECIqhk7HgM6yXG1ZB26Feiw/Z6DgS0dASnA79WaU95CpxYvSwh8lGjsVc62E
         9992ADocVLecmqS5NIM5Q6BjzFH2sScAZ/3kfxjxIA7sG8VVbDSu/5X5CVDnJqx/zO91
         XYsPhCjEFLMHdkLRPpcsVkVi3jriMlvLluDDuRrSlYchXVi5f4IHUCeG0vChZUXi7IQa
         tagxkZzZ/5Ks3v1+WiEkg5ptBQNxMCJ3d0mt1k9BobRcGoMjH9FSMJMZVqZ/+tntr28X
         T21ndMZhEEkRp/oj/YGJ+0BGVfLtZRE4+Hvg2XgXwwLHmITWimfargYa4bGO8e5G50bH
         qEww==
X-Forwarded-Encrypted: i=1; AKwUvBxJiKBUSlQqnCU2TQXFykCPa4QU4AFtPy2powMYa4KmXUQlchVqBeU6ySOU59h7bHovpuOTrxBQ6Tdv@vger.kernel.org
X-Gm-Message-State: AFuF++nqe3aBmSVrIH84shcRmEKFm/JX5SKOJ3TTsF2o8pZLHx1TXiS9
	osEEP5sx8GWIhcveQC17yAnXZd90pNUSISvRfAybYkZb1RAU0IQSP0+uCng40hF9iQ==
X-Gm-Gg: AYBFou3COJ9dQAScJuBtUfjxCINLfK4Ykyx0Sh3Rfqn9jcGFBGvREwIi3fPUV5EEKFY
	/C/6NBMM0vVU47Pw1woup7FlcAP/k+b7ws1RhhRkbbpIm+mCzYcesQdU/Zo58LnMDqsqbBk6FVD
	jiCHVdjt6kNZIJM8W8R6PzJ3JVt2GHY9aQDr+L7VeN1x5FJvTfjG90TTDLlSqZxHVsyPBxL72Qc
	iK8E6gyjCRibBLaoNPlVgjWD+My3fSqnQm8N0S2Tn/vucHulQTiYaHWBTHGkKUHtiQsXVbOmfXU
	ayfVcxCJqnRdV8UkDURyIXoUc9wh5LsJKRLF43Bg2356PJd3HxF1YYBHEGnY/mdKiZx3pnomQ4J
	F7+o3nkmsKN1IIMgqDnVrjX98U5LVhlJOVxQHXn/c1tB96P/ZBzIPQc80vXtJCRfFjrDvManZO9
	bs38Ig9m6DmhzmoJMZmOf61gXJRCd8si1Knjxxl+9m+9LJPGFY1Q3FLSR7+oZffGNJqrLKujN52
	355ZVo/vWqRkvM9rLhcZsXpiIptocL1gUWGlhrcrMDfQmdVYsMSPrw=
X-Received: by 2002:a17:90b:264c:b0:36b:bec8:94c5 with SMTP id 98e67ed59e1d1-39b2612f7dbmr7487531a91.10.1788511431512;
        Fri, 04 Sep 2026 01:43:51 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:43:11 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v8 06/16] usb: hub: Associate port@ fwnode with USB port device
Date: Fri,  4 Sep 2026 16:41:45 +0800
Message-ID: <20260904084158.1341550-7-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
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

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Added extra |struct fwnode_handle *| local variables to shorten lines
  (Andy)
- Added comment about passing fwnode_graph_get_port_by_id() return value
  directly to device_set_node() (Andy)

Changes since v4:
- Dropped unused |hdev| variable
- Added flags for fwnode_graph_get_port_by_id() with
  FWNODE_GRAPH_DEVICE_DISABLED so that even incomplete
  ports can be connected

Changes since v3:
- Added missing fwnode_handle_put()

Changes since v2:
- Skip assignment if hub firmware node is ACPI node
---
 drivers/usb/core/port.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b4452b665f59..c0a51d9b06a6 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -7,6 +7,7 @@
  * Author: Lan Tianyu <tianyu.lan@intel.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/kstrtox.h>
 #include <linux/slab.h>
 #include <linux/string_choices.h>
@@ -358,6 +359,11 @@ static void usb_port_device_release(struct device *dev)
 {
 	struct usb_port *port_dev = to_usb_port(dev);
 
+	/*
+	 * At this point ACPI nodes and swnodes have been removed by
+	 * device_platform_notify_remove() in device_del().
+	 */
+	fwnode_handle_put(dev_fwnode(dev));
 	kfree(port_dev->req);
 	kfree(port_dev);
 }
@@ -754,6 +760,7 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 {
 	struct usb_port *port_dev;
 	struct usb_device *hdev = hub->hdev;
+	struct fwnode_handle *fwnode = dev_fwnode(&hdev->dev);
 	int retval;
 
 	port_dev = kzalloc_obj(*port_dev);
@@ -782,6 +789,24 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	port_dev->dev.driver = &usb_port_driver;
 	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
 			port1);
+
+	/*
+	 * ACPI FW nodes are associated later when device_register() happens.
+	 * Skip assigning one here to avoid potential conflicts.
+	 */
+	if (!is_acpi_node(fwnode)) {
+		struct fwnode_handle *port;
+
+		/*
+		 * fwnode_graph_get_port_by_id() returns either a valid fwnode handle
+		 * or NULL. Passing NULL to device_set_node() clears any associated
+		 * fwnode. It is effectively a no-op here, since no fwnode has been
+		 * assigned to the newly created device yet.
+		 */
+		port = fwnode_graph_get_port_by_id(fwnode, port1, FWNODE_GRAPH_DEVICE_DISABLED);
+		device_set_node(&port_dev->dev, port);
+	}
+
 	mutex_init(&port_dev->status_lock);
 	retval = device_register(&port_dev->dev);
 	if (retval) {
-- 
2.55.0.979.g7e5102b832-goog


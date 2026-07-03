Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE85B3BF66D
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 11:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076629; cv=none; b=QosYBcTN7T8oin7p17JBVveazLYrmFs5FgIURLt7o2NaCdXgbpS43ff4XZaYaZ8Z4aiklK2+fTQMt99oKZ4GBkAoNOAaTP2tOtpxwQFkx5nbk9YPddGCYWhc0sWde394Jw0f6v/XHbWvmd/2FuKG7ESssYAJPjyIjtEavC7XlJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076629; c=relaxed/simple;
	bh=WCsp1zUqe2LV+YoqzMPIvSR89iST8lMX4HojqXU/XZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KvCMbB4jzCYA5TYBbv+i1i/1V1xGn2Og2oqqxm2S1Tx34USmk2BxDLKzkUnHtTeVb8LjNP4JpHt3wamZao8B06hdF/nbOG02FtWVvhBYUO1s9hNEfFGit5H/BDfnzzsSFcBNiOoYJvW255Efm57YtfoUtV3IaEb0q5X7e7rvIwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cQaPIvwe; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cQaPIvwe"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ca265d6ca1so4868375ad.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 04:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076626; x=1783681426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3mY17pOHR7Cz6c2b8dxl7oG2Wt8NUoj3LgplMYXljY=;
        b=cQaPIvwew92u+dA489d9lsBrFybcfn60RziZkeN+QSWjgck0dk4mkiFoN3a+nsnZJC
         guAfllPEF5KdR7SUcj8+9UySeOMrY2BLgTWBlpnkdLFBJoDUyZ8WdZZ1g+JyMhp06v5y
         BkTqCHY2+YWwtsO7v9r2tTYeQ0FcljP2+fCVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076626; x=1783681426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b3mY17pOHR7Cz6c2b8dxl7oG2Wt8NUoj3LgplMYXljY=;
        b=lMQZCdfKaddaTRenQpUVSvphJL7PpP3TfBmDE/W1r48rPWnUlN0Nk5xyjXG0ebvGl+
         eB1yN/nf78FXRqZ9UczdTA5bVaP9Qfi7ewrpkOVujHpBXRt4Uh7PLGYOkA8iA5W7vJcS
         JPnCkDHQWlywks18fZSdOKgcGF1BA1raTVLyYzGaWWFD7oqvO3V+I1ZWSIqB0V6IvNcw
         DcFTWGMsH+w33SSL2rWXjX4KmKa/ktoDMHAvRPeWzmA2jBFOkeszA9/KUXSJQFtL9J0Z
         r6vLOxu5aWabCgvAgZQ3A9rvQ1u9lm/lyks7YO8ACYmJ0obQV79ilbgOlyFXHCkovHym
         suEw==
X-Forwarded-Encrypted: i=1; AHgh+RoM1B7BrcvXGhFGNnW3zXLuE7N+IHG6+UorZwxJcqkEwJQJ2FYXCs6z1alLgnNmwsN92uBvHX9KvL9M@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9rgIIN5wPMNTJkCdcM1klDS3D6s2CtwNzkdrc4OKmMbiUKQRR
	nnqUa3RFWHm4ZxSBuI118BcGMld5tcvvOoRct1yZ44g3uZ4ymIoYj+dilsrLwGXprQ==
X-Gm-Gg: AfdE7cma/zwpVoSQkmynA/QZJjSjz4P859sHTlIBEOP9QfvFOUo/lmZj1n69G6VRNqq
	GPP4wzS1Zsy6p0ZKeUwB789VhIz2GlbUimby2TaqPfpxdps0HFKN6CvmE9H0/DIPC8kwlrCScM3
	4ynTkRCot9riAI+T9DgEVRYZ289kXutSm3KrSGtg80OQPeq6g4119Oncl6Jz9wZgU2YcpNbt9vk
	01TxP6HR/L1nM+OVCq2jSLZJYmLUL3MgvbER9oit8FWo7E1OOCLLib2VvyJgqCh7joqO9Rru3p7
	YDUH6oAfhc/LT1zmopRjeIXaNjjWFqY+7HnkjMLkBfGykTNFvc/85V9n1kiwAmTajMpKkNENTJ3
	OlIaWyTB6FVHqxTZvffBtiKfMNjzIkYzq7G5wNxMSHse9i9T2Njym2zXTr0Pmb2o2+CPSHVqUMF
	znvhRB/GkaZD+cc/jdcWrZoUXFy7Pu7wg5MdK68L9WaHHq4EXxj43KHaR5kf6Bh5kwsROZog==
X-Received: by 2002:a17:902:c947:b0:2c9:fc4c:8142 with SMTP id d9443c01a7336-2cacabb1b50mr37971215ad.2.1783076626047;
        Fri, 03 Jul 2026 04:03:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:03:45 -0700 (PDT)
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
Subject: [PATCH v3 02/13] device property: Add fwnode_graph_get_next_port_endpoint()
Date: Fri,  3 Jul 2026 19:03:03 +0800
Message-ID: <20260703110317.1283411-3-wenst@chromium.org>
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

Due to design constraints of the power sequencing API, the consumer
must first be sure that the other side is actually a provider, or it
will continually get -EPROBE_DEFER when requesting the power
sequencing descriptor.

In the upcoming USB power sequencing integration, the USB hub driver
first needs to check whether a graph connection exists, and whether
the other side of the connection is a supported connector type. The
USB port is tied to a "port" firmware node, and this new helper will
be used to get the endpoint under the known "port" firmware node.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Dropped unused |ep| variable
- Rewrote as do {} while()
- Dropped WARN() use
---
 drivers/base/property.c  | 25 +++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 3e3e19ef66a9..7e7ad3635806 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1099,6 +1099,31 @@ int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
 }
 EXPORT_SYMBOL(fwnode_irq_get_byname);
 
+/**
+ * fwnode_graph_get_next_port_endpoint - Get next endpoint firmware node in port
+ * @port: Pointer to the target port firmware node
+ * @prev: Previous endpoint node or %NULL to get the first
+ *
+ * The caller is responsible for calling fwnode_handle_put() on the returned
+ * fwnode pointer. Note that this function also puts a reference to @prev
+ * unconditionally.
+ *
+ * Return: an endpoint firmware node pointer or %NULL if no more endpoints
+ * are available.
+ */
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct fwnode_handle *port,
+							  struct fwnode_handle *prev)
+{
+	do {
+		prev = fwnode_get_next_child_node(port, prev);
+		if (fwnode_name_eq(prev, "endpoint"))
+			break;
+	} while (prev);
+
+	return prev;
+}
+EXPORT_SYMBOL_GPL(fwnode_graph_get_next_port_endpoint);
+
 /**
  * fwnode_graph_get_next_endpoint - Get next endpoint firmware node
  * @fwnode: Pointer to the parent firmware node
diff --git a/include/linux/property.h b/include/linux/property.h
index e04901c0bd8f..931e703393cb 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -506,6 +506,8 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
 struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id);
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(
+	const struct fwnode_handle *port, struct fwnode_handle *prev);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.rc0.799.gd6f94ed593-goog


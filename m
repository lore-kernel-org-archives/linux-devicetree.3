Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5047D3D75AA
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 08:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105669; cv=none; b=bwu7yvgoeObX8DaX3mYweQJw7MAYd2ajgeRDlx2rzhiML2naY8Qhl5yletKr4X3MegkdTpc790G7iv6HYIMTLTX5MAcTpar6ppwVuUntUK7g3OR/XY5ow9iLahOUuWPFYUGf2afw69P2TFZvbZ4PwgXUE52k2SmOalgu6CQPs9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105669; c=relaxed/simple;
	bh=sqdob5TVS1N4bmSmguYYfBBqYJRqBaCnxbFmD0sCAjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ubdrfF9G1dTfVxMnBbFoGcuxpDEPBy5ByO4GH4I+N59nMzmCcECGbnB/b0dwX2YAFMWTihu6+TH9gvm0NAOHfuLdL8zQW4NXFAWRbTb95OnWIopaqeEVmwLYpgaMt9lyhK84oQTkjfPc/IhyjLl0qzLGkXMRGyDseLZzOdLr324=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F49u4kTA; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F49u4kTA"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so1704080b3a.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 01:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105666; x=1784710466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZ7tYQ51+XcWWhdGhKfBc+Z+vMHf2l2pRpxpCrkBTOs=;
        b=F49u4kTAOR0K7VBexydgAZXRUTsm+VJhRyAQqv+Ve/qdyP4gV6MoLTVLx4ZjL2uWhX
         cKN42UmTfQw0V6/saDUKC0qBMqh1v/l0wcQnTE6Mxkn8DOh0cdBRkRs6qY59HLxrOD7n
         LF/NITZHrx3sbvIplWvgVamTrnrmC/WxuUMTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105666; x=1784710466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VZ7tYQ51+XcWWhdGhKfBc+Z+vMHf2l2pRpxpCrkBTOs=;
        b=HQ92Iep5V0hkmwQrp7oYzjxPq3FWEDBQgfQqNZJP3TR2Y4Gh+jCQmTM5mm9XY0OOJe
         ZdJ/YTQpwRvMwzA1iiyhTS7cVB5CDUl564zogVM93Dm6qS1U7fzpPBC/HQGiKHBJpvRt
         V4DOCKORHVpc6/8CAeQ/eTvRp65XLZF4WWKlDas/Y/Py0CNj1VtCT3S/RE82/E8J/6dM
         k8DRt3gImvcZ0UbOJX/YIXEh3WGj/0D9RR3vHySiU0mVqBIB4mlsGhgSjG8EG3yuykZC
         3D8vr/Jzuc9KtjN82MOhotu2BveWtXBOudJBPwyGs4Nf0BwDLkE2oTgnkwN6TjUincyE
         UJwA==
X-Forwarded-Encrypted: i=1; AHgh+Rpqbpg+7juB+SypO4QIg+Q77kKoFWSjd0mogW9AmxqbabARX6Dn9fltS5h7/Skmn6XNikmCkYc3Kczv@vger.kernel.org
X-Gm-Message-State: AOJu0YwzP+qGSDe6ZtCbByWO5g9PIbFWoucqFpQd7+z5YAWSdQ1Eqy35
	t4PjbuzJSSXeVsKYahbPjPu7nJJLGw52gu7jU/Vf88ZQwSv0C6Px5yAASUawDZyQDA==
X-Gm-Gg: AfdE7ckXtLr1KZ50cCz/PNxa9W6dNa9A4fNFb5uH/XSheEl5Uku4Ns/rY6WfCX784m7
	cUtOYwbOmA0IddtLfhtK1NwLWhw2+bgEvj/VGFouEGomYVaaRttwN7ZScmlH+yqoDs4ULLvyaaA
	SPGrnLde1fx5YynTTaL4jeyCd0M6Y7NO04Om+EPwv9Xux+Z6uYnF6U3thKiiaLQSySGnuQLqqBN
	Bzso6Gnc49bscvIvxBv21RAyaXet1necbDG1KUfBxkt6dmN19egSs37NFqqK1KUpNKg0HVL8jzu
	C8aUi1B7abWJUIK4N7+kY1/WlMJZ/2V2pkVQr+8ok7TWr+EFMoDUvyg1Qnml7QGZXeRlZAChk02
	Y5l48B2vSvXGGr43uhRuvN1DJbqZ8NULU8t20z5tzDaCMxHuSQdqO+RLAM/6ffSGV15u+UuqlUK
	KOw0Nn1s8HZOaFcobKWEaIJn6sCDEhMG+/YK6CbVf4q2lsSjyC2FMVBmahcbSLdEVtkj7EZg==
X-Received: by 2002:a05:6a00:228f:b0:848:2f74:1d65 with SMTP id d2e1a72fcca58-84889744e25mr15178478b3a.75.1784105666556;
        Wed, 15 Jul 2026 01:54:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:54:26 -0700 (PDT)
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
Subject: [PATCH v5 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
Date: Wed, 15 Jul 2026 16:53:32 +0800
Message-ID: <20260715085348.3457359-3-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
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

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Dropped unused |ep| variable
- Rewrote as do {} while()
- Dropped WARN() use
---
 drivers/base/property.c  | 25 +++++++++++++++++++++++++
 include/linux/property.h |  3 ++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 950defc0c55a..5d3993bd8fc4 100644
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
index 480ba8646bcc..9a784a856773 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -505,9 +505,10 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
-struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id);
 struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
 						  unsigned long flags);
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(
+	const struct fwnode_handle *port, struct fwnode_handle *prev);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.795.g602f6c329a-goog


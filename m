Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBEF3D7D77
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784882650; cv=none; b=Lz0XT0YJcpGZ4Oc9bvhkuqZI+aJ7aPg8xSM5LKV6prVegMNG8QCuvkf4wshqLeJfBQ8PXon8z9R9Q5iqyxrFqdGRpud7M4ReTkOHSMBF11CVTq+4guy2H7e2GIFfBH3wgQ/nUiGWg2TrLyhWR9hA4UhqQzjkKzYKEtvD7Q6mhoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784882650; c=relaxed/simple;
	bh=rN8bGYfPxlquy6cQeK5GYz3ym6oKo/FOx8yU0FBCzV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HxtESSO/fzVVOeAAhOlz5DwDuDLiQ8Qpmy5apD/Iy7dxwNf11g0tlXHEIMA7hYRuQRGqvLEuZUIY5+JCoRzIjuSv79w5jebCJjCmJh0RS96EgZq2BR/Coa76LkuX88Dhxs8oV783fSZ171N+z5W+hxErQHbytT7GTdFhJ76XZZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hXHF/C1i; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hXHF/C1i"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so151210a91.0
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 01:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882648; x=1785487448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZPli2S6cZzTtPxNu5kCcB+M+KQUeHMnkMABY4ADLcw=;
        b=hXHF/C1iFP+DzsSdCDcke6XtH45FLhGqmJxDPybdM0yRDfbEOsigMesemAKruvD4Y8
         NbDh11LPukF6dWMm7h1fXmBA0NG/a1omudCKRimwAt1eEDIbJOsSpEpmA3rT6daaP64i
         UjNN8IydQz2sdOKPDz7dzSTe9VAUG76EmTXk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882648; x=1785487448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZPli2S6cZzTtPxNu5kCcB+M+KQUeHMnkMABY4ADLcw=;
        b=HRvQCcX0NE81Hfyi80CM2iCsI2c0+4wqvvL/J880Iv5SEy8743ACQHsph38MU/nSJq
         Lj2HnYW/U6/gd3HSXeiDd60FFaL2YzoxO0dd4WQ5lr4eIfDGf7P8vHPNEsYBb1d2pM2d
         dofmna42eZWYuuyYf7Ff7TMUOi6BnN9gTAjUf1AABLTwCzAhpmJhgxEaOGMGNK9J03D3
         dfsJ3vN6uQavdKR1+I0B7NRdxiSJoQ1cVz1rAHrN/TKaeOgtKp5qcre71rwS5BUwQO34
         nruatcV7jKOWclWkMkCwX1IIH/uOv2ZQzNsqjc1XeAjydViQ8JCPRcYYV//UAnYcfMUw
         9hpQ==
X-Forwarded-Encrypted: i=1; AHgh+RpYIKa+jzxtQhrPaQw722V2FwRuL5HiOST1hTdN38w8+OtNFDaNUeSjF8xRYbXYoBlXzTC0vfu1YKi9@vger.kernel.org
X-Gm-Message-State: AOJu0YyFHu2uVv6HYm9lVQ3SIHVpcKGmCJbarmpK0R15E7c1PH/2hsji
	GG9Hllg0hmmB2VyYkgXvSkQoKsdTVCuS0/KlHHkAYPmNF7yvq/Vnwjv4hBb657lfhg==
X-Gm-Gg: AR+sD137eKUPGbipW94IjGmEGMRk3JT/kGYboDq4LAQHat63tIUVUjcv2cX9pdTNr7O
	jwi48UvCtqoNn0W+7SHWTvoCzBbOqdY9i1J1SEHLB5qATj7edMA9p5XBQyvoszaX8Kdbu0Y3/LG
	5cqfAlGtR9i5GQ8isO0QldZb8X1isLeeBjR0+Dh3hNW12J3p3CAvroHLainKRsEL/PDNsKClKYm
	v+k8uD15zH/jIIDfZ+7YLKExU1womGAhoksD+LssxnAGXVoyy0r3ct1R0WCZRT/X9u+JTAPoX4t
	Ubi+AmhSidtvpiqEHGzxA3laGuUeJ6m4WGdgs0NuQqlUZlj1WXFkY8WnLHnjxNRSBkhYKi4pkP1
	XnXG3ae5ahesEBtzaUDu1g79fOn0DANf1n+wG6BOTPX6Q7gvfNBvyNNGYJfL242ABXTUcA2bxGi
	hhrsOS9TCkbAc8BxQbkr8peTC0vEW+9rYwjHzpkd7s/st3HgfKspvnp9nZzm4=
X-Received: by 2002:a17:90b:2750:b0:381:5ab5:b667 with SMTP id 98e67ed59e1d1-38ec6637d1amr6238598a91.31.1784882648264;
        Fri, 24 Jul 2026 01:44:08 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:07 -0700 (PDT)
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
Subject: [PATCH v7 01/16] device property: Add fwnode_graph_get_port_by_id()
Date: Fri, 24 Jul 2026 16:43:10 +0800
Message-ID: <20260724084328.3943997-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In some cases the driver needs a reference to the port firmware node.
Once such case is the upcoming USB power sequencing integration. The
USB hub port is tied to the corresponding port firmware node if it
exists.

Provide a helper for this.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Dropped left-over declaration in header (Sashiko)

Changes since v4:
- Added flags parameter so users can specify whether incomplete ports
  are returned or not (Sashiko)

Changes since v2:
- Moved "Return:" kernel-doc section to the end. (Andy)

Changes since v1:
- New patch
---
 drivers/base/property.c  | 29 +++++++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 9387bb83eb54..950defc0c55a 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1346,6 +1346,35 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL(fwnode_graph_parse_endpoint);
 
+/**
+ * fwnode_graph_get_port_by_id - get the port matching a given id
+ * @fwnode: parent fwnode_handle containing the graph
+ * @id: id of the port
+ * @flags: fwnode lookup flags
+ *
+ * The caller is responsible for calling fwnode_handle_put() on the returned
+ * fwnode pointer.
+ *
+ * Does not return ports that belong to disabled devices or endpoints that
+ * are unconnected, unless FWNODE_GRAPH_DEVICE_DISABLED is passed in @flags.
+ *
+ * Return: A 'port' firmware node pointer with refcount incremented.
+ */
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode,
+						  u32 id,
+						  unsigned long flags)
+{
+	struct fwnode_handle *ep;
+
+	ep = fwnode_graph_get_endpoint_by_id(fwnode, id, 0,
+					     flags | FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return NULL;
+
+	return fwnode_get_next_parent(ep);
+}
+EXPORT_SYMBOL_GPL(fwnode_graph_get_port_by_id);
+
 const void *device_get_match_data(const struct device *dev)
 {
 	return fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data, dev);
diff --git a/include/linux/property.h b/include/linux/property.h
index 14c304db4664..01ea010cb2f9 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -505,6 +505,8 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
+						  unsigned long flags);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.229.g6434b31f56-goog


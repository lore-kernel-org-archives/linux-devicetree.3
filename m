Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C0B42BC33
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616883; cv=none; b=LmIdkUGoLOMWwciScizGVMUfgMGKePwMV6QoqIMjCQiRJ6maqB2sxLXS5ptLlgNNvIVL+VnG5uu+nGu4WCOz3fp5mVFcUPfquPp4WN0te3+gP9I7WrXU46IfYYU9wZ4YKwUsDXEP8+V0K7IbFeUfLzRpwlnbwAxuogLo5NRQ3vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616883; c=relaxed/simple;
	bh=rN8bGYfPxlquy6cQeK5GYz3ym6oKo/FOx8yU0FBCzV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQ3mueGIHvkuR0jjCLifaIur8hNLwCqggwaOmgQ4wlJhEU8PZT0w6EOUeAL8ZZW1oi6IcOQYDTPmCE5WW8f7l6EnZuPDwGmFvotgMNW4ZR14VK1pxy9Zw494hwAjBaLnzZ7uQoEld8rdtG9wWXmU60VZnWQqj13oto0A94SjgM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O37Eedr4; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O37Eedr4"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cad8076b01so131930755ad.2
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 23:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616881; x=1785221681; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZPli2S6cZzTtPxNu5kCcB+M+KQUeHMnkMABY4ADLcw=;
        b=O37Eedr40TOL1RWQ6QWyigzYQhZ5h6H0pxJg+gceK3/HoVfforjFkq8OceLGsaRKOe
         ScSbEH3/CJ1lqVjsritmG2lJvjtMZcvz1Sgejb90xiWUOFph/b6goc3ePmMBftzHJUcu
         VgFCsVs2w6O42y1a0Q42h7rQUFQIMfpFbWs1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616881; x=1785221681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZPli2S6cZzTtPxNu5kCcB+M+KQUeHMnkMABY4ADLcw=;
        b=bYieOqNGEhW07+UUtkupLDbd7qQap+I2TI7HOPYQu7hL0Ldx3z9Gbb6kU0lMlnh8+F
         yjvTwZ6WYilYYwrQq8hpsYf9OBB4XqaslV1TTYCpraMC7JnJ4ObPaLDopdS594lRN6Jh
         nuNG3ea09qRElHbmuzIzHxZQn+eLBipxxJNJEkHB6oG82gzqpuexT4Xw1/glADqjD+wW
         lBsxB5/9RPJRL3oiXbwDWh13AWxKFLma20dJKcDPvDRFOUKElWnVHrEEpGDzmklbpvSt
         L5F72glJRJ7yCBsuKpPN3gDZLa6IZa7esEdKGjsfViW9xGTk9Yzyoj5+qLPzjX2TIXFe
         VmRQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpwin+wT4Ht1GPwZaPG92W+4AgAbJUNVF88dN9mr1DqiYEHHnrEGt/r6I20q2HEhSdM0x8ZEGp+eTCY@vger.kernel.org
X-Gm-Message-State: AOJu0YzbfyPIP4NKCYdmztsYaq+eUTnEMvMnu6t73RrfI1wHKYSzN2wC
	w+rZZjnb/RY/85YCtET2H2QjIGkMY4XoxZ9bYkCx/07IeBpYzsIUGbEqH3q2/0G66g==
X-Gm-Gg: AR+sD122vMjEE6zWnAvg9BouJPGRon2qvE82qohbodILYmwawVhrUYTfdQBs4tjRsC/
	JtSfQrfuF0zpnyPmBioKBYQELVSB8yeBhZlEycCvfWSaM7cU2EdAEK9vYy0V82Hr99FctVhBzle
	bMFkgF1jvMqKmdn7YYLyAmV+NyJObDcNOkpkM1dlFPcuX0EofCZj6AWvgQa8T7Lc+5y/wFZSZZp
	tjX/KJ74B9Ip2VMnLaBUT5Ogn+318MFmdqqh3JSFOSk9wDYyJa7uEM8ptlQ4NQwmRz1v505iSe3
	Befq4oIzpsuNiM0/MWhYCA52GhEljTuunSHzpNoS+Y3c+ItfMR01Ix55WGqdHfoEX7jROQSGmA3
	oA7afwZ7BPDkMP4cgKQgMHerLgCAfBuOWKdnIlpANwFp+85pbMjtvb9B8BtovB7leHows0psv/P
	zrm4RoCg1OasoBzilyEBSqktWSXmzw296oPMbnR1KwY+SzlgHj3O5DXsDVlGc=
X-Received: by 2002:a17:902:ce8a:b0:2cc:61e8:5fba with SMTP id d9443c01a7336-2cf349a2153mr182756085ad.32.1784616881554;
        Mon, 20 Jul 2026 23:54:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:54:41 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 01/16] device property: Add fwnode_graph_get_port_by_id()
Date: Tue, 21 Jul 2026 14:53:56 +0800
Message-ID: <20260721065413.2306137-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
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


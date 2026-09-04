Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7FD3F7AAB
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 08:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511340; cv=none; b=lJJWEKnd0pz8qLJtxbxg3+HddIUxkgUc46bANiZNXY8A3nep4rPV511Xa/xo9TYSlLOrR9P/E2vOVCnBoopj3hQib3dqq7fuVPChW/R/OM9Sd5ielz27v7ReD3EXZqipExJ92gJD749ekloDICReNvsKZfNSdaEU7gFvJj9kIs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511340; c=relaxed/simple;
	bh=RGLL0tPfDP6uNlWVczfepdqpvZGR4BjUGaRZ583Zkzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1vONGtY+O+L24qEVIz5FwDCTWAmiaYVnk8ICt6m8d2Ho/fFwII4RbTDPrjxw9iYlbxTDWeRiV7ET406Rq43CrxVskrPEo+A5Zpf7I/ha8mSFM1LaubQFqkqZqSNEx3+GGuSsSfPzPFgo4KQ1TPZszSLllUB+NzjiLlHxM4BnZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SdoxKF/l; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SdoxKF/l"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc439bfb2d8so613481a12.2
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 01:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511337; x=1789116137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WRetEA2OXFI4SKJH2CBFzorRJvZCDQyI99zumpuCSb8=;
        b=SdoxKF/l8oxoFHgKxIo2orVm21tVNJeFZDYAAxz/og1s6K6/DLU1+vy+GxEnQ+d0O0
         fH3coiOH9Oliz/lEqLyhSc1d8a8rS/4hCT7ewMQ+3J5qSbEMzkxbHxURGEcATdhgisYI
         P4/Zw0UjWnATRqqNQXFB8t1U7BgppgBSCHS9Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511337; x=1789116137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WRetEA2OXFI4SKJH2CBFzorRJvZCDQyI99zumpuCSb8=;
        b=dC6tNmQuWVHDkp7EEDnSgEdhZpcTI//suMbz1LNi5g0YXmLPMmKgaHrB+lwCZMFFVh
         PXQFso3mJTTxw5UGnklWslBd83UPpmMEwLpv0vL9rsh2HObC6M6dgMKlYzJKvQbe9hcA
         25DOSizIuy7+Jobsv3T5bwecNClo9+TNgSODzFDL/+tW91yX9r5dtwMlj1hui7ZvrhVD
         hlI7QgoojtpevIDZmkHDzizU6ifwR7E0n5/5fgVlcAPjGyf/OtKQPZQEN7pdYZeUz0AM
         yJRLwz9pGm6DyeCTAW88UMRIlRxR5J5zUi+qi7bRWIvz7S9f5QPqZPoEiFhWyAvctXlQ
         C5rg==
X-Forwarded-Encrypted: i=1; AKwUvBzFssPg9gZ3FTTNMzz7XryKl98BgVU1yLnJ0jrgUM72IE7HijQsaNrQ17fUIDViNyZA2bo7ooiq7U7w@vger.kernel.org
X-Gm-Message-State: AFuF++nLYKJYdEpQdSIeJH7hg9in6qVkVItJY8loEEVMp2Y+s08/ZCKZ
	GNtEFFffHTUnIxuxB4Y8wBtRo8sklBNf6sU0NzkUdreb5qwr18V+p6+/NLiUvrh7Aw==
X-Gm-Gg: AYBFou2CMkK+Ny/gd0Ql6+8kS59uSJov8dX/n0DWZGvi9MzC3zH53SsdWXFqeFCNoUg
	w6uryITZDAumYcnPtPGMkUtKxdxCzijxHD9wnBRqtgtLbQ4ughwceqmH6CVyMWBfeQJiWXnVbPb
	KNMAWnS3PgJefwAk4IOIkWPdpkWor4rKRg3gZFYmdeCdjJ/j4rqqlke19TjLa+WwH3hTQ7jFTyp
	OwusLQVg/neKnh1LFw2J66TPTB1WrNWq3ANWwhld57CYJGnmF7gLerMw9mmKn3mPcKhiqnsMd68
	jHvUASWHowR4++9RtbZyWyeH60hyn38Q+0IuhnmiZPSJFhVB3uljU68SkWY2EZO7D4GwRs2U0Fp
	x484gC5p/o0HEQ6rRCs0FmEdeEQqJ+SbHskFN3zZaD9nDN1iYfxfrf8B5RqxkwdiaTcAb4ZCEut
	nh9ylCdJpZ8SMyZuRUErodsH9lv/P7Qn06lb3ItrwU6t266WnM0sG/nmo75ceu7/gO2KfT1i6L+
	UlC0HfhdPXRQ68uPUII5vWMCSs12zVhEY6th+Pg+UMC
X-Received: by 2002:a17:90b:314e:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-39b261500fdmr6024537a91.4.1788511335746;
        Fri, 04 Sep 2026 01:42:15 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:42:15 -0700 (PDT)
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
Subject: [PATCH v8 01/16] device property: Add fwnode_graph_get_port_by_id()
Date: Fri,  4 Sep 2026 16:41:40 +0800
Message-ID: <20260904084158.1341550-2-wenst@chromium.org>
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

In some cases the driver needs a reference to the port firmware node.
Once such case is the upcoming USB power sequencing integration. The
USB hub port is tied to the corresponding port firmware node if it
exists.

Provide a helper for this.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v7:
- Mention in kernel-doc that the function does not return ports that
  have no endpoints (Sakari)

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
 drivers/base/property.c  | 31 +++++++++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 33 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index b136c339ddae..68108805482d 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1353,6 +1353,37 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
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
+ * Does not return ports that have no endpoints.
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
index 907c790a3f01..3dbbd01a52d0 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -507,6 +507,8 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
+						  unsigned long flags);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.979.g7e5102b832-goog


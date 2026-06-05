Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2819637104C
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 11:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659485; cv=none; b=qiAn1Lyl2aLjWfeIzpS/Q0Jcm/SwQqN4t1QcpQqy7IzstWR/7Rtnydfq9Ln2HXc+y9pLu+P0dBsz8VoemWMSg1sAehUdoPHFlZ5MUQuirGxpJ+x2t9zlHcHs2c6VfmPEEOSd3LD1Yr/fg/8RbGhgCczhX6CgYfzw4wtwgij7iMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659485; c=relaxed/simple;
	bh=0vd+vO7kT/Bwe+zNKztgtx34weofQNBHZTUxt16DUFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iTreWx9GEcp+wCVJQcpniEOyPvTM3QJ+OAR+T9tEtAO7t/4YmX/XKZfcngqforrfCNGdT6guacY1hXLff4lv4tBqL9R0yWaa2OoCNfVjU+XiGZvjQhiuHw2OBFkCPX4ut469FwOIu3EhrWK64vAG17NcICv4jnrLHjhuvifJxFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=je4y5F63; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="je4y5F63"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso9743605e9.2
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 04:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659481; x=1781264281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6daWXnyshURFrvLbUnWsTDQNHdO5cag/yMoMIvHA3zY=;
        b=je4y5F63vJ0t4nHG4Qe82KFnMnixF7PIQSfbaVCqTHot5p/CkaW/OP8OofAdWPTy/g
         VTKsOcCVgKFqAZPJ7BjXvT+UQ06SymjNFe5kkqmWf1Am9cLUmxMpGfcinxTRvbPsG28G
         LJpWvftRMd7sJxjY6aLJhDnmz4NlXdbDTszLIj6PZtNV8k1v9ZWdnXwD10S4/OfuKXpg
         5NM7DMgHNroUvJiZqlhOo4CMGTfk90ZlFiIllFDHtsO965PeZ3u3EvpFQasNaob/mAkP
         gpeJ1ZjZA5UJGGk+RFeRpZTnMU0HC0VGwOfvE7X5/ukMr1QNCauF2nji8JnYzRVTlunc
         3O8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659482; x=1781264282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6daWXnyshURFrvLbUnWsTDQNHdO5cag/yMoMIvHA3zY=;
        b=K5W0tWm60RBLCv/DGrw1Z5z7IkxIsZj5k037qAnYNGNqqyc54yuGmuLGHcMZfqgXbe
         GXPOTYnPTJ6eI6LG+B8HerYLIgQoaF6z1XV5cmt/thFFqntTp2NgfeZmKn0Bc932+4T2
         npb+hnWHNcZSqooX883s4nB3lrSYHB2/EDRHdNpfMoV3oQ3Sk/vAkCPQVzsAiAeVoBHY
         /gt3Z8a4cdUShdUYwBNbFn3AxOR8b0OsZrMswxFueixoTBOLHAsyV1YACeGBW+Sp2lCo
         VXd8Z18H4aXcyKnk/9K3M/WXVTjRhrtqklp2I0Xo/X0iQAkAYJUDUzcXp9iU9NiSke0+
         sW9A==
X-Forwarded-Encrypted: i=1; AFNElJ8S+efX6SK//QXDjoLBhmqP/tqL3AEabmvlbCgqHfdcMiNQEQh2xzxSlhrITKhUENHzUMyOOLMeOIU7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1oo4NiU4mGPn4UoK8uwq/f7q1PLoFWoWaWJU5FFe/Liw8Cujq
	8goZPkxhhZalH4FN2ziDZWMwBaHNvaK1kS+owQ7xM0QjIPSO523Khid/
X-Gm-Gg: Acq92OEbxt0f1EpzhyC2B68La9qTWtNmlNgCGopJ0Xpb9h18Au6tLQsIzJIMEUP4Qx1
	KWoibQt6ItFu/zh2BczMFN9pa+y2bn2l3UXFVQ5gmy/yitaJ3SS+AReVkHMc6/LV6oZtodsA82r
	IwopNkxh1E196c1EQGeVOMaC+OZS8T1Xp8vD8htnG8FUddznXyy/Qb6mOOApDrmGkrTzWezu/hq
	bfM1EDxwUwqND0PBESLWyF2Ekhars5ASeY3bU6PwbXdJPfofZIC/VMQJ3LuSLOlIcH81HBuyQid
	j0EmogAZrUg61EGVcNwpAHogvJs5Gt7QGaZulUOno5gs/Fi51Jyovo2yakseZ4RnPi6B9r8eMsL
	zcIK1oHOntlSYHISnP46vNo/ltOuNW/7QChvss/IwB0WuWkwLxDgMPGCn9egW5y/+KsVJBD3eYQ
	ebUsj3XiHiN5Bdl10UzJca9WnlYT3jocx4pcTCKKvEdO7xAn22rwo4Ayd8EQRO
X-Received: by 2002:a05:600c:c0d3:b0:48e:6db3:ff33 with SMTP id 5b1f17b1804b1-490c265c091mr36372165e9.14.1780659481627;
        Fri, 05 Jun 2026 04:38:01 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm15262439f8f.7.2026.06.05.04.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:38:01 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] remoteproc: imx_rpoc: fix carveout name parsing
Date: Fri,  5 Jun 2026 04:36:19 -0700
Message-ID: <20260605113621.1479-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The imx remoteproc driver assumes that the names of the reserved memory
regions reflect their usage (e.g. "vdevbuffer", "vdev0vring0", etc.). This
conflicts with the devicetree specification's recommendation, which states
that the names of the devicetree nodes should be generic.

Therefore, instead of relying on the node names, use the names passed via
the "memory-region-names" property if present. Otherwise, keep the old
behavior.

The definition of imx_rproc_rmem_to_resource() is added to a common place
as imx_dsp_rproc.c can also use it given that it suffers from the same
aforementioned problem.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/remoteproc/imx_rproc.c | 13 +++++++++++--
 drivers/remoteproc/imx_rproc.h | 21 +++++++++++++++++++++
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 7662ebd9d2f4..74719066905d 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -672,7 +672,7 @@ static int imx_rproc_prepare(struct rproc *rproc)
 		int err;
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, i++, &res);
+		err = imx_rproc_rmem_to_resource(np, i++, &res);
 		if (err)
 			break;
 
@@ -850,11 +850,20 @@ static int imx_rproc_addr_init(struct imx_rproc *priv,
 	if (nph <= 0)
 		return 0;
 
+	if (!of_property_present(np, "memory-region-names")) {
+		dev_warn(dev, "using node names for carveouts should be avoided\n");
+	} else {
+		if (nph != of_property_count_strings(np, "memory-region-names")) {
+			dev_err(dev, "invalid reserved memory name count\n");
+			return -EINVAL;
+		}
+	}
+
 	/* remap optional addresses */
 	for (a = 0; a < nph; a++) {
 		struct resource res;
 
-		err = of_reserved_mem_region_to_resource(np, a, &res);
+		err = imx_rproc_rmem_to_resource(np, a, &res);
 		if (err) {
 			dev_err(dev, "unable to resolve memory region\n");
 			return err;
diff --git a/drivers/remoteproc/imx_rproc.h b/drivers/remoteproc/imx_rproc.h
index 0d7d48352a10..3632bc375c71 100644
--- a/drivers/remoteproc/imx_rproc.h
+++ b/drivers/remoteproc/imx_rproc.h
@@ -7,6 +7,8 @@
 #ifndef _IMX_RPROC_H
 #define _IMX_RPROC_H
 
+#include <linux/of_reserved_mem.h>
+
 /* address translation table */
 struct imx_rproc_att {
 	u32 da;	/* device address (From Cortex M4 view)*/
@@ -45,4 +47,23 @@ struct imx_rproc_dcfg {
 	u32				reset_vector_mask;
 };
 
+static inline int imx_rproc_rmem_to_resource(struct device_node *np,
+					     int index,
+					     struct resource *res)
+{
+	int ret;
+
+	ret = of_reserved_mem_region_to_resource(np, index, res);
+	if (ret)
+		return ret;
+
+	/* "memory-region-names" is optional */
+	ret = of_property_read_string_index(np, "memory-region-names",
+					    index, &res->name);
+	if (ret == -EINVAL)
+		return 0;
+
+	return ret;
+}
+
 #endif /* _IMX_RPROC_H */
-- 
2.43.0


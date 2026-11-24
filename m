Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795511552;
	b=z4FjbsmHpuDASXywnAhGlzysngPJwqLjbWEm9FC38b3oVYrVDCl8M8lP66z0xemOvYsP
	 do9Qv7IMz72aZ7JPSFZHiogdPhMJvrs1rOVV1XQR+MwRTyzNHPQKOHQiBmDxuukmx1U1e
	 BJuhiiQpoi0pIgd6ydOSnr/gfwjNAU7ntiUT27BdFgf/mW3kZFHb2Ob75B2ophLm8RRtk
	 OjVyF6J0J78JybkT+BZ1F3FRD23FRM5SL9S1rj/WpfND1NZHqoOVYW8vRT/S6PgtFAW/t
	 SVrN+PKL88yDWAc8rjevS0jqsRE4e6G44trnDW0PFM6fO95tp3FW6+4sGm7hAw6ljng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795511552;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=O3FlsByaFaxp+/zhfhE9AvQlMkAjbHT2mmcY3mRyRnk=;
	b=JmfMsOI6ppHTP46ZaeF6JfTxQnG/w5F6grRJVZAv8EVeKUL5HbHOeKsvezo1pKu288RD
	 1Ev+X1ByMgewmgvahM7zhrwvWLe+tObi+UVaQwO/P1u/E0rKQZVHWIR/cl2cyuCFq4n0V
	 XZMBPoyeW/Qu4hvibi2hatNIH3o6R+hg1ne/HLDg+en7XXedZC8ziGi2Ddr6qxJLQtrHH
	 kk+gDb8aRw/r/TXv2FSQl2Ujlm69QV96VmtknfHNCwTcLL+jV6JlPf7cv7xfkz0rLWX2M
	 4aTd0i4Jhd91PazZOGt0Fj+i6Tw0EpZE3Rjr/kPkIhnIZZLpGE+lVqOxAQAaEYTJpww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="VpXUiT/j";
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56447606A31E
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 09:12:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56447606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VpXUiT/j
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F0BF54E41746;
	Tue, 24 Nov 2026 09:12:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6976601E1;
	Tue, 24 Nov 2026 09:12:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A6AC11E684FB;
	Tue, 24 Nov 2026 10:12:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795511549; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=O3FlsByaFaxp+/zhfhE9AvQlMkAjbHT2mmcY3mRyRnk=;
	b=VpXUiT/jktqRSQXuDH6sQbg6irOkH+DCmmwzTlSxn2F4uN2KE68HK8ubFpJIGhMUtroJoS
	76er0YaIPvGFqYQpRYODPZQX2UlUIMt27K8XlBCOGr9E+HTAxFMrZyLVKnCJ+9WB08RE24
	mwfSAfYetNQnc0CRquLDAu7iVzWzn9rBQ8XnYY8ANgdMitv5oKk+oEwm2uJ+V7vUDK5sWT
	C4TpqAsRsAtWlH2PhSEs79MUVIeFqlTzM/pVX4CcgwUKdOIqzLu22CWfVSFesJ7HaVBlRv
	OSZ2kZVszKU4p4IphjYEsqPpNPwkjua+yN0d30byQp0wy+5ddSEz78tGq3I2wQ==
From: "Richard Genoud (TI)" <richard.genoud@bootlin.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Beleswar Padhi <b-padhi@ti.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v7 2/6] remoteproc: k3: skip mapping firewalled lpm-metadata memory region
Date: Tue, 24 Nov 2026 10:12:17 +0100
Message-ID: <20261124091221.2593576-3-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261124091221.2593576-1-richard.genoud@bootlin.com>
References: <20261124091221.2593576-1-richard.genoud@bootlin.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The region lpm-metadata is firewalled by TIFS on Jacinto devices, so it
should not be mapped to prevent speculative access crashes

Just skip this memory region during initialization.

Signed-off-by: Richard Genoud (TI) <richard.genoud@bootlin.com>
---
 drivers/remoteproc/ti_k3_common.c | 36 +++++++++++++++++++++----------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index f79ccb57a372..5b7881263b8c 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -464,7 +464,7 @@ int k3_reserved_mem_init(struct k3_rproc *kproc)
 	struct device *dev = kproc->dev;
 	struct device_node *np = dev->of_node;
 	int num_rmems;
-	int ret, i;
+	int ret, i, j;
 
 	num_rmems = of_reserved_mem_region_count(np);
 	if (num_rmems < 0) {
@@ -494,30 +494,44 @@ int k3_reserved_mem_init(struct k3_rproc *kproc)
 		return -ENOMEM;
 
 	/* use remaining reserved memory regions for static carveouts */
-	for (i = 0; i < num_rmems; i++) {
+	for (j = 0, i = 0; i < num_rmems; i++) {
 		struct resource res;
+		const char *region_name;
 
 		ret = of_reserved_mem_region_to_resource(np, i + 1, &res);
 		if (ret)
 			return ret;
 
-		kproc->rmem[i].bus_addr = res.start;
+		ret = of_property_read_string_index(np, "memory-region-names",
+						    i + 1, &region_name);
+		/*
+		 * lpm-metadata is a firewalled region accessible only by TIFS.
+		 * Skip mapping it to avoid speculative access crashes.
+		 */
+		if (!ret && !strcmp(region_name, "lpm-metadata")) {
+			dev_dbg(dev, "Skipping firewalled memory region %s %pR\n",
+				region_name, &res);
+			continue;
+		}
+
+		kproc->rmem[j].bus_addr = res.start;
 		/* 64-bit address regions currently not supported */
-		kproc->rmem[i].dev_addr = (u32)res.start;
-		kproc->rmem[i].size = resource_size(&res);
-		kproc->rmem[i].cpu_addr = devm_ioremap_resource_wc(dev, &res);
-		if (IS_ERR(kproc->rmem[i].cpu_addr)) {
+		kproc->rmem[j].dev_addr = (u32)res.start;
+		kproc->rmem[j].size = resource_size(&res);
+		kproc->rmem[j].cpu_addr = devm_ioremap_resource_wc(dev, &res);
+		if (IS_ERR(kproc->rmem[j].cpu_addr)) {
 			dev_err(dev, "failed to map reserved memory#%d at %pR\n",
 				i + 1, &res);
 			return -ENOMEM;
 		}
 
 		dev_dbg(dev, "reserved memory%d: bus addr %pa size 0x%zx va %p da 0x%x\n",
-			i + 1, &kproc->rmem[i].bus_addr,
-			kproc->rmem[i].size, kproc->rmem[i].cpu_addr,
-			kproc->rmem[i].dev_addr);
+			j + 1, &kproc->rmem[j].bus_addr,
+			kproc->rmem[j].size, kproc->rmem[j].cpu_addr,
+			kproc->rmem[j].dev_addr);
+		j++;
 	}
-	kproc->num_rmems = num_rmems;
+	kproc->num_rmems = j;
 
 	return 0;
 }

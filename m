Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920876;
	b=IEykIYfvSQUpCsxCMrY9wuRS5u9edAOu+dQSyvevUhXvpg6SWVkTYo3BqOitObDVwWhi
	 ZfjRwdmYj7mb7GQuvy6SeBywAWGlf1BZ8cLXdy8nXyik4frSbnUvYNDzbwS7Q4JdPPiRQ
	 HjVoIz7AnVAvSrhALsOImwIUedPD2foam354PhprI765eX+3+rvquujMrQ7ko5OG5N9LO
	 WgTJ3Dt46b/45gKVjstV3sDiiTVM1HCRq/hLKH0lwe47mJhj6CXJ31iMhYOgsfWhJuOve
	 g52gIkG36MLcLDv+skgQjuXrRiKnYoiMdoMcu0l3Nz1U2phExD1Atvsao0oW5uzLZag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920876;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=O3FlsByaFaxp+/zhfhE9AvQlMkAjbHT2mmcY3mRyRnk=;
	b=M30M29z/+WdjGK4pxdkjvMy1J75ku88Aa48LFx4C5kxzHenh/zGChlX0tIfbrTPjak1v
	 0a8xwI6zs0s9Ka4U6iR4x+0MSmODXfEM89i5L4fBd72rJ6Mg02y3tqB7nGJjc4UQaLLqX
	 8/X5cerm6fhuDaGRlGmII1e6sUJCnC8X03mL+LXlgaBzEWWmNs0g9lRfkGK1dFTM3FuLG
	 g2qQIhOuaw4MIQefcMQR3rd1qfCszfQtwVV7RSMfFBfvMBJcFK+J90kNVpAjiS0LWTnZo
	 TBagFVuff6JyqqGL2wBZAUc9oe3A+wHienP5dy18CwhG05GVtebg57199lOUbWft8Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=w6BieCWK;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF95606A886
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 13:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FF95606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=w6BieCWK
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 341734E4156F;
	Tue, 17 Nov 2026 13:07:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 034AC5FC81;
	Tue, 17 Nov 2026 13:07:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 40B7E11BC0035;
	Tue, 17 Nov 2026 14:07:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794920872; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=O3FlsByaFaxp+/zhfhE9AvQlMkAjbHT2mmcY3mRyRnk=;
	b=w6BieCWKAZYDm1VFVB+14gYHziDY1jrdhfbgyVSIJS1kShIuV2epq1Wrajx68AP9cCDfHq
	0ZtESK7UcngAdJx5YZUkQMduOOXa72+flOFKXB+QvxO8Rk50XgM1/e9x6nxk3wINR0ctlo
	zLkP/k8MuUsIaDpHYwKdEkQJacq1xKGMLTMMhQjJQCz+yxPUeTYK7K84ydSK3RVvE/7Sf8
	sdEMJ/4Wj+fHXf+R2R1jWPwI2cC9mSHeX9uVnjx7Uvn6z0p02frke2DRVttCeAobA4ybLC
	WfYymvqub0tCed2R5woNmvxTMPg0KYoFsIkXkbBreMYDsKOL8SsNDjWqucZ1Ew==
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
Subject: [PATCH v6 2/6] remoteproc: k3: skip mapping firewalled lpm-metadata memory region
Date: Tue, 17 Nov 2026 14:07:33 +0100
Message-ID: <20261117130737.141993-3-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117130737.141993-1-richard.genoud@bootlin.com>
References: <20261117130737.141993-1-richard.genoud@bootlin.com>
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

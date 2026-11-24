Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531415;
	b=QUGDGUtVM9pPfQKMulH3FAoc7jKbfMHT7REXpaIVs8C1vnwnhK7klJlEsHhF3C9bYOAu
	 +MRJkTXgadZBoPmi5CWycI1F4ukorsEDG2W0PVGXVVvYHgWA9M0PHsElEInEXBuXBYcQU
	 BdKdcdm+JQlLFfEOsvgAavZwU5c8uxYyZsfORk3zIbmtETZwknIb/zHnequ5P73HvcxKR
	 nmjjwA8MdKoHlungokoglQaWW2wKTGuoRmc6OGAzrIbb+TKft7/vmpkVOaV6/r95BPiGw
	 DTfmOAf6GDaTSZDRR848ydPNjDI3/EJXn57b1nfYJ1KCVV2E5NA9IxRntxsqholj8uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531415;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=pDDeBaiwg/WpPN6897we0vfFKhysWC2sgbefrfOmhUU=;
	b=CjhHPFHTNSIr8QxmCFo96nLQuAU7mgAWrWnI+J4GnB06Mac3JL1WhmdAbdYfoOqz0Y6h
	 PBLqiXQ4x8zG9g1Lc9x7Vz1MYwLlLAaL7Ch/wBkcY4Rl2Y5xApJXcprr8jQzIvmnBp3Qy
	 jcg06dvZYEgz2lDi3bB6CU8zvQKwCDFhLKedNfOYNSzt6FLKdKDaBHK8vXYumD5TbjV9e
	 /rH+ctDjJDmcUxYEAFddoFTyBMWJCX3FyaECVAEPTBHvXSQBzRiBu/hVbSqQh98JRDLfl
	 rvHJAtwEbz5eEGqgtyODLTHh+SmzAJSPnaJKBBVVoVT+s8to86LxXP0CgmMeNWutm+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=aZuJxikh;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DA7606A33C;
	Tue, 24 Nov 2026 14:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0DA7606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=aZuJxikh
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 83ED34E41764;
	Tue, 24 Nov 2026 14:43:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 593D1601E1;
	Tue, 24 Nov 2026 14:43:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4C96C11E6997A;
	Tue, 24 Nov 2026 15:43:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795531412; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pDDeBaiwg/WpPN6897we0vfFKhysWC2sgbefrfOmhUU=;
	b=aZuJxikh/d6DIgJdWk5XmggCxkHZHGqyy+AdeNpJnF8shjY9SXNYloeIYqxLQYkgUPPs8p
	PSvyOoE4ZJfCCai+/fF4iLNOa2zuSh+/vj1DJDTmV9SXx+OcoBt4AzBap9T8ITuSLwH2Df
	naYvQDHQoIAirMrUaVSrbLVsKG+XCYGPQBSTipFGTALjWRzdG+F1kKMUzkO+zm9d18mw4l
	ZTlkKRuOlBMr3gHLxprZbjvrsBls7+C7zzx96J//9O8R5DIXFeEhcGP6zBlzW2GfyOfEDp
	rHgiCcNpaP0ETiIdIm4p+l7RdqVRMD8fkUgS8s399UduDhPnfYd7Sc2F/B2+LA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Nov 2026 15:43:02 +0100
Subject: [PATCH v5 1/6] spi: spi-mem: Rename the DQS setter and pin field
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-winbond-nand-next-phy-tuning-v5-1-261e0e712857@bootlin.com>
References: <20261124-winbond-nand-next-phy-tuning-v5-0-261e0e712857@bootlin.com>
In-Reply-To: <20261124-winbond-nand-next-phy-tuning-v5-0-261e0e712857@bootlin.com>
To: Mark Brown <broonie@kernel.org>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
 Michael Walle <mwalle@kernel.org>, 
 Takahiro Kuwano <takahiro.kuwano@infineon.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, praneeth@ti.com, 
 u-kumar1@ti.com, p-mantena@ti.com, a-dutta@ti.com, s-k6@ti.com, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The current approach was a bit too simple. Using the DQS feature
requires:
1- the chip to feature a DQS pin
2- proper wiring between the host and the chip
3- the controller capability to use it

Rename the helper and the field to reflect that we are talking here
about (1) the chip capability.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c       | 10 +++++-----
 include/linux/spi/spi-mem.h |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 8047b7508c8d..65956cf62156 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -546,7 +546,7 @@ const char *spi_mem_get_name(struct spi_mem *mem)
 EXPORT_SYMBOL_GPL(spi_mem_get_name);
 
 /**
- * spi_mem_set_dqs() - Mark DQS as being available
+ * spi_mem_set_dqs_pin_available() - Mark DQS as being available
  * @mem: the SPI memory
  *
  * When reading at high frequencies (> 100MHz), especially when DTR is enabled,
@@ -559,11 +559,11 @@ EXPORT_SYMBOL_GPL(spi_mem_get_name);
  * Set the DQS boolean if the feature is available and configured at the chip
  * level. Controllers may query this value.
  */
-void spi_mem_set_dqs(struct spi_mem *mem)
+void spi_mem_set_dqs_pin_available(struct spi_mem *mem)
 {
-	mem->dqs = true;
+	mem->dqs_pin = true;
 }
-EXPORT_SYMBOL_GPL(spi_mem_set_dqs);
+EXPORT_SYMBOL_GPL(spi_mem_set_dqs_pin_available);
 
 /**
  * spi_mem_has_dqs() - Query whether the DQS is available or not
@@ -573,7 +573,7 @@ EXPORT_SYMBOL_GPL(spi_mem_set_dqs);
  */
 bool spi_mem_has_dqs(struct spi_mem *mem)
 {
-	return mem->dqs;
+	return mem->dqs_pin;
 }
 EXPORT_SYMBOL_GPL(spi_mem_has_dqs);
 
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 0cce6b57242a..55de48c277ac 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -275,7 +275,7 @@ struct spi_mem_dirmap_desc {
  * @spi: the underlying SPI device
  * @drvpriv: spi_mem_driver private data
  * @name: name of the SPI memory device
- * @dqs: extra data trobe pin available for high frequency read operations
+ * @dqs_pin: the memory provides a DQS pin
  *
  * Extra information that describe the SPI memory device and may be needed by
  * the controller to properly handle this device should be placed here.
@@ -287,7 +287,7 @@ struct spi_mem {
 	struct spi_device *spi;
 	void *drvpriv;
 	const char *name;
-	bool dqs;
+	bool dqs_pin;
 };
 
 /**
@@ -463,7 +463,7 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 }
 #endif /* CONFIG_SPI_MEM */
 
-void spi_mem_set_dqs(struct spi_mem *mem);
+void spi_mem_set_dqs_pin_available(struct spi_mem *mem);
 bool spi_mem_has_dqs(struct spi_mem *mem);
 int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op);
 void spi_mem_adjust_op_freq(struct spi_mem *mem, struct spi_mem_op *op);

-- 
2.56.0


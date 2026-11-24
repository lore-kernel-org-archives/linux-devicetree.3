Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531423;
	b=PA/0L/pPrlxpbeTcBNXAeP+8L4xNSp895SNQGA2Hl7Nke8Ijtz5G2SfLED0ipba5TTWm
	 YTCKPYF26ylwHmzDTPR8wTmAKIP92gp3Qiv4XSDJse7ZNI84b8t5S6sV6mFsRZ6kBKQEE
	 GfgBM0LOol4qtMEsjam6N3OAQ3o1h2mbfzCkApQLmi9EcMRTmxPZUd6PKFWIgP/9K9s4Y
	 LbtCHqamrsIqceIIz9WI133BZhdtrk7XtLMZAEKD2sUmvOwJHngF1PTqAUN6aaazO7AZx
	 XVu1iywj/74Rkp+uEBrF8RnePMdSyu62mf/iZQN6000/7TtSIZadTdc6wdF3iWn1r7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531423;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=rsSEC3YMSOYTdSlx2oUUkC2uE8Ycw6TWa+yYdC0gjCk=;
	b=UhKQ9NUJ4jvJorfz1BsJ/iAzrzqdLE0bZirlqWXv8rMUg3sP2L2sscRbKUTMfCutx0v5
	 Y685rg5GOeudjcQ36IFo9v6S62ndtYON+2TDQHyMjmsNAuW/xjIAc+EAqn6wVqimo6kcq
	 s/sE1W1261GSaMSpvg677acWCY0Z85VkOKJDSTPUCcVgWR+m49YGJq2HWKq5lD/Q7Zv+i
	 UlLpDBv2ISQpAfK/PD473vyjnL6ufA6l/36C3ftB2H/PDg/fj0wdcN3SQjsE1MpOTphma
	 E3KwPorY69VfzUnlYMxxkUGR5Xh+i2rVtamje90vLy/LOa2RzFY4dijT9wIn+x780Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2Q5aO5hJ;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A09F606A685
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:43:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A09F606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2Q5aO5hJ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D63914E41766;
	Tue, 24 Nov 2026 14:43:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A2903601E1;
	Tue, 24 Nov 2026 14:43:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2368311E6998F;
	Tue, 24 Nov 2026 15:43:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795531420; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rsSEC3YMSOYTdSlx2oUUkC2uE8Ycw6TWa+yYdC0gjCk=;
	b=2Q5aO5hJ5+SN9asIz5WDsyYJxyxD74MgXS0GLwv5PFHifYgtWbwzN9brjfMZMyFxM3g8qD
	h+GT+NL9y6pNEnPvCGEDGtffLrpTgyA1A9sEtebBkzEpfd/PsXXEcaD3ep3O0T763j0XwX
	qKjDSrOj4L6gzQ/XSSsL9CWpvWONE1JqImCVi1JdeR6dknbJMLR6Mw/fCRGMyMAOJiflX+
	WKozlbUjK8JpPSkscMiEWb9IOAxQ3aCzlhJJAWMMklCTkpszggFKJUNaa80UVgXs42tozX
	5b99EfzCn8xLRAVLTVC+QcZti4c7DXvTtZthztdUOjCNhu62HazsjIM7A01H9w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Nov 2026 15:43:05 +0100
Subject: [PATCH v5 4/6] spi: spi-mem: Take the DQS wiring into account
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
Message-Id: <20261124-winbond-nand-next-phy-tuning-v5-4-261e0e712857@bootlin.com>
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

The DQS line may not be routed between the memory and the controller.
Parse the spi-dqs-not-wired property when the SPI memory device is
created and only report DQS as available when the memory supports it and
the line is wired.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c       | 7 +++++--
 include/linux/spi/spi-mem.h | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 76674750237e..9537756e5afc 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -8,6 +8,7 @@
 #include <linux/dmaengine.h>
 #include <linux/iopoll.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/spi/spi.h>
 #include <linux/spi/spi-mem.h>
 #include <linux/sched/task_stack.h>
@@ -569,11 +570,11 @@ EXPORT_SYMBOL_GPL(spi_mem_set_dqs_pin_available);
  * @mem: the SPI memory
  *
  * Return: a boolean indicating whether the DQS signal is usable or not. DQS is
- * usable when the memory supports it.
+ * usable when the memory supports it and the line is wired.
  */
 bool spi_mem_dqs_is_usable(struct spi_mem *mem)
 {
-	return mem->dqs_pin;
+	return mem->dqs_pin && mem->dqs_wired;
 }
 EXPORT_SYMBOL_GPL(spi_mem_dqs_is_usable);
 
@@ -1089,6 +1090,8 @@ static int spi_mem_probe(struct spi_device *spi)
 		return -ENOMEM;
 
 	mem->spi = spi;
+	mem->dqs_wired = !device_property_read_bool(&spi->dev,
+						    "spi-dqs-not-wired");
 
 	if (ctlr->mem_ops && ctlr->mem_ops->get_name)
 		mem->name = ctlr->mem_ops->get_name(mem);
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 82c417a661e0..ed581a4d4e9a 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -276,6 +276,7 @@ struct spi_mem_dirmap_desc {
  * @drvpriv: spi_mem_driver private data
  * @name: name of the SPI memory device
  * @dqs_pin: the memory provides a DQS pin
+ * @dqs_wired: the DQS line is routed to the controller
  *
  * Extra information that describe the SPI memory device and may be needed by
  * the controller to properly handle this device should be placed here.
@@ -288,6 +289,7 @@ struct spi_mem {
 	void *drvpriv;
 	const char *name;
 	bool dqs_pin;
+	bool dqs_wired;
 };
 
 /**

-- 
2.56.0


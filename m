Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194893;
	b=AuEwlKzhXMXJLp3T4gqAd9XMLJ6T9dK89kn6Mjn3RXLDtnpEgH8UJ7uvOQaCGJYO7ycJ
	 RYT97DETSTuJ3XMF+rgRVd31nkU03Amthdb3XALy4MJlondzLSHxDi/QvC1eQcuQmtDAN
	 NBDkp1eBqKEcWjlqiHsA/YCz/UAOXrznRum51f6VEJArJO1m5wJ2lQvR2GtaP3mbi/M+T
	 5g+fPThJJD/KGR7yhASpmEsu4t1m4uQyiXbUSqkHdWO2bAvFjI7I2o5X/v7X3/kZqGkNX
	 4WjhTlNOTLTOPx52TXVeGSAtOUg/2hbNU5ypP0G1J9nLk4XyfnvAVwh0PjNGNsPm9og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194893;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=lJI13tJYjzjGtIHD9Wd2cBZDEmFMRj8+hARz6pmVykE=;
	b=FObd7mLHgAoiKNykBGirwK5vlb5VMOBtgAMhrhuDXNxF1s0+6IHyPmECiobYAWxAIVN7
	 BWQFrmYkTqKoGcpwDzjVbUsblCDWXaVdBN+XWKV1gjBh+XVx0z76u2vjQ4KlnJ+OfMJys
	 Rx37H9fmq6u4Hmt6ngoY8yrc8OFlnwLPNAq1Bg+HT6BSJbwAUS0kny+nK0MbSLcvIKeCp
	 g3zP+nw3KLN7ln5Qn39eDuI1WyvFrpTTIS2vRmRpUWPNID4Am6fpkvWpevX1QKEf2FRuB
	 fIi9sv043ZhC2Txa4Guku5e9n0XrW/9eWI6tUZXiAGGqz6TcGtZ3e86jZumy5pc999A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wyZRYaA7;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66B860A260F;
	Fri, 20 Nov 2026 17:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E66B860A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=wyZRYaA7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B518C1A175A;
	Fri, 20 Nov 2026 17:14:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8A0A0601B9;
	Fri, 20 Nov 2026 17:14:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 015A511BC0500;
	Fri, 20 Nov 2026 18:14:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795194889; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lJI13tJYjzjGtIHD9Wd2cBZDEmFMRj8+hARz6pmVykE=;
	b=wyZRYaA7rdUucPHhAgRe3w46AtJR27dhbOgZmFrDyPf3Qj9Z2yWMvm35Jzj/Ce+EcEIhA/
	AUMvShEeawcwrFFZFNmpmKPlkrrCeUjtXBjfcWGZEPNJLCUs0KSi8cvX6el/rKF64hWQ8p
	yWNeA0doxrInbs7qQmBIb0VFVf6i1XRm4meS+c3CRVXjpYQS7TJhclXFp9A6V7Ra377TW1
	LTWwhqSM0yZB9CTnbXAvIfHhrTMYocVLcyCI8zsQyXUZ7Qu0REy7y8Jw0iDU76AKzISD0v
	kTpcZlFbWooysaos0m7hhq6p03SF9ZFaK+aC60cbcoZZt0OcCe3sHZz5jyXsEQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 20 Nov 2026 18:14:32 +0100
Subject: [PATCH v4 06/11] spi: cadence-quadspi: Advertise DQS support
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
Message-Id: <20261120-winbond-nand-next-phy-tuning-v4-6-8c21e1f71f41@bootlin.com>
References: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
In-Reply-To: <20261120-winbond-nand-next-phy-tuning-v4-0-8c21e1f71f41@bootlin.com>
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

The Cadence QSPI controller supports DQS read data capture. Advertise this
capability in the controller memory capabilities so that
spi_mem_dqs_is_usable() reports DQS as usable when the memory supports it
and the DQS line is wired.

This lets memory drivers enable the DQS output only when the controller is
able to make use of it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 2982df7fd092..72a5101c4a8c 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -3770,12 +3770,14 @@ static const struct spi_controller_mem_ops cqspi_mem_ops = {
 static const struct spi_controller_mem_caps cqspi_mem_caps = {
 	.dtr = true,
 	.per_op_freq = true,
+	.dqs = true,
 };
 
 static const struct spi_controller_mem_caps cqspi_am654_mem_caps = {
 	.dtr = true,
 	.per_op_freq = true,
 	.no_cs_assertion = true,
+	.dqs = true,
 };
 
 static int cqspi_setup_flash(struct cqspi_st *cqspi)

-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194900;
	b=3dTwC1oyvrwp+uoB7jOqwIoctIbhxM0SXdppWeC1ab/lFg07rEknZuxen+UaJEWSv3aU
	 loVrTBj5G55kmPEqWOb0Yz2lBQ8UfZPbn6OgVG4mdaZ+Apz5eg0WyKp5REka/yUhAFtB8
	 oudzvOmbrMMW8zj6AH0HQWXpmn5qXjiXvqmBJJ/5yleYCZuOpJSjFT3goMHm89up83asG
	 nuRAwPOBHKKu5RSsZlRE806LuoUc/B/1icYtabQn59tBb4Y0wXfYDE6YbQz2tfaj3ZdvR
	 MlznfdmgtK7dlv0VvNp6f7DSFKua3OFwO09XX5oJZUpXiqgIBLAlX1XsakdurXW+t6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194900;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=c8TjqIKbyMReltOgDe2OyJat4Lo0bIv1OAsaj1Ilaz0=;
	b=mhdgC9CZPX5GYD3vEA61tTMwA99nUc1g3YacDX520SXiCsEirK28qadvRsimBxm29Ua4
	 NJ9ApG7RmQokdKjfyvRwqeo640WIXzwiHqbvG/95f5M4ONhlnr09rtbkQGzdaGjGctCBn
	 f5obRishpz221c+TbClmncorVqQPhFAKAvkUYXF9r2guIubjZASfehG7vzXWtf9qGisrV
	 QFw/8+Y4Bhes1gdbh48soy/DWdsFJeXw8WLCYd8xCvfMQWEh2ttpnaUcGDhCsmHC0qEBQ
	 RFDyyU2/clU6ATRnt6oh8nywNwfq1gjWQ+q1zKRNJmo+CfYqJFBAvRRioUALFkgAqQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="ZOna/YKN";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D6B60A2608
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06D6B60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZOna/YKN
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 77CAEC62222;
	Fri, 20 Nov 2026 17:15:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AC587601B9;
	Fri, 20 Nov 2026 17:14:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 62C1211BC04A2;
	Fri, 20 Nov 2026 18:14:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795194894; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=c8TjqIKbyMReltOgDe2OyJat4Lo0bIv1OAsaj1Ilaz0=;
	b=ZOna/YKNEjgtsubmrK1U/LoTSwzfQMFL4VHBsA53RFGid3P3xVGJfMQYuJT9pOdYCDD5bO
	qpg6sF82/x8zGjNk7sf9eNtrt/DoqoDnTOZqQcbLGY2yTkbq0S6IJiQjKU1fW4too0afB3
	gS8G252+oRsPB3QNOAeHnjCMbt0vA+QvghxAe2d5KZ6h594oMkaHpGpUiVW5clX6bEbXcM
	4MMmVI/Qi7iLbhmeDBgo9w8diCboUwKYGKW98FinlI8uwstCd5eFYyzRyiHOonHCpcWD5Q
	mwYSfVzau2ISiWA1MZUGp3q3JvgbnocHVwMKzjUzXgR1LNnF9GdxkPey8qTTaw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 20 Nov 2026 18:14:34 +0100
Subject: [PATCH v4 08/11] spi: cadence-quadspi: Check DQS usability before
 enabling DQS capture
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
Message-Id: <20261120-winbond-nand-next-phy-tuning-v4-8-8c21e1f71f41@bootlin.com>
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

The DTR tuning path unconditionally enables DQS capture. But DQS is only
usable when the memory supports it, the DQS line is wired to the
controller and the controller is capable. Use the spi-mem helper that
combines these conditions instead of assuming DQS is always available.

This lets the driver fall back to delay-based capture for DTR memories
that do not have a usable DQS line.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 683924a4a274..05f64ebb1965 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -3538,7 +3538,7 @@ static int cqspi_am654_ospi_execute_tuning(struct spi_mem *mem,
 	f_pdata->dtr = op_is_dtr;
 
 	if (op_is_dtr) {
-		f_pdata->use_dqs = true;
+		f_pdata->use_dqs = spi_mem_dqs_is_usable(mem);
 		cqspi_phy_pre_config(cqspi, f_pdata, false);
 		ret = cqspi_phy_tuning_ddr(f_pdata, mem);
 	} else {

-- 
2.56.0


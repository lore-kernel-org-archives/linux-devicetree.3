Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194907;
	b=YUFYFPzok4ygBLIjlRwOATO+Q00gQJ0diCLQ6Qi9cz42Ul0T4qzybh4WHW+uXIPCZXvH
	 Kg5I32jgxIwOps4IOD9vN8/9ZFR7rTbwRi4823Wl39pmOQkWokddnR1ZsrN13OHRxtQQ+
	 zCdt5Cn4oAHj/F5EJO+Wpk9gl6KEtcec19rhdCe4KNTaF0fPR5rZbgP0ao5/i0RdXab1r
	 66T2sfqLdCKmKkkzi71IwIsDUqsDKGz9cujnaHU9wTNOKU5AoxToUX49gcKev6Hq9lRM+
	 3Bf73MgaLtI4HvIZIqgx5F4QVHgPILBxmpSv2dKmCfGsJMNZ0MfFZTJN1yXBDBqD9Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194907;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=31+QEQkTdBsAyjdQylHnzUm9tPSei/fUeG542zDh7q0=;
	b=cjwzpwNMkPabh5v5UmSOq/KuWcdM1V7NrmWwEzT/hEl7kHTTgpTu3sBIgky6Dgr1zLSL
	 E/UiVk7TCBZDMUnhctaiYLOCP70l9EBC1a/PSboqvQmUsSnncSdlBEs44Czk6aC2m8VoL
	 DVhipXiyeZrQuRPF6hRpjt8JgZu3KfoKWytCuF4S1kvhxN+DxvlPrqnVWhg88/KXmLjiW
	 ehCdnvN7SfG3+7TZxXjrKtt/8+ggVy3ySN4YqzJOey6WHKiv2Q+3AbNRX6WnQCVYpbD4b
	 /tkTdHjR+v6IHcn0+wBhRTn3d0vHzita/Dj9yzQzmi925pA22WL9vhznld9vQGzqO3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="fHR6XY/d";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2886E60A2605
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2886E60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=fHR6XY/d
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4A9F0C62220;
	Fri, 20 Nov 2026 17:15:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 824A1601B9;
	Fri, 20 Nov 2026 17:15:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97D3811BC05A8;
	Fri, 20 Nov 2026 18:14:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795194900; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=31+QEQkTdBsAyjdQylHnzUm9tPSei/fUeG542zDh7q0=;
	b=fHR6XY/dsAuwkq49kqO1G1gpUJP18bQnFEHtqr2pY7KpDvCdkr87Rwh7YZhIvsLktmfC04
	kcNsvcVM5iVKZdKENVsIDsam65sE40JjUcsLgDMSQXITFGRD0nof1letJMJyRE/R/jt9Bg
	2UW+K39vOD8hY04ZbMcWizS4qb+A1PDRUGnlpjCGf0DTT6SoCbl5K6ICBHqF9ji0qwz3a8
	IcogV3nNRdxH9BOr9E0u3Ph8TuPjQ331sMkiRAapC7yXlyRhH6LRHReaMjkM4bOIHEaaUd
	PS9MRvB5O0vxPONabqGAyNVLpb0McN0fsI7kcDwBuedREZNdrDFwHjImOx1SYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 20 Nov 2026 18:14:36 +0100
Subject: [PATCH v4 10/11] mtd: spi-nand: Set the DQS spi-mem capability if
 available
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
Message-Id: <20261120-winbond-nand-next-phy-tuning-v4-10-8c21e1f71f41@bootlin.com>
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

Check whether the NAND is capable of generating a DQS signal and advertise
the capability through the spi-mem layer. Do it as soon as the chip is
identified and before the SSDR/ODTR operation variants are negotiated, so
that controllers can take the capability into account when they need it.

Whether the DQS line is actually wired is described by the
spi-dqs-not-wired DT property and handled by the spi-mem layer, which
only reports DQS as available when the chip supports it, the line is
wired and the controller can use it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/core.c | 3 +++
 include/linux/mtd/spinand.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index fee4a48b4c7f..6e1b7976d237 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -1797,6 +1797,9 @@ int spinand_match_and_init(struct spinand_device *spinand,
 			}
 		}
 
+		if (spinand->flags & SPINAND_HAS_DQS)
+			spi_mem_set_dqs_pin_available(spinand->spimem);
+
 		/* I/O variants selection with octo-spi DDR commands (optional) */
 
 		ret = spinand_init_odtr_instruction_set(spinand);
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 87107f0955eb..990d3e9ac3fe 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -492,6 +492,7 @@ struct spinand_ecc_info {
 #define SPINAND_HAS_READ_PLANE_SELECT_BIT		BIT(3)
 #define SPINAND_NO_RAW_ACCESS				BIT(4)
 #define SPINAND_ODTR_PACKED_PAGE_READ			BIT(5)
+#define SPINAND_HAS_DQS					BIT(6)
 
 /**
  * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure

-- 
2.56.0


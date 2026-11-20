Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194907;
	b=Fq2dLPUl0kHMPktbyemb/2VFgV3sQythgCh7Js/BKw1EMJTdBzDI07hUtGNsTVttVnn7
	 en2wAU0JaGDih5HSS42Gbmqqo2R0MAFdZg3G5M14rwUr80uIKQ/FLL6Z7KOb+RWpNThPG
	 JTLpjGtUC+K2zl4I3MPRIvQHRQG1RTtW3OKXHbdowdSe247sOG26f2dxTl92MvdayQKyK
	 hpLiqoW4GsA5YlUo30djdKat6TL8jEZ/Yw9sOPqvQ/h8XgkKkBqZ6G3NAGsKy70Q5c6C3
	 z7R7vuiTs0aYcoee/Sh6tdQPCeNkGOPmXPmdw/CbeRcoqJIm49+xGVhRGj1DEd8NvdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194907;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=LCqBoB1Pe9pUcyqNRVvDpXDDWYdn3GrEsr7pawWUEio=;
	b=IGXGdQ5wCCzweqrB6IumSlS0O0wEoVSlC79FNS51mCN6IfYEIaDVKXOo8WyQPvJwYKuc
	 1YScmo3nxmFmp6i3BpEN21U5MdSxA2s5LKo3H/qcw6ussHc9wSLNHgZNS5iJiXdKMX7pz
	 K+4QbbBHFW6iirHkE29JZPbdLGEft8Bo4dIWZB/keMEHGqqr3A6ZGIxEeGRnOosz6pKKc
	 k78vxMDCXXQcbKarwzzTIKBybbTFcLzKtbu8GFVZ5e/mR4aeT+W37x1l2QTuFhVkPfbbq
	 ktehiB+Walo/ZgCfFOMXZD9EMAq5x3iuvwhzDrigDkOdZgkPIquJbjBpp/OOKfUXPeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Hvbo+by9;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8714F60A261B
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 17:15:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8714F60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Hvbo+by9
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1D001C62223;
	Fri, 20 Nov 2026 17:15:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 555A1601B9;
	Fri, 20 Nov 2026 17:15:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35FA311BC052A;
	Fri, 20 Nov 2026 18:15:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795194903; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LCqBoB1Pe9pUcyqNRVvDpXDDWYdn3GrEsr7pawWUEio=;
	b=Hvbo+by9OQ1Ie+2GH4ZvOUvdrb3Vn9EXeZgN6r0Dvz+e3lGbIGWRmpMwlXeQxWdOiE3/QE
	R14xZr9BjIOJklHTHQS7Xkbn0amCLX+1rlXoH+1P1jj5S9FxbBjXCcZwRXQbsy8+sKtTW8
	MeEburfDqlisRxFrLZIQdeFfzl9sMSZX7Mo4qaAJR8uRa7LwB4yTusoPyIM/zb6yOcfWSn
	g3xwv59bFrMkUtQBuPvq7SUGla1LcIC7Noo47RRJDFM9WrT7zVtwSKP8M9O/RvE7//4o5t
	+RNEe5DnSDNXsCKAsR7/U/Z6q8RWMlKT8FogljpLq4D2OuGWwGf4gLp+cC+nBw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 20 Nov 2026 18:14:37 +0100
Subject: [PATCH v4 11/11] mtd: spi-nand: winbond: Enable the DQS pin on
 W35N**JW series
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
Message-Id: <20261120-winbond-nand-next-phy-tuning-v4-11-8c21e1f71f41@bootlin.com>
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

These chips have a DQS pin. Enable its output in DTR mode when the line is
reported as available by the spi-mem layer, which means the chip has DQS,
the line is wired to the controller and the controller supports DQS. There
is apparently no issue in setting it for lower frequencies, and the extra
power consumption seems very low compared to the current drawn by the NAND
array itself while operating, but keep it disabled when the line is not
wired or the controller cannot use it to avoid useless power consumption.

This setting will be required for high speed I/O transfers (with PHY
tuning).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/nand/spi/winbond.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/spi/winbond.c b/drivers/mtd/nand/spi/winbond.c
index 810975808c97..336bf743778c 100644
--- a/drivers/mtd/nand/spi/winbond.c
+++ b/drivers/mtd/nand/spi/winbond.c
@@ -667,7 +667,9 @@ static int w35n0xjw_vcr_cfg(struct spinand_device *spinand,
 	else if (!single && !dtr)
 		io_mode = W35N01JW_VCR_IO_MODE_OCTAL_SDR;
 	else if (!single && dtr)
-		io_mode = W35N01JW_VCR_IO_MODE_OCTAL_DDR;
+		io_mode = spi_mem_dqs_is_usable(spinand->spimem) ?
+			  W35N01JW_VCR_IO_MODE_OCTAL_DDR_DS :
+			  W35N01JW_VCR_IO_MODE_OCTAL_DDR;
 	else
 		return -EINVAL;
 
@@ -749,7 +751,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 							&write_cache_octal_variants,
 							&update_cache_octal_variants,
 							&cont_read_cache_octal_variants),
-		     0,
+		     SPINAND_HAS_DQS,
 		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
 		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg),
@@ -804,7 +806,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 							&write_cache_octal_variants,
 							&update_cache_octal_variants,
 							&cont_read_cache_octal_variants),
-		     SPINAND_ODTR_PACKED_PAGE_READ,
+		     SPINAND_ODTR_PACKED_PAGE_READ | SPINAND_HAS_DQS,
 		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
 		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg),
@@ -845,7 +847,7 @@ static const struct spinand_info winbond_spinand_table[] = {
 							&write_cache_octal_variants,
 							&update_cache_octal_variants,
 							&cont_read_cache_octal_variants),
-		     SPINAND_ODTR_PACKED_PAGE_READ,
+		     SPINAND_ODTR_PACKED_PAGE_READ | SPINAND_HAS_DQS,
 		     SPINAND_INFO_VENDOR_OPS(&winbond_w35_ops),
 		     SPINAND_ECCINFO(&w35n01jw_ooblayout, w25w35nxxjw_ecc_get_status),
 		     SPINAND_CONFIGURE_CHIP(w35n0xjw_vcr_cfg),

-- 
2.56.0


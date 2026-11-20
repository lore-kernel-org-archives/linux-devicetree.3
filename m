Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795194896;
	b=fURC+dIUZ1FGUW/8YxUiMqlChYbI3QCVRLVNP2Kh+pPdnjbtdp7Ahpn3BkfTA6cQS3j7
	 1KvmBPIcUC4M8e6zlpmVMV1Tkfiaf4COvhXY4dCuIDCjggCKd+Glo0XLbPXDKSvar0Xzn
	 6p+CZu1X3VDsVsB0+hu2Inwk8iUCVekh+5DZ2oa641aABgxV9tKRzmwjH8K25a0GfA/+U
	 FUhizvFPHihOMWryBmNrp6Ow4h3RT28GMMBWLJWQDq9z9E6AfY2PYy9QVL6mRCIq/aK92
	 wOTvQhd5A4FDstdrYqZy79CsTCFl/LgMz9RixTrd6cgYO6v7IQgAlYgm6bC1kyp4RHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795194896;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=YbvWbjLCYoKp6tHNvaVP7QLDPYtscluj35tRrDoYGIs=;
	b=wJlHMBAiSSDBS/qnneRVBmpoCKtiugVWrqlb6OQdCmI2mSuNFMg+CaZC90cxL5/Yw/X+
	 p1Vhf3qsTemDEPCjTkec0Mg6dPuyMuiwS9ZwvcwtTijBvtTdK3FEWNIftSnZJd0a9mS46
	 nETEnNCTX/AYUOe6cGoW+5fPdy+PYUQyRwlcVPePrh8RzmfVWnzq5/LsgyKscnHjOGnto
	 V+NSVeX2S8DLmh3rylVDG3fVb3k8RKIWewum+ePiOFc8hjdxcAV2bs8qAbmVjRAAx0A0s
	 Fln67wdyFf4Wq/DoRuF6/FNxQgLX8xWLiEktmiXtdMad7rLTWkXHkBNQ/gfAGR3RR9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=P6x3FjYY;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8180A60A2626;
	Fri, 20 Nov 2026 17:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8180A60A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=P6x3FjYY
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 40D671A175B;
	Fri, 20 Nov 2026 17:14:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1711D601B9;
	Fri, 20 Nov 2026 17:14:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2FC4411BC050D;
	Fri, 20 Nov 2026 18:14:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795194892; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YbvWbjLCYoKp6tHNvaVP7QLDPYtscluj35tRrDoYGIs=;
	b=P6x3FjYYmvfqQntA6Q2WCDt18eREPbuyVoBhYZY+YlNclM1g6lcyI4DEH5pfeUeNq667IO
	f2184sdb5Ar4ZsHoMj6SHO7XH9nZIVg6AbjOH4+7qC+0GmQHMX/wS89mLag6GrOpJXzVg8
	MA/sqi3SixaRfh4tPzjyWMVWQSrbXkhJ7hf9WNIq7AU6em3QkZUOT8ASSyop4lfAUhMGnB
	bk1GEytHXXpr+plJ5YhwUIjwjltErAbQAtZF2kbnnOLMLh92ZSd1cS1mDmHr/gCitFYVTT
	00kX99GDD2VHdHwmanq0T/oXzIj5D7wnDM0aIwxlQ0uW1me93PCe728I/vaCxA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri, 20 Nov 2026 18:14:33 +0100
Subject: [PATCH v4 07/11] spi: cadence-quadspi: Decouple the read capture
 bypass from DQS
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
Message-Id: <20261120-winbond-nand-next-phy-tuning-v4-7-8c21e1f71f41@bootlin.com>
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

The READCAPTURE bypass bit is not the logical opposite of the DQS bit.
Bypass selects the legacy delay-based read capture while DQS selects the
data strobe based capture. Both are valid in DTR mode: a DTR read without
a DQS line must use the delay-based capture with bypass disabled.

The tuning helpers currently derive bypass from !use_dqs. This happens to
work while use_dqs is always true in DTR mode, but use_dqs will soon
become false for DTR reads when the DQS line is not usable. Bypass would
then be wrongly enabled during tuning, unlike cqspi_phy_pre_config()
which keeps bypass disabled for DTR.

Store whether the read op is DTR and derive bypass from it instead of
from use_dqs. SDR reads keep bypass enabled and DTR reads keep it
disabled, regardless of the DQS setting.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-cadence-quadspi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-cadence-quadspi.c b/drivers/spi/spi-cadence-quadspi.c
index 72a5101c4a8c..683924a4a274 100644
--- a/drivers/spi/spi-cadence-quadspi.c
+++ b/drivers/spi/spi-cadence-quadspi.c
@@ -84,6 +84,7 @@ struct cqspi_flash_pdata {
 	u32			tchsh_ns;
 	u32			tslch_ns;
 	bool			use_dqs;
+	bool			dtr;
 	bool			use_tuned_phy;
 	bool			dll_locked;
 	u8			cs;
@@ -1149,7 +1150,7 @@ static int cqspi_tune_phy_read(struct cqspi_flash_pdata *f_pdata, bool enable)
 	if (ret)
 		return ret;
 
-	cqspi_readdata_capture(cqspi, !f_pdata->use_dqs, f_pdata->use_dqs,
+	cqspi_readdata_capture(cqspi, !f_pdata->dtr, f_pdata->use_dqs,
 			       f_pdata->phy_setting.read_delay);
 
 	reg = readl(reg_base + CQSPI_REG_CONFIG);
@@ -2137,7 +2138,7 @@ static int cqspi_phy_apply_setting(struct cqspi_flash_pdata *f_pdata,
 	f_pdata->phy_setting.tx = phy->tx;
 	f_pdata->phy_setting.read_delay = phy->read_delay;
 
-	cqspi_readdata_capture(cqspi, !f_pdata->use_dqs, f_pdata->use_dqs,
+	cqspi_readdata_capture(cqspi, !f_pdata->dtr, f_pdata->use_dqs,
 			       phy->read_delay);
 
 	return 0;
@@ -3534,6 +3535,8 @@ static int cqspi_am654_ospi_execute_tuning(struct spi_mem *mem,
 
 	f_pdata->phy_read_op.max_freq = mem->spi->post_config_max_speed_hz;
 
+	f_pdata->dtr = op_is_dtr;
+
 	if (op_is_dtr) {
 		f_pdata->use_dqs = true;
 		cqspi_phy_pre_config(cqspi, f_pdata, false);

-- 
2.56.0


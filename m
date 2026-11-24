Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531419;
	b=CfdMmE1HoTb5FkqvG34Gr2lIpHnVZFqHUbupxBWr15Jah6T54rp7aLxbQjcG9muVmrkn
	 RHHB6NQ0rcxJO96jFVx5WC2sXs+nqWxfM8evpR9QfqhiFTb6m6op59lFCFqrJmgMlnpgb
	 m3+xYeDcGWOlFxjs1UcxTlHsqZBFiSPhSuVAfFt1nWOtqeeU/36H9gUBbIewj57jFcQ24
	 1bVGAbaU5lE/0Hp3KY/SCzMyU0CiwB5ttqjaw6ZNxY5S/b9ML6ksDoPdiLwSsvM0dsqn6
	 Y2WfBoaKVrvo/VbwZ3ao1/KdAUjLWQp3gEuU5PmOYtLKDucd6oHD/IWWuOciXH3oMUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531419;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=clymHxqzJ4VZD82QYRjmyNxk5goaCZ4HHr8eN5h2/Tg=;
	b=qkqnYyhyIkt6+7IwXPgFqEFHFA/0+nj0vaSRr/Rm+/giX2Yhkrg8+H2vkq/78k0zs/Qn
	 S/C3JN+WIL0ysBm+YKbhGbcezTgmrWzeCCePr8q8y5vxSJKtRfXUeJBo58FcF2Co1vLrF
	 q7LV7jGY0mlCTbcFpgIBrsHOzqbmYwgzxPEZkkXG9xVidNmtYRCUao5QILJ2BGY3D3Xz6
	 FNuJrvD9SN/hdQwkbm4VgizCv1R3gOzilx20GgIDjDKfDScOCVFpHgPi5n8puG12Ufxml
	 n+3UHs1pz5HtjwRDiXjpjkKH+yQkCc47y/6AsTbBFnsnjVhJGQapvszwEDLEKEdQVig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TfJnWicB;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E689606A329
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 14:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E689606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TfJnWicB
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AEA8D4E41765;
	Tue, 24 Nov 2026 14:43:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8329B601E1;
	Tue, 24 Nov 2026 14:43:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 63B7711E69988;
	Tue, 24 Nov 2026 15:43:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795531415; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=clymHxqzJ4VZD82QYRjmyNxk5goaCZ4HHr8eN5h2/Tg=;
	b=TfJnWicBDSkAK4y8+3G+IzvXGuzIaA9tTyQhjE74U0RaS1c8uLdbSXb/pofnb/6YvBuW6a
	UDqdIy2d829bstKrJ8TlI4QH1n2l/2iSx7kyTnIqZsirO/Jlgl4CM0NdkFO7omamsjVXF1
	kfzOmLTCUN6rtFmAXCk3pWipnePf4KIUMTonHg0V/HANDB/9lds9+MLH3UcM6Wxl5JLAFW
	kPTJnpJ+u1bh8+h1yQ3xdJ/QzItjAhW1ckKMMMvTTScfk3v5U+eRL6KHjgQCts2fq4Tbdh
	NrsUy12KfLBCOZpXzxFXK/Zcr8iEyoTATAprmRy3sBUalCr0Hc+fhclmOA8riw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Nov 2026 15:43:03 +0100
Subject: [PATCH v5 2/6] spi: spi-mem: Clarify the conditions upon which DQS
 is usable
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
Message-Id: <20261124-winbond-nand-next-phy-tuning-v5-2-261e0e712857@bootlin.com>
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

The helper currently only captures the chip capability. Let's rename it
to capture the fact that it is going to reports whether DQS is usable
end-to-end through the upcoming changes.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-mem.c       | 12 ++++++------
 include/linux/spi/spi-mem.h |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 65956cf62156..76674750237e 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -556,8 +556,7 @@ EXPORT_SYMBOL_GPL(spi_mem_get_name);
  * Mitigating this limitation is possible with the addition of a data strobe
  * signal, commonly named DQS.
  *
- * Set the DQS boolean if the feature is available and configured at the chip
- * level. Controllers may query this value.
+ * Set the DQS pin boolean if the feature is available.
  */
 void spi_mem_set_dqs_pin_available(struct spi_mem *mem)
 {
@@ -566,16 +565,17 @@ void spi_mem_set_dqs_pin_available(struct spi_mem *mem)
 EXPORT_SYMBOL_GPL(spi_mem_set_dqs_pin_available);
 
 /**
- * spi_mem_has_dqs() - Query whether the DQS is available or not
+ * spi_mem_dqs_is_usable() - Query whether the DQS is usable or not
  * @mem: the SPI memory
  *
- * Return: a boolean indicating whether the DQS signal is available or not.
+ * Return: a boolean indicating whether the DQS signal is usable or not. DQS is
+ * usable when the memory supports it.
  */
-bool spi_mem_has_dqs(struct spi_mem *mem)
+bool spi_mem_dqs_is_usable(struct spi_mem *mem)
 {
 	return mem->dqs_pin;
 }
-EXPORT_SYMBOL_GPL(spi_mem_has_dqs);
+EXPORT_SYMBOL_GPL(spi_mem_dqs_is_usable);
 
 /**
  * spi_mem_adjust_op_size() - Adjust the data size of a SPI mem operation to
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index 55de48c277ac..82c417a661e0 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -464,7 +464,7 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 #endif /* CONFIG_SPI_MEM */
 
 void spi_mem_set_dqs_pin_available(struct spi_mem *mem);
-bool spi_mem_has_dqs(struct spi_mem *mem);
+bool spi_mem_dqs_is_usable(struct spi_mem *mem);
 int spi_mem_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op);
 void spi_mem_adjust_op_freq(struct spi_mem *mem, struct spi_mem_op *op);
 u64 spi_mem_calc_op_duration(struct spi_mem *mem, struct spi_mem_op *op);

-- 
2.56.0


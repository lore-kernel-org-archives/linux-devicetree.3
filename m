Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080D347AF4D
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 16:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529543; cv=none; b=bXqaJCgO+W4CQ9y46mlY4QW1EsQ5M9oKbARrEfS5FuNBxHfVJtqokM8z245er81LmaiWtx2t4hAJ9cjqPAx/HY72/t+y8GGwDBGOKTvIqrI1krZsmjPR9QJX29gZRyJq/h4tbnasTvMGXkGd1RnCACProZI5dRBM7AJzf/RFbKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529543; c=relaxed/simple;
	bh=wyhKq5giS1/IoMkjpsGRbT+IH8vqF62PQtP170jfxxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LZRresHHpSqXk71nQuT4mImJzPcupBvXyPkk/bwkIV09RpCWjEYFZgOfpfMb715rPG5Xey1oOicWGpt9Tw/4+pGXNB/BBMyytwni/kDff9PSzLdrnwpGO8O8woDQaLeGOBugMrCp0n5FaynN6TCSAkfcahW+Fw0cN66jFsJuRE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=DeC6R8iB; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="DeC6R8iB"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso648583f8f.2
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 09:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1783529534; x=1784134334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=damSg+KRPsx8cUGtM6YEq9+rU5hH+rbnhhK5WWTTkmU=;
        b=DeC6R8iB32yYNB6XgHVk5JvAliTz00PFgM+80NVoSYbD0fZ/7/4+GdxZE4uUqoN2jI
         f6wJDYK19L7KgkuqxAFiY7R5j0NBjP5yG7M6+R6j3LARIhVqW1rNz8Udfi6oaj7M2scQ
         fwMNpSb5HtuTcLp4AGI63yMDSo5qYqHBIEuvu/bo2XO3S6rO6jSHlnHlgWJIsjcQUVUy
         8BjGuBhTx8figtQF0K9r1JI26QX1FeAzIksc/ltcKCQ0xE91OiKYRS/AkaBU2Ah7FfyO
         WhCQM06ia93dEw4aKJKyuiR/U4lEr0+k0Wx17cLIo77OKau1Uwu7dbhCuY4tXiIfHrBt
         q3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529534; x=1784134334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=damSg+KRPsx8cUGtM6YEq9+rU5hH+rbnhhK5WWTTkmU=;
        b=eEG2zY3d2ZOPw7cncs2ipR16nmLZWEznEtBR2fCTU5xDSoRNJe0yHzbz5wiNsErLYF
         3khG21sK19bZ+dsQe3P4btNj5JdFGqPU8zB4ub+Ri068vWEL652yYhsT9QX4W1DJHMwx
         FMJfpkhyZN+xtmeBJkzdSbQ96hT3HJczI6HrIxDiXtLdu31z+SQlNMegwFDKA7/wY530
         3VuBaoQDH/HtMKbNZyyZIll8vxaTxBiDQcnZ9uakvpO2kcmyUafzeZweOyejrT+nXxA+
         HTkzcUNLMV0EQs0CRIy42KfLOsuJuo57oWKgJ3ZotfmnUzMhu3kw/bXKBuCeOtATfPoO
         SPIA==
X-Forwarded-Encrypted: i=1; AHgh+RrfxwGABZw2H7sFmXB1WOz1EGwAbAwHFvNZQ7iutXNn7XtiR58XTdmtgni38m88ZyyAXBg94RA76Y0r@vger.kernel.org
X-Gm-Message-State: AOJu0YypgscCGEFm0e91pbN799xmG9miVC5ahLuIB6RJdg7tdQZIYeD7
	NElwC0nB/UJlHhVfv/D+G58wbjmvjjUwzRH+XKDhgh1J7z187rnc+cx3EP/NZxEPMc8=
X-Gm-Gg: AfdE7cmACONH+lz7hauQvPem3o9EpSfn9+jerPhdRDskdAgf24RbafUwFTB9uYOLikY
	M4FmILtqjMVi8P/aDHgOieBefAaQwOM6CQBOvTfheEKY0A2S6WFtBBb3J57FZD/4L8e91J/qRaq
	fEZRj7tmaSoy6X6gASvTjMS8G/fsLy8bXGNVvyWj/fU45bxoO4VQRuUzpTNqZGdXE4fGbiZA51u
	cVXNKx8nCMZoQMigzx67ew5T+ypBM2DlhsYF7T9idQ/IkyphTZIj9R5kilgOfFWKyOE1k9N2IjK
	QMkipJQjxZbiZ6k+t0RT7WVNnPwPz4ix8jBa4Frlv16Yp2c58cTPByCR4cE+Dyre6Rj/u5pS8pv
	h2MaIDeUbesI95Noxpv4w0vyJFo9zrH6N3416fYaedD/Gr1GT5lJaKRIhDbMngwBt4tdjCayJm1
	iP9TsYoZsU9JGILVifjVef37QjrQaDhdjLuz+IWv3Dv7HGin9rpEKEezTTRQhU4FwBokrV/2isL
	+o87qCzcNLckJ3jg6iisVWQSLr7feOm+wRJMEttba8=
X-Received: by 2002:a05:6000:1acf:b0:46e:27ed:6d0d with SMTP id ffacd0b85a97d-47df071c1bdmr3937027f8f.8.1783529534551;
        Wed, 08 Jul 2026 09:52:14 -0700 (PDT)
Received: from threadripper-fedora-workstation (dh207-15-57.xnet.hr. [88.207.15.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm42902679f8f.33.2026.07.08.09.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:52:13 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: conor@kernel.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH 3/4] spi: atmel-quadspi: add LAN969x QSPI support
Date: Wed,  8 Jul 2026 18:51:10 +0200
Message-ID: <20260708165201.624271-3-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708165201.624271-1-robert.marko@sartura.hr>
References: <20260708165201.624271-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Microchip LAN969x has two QSPI controllers based on SAMA7G5 QSPI.

It requires pad calibration, supports DMA, and supports 100 MHz operation.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/spi/Kconfig         |  2 +-
 drivers/spi/atmel-quadspi.c | 66 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 66 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
index 8782514bb89b..bb3773f99ad9 100644
--- a/drivers/spi/Kconfig
+++ b/drivers/spi/Kconfig
@@ -189,7 +189,7 @@ config SPI_AT91_USART
 
 config SPI_ATMEL_QUADSPI
 	tristate "Atmel Quad SPI Controller"
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_MICROCHIP || COMPILE_TEST
 	depends on OF && HAS_IOMEM
 	help
 	  This enables support for the Quad SPI controller in master mode.
diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index d1aec14e3978..f05e2617fa89 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -1152,6 +1152,58 @@ static int atmel_qspi_sama7g5_init(struct atmel_qspi *aq)
 	return ret;
 }
 
+static int atmel_qspi_lan969x_init(struct atmel_qspi *aq)
+{
+	u32 val;
+	int ret;
+
+	atmel_qspi_write(QSPI_CR_DLLOFF, aq, QSPI_CR);
+	ret = readl_poll_timeout(aq->regs + QSPI_SR2, val,
+				 !(val & QSPI_SR2_DLOCK), 40,
+				 ATMEL_QSPI_TIMEOUT);
+	if (ret)
+		return ret;
+
+	ret = atmel_qspi_set_gclk(aq);
+	if (ret)
+		return ret;
+
+	/* Start the DLL before resetting the controller. */
+	atmel_qspi_write(QSPI_CR_DLLON | QSPI_CR_STPCAL, aq, QSPI_CR);
+	ret = readl_poll_timeout(aq->regs + QSPI_SR2, val,
+				 (val & QSPI_SR2_DLOCK) &&
+				 !(val & QSPI_SR2_CALBSY), 40,
+				 ATMEL_QSPI_TIMEOUT);
+	if (ret)
+		return ret;
+
+	atmel_qspi_write(QSPI_CR_QSPIDIS, aq, QSPI_CR);
+	ret = atmel_qspi_reg_sync(aq);
+	if (ret)
+		return ret;
+
+	atmel_qspi_write(QSPI_CR_SWRST, aq, QSPI_CR);
+	ret = atmel_qspi_reg_sync(aq);
+	if (ret)
+		return ret;
+
+	ret = atmel_qspi_set_pad_calibration(aq);
+	if (ret)
+		return ret;
+
+	aq->mr = 0;
+	aq->scr = 0;
+
+	ret = atmel_qspi_set_serial_memory_mode(aq);
+	if (ret)
+		return ret;
+
+	atmel_qspi_write(QSPI_CR_QSPIEN, aq, QSPI_CR);
+	return readl_poll_timeout(aq->regs + QSPI_SR2, val,
+				  (val & QSPI_SR2_QSPIENS), 40,
+				  ATMEL_QSPI_TIMEOUT);
+}
+
 static int atmel_qspi_sama7g5_setup(struct spi_device *spi)
 {
 	struct atmel_qspi *aq = spi_controller_get_devdata(spi->controller);
@@ -1679,6 +1731,15 @@ static const struct atmel_qspi_caps atmel_sama7g5_qspi_caps = {
 	.has_dllon = true,
 };
 
+static const struct atmel_qspi_caps atmel_lan969x_qspi_caps = {
+	.max_speed_hz = SAM9X7_QSPI_MAX_SPEED_HZ,
+	.init = atmel_qspi_lan969x_init,
+	.has_gclk = true,
+	.has_dma = true,
+	.has_padcalib = true,
+	.has_dllon = true,
+};
+
 static const struct of_device_id atmel_qspi_dt_ids[] = {
 	{
 		.compatible = "atmel,sama5d2-qspi",
@@ -1708,7 +1769,10 @@ static const struct of_device_id atmel_qspi_dt_ids[] = {
 		.compatible = "microchip,sama7d65-qspi",
 		.data = &atmel_sama7d65_qspi_caps,
 	},
-
+	{
+		.compatible = "microchip,lan9691-qspi",
+		.data = &atmel_lan969x_qspi_caps,
+	},
 
 	{ /* sentinel */ }
 };
-- 
2.55.0


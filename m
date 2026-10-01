Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BB54AF9C5
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790860723; cv=none; b=hXaVdudVmyTUNFDm3mMu+5Dlt3ZC9toO/zFoUAgyU4JBvsGdhm6bYNz7Hp249FBTqBTkIWKfYNDeaVssNYqk8kNI05szuuVGoWD01miKkcgxbZng/p1wqeq4GOpBtHd2ruLsor6aDHZ2m2dgD+wmJYj+BvEUN1aCJ7csbljTlqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790860723; c=relaxed/simple;
	bh=sFkXBSnLk+vZbRKQdCAmvra4Fypns8vJgfKHZ9ztqDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C5o9XUFMIhUKzt9hVioVazcqI6rtu00Aj4agPn+VLGSamZxgxgXd8i16+0l0dgSoVPhUoHiM3EtFfCVWySd21sJzJVNaq8zVs11GPlfpYLJvCdntHMCk4nxOECqGnsX1XPrK+8OWtP9YRa499KB+WM/yb05XFPICS9PSwjbXKa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSCrTMuc; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSCrTMuc"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so3898340a91.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 06:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790860720; x=1791465520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DIgme/hli59wBCI5OwyN88StS5WzrGGP4qMfY50DT24=;
        b=NSCrTMucKye39BuqMlLMOaWpl/1zFQenbpy7dRUVpFyfddArSjZw1rTQS9I5ungoA8
         uj5smN2tuEwC405VqXFqtKRqkCh15HwfZWO4urPdmbfACdclOjWK/EKTeat3KHusVNdX
         X9m5GxFOLvPXIaZGUgtEn+HElgwQBWMqKU0QeHdfMRdLm7JF3xfCTW66PLDeMTE563Bh
         Gn0PoOjr7cVbjMDpwFGD2eFR22/OmC/vQT4e5I1skxk3PsMig4js5tBfCxlnorpSiK2A
         Suaki5gPNF20TvOQgXMrwVkM+D2lyqtZPEJswXItocnxnnkbfvS8dwVOC+qQZAyzIIbR
         MHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790860720; x=1791465520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DIgme/hli59wBCI5OwyN88StS5WzrGGP4qMfY50DT24=;
        b=f+GQJsylOt/VlHUjlQ+O1YrxFAKC9G1baDNstjBGHbWjlSuSD5C+GbPO6B57eIAEnw
         xW0yYOES5d8dTMAIdOz2Iia2+kqwp5qhfa3S0H22txAbsrgUlyz8wdEhUHiqCNPfR7Cy
         qDEMcj7dNep2nc8gMmrlT4Vgvcd8yjNZEEj98MAOeXN9xcWTV10hYYh8CCYEnPk6zckg
         quOZsbIymAD+QGN+H0FLjn8+Is638St0ORKCbNBVi1A/qzA5ktt4DFwl6L9DMDlalhJm
         xsPgzMN6RgmKj8xlQbM5AD/KMU4p0gBjtLEx03fsZwTuAk1MPriLegDTkBK+OCJIlffR
         ZD0Q==
X-Forwarded-Encrypted: i=1; AKwUvBw7XP97yX9FE8BmzaqtJAQSg/lk3iZih8X5dFn5v7gukL+Ar+qPASdlQOPc3EN4fAwvOrp5AIXeSqPJ@vger.kernel.org
X-Gm-Message-State: AFq9FYKNPUouDWzIJtdozxVElg1QR5xUAYhlyRGiWFN+7Ixz2LaJ34By
	9nALGF3UC/aVv4Joqxod4XnvLQczD3jABGc4Hpm6T/kLNOnjzZuwQ7ui
X-Gm-Gg: AYBFou33I5Gt25YjnbGOUasdMk9osQ9bbDLgHoC6/OYND3YoCLwXT8eVAYUuZ5QWNgX
	9LZzC7Xd+kKSjjE12oQE61pYrxmYUgUkwCAgINfRH4iUx3BU056b3zHYGtAOgE1LJ7sylSq6cpJ
	jONbLSTu6chv0QJJszh+ulOWG1QdKS3EXkbXf/tKZi0NnWjAK+0lQfVsXrK8Ts2+UwUk9X4VZqS
	Oxnl+L+D/0UaoK6aH4MucwHqaB3ToXiZyAfFLm+wxg8fQQLgc6l7ZFHtNZXp1sIW/wSjBYpxdzO
	dPbm+IRANaxcTj/n/c7RKqr9qK8DRJc/XFzSfIbXUF+gkT5cNQ+wpI0IogMIcwwInzclmhmOqG3
	BaVZZgZ89oYCVPz5itXDK6iyywq7hI5pzFhUIKInfDwmJl5+S5VyfhRP5l7d1wy4mrlx8wTeD3O
	YRtGEjGaXQ40xP45sNack+ipXKD/VVCFDGnidkdPKbbWk/bmiGM1HCA8Hy+6ng6NFkHOrYxc3+I
	+85010mJskbCW7xJjFPqMyAK0jlavPB9yMlDEbNR6X4HcbzjwE8rpGQcHF9i62077m4/h4=
X-Received: by 2002:a17:90b:2b4f:b0:3a4:bda6:16d0 with SMTP id 98e67ed59e1d1-3a4fb2ba95bmr1983848a91.55.1790860719369;
        Thu, 01 Oct 2026 06:18:39 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f46bb550sm5016692a91.5.2026.10.01.06.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:18:38 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com
Subject: [PATCH v2 3/3] spi: ma35d1-qspi: Add GPIO chip select support
Date: Thu,  1 Oct 2026 21:18:18 +0800
Message-Id: <20261001131818.110028-4-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261001131818.110028-1-cwweng.linux@gmail.com>
References: <20261001131818.110028-1-cwweng.linux@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chi-Wen Weng <cwweng@nuvoton.com>

The generic SPI controller binding allows GPIO-based chip selects, but
the MA35D1 QSPI driver does not currently enable the SPI core's GPIO
descriptor handling.

Enable GPIO chip-select support and specify that the controller provides
two native chip selects. Add a setup callback to reject active-high
polarity only for native chip selects, while allowing GPIO chip selects
to use the polarity handled by the GPIO subsystem.

This keeps the binding capable of describing valid board wiring while
preserving the active-low limitation of the controller's native chip
selects.

Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 drivers/spi/spi-ma35d1-qspi.c | 39 ++++++++++++++++++++++++++++++-----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-ma35d1-qspi.c b/drivers/spi/spi-ma35d1-qspi.c
index 30e3239f777d..0644bb2990b8 100644
--- a/drivers/spi/spi-ma35d1-qspi.c
+++ b/drivers/spi/spi-ma35d1-qspi.c
@@ -62,7 +62,7 @@
 #define NUVOTON_QSPI_STATUS_RXEMPTY_MASK	BIT(8) /* Receive FIFO Empty */
 #define NUVOTON_QSPI_STATUS_BUSY_MASK	BIT(0) /* Busy Status */
 
-#define NUVOTON_QSPI_MAX_NUM_CS		2
+#define NUVOTON_QSPI_MAX_NATIVE_CS	2
 #define NUVOTON_QSPI_DEFAULT_NUM_CS	2
 #define NUVOTON_QSPI_DEFAULT_BPW	8
 /* Bound PIO operations to avoid long atomic polling loops. */
@@ -442,13 +442,35 @@ static void nuvoton_qspi_set_cs_level(struct nuvoton_qspi *qspi,
 	spin_unlock_irqrestore(&qspi->ssctl_lock, flags);
 }
 
+static int nuvoton_qspi_setup(struct spi_device *spi)
+{
+	unsigned int cs = spi_get_chipselect(spi, 0);
+
+	if (spi_get_csgpiod(spi, 0))
+		return 0;
+
+	if (cs >= NUVOTON_QSPI_MAX_NATIVE_CS) {
+		dev_err(&spi->dev, "invalid native chip select %u\n", cs);
+		return -EINVAL;
+	}
+
+	if (spi->mode & SPI_CS_HIGH) {
+		dev_err(&spi->dev,
+			"active-high native chip select is not supported\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static void nuvoton_qspi_set_cs(struct spi_device *spi, bool level)
 {
 	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
 
 	/*
-	 * The SPI core passes the physical CS level to ->set_cs(). This
-	 * initial driver only supports active-low native chip selects.
+	 * GPIO chip selects are handled by the SPI core. For native chip
+	 * selects, the core passes the physical CS level to ->set_cs().
+	 * Native chip selects are active low.
 	 */
 	nuvoton_qspi_set_cs_level(qspi, spi_get_chipselect(spi, 0), !level);
 }
@@ -457,7 +479,11 @@ static void nuvoton_qspi_mem_set_cs(struct spi_device *spi, bool assert)
 {
 	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
 
-	/* The direct spi-mem path passes a logical assertion state. */
+	/*
+	 * Direct spi-mem operations are only executed for native chip
+	 * selects. GPIO chip selects use the regular SPI fallback path.
+	 * This helper takes a logical assertion state.
+	 */
 	nuvoton_qspi_set_cs_level(qspi, spi_get_chipselect(spi, 0), assert);
 }
 
@@ -638,18 +664,21 @@ static int nuvoton_qspi_probe(struct platform_device *pdev)
 		goto err_assert;
 	}
 
-	if (!num_cs || num_cs > NUVOTON_QSPI_MAX_NUM_CS) {
+	if (!num_cs || num_cs > NUVOTON_QSPI_MAX_NATIVE_CS) {
 		ret = dev_err_probe(dev, -EINVAL, "invalid num-cs %u\n",
 				     num_cs);
 		goto err_assert;
 	}
 
 	ctlr->num_chipselect = num_cs;
+	ctlr->max_native_cs = NUVOTON_QSPI_MAX_NATIVE_CS;
+	ctlr->use_gpio_descriptors = true;
 	ctlr->max_transfer_size = nuvoton_qspi_max_transfer_size;
 	ctlr->max_message_size = nuvoton_qspi_max_message_size;
 	ctlr->mem_ops = &nuvoton_qspi_mem_ops;
 	ctlr->mem_caps = &nuvoton_qspi_mem_caps;
 	ctlr->dtr_caps = true;
+	ctlr->setup = nuvoton_qspi_setup;
 	ctlr->set_cs = nuvoton_qspi_set_cs;
 	ctlr->transfer_one = nuvoton_qspi_transfer_one;
 	ctlr->bits_per_word_mask = SPI_BPW_MASK(8);
-- 
2.25.1


Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10791525A70
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 12:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685782; cv=none; b=H6kWutumTEb4Dw9b3mPCcDXZcMh6X+T9W3iVL+9OYgn279hUnAuDZhf6bUXQTxHGcfVAzAt5HrGSWigZv0QDSo4x9m2L7xam84AqqVKFcVbjxyQjIP3aGBJy2+pGL5EfjIYs7sUeSpY+slIdcPOuIlvnQ6UTPQzpXDZ1d66He/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685782; c=relaxed/simple;
	bh=0s98rTvHsC32agiOIHMaC9l8JpcSgUu5GK1Z0cDYe9A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OH9ObmQfQScctmSt8tHgmVqIdBwx+Vlb6yXKiRGx6WgZtbwwv5AzErkwjHk7hSs0b/16xXJY4n3lTyHrbvDM/EGJiQ9PZ5CfDXa1AgmXDVBIxvGm7Yib6gGUmXffE/tmCHgfqti9RPzILpUviJtDgQLg7QYhuHcBeOcv+OA0pSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QekpJTvf; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QekpJTvf"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8bf173aso21893865e9.3
        for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 05:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790685775; x=1791290575; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVy3pMcwnfHYSRpZR/CKSRkvEsspWtxyGHbN5bb25Zk=;
        b=QekpJTvfUu+/ifKhB6fXSH7I0a4Z5+kf282dnmeRS8wO8JTXZxhvnd3C9wfr3UnKy0
         Tjoc2nPxi6tYj5zgQFAiYSZP/ZUlk2km2eidsnklgQyp7YR4J070M7rxx6Mgri3+hQ8S
         PzlRXqmUtou4KZz8jHFdttjUPB3jFNixXhQVKCTIMvEQAmsX1CpwibW1BvV520V3E+Bz
         xv450PocOPdsi9NZ9TEM7SPZAGzQPfykENr/3KtffTJr8oMeBLnYGDXZKo4I4c0l5ZQn
         kKxFX0uFIF2i6yivicDdQMp9tOBRN2r/vAUFwrh2qs7kcYCCv6H8+63KLwk+DFUMAYt/
         QGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685775; x=1791290575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aVy3pMcwnfHYSRpZR/CKSRkvEsspWtxyGHbN5bb25Zk=;
        b=iGltLoyAW0bqzdMNuFnvv2DiQRPV2/bMuXhf2pbQ07jMtW1Rf7aVusXzk0l+PvDz+c
         AGBHsPDwp7I13vdq6F8kjFpPEIXML5diEBQVltONoQH+Oz18XVm2jiMR3wt5zQTnbb4B
         lpdwZ/jXjclay3x7KVYZzJOOmZtS5gRACn9ierEwVqweQgkt0aqk3dEkxl/cAxb400Gh
         6d4ja+TK/1S3qnl0/VEFVDH+3IaYy95UMoclK141sb8SKTKY4XlEpvrbXuSpiLk005zt
         9heEzXLN73DwTDRkOARZbsN7Eka7YL6Jq1TkMkBpnnN/EhwzgJAE2v5YJGUq+t2eZHqZ
         1Low==
X-Forwarded-Encrypted: i=1; AKwUvBwB2dtYMl6TYNag9SoD6b2m99e/v7sTi2PeXzlFANp1TEaabdl4SzbzgtvfrMKkrIUsRqQ7+rzjvqg/@vger.kernel.org
X-Gm-Message-State: AFuF++klDsVK1W/umo7AardFijptbIFU1TrEra/W0whluKDwLn/BC0IF
	GOmxuwUmP7CJcpXkBFQrgRgxo3Ycf3UEZ5xp9gPiB6PBldcgKg82Btbx
X-Gm-Gg: AYBFou1chrOYzG+dpmrwjOT+fgcBdBjBPAylhVr+Xv93CLK5J/b+5MrQsW45Tnct+bw
	nIPnnk3t3/OwGIAwaW1Whiyju8etMvGRJfjH4JJRnTmk5xNH7rZ2Ro+o/gWNHgkXqzW/70Hdj8U
	OalgN9ze+XN0zKlEZO5KcHkI1dqRKmS41mj+2PVA0ds4R4Mv9MUeKV2H8YbAXowoxag6j+sjodm
	UMxJNQWtee8TjEN0gm5Y3XVGEa5BdckyXRQjKlOrfGv8P3lR8pfvkZRoMpc7mk3CDoX+/+PPoX+
	UZ+YxRrcD9wgvSCj5iuirw5tLpYwdqXw4CoZBkNILJMbhR64ZHUM8CZOv+o+g6DBdUtOcvfGRcx
	t3awq1loXO/Bdoy/8rXTt9R+V4Z8DsmobDt14YD8oZGRA6utQbYOCrzgLVg//1sxe6AOgaRmV/y
	eYUnu9TVjaJrRnYFbiEmo8FJvf6RdjEPBJ8PiQtcW0C2hCOqA7XtHPJxcx3oWhrg5zpokjJ6xsF
	8PwjkOunrcg5Or9Hry8HnbKsiZlJGAncxCpeSfTYAHLZVbSoLNcrw6wJqR3Fd1J1e/y4z5i/L4g
	8d2oWqsbIkcl4AVxsA==
X-Received: by 2002:a05:600c:8b6e:b0:499:8aff:59b6 with SMTP id 5b1f17b1804b1-49fe66cccf5mr268707865e9.14.1790685774623;
        Tue, 29 Sep 2026 05:42:54 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af502da06sm4436630f8f.11.2026.09.29.05.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:42:54 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-iio@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/8] iio: adc: rzt2h: Add chip-specific configuration
Date: Tue, 29 Sep 2026 13:42:43 +0100
Message-ID: <20260929124248.237032-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260929124248.237032-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare the driver for supporting SoCs with ADC IP that is similar to the
RZ/T2H ADC but may have different channel configurations.

Introduce chip-specific configuration for the channel template and number
of channels, and use it when setting up the IIO channels and DMA layout.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/iio/adc/rzt2h_adc.c | 49 ++++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index d53888730f00..f1a830da6f9b 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -56,15 +56,21 @@
 #define RZT2H_ADC_DMA_PERIODS		64
 #define RZT2H_ADC_DMA_BUFFER_SAMPLES	(RZT2H_ADC_DMA_PERIODS * \
 					 RZT2H_ADC_DMA_PERIOD_SAMPLES)
-#define RZT2H_ADC_DMA_BUFFER_SIZE	(RZT2H_ADC_DMA_BUFFER_SAMPLES * \
-					 RZT2H_ADC_MAX_CHANNELS * \
-					 RZT2H_ADC_CHANNEL_BYTES)
 #define RZT2H_ADC_STOP_CYCLES		2
 
+#define RZT2H_ADC_FEATURE_CALIBRATION	BIT(0)
+
+struct rzt2h_adc_chip_info {
+	const struct iio_chan_spec *chan_template;
+	unsigned int num_channels;
+	u8 features;
+};
+
 struct rzt2h_adc_dma {
 	struct dma_chan *chan;
 	u16 *buf;
 	dma_addr_t addr;
+	size_t buf_size;
 
 	unsigned int period_index;
 	unsigned int period_bytes;
@@ -83,6 +89,7 @@ struct rzt2h_adc_dma {
 struct rzt2h_adc {
 	void __iomem *base;
 	struct device *dev;
+	const struct rzt2h_adc_chip_info *chip_info;
 
 	phys_addr_t phys_base;
 	struct rzt2h_adc_dma dma;
@@ -325,7 +332,8 @@ static void rzt2h_adc_dma_callback(void *data)
 static void rzt2h_adc_dma_calc_layout(struct iio_dev *indio_dev)
 {
 	struct rzt2h_adc *adc = iio_priv(indio_dev);
-	unsigned int hi = 0, lo = RZT2H_ADC_MAX_CHANNELS - 1;
+	const struct rzt2h_adc_chip_info *chip_info = adc->chip_info;
+	unsigned int hi = 0, lo = chip_info->num_channels - 1;
 	const struct iio_chan_spec *chan;
 	unsigned int sample_chans;
 	unsigned int first_chan;
@@ -346,7 +354,7 @@ static void rzt2h_adc_dma_calc_layout(struct iio_dev *indio_dev)
 	 * width, so pick the smallest power-of-two-aligned block of channels
 	 * that covers all enabled channels.
 	 */
-	for (sample_chans = 1; sample_chans < RZT2H_ADC_MAX_CHANNELS; sample_chans <<= 1) {
+	for (sample_chans = 1; sample_chans < chip_info->num_channels; sample_chans <<= 1) {
 		first_chan = round_down(lo, sample_chans);
 
 		if (first_chan + sample_chans > hi)
@@ -606,8 +614,8 @@ static int rzt2h_adc_parse_properties(struct rzt2h_adc *adc)
 	int ret;
 
 	ret = devm_iio_adc_device_alloc_chaninfo_se(adc->dev,
-						    &rzt2h_adc_chan_template,
-						    RZT2H_ADC_MAX_CHANNELS - 1,
+						    adc->chip_info->chan_template,
+						    adc->chip_info->num_channels - 1,
 						    &chan_array);
 	if (ret < 0)
 		return dev_err_probe(adc->dev, ret, "Failed to read channel info");
@@ -628,7 +636,7 @@ static void rzt2h_adc_free_dma_buf(void *p)
 {
 	struct rzt2h_adc *adc = p;
 
-	dma_free_noncoherent(adc->dev, RZT2H_ADC_DMA_BUFFER_SIZE,
+	dma_free_noncoherent(adc->dev, adc->dma.buf_size,
 			     adc->dma.buf, adc->dma.addr, DMA_FROM_DEVICE);
 }
 
@@ -648,13 +656,16 @@ static int rzt2h_adc_setup_dma(struct iio_dev *indio_dev)
 		return 0;
 	}
 
-	adc->dma.buf = dma_alloc_noncoherent(dev, RZT2H_ADC_DMA_BUFFER_SIZE,
+	adc->dma.buf_size = adc->chip_info->num_channels *
+			    RZT2H_ADC_DMA_BUFFER_SAMPLES *
+			    RZT2H_ADC_CHANNEL_BYTES;
+	adc->dma.buf = dma_alloc_noncoherent(dev, adc->dma.buf_size,
 					     &adc->dma.addr, DMA_FROM_DEVICE,
 					     GFP_KERNEL);
 	if (!adc->dma.buf)
 		return -ENOMEM;
 
-	dma_sync_single_for_device(dev, adc->dma.addr, RZT2H_ADC_DMA_BUFFER_SIZE,
+	dma_sync_single_for_device(dev, adc->dma.addr, adc->dma.buf_size,
 				   DMA_FROM_DEVICE);
 
 	ret = devm_add_action_or_reset(dev, rzt2h_adc_free_dma_buf, adc);
@@ -667,6 +678,7 @@ static int rzt2h_adc_setup_dma(struct iio_dev *indio_dev)
 
 static int rzt2h_adc_probe(struct platform_device *pdev)
 {
+	const struct rzt2h_adc_chip_info *chip_info;
 	struct device *dev = &pdev->dev;
 	struct iio_dev *indio_dev;
 	struct rzt2h_adc *adc;
@@ -674,11 +686,16 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 	struct clk *adclk;
 	int ret;
 
+	chip_info = device_get_match_data(dev);
+	if (!chip_info)
+		return -ENODEV;
+
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*adc));
 	if (!indio_dev)
 		return -ENOMEM;
 
 	adc = iio_priv(indio_dev);
+	adc->chip_info = chip_info;
 	adc->dev = dev;
 	init_completion(&adc->completion);
 	init_waitqueue_head(&adc->dma.wq);
@@ -738,8 +755,14 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 	return devm_iio_device_register(dev, indio_dev);
 }
 
+static const struct rzt2h_adc_chip_info rzt2h_adc_info = {
+	.chan_template = &rzt2h_adc_chan_template,
+	.num_channels = 16,
+	.features = RZT2H_ADC_FEATURE_CALIBRATION,
+};
+
 static const struct of_device_id rzt2h_adc_match[] = {
-	{ .compatible = "renesas,r9a09g077-adc" },
+	{ .compatible = "renesas,r9a09g077-adc", .data = &rzt2h_adc_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rzt2h_adc_match);
@@ -747,6 +770,10 @@ MODULE_DEVICE_TABLE(of, rzt2h_adc_match);
 static int rzt2h_adc_pm_runtime_resume(struct device *dev)
 {
 	struct rzt2h_adc *adc = dev_get_drvdata(dev);
+	const struct rzt2h_adc_chip_info *chip_info = adc->chip_info;
+
+	if (!(chip_info->features & RZT2H_ADC_FEATURE_CALIBRATION))
+		return 0;
 
 	/*
 	 * Datasheet Page 2810, Section 41.5.6:
-- 
2.55.0


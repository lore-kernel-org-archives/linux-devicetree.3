Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECF3370D68
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 05:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782625001; cv=none; b=qormSEaSAPo6pV/IpfuOuaziHuzXg+N7H4sAQfHvYKHCE8xHuiCJ+aeJFc9SyfNTi6dNzivjNxd89K2lHmn8VsETxA5HE8oppB19KPfoGDGYXpe1GPeEfJvGKplj4lSjzTJ9/97JAELz5ZzNzD0T6Oxy84BtjIUMDo227cvy5kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782625001; c=relaxed/simple;
	bh=xrAVSFHeolvwfyD9ULO7cg9OWGYssZy60x8GTbDGZY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kdBdMnFQ98dJN5/lfSb5sipO+jx6D0KUInRhjdcpfXGMtPI89zcg0UfVwJdG/xjP3pDtisF5mL/qQ8hiAFi8irPD+2ZGRUKRQGgXShBtn3ABFLFcEW+a8VhzLsSUI2L9jLLBBEGhUk+MfN+8OnSvnmVi662c4cJDjuelr7og2jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCCxe/j6; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCCxe/j6"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-59ebde7d704so748630e0c.2
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 22:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782624999; x=1783229799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cTULUklEdED9BcesY9aB5GZGobdgh56Nfuku4RCC2tc=;
        b=CCCxe/j6v9DqyH+96xfN+q4aDe0z/qYviOiIBWXUXbBGX/ZroDn7cpbVgptMuxF7At
         Cf2bTsvcHfFnDe1lMXYOqI3ih+D8qQfLz9Rr45wrB1+atUXpllb3Z2pPHZAUKjfMJqg3
         2hfkHGzVZahUVzfSLEKaSC6zVVey1QJhZ7/vdKtXgY00htNLcDUA8GFZF1Jg5J51u+8b
         DGWxrpQzMh/s1SM5qU0wAcPV+X9n7r9mZxy3+QUM6qj2z2sWsFLBPYlR1gNUqLO0TWZn
         obymzYSzeRCu71N8auDZAyRmWozLXbiF2RAmw1Ht/E7L59zyMmfArOZsIK97dS2q7eUm
         kMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782624999; x=1783229799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cTULUklEdED9BcesY9aB5GZGobdgh56Nfuku4RCC2tc=;
        b=dmtYeg1FkwIKIaKWHy4lpv2oeNKAGzP68YbSGO2+OmvoLTB1odMPQmDDf4Cb1EorOj
         NSdMG/ffm0L2VxGgYWJiJF+9VCjuddeZRm3e7gFXXIszkjl5QaIFzDy4GyTBcpSfrY1p
         7HpoenbGMELjuD9WB76m0eTtQrT5YPLfvqQ+/iNZQPj7nhpbFgUeyO/XkL5uRvcnMnF6
         2Mal+QOWJlsRYC3BnmDGKP59osOB2m8wQd7JsZ2yq8LVJWAZvkSEj9RTkhwsvNerGcv8
         GzhDFNdxbPKelKGDrvMxIfXLRKta66/2eRax9KN0P3BwejPnRjDR5QHhPwatwgNiJrEh
         mcEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrh9h0gTSRfSLhDOIck1lB5Dmis88WEc2UiJPXhjnQsz3hj2ERu2SnS1cF234ujDvqzxMn8h7332EcJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxS9nM4T2nf/S0bIwMQTdrvTwTCAwIK9XvB/L2O4v+1BqjA2/NR
	+98TTzBTrWbSww4v1yZ6ekZftpaPGCfmoC3N1rrZAomnIExfm/Mt3+J+
X-Gm-Gg: AfdE7cl57niWitqMVL5GxSfrppSsrOA1KPyVNz7bSw984H6tSaVErQWYNNY2yzvrlIp
	60/+cP9vqdTs6VC/qBE9C+lX60sb3sgMc5tT0mTIqeM3qDtoiWYZbOMJc+CV/V1SsGN9SnyVFPb
	n9v1R7PIuV/XEpYHa/ynSSspLPL2uK0wX+cHz0cwf5UyXK+0XHxvBJ34KLt6Z0+3cZdUjw8GFes
	rccNBgo5kSblm5Iwsg5vQaNdrJvQ+Z7V/qt65VUiqEtCecPJWRKplyReW+q2v4Fs7NF3m9wcg2U
	o/XFT3l2etTGuxN0aXD6cxYI+95XQBywAAENFMHP4MisVLQaiVLASXJ81H4bFQUDbyPQkK5OipB
	/oruqW08kZqYCYDvwq9Zea43RL9b0bFktOGHy9BJk4TK7QvN5lt2My5WQj2ASCSny37YkkjXWxN
	gVvMVDizOl291ggkUd
X-Received: by 2002:a05:6122:e1ae:b0:56d:b639:5c0d with SMTP id 71dfb90a1353d-5bd69e4cab9mr4499913e0c.13.1782624998624;
        Sat, 27 Jun 2026 22:36:38 -0700 (PDT)
Received: from [192.168.100.153] ([2800:bf0:61:1127:ab87:5602:531c:8dfb])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bda2dd64c3sm229003e0c.1.2026.06.27.22.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 22:36:38 -0700 (PDT)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sun, 28 Jun 2026 00:36:07 -0500
Subject: [PATCH v2 6/7] iio: adc: ti-ads1262: Add buffer and trigger
 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-ads126x-v2-6-4b1b231325ba@gmail.com>
References: <20260628-ads126x-v2-0-4b1b231325ba@gmail.com>
In-Reply-To: <20260628-ads126x-v2-0-4b1b231325ba@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Lechner <dlechner@baylibre.com>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Cameron <jic23@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9749; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=xrAVSFHeolvwfyD9ULO7cg9OWGYssZy60x8GTbDGZY0=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDFkOm25sDMl7/NjiuvauaMmVYXNdTgkrdu94OHfGe7U/X
 LcDdkVndpSyMIhxMciKKbK0Jyz69igq763fgdD7MHNYmUCGMHBxCsBEJN8w/A+IWMjUtUp/+7Qv
 V9ZdTPmku37CNsMVLa2FIXIpGe7VdsKMDDfF2T6vktDPXa9jUCIqJXpmhum3bBPm7vtHlWZG9Wd
 6cQMA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add triggered buffer support and a data-ready (DRDY) hardware trigger.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/iio/adc/ti-ads1262.c | 265 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 265 insertions(+)

diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
index 4ae22c1b0b4b7d79..53bc70e0c35a59da 100644
--- a/drivers/iio/adc/ti-ads1262.c
+++ b/drivers/iio/adc/ti-ads1262.c
@@ -38,6 +38,9 @@
 #include <asm/byteorder.h>
 
 #include <linux/iio/iio.h>
+#include <linux/iio/trigger.h>
+#include <linux/iio/trigger_consumer.h>
+#include <linux/iio/triggered_buffer.h>
 
 #define ADS1262_OPCODE_NOP			0x00
 #define ADS1262_OPCODE_RESET			0x06
@@ -258,6 +261,7 @@ struct ads1262 {
 	const struct ads1262_chip_info *info;
 	struct regmap *regmap;
 	struct iio_dev *indio_dev;
+	struct iio_trigger *trig;
 	struct gpio_desc *reset_gpiod;
 	struct gpio_desc *start_gpiod;
 
@@ -273,6 +277,11 @@ struct ads1262 {
 
 	/* Protects transfer buffers and concurrent SPI transfers */
 	struct mutex xfer_lock;
+	struct spi_message msg;
+	struct spi_transfer xfer[2];
+
+	IIO_DECLARE_BUFFER_WITH_TS(__be32, scan_buffer,
+				   ADS1262_MAX_CHANNEL_COUNT);
 
 	u8 tx[ADS1262_XFER_BUFFER_SZ] __aligned(IIO_DMA_MINALIGN);
 	u8 rx[ADS1262_XFER_BUFFER_SZ] __aligned(IIO_DMA_MINALIGN);
@@ -781,10 +790,250 @@ static const struct iio_info ads1262_iio_info = {
 	.debugfs_reg_access = ads1262_debugfs_reg_access,
 };
 
+static int ads1262_buffer_preenable(struct iio_dev *indio_dev)
+{
+	struct ads1262 *st = iio_priv(indio_dev);
+	unsigned int weight;
+	unsigned long i;
+	int ret;
+
+	weight = bitmap_weight(indio_dev->active_scan_mask,
+			       iio_get_masklength(indio_dev));
+	if (weight == 1) {
+		/*
+		 * A single channel is read by command (RDATA1), so one transfer
+		 * holds the command byte plus the 4 conversion bytes, which end
+		 * up at offset 1 of the rx buffer.
+		 */
+		st->xfer[0].len = 5;
+		st->xfer[0].tx_buf = st->tx;
+		st->xfer[0].rx_buf = st->rx;
+		st->xfer[0].cs_change = 0;
+		spi_message_init_with_transfers(&st->msg, st->xfer, 1);
+
+		i = find_first_bit(indio_dev->active_scan_mask,
+				   iio_get_masklength(indio_dev));
+		ret = ads1262_channel_enable(st, &st->channels[i]);
+		if (ret)
+			return ret;
+	} else {
+		/*
+		 * Multiple channels use software sequencing: each transfer
+		 * rewrites the per-channel configuration registers while
+		 * returning the conversion of the previously enabled channel,
+		 * found at offset 0 of the rx buffer. The registers are not
+		 * contiguous, so the write is split in two bulk steps.
+		 *
+		 * First step: write protocol (2 bytes) + MODE0, MODE1, MODE2,
+		 * INPMUX (4 registers).
+		 */
+		st->xfer[0].len = 6;
+		st->xfer[0].tx_buf = st->tx;
+		st->xfer[0].rx_buf = st->rx;
+		st->xfer[0].cs_change = 1;
+		/*
+		 * Second step: write protocol (2 bytes) + IDACMUX, IDACMAG,
+		 * REFMUX (3 registers).
+		 */
+		st->xfer[1].len = 5;
+		st->xfer[1].tx_buf = st->tx + 6;
+		st->xfer[1].rx_buf = st->rx + 6;
+		spi_message_init_with_transfers(&st->msg, st->xfer, 2);
+
+		regcache_drop_region(st->regmap, ADS1262_MODE0_REG,
+				     ADS1262_INPMUX_REG);
+		regcache_drop_region(st->regmap, ADS1262_IDACMUX_REG,
+				     ADS1262_REFMUX_REG);
+	}
+
+	ret = ads1262_set_runmode(st, ADS1262_RUNMODE_CONTINUOUS);
+	if (ret)
+		return ret;
+
+	ret = spi_optimize_message(st->spi, &st->msg);
+	if (ret)
+		return ret;
+
+	ret = ads1262_dev_start(st);
+	if (ret) {
+		spi_unoptimize_message(&st->msg);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ads1262_buffer_postdisable(struct iio_dev *indio_dev)
+{
+	struct ads1262 *st = iio_priv(indio_dev);
+
+	ads1262_dev_stop(st);
+	spi_unoptimize_message(&st->msg);
+
+	return 0;
+}
+
+static bool ads1262_validate_scan_mask(struct iio_dev *indio_dev,
+				       const unsigned long *scan_mask)
+{
+	struct ads1262 *st = iio_priv(indio_dev);
+	struct device *dev = &st->spi->dev;
+
+	if (iio_trigger_using_own(indio_dev)) {
+		dev_err_once(dev, "The %s trigger only supports one active channel\n",
+			     st->trig->name);
+		return iio_validate_scan_mask_onehot(indio_dev, scan_mask);
+	}
+
+	return true;
+}
+
+static const struct iio_buffer_setup_ops ads1262_buffer_ops = {
+	.preenable = ads1262_buffer_preenable,
+	.postdisable = ads1262_buffer_postdisable,
+	.validate_scan_mask = ads1262_validate_scan_mask,
+};
+
+static int ads1262_enable_and_read_last(struct ads1262 *st,
+					const struct ads1262_channel *chan,
+					__be32 *val)
+{
+	int ret;
+
+	lockdep_assert_held(&st->xfer_lock);
+
+	if (chan) {
+		guard(mutex)(&st->chan_lock);
+
+		st->tx[0] = ADS1262_MODE0_REG | ADS1262_OPCODE_WREG;
+		st->tx[1] = ADS1262_INPMUX_REG - ADS1262_MODE0_REG;
+		st->tx[2] = FIELD_PREP(ADS1262_MODE0_DELAY_MASK, chan->delay) |
+			    FIELD_PREP(ADS1262_MODE0_INPUT_CHOP_MASK, chan->input_chop) |
+			    FIELD_PREP(ADS1262_MODE0_IDAC_CHOP_MASK, chan->idac_chop) |
+			    FIELD_PREP(ADS1262_MODE0_RUNMODE_MASK, ADS1262_RUNMODE_CONTINUOUS) |
+			    FIELD_PREP(ADS1262_MODE0_REFREV_MASK, chan->ref_reversal);
+		st->tx[3] = FIELD_PREP(ADS1262_MODE1_FILTER_MASK, chan->filter);
+		st->tx[4] = FIELD_PREP(ADS1262_MODE2_DR_MASK, chan->data_rate) |
+			    FIELD_PREP(ADS1262_MODE2_GAIN_MASK, chan->gain) |
+			    FIELD_PREP(ADS1262_MODE2_BYPASS_MASK, chan->pga_bypass);
+		st->tx[5] = FIELD_PREP(ADS1262_INPMUX_MUXP_MASK, chan->input[0]) |
+			    FIELD_PREP(ADS1262_INPMUX_MUXN_MASK, chan->input[1]);
+
+		st->tx[6] = ADS1262_IDACMUX_REG | ADS1262_OPCODE_WREG;
+		st->tx[7] = ADS1262_REFMUX_REG - ADS1262_IDACMUX_REG;
+		st->tx[8] = FIELD_PREP(ADS1262_IDACMUX_MUX1_MASK, chan->idac_mux[0]) |
+			    FIELD_PREP(ADS1262_IDACMUX_MUX2_MASK, chan->idac_mux[1]);
+		st->tx[9] = FIELD_PREP(ADS1262_IDACMAG_MAG1_MASK, chan->idac_mag[0]) |
+			    FIELD_PREP(ADS1262_IDACMAG_MAG2_MASK, chan->idac_mag[1]);
+		st->tx[10] = FIELD_PREP(ADS1262_REFMUX_RMUXP_MASK, chan->reference[0]) |
+			     FIELD_PREP(ADS1262_REFMUX_RMUXN_MASK, chan->reference[1]);
+	} else {
+		memset(st->tx, 0, sizeof(st->tx));
+	}
+
+	ret = spi_sync(st->spi, &st->msg);
+	if (ret)
+		return ret;
+
+	memcpy(val, st->rx, sizeof(*val));
+
+	return 0;
+}
+
+static int ads1262_fill_buffer_mult(struct ads1262 *st)
+{
+	unsigned int chan;
+	__be32 val;
+	int i = -1;
+	int ret;
+
+	/*
+	 * This routine enables and reads channels in a full-duplex fashion.
+	 *
+	 * When a channel is enabled, the previous conversion is clocked out of
+	 * the shift data register on the same transfer (Section 9.4.7.1). This
+	 * allows for low latency software sequencing but forbids any
+	 * communication with the chip in-between or data corruption may occur,
+	 * hence the need to take the xfer_lock for the whole operation.
+	 */
+	guard(mutex)(&st->xfer_lock);
+
+	iio_for_each_active_channel(st->indio_dev, chan) {
+		ret = ads1262_enable_and_read_last(st, &st->channels[chan], &val);
+		if (ret)
+			return ret;
+
+		reinit_completion(&st->drdy);
+
+		if (i > -1)
+			st->scan_buffer[i] = val;
+		i++;
+
+		ads1262_wait_for_conversion(st);
+	}
+
+	return ads1262_enable_and_read_last(st, NULL, &st->scan_buffer[i]);
+}
+
+static int ads1262_fill_buffer_one(struct ads1262 *st)
+{
+	int ret;
+
+	guard(mutex)(&st->xfer_lock);
+
+	/*
+	 * When only one channel is enabled, we can't really avoid SPI activity
+	 * from happening when the auxiliary ADC is in use, thus we have to read
+	 * from the data-holding register (command mode).
+	 */
+	st->tx[0] = ADS1262_OPCODE_RDATA1;
+	ret = spi_sync(st->spi, &st->msg);
+	if (ret)
+		return ret;
+
+	/* In command mode the conversion data is found at offset 1 */
+	memcpy(st->scan_buffer, &st->rx[1], sizeof(*st->scan_buffer));
+
+	return 0;
+}
+
+static irqreturn_t ads1262_trigger_handler(int irq, void *p)
+{
+	struct iio_poll_func *pf = p;
+	struct iio_dev *indio_dev = pf->indio_dev;
+	struct ads1262 *st = iio_priv(indio_dev);
+	s64 ts = pf->timestamp;
+	unsigned int weight;
+	int ret;
+
+	weight = bitmap_weight(indio_dev->active_scan_mask,
+			       iio_get_masklength(indio_dev));
+
+	memset(st->scan_buffer, 0, sizeof(st->scan_buffer));
+
+	if (weight == 1)
+		ret = ads1262_fill_buffer_one(st);
+	else
+		ret = ads1262_fill_buffer_mult(st);
+	if (ret)
+		goto out_notify_done;
+
+	iio_push_to_buffers_with_ts(indio_dev, st->scan_buffer,
+				    sizeof(st->scan_buffer), ts);
+
+out_notify_done:
+	iio_trigger_notify_done(indio_dev->trig);
+
+	return IRQ_HANDLED;
+}
+
 static irqreturn_t ads1262_irq_handler(int irq, void *dev_id)
 {
 	struct ads1262 *st = dev_id;
 
+	if (iio_buffer_enabled(st->indio_dev))
+		iio_trigger_poll(st->trig);
+
 	complete(&st->drdy);
 
 	return IRQ_HANDLED;
@@ -1355,7 +1604,23 @@ static int ads1262_spi_probe(struct spi_device *spi)
 	indio_dev->channels = channels;
 	indio_dev->num_channels = num_channels;
 
+	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
+					      iio_pollfunc_store_time,
+					      ads1262_trigger_handler,
+					      &ads1262_buffer_ops);
+	if (ret)
+		return ret;
+
 	if (spi->irq > 0) {
+		st->trig = devm_iio_trigger_alloc(dev, "%s-dev%d-drdy", info->name,
+						  iio_device_id(indio_dev));
+		if (!st->trig)
+			return -ENOMEM;
+		iio_trigger_set_drvdata(st->trig, st);
+		ret = devm_iio_trigger_register(dev, st->trig);
+		if (ret)
+			return ret;
+
 		ret = devm_request_irq(dev, spi->irq, ads1262_irq_handler,
 				       IRQF_NO_THREAD, info->name, st);
 		if (ret)

-- 
2.54.0


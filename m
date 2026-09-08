Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324675AEC66
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 19:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895272; cv=none; b=P18QB+f0/1JABzh1uqvLkKIA6pocLPrL+6LZ5Fr4XpY78/0TEKoCwqy46C51r9zNrRtgugh6F0MAOPLDcxkQK2ns9szO1mi1eWvgC0Uy6MedS2rMpsv9t3Oamz7AvRjfYzKHFQ+uo2KOVDGRmXhGTXrXXQDzqFlVCoQdU6lwNXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895272; c=relaxed/simple;
	bh=25uBJoo4JZ26ZIYB2cQwpWUhC8xBD8wl805UIP6bEjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AscFTkOOQg+bI2uKw1BnzWAGmzmPE6y8XdiGTT6MpkBWnfUj2iSwwcV/Tyy0CfHHbIw0GsO7BH5GabUiGjhwOGVnH6x/AhMsUUxpfenCBLYoN9xfmQIbW/DoXgeNTvjPNw0Ic5LteomDVNNPYAS4eDjJ3igkH0qdZOfvUemsy9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XXIr8EPn; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XXIr8EPn"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48584dc164fso4652131f8f.0
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 12:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788895263; x=1789500063; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JUDx5mN4Fxz6V+jBn6+jDa8+QAdVAQRdNH1HIZiM03M=;
        b=XXIr8EPnJeeqMDq70m2wC6zQ3Huiwp6UKDqQt17f7yRLqTt5SJiN109hL1JxP0HIcj
         Ck17v6VbtRwN3D9j7Tf3wmsGo569p8a0t+zzfHaZqD6RwSmnLx+mU4peczRFvKckiIe7
         beqcPPJTMpNcNR1OPchsFD1ahnHrYi0oO9CIZIUT8Ce4g/2qBMYhT/ZpdTComMn6MLWj
         WXA4JaJQ9pZj3k9YzPCBgXBEKXDeXFohiZI7gRPVG00snOOXWyMTR2PwVcoQ8WVJ2oCL
         1R3QTUWa0+udDu9FkNL0IVIWMybvbTSDAJpg000zdRQNWCXczfPNBipGP17DiRz9HjIg
         JT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788895263; x=1789500063;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JUDx5mN4Fxz6V+jBn6+jDa8+QAdVAQRdNH1HIZiM03M=;
        b=m6DiFWbCAzpKWnsvVMWJyj0acvklr5IPFRsACg7vJpUn+MtNPFHlBODXesWvFbakSb
         ajJtai6kaazThdC6BP6KNQ4lCoTeofOctW0yFa9hF0yuGsFyeaYZww6JCMNDa/DSJNXz
         6zbDHTsS7RQhv+wnW5iVTxU7ur+LJ2/ClbDs0/K8zwKFRuQ+tOkfImGX4s3MXS7YzFMt
         G3mJI2TFczA0CMq2e/rtI5sSdxx/9FZZlyixtiE+mOAGjZuusdqJFhOvyZRuKQ96RY1e
         gTYdZP+u2FxaZY74NsKtQEpNjruNlovUa4EujYbZKt45Rh08ZswZzHFUHWbnv2MO2hm3
         fYPA==
X-Forwarded-Encrypted: i=1; AKwUvBxMRmsAbMwe0dP8wQXWJ5rJBUpEVsFwYj6qDGvLamKhsHxKJzgKSJumy5MxW6Vr1hiHLc4LUn+cEY9z@vger.kernel.org
X-Gm-Message-State: AFuF++kLXDxdoj5KThV/tfUSO/+4BsWVfnQgVLgJDGEFHcHW5xLGcV1X
	dyr96v5L4X40umg2zG16PT1C70GvXW2lPD2f3M1vt5rpxBE2bK6d2/c8
X-Gm-Gg: AYBFou2Eo6x1gSmzY2mJ0mewqG1KH0Icj4qLm4VbWsTb104GftECLicmnQY6XFpSeh2
	gkhFEfXIXmxTWxnyf+rB8yi1k1NesugrqIar5P27YMiyIRClE0ip7dTS3IFU5F1QkLDjbP9tPF8
	xLqz7U7f/QqAZJuxVjbibqYaenzWwoRvYAmHUWzhBzG4wNuKdjKxevs8Li4vdnDHGvCnZOHCqoK
	LxBYF/bFyZDN1GmQTfRLwpG9A6QVBepP1ov3XaVT4ckza+sRBn7ZgkXEnO9h9+4n+o8E5gteh6P
	1M6G0KI/gpkZ0vMum2nZox2+O6qcfwtEyz53LfQ2k+B/8KMGDrE/QFbOZTgnSGaKTyczTy3iUwu
	YzUxvs+HJq4AvBD7NIHHa0/hPqedlrSPLEP9mLPDsU2/gmrojz2dk6pKbUqdJfE9DFETpJ5Mtrb
	D+S8od6B2/y4D37k45H1qTyfTm0ODTCRn9ppuX1se+6p+aKHrnevPvOWFnlaEr++az8ZFFCC6O/
	EgbJZ8B4ivGXQ2Yf5gLnGfVBq6oYkuBoa05srCXCg==
X-Received: by 2002:a05:600c:3e06:b0:49d:99:1d98 with SMTP id 5b1f17b1804b1-49d00991db1mr243065025e9.9.1788895262515;
        Tue, 08 Sep 2026 12:21:02 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.115])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf770fcf5sm407885845e9.6.2026.09.08.12.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:21:01 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org
Subject: [PATCH v4 2/2] iio: adc: ti-ads1015: Add support for label
Date: Tue,  8 Sep 2026 22:20:36 +0300
Message-ID: <20260908192036.8503-3-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908192036.8503-1-flaviu.nistor@gmail.com>
References: <20260908192036.8503-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for label sysfs attribute similar to other ADC devices. This is
particularly useful because the label can match the schematic signal name,
identifying channel voltages easier if label is defined via device tree.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 drivers/iio/adc/ti-ads1015.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 0fbfa4e499aa..0f9244107c6d 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -233,6 +233,7 @@ static const struct iio_event_spec ads1015_events[] = {
 struct ads1015_channel_data {
 	unsigned int pga;
 	unsigned int data_rate;
+	const char *label;
 };
 
 struct ads1015_thresh_data {
@@ -586,6 +587,15 @@ static int ads1015_read_raw(struct iio_dev *indio_dev,
 	}
 }
 
+static int ads1015_read_label(struct iio_dev *indio_dev,
+			      struct iio_chan_spec const *chan, char *label)
+{
+	struct ads1015_data *data = iio_priv(indio_dev);
+
+	return sysfs_emit(label, "%s\n",
+			  data->channel_data[chan->address].label);
+}
+
 static int ads1015_write_raw(struct iio_dev *indio_dev,
 			     struct iio_chan_spec const *chan, int val,
 			     int val2, long mask)
@@ -843,6 +853,7 @@ static const struct iio_buffer_setup_ops ads1015_buffer_setup_ops = {
 static const struct iio_info ads1015_info = {
 	.read_avail	= ads1015_read_avail,
 	.read_raw	= ads1015_read_raw,
+	.read_label	= ads1015_read_label,
 	.write_raw	= ads1015_write_raw,
 	.read_event_value = ads1015_read_event,
 	.write_event_value = ads1015_write_event,
@@ -853,6 +864,7 @@ static const struct iio_info ads1015_info = {
 static const struct iio_info tla2024_info = {
 	.read_avail	= ads1015_read_avail,
 	.read_raw	= ads1015_read_raw,
+	.read_label	= ads1015_read_label,
 	.write_raw	= ads1015_write_raw,
 };
 
@@ -861,7 +873,9 @@ static int ads1015_client_get_channels_config(struct i2c_client *client)
 	struct iio_dev *indio_dev = i2c_get_clientdata(client);
 	struct ads1015_data *data = iio_priv(indio_dev);
 	struct device *dev = &client->dev;
+	const char *label;
 	int i = -1;
+	int ret;
 
 	device_for_each_child_node_scoped(dev, node) {
 		u32 pval;
@@ -897,6 +911,15 @@ static int ads1015_client_get_channels_config(struct i2c_client *client)
 			}
 		}
 
+		if (fwnode_property_present(node, "label")) {
+			ret = fwnode_property_read_string(node, "label", &label);
+			if (ret) {
+				dev_err(dev, "invalid label on %pfw\n", node);
+				return ret;
+			}
+			data->channel_data[channel].label = label;
+		}
+
 		data->channel_data[channel].pga = pga;
 		data->channel_data[channel].data_rate = data_rate;
 
@@ -985,6 +1008,13 @@ static int ads1015_probe(struct i2c_client *client)
 	/* we need to keep this ABI the same as used by hwmon ADS1015 driver */
 	ads1015_get_channels_config(client);
 
+	/* Channels without a label property fall back to the datasheet name */
+	for (i = 0; i < ADS1015_CHANNELS; i++) {
+		if (!data->channel_data[i].label)
+			data->channel_data[i].label =
+				indio_dev->channels[i].datasheet_name;
+	}
+
 	data->regmap = devm_regmap_init_i2c(client, chip->has_comparator ?
 					    &ads1015_regmap_config :
 					    &tla2024_regmap_config);
-- 
2.34.1


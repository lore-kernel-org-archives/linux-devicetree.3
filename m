Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2027E4AC16E
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 17:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788369762; cv=none; b=Rekec1QMRxnrb4nJzakdaI8a2VZki3yHXbY6NBzodvt8LoGLLEoUa8Vng/0Y2H0vZudCFFIQ/78Q2qjk0H5m5x6OSakiNUR+DNGfq+a1fucQGAi6ASkw79/yzRGbYR82DSs+0lAcgnk+FNi6aJyq8V0EY8RJR+MYtks3+Ln2o54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788369762; c=relaxed/simple;
	bh=4XulWumZXqpCfKb3SArb1B6Yum/mNtjYciJqXggO0jo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CI48L3vFu38eEWrXAWuzSSt7bfpRZYFDJrivjIpeafB2cKzg1+uTyXPf32ee5xQ8rKsd9PQUkNX5E2CRtxkuKHtDlJWxM0/gs+kBb5bOBX1t9BEZwtwXaDbsscGMA23Rn9eT9aZse6qjuCk43dVWLn4CZCZssIQ5Yp9EGrcNNeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7muB3Sy; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7muB3Sy"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-482dd6ee390so1348685f8f.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 10:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788369759; x=1788974559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mrl372Fg43b2CyduoRGiy3yZV5K9VIBKnZ3Q5D/PZek=;
        b=f7muB3SyY8DHNb3BH7P6gDMmOTZSDXM9qtha2dOuXusTTSOTUBD6s/f4gd5anYYUy9
         sqrca/j3SZAmTEgthEpeurMhoLSSXK0r0AfDCHsaWhBPSNT3daciZN9+SlIlQlMjFR3W
         C6FvVyqxaIWuJD6opaaXesKbbnzCfKAvqmntMU5qhYhOmKAn/gkYmFDEIIYK3uXYdVk4
         SLj7J7Ft/Du7aOhH9vnPNJGUOj3vPmOImlnuxKEaeoG3LYCN6YhFFiIBO9MhOEnWhBt/
         KmFRWb5zpAalTim+mQvuIQ4OLOIr21YQOUrPIeIOqKNjbpyLwEuwSwN079p5eVsUstca
         HpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788369759; x=1788974559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mrl372Fg43b2CyduoRGiy3yZV5K9VIBKnZ3Q5D/PZek=;
        b=LcUjw4Lhcq4e7ePcB2lZ5S3UVx6FhW4ptAomEI8EgOnxlKdAoNxXb6iWDbIume7UuF
         1bD+C8zRXDhFiOKuH90jH/3b8SS14TzdfeNkerkqxJsa/WfWz13oeQaDzT0nRx7IOlB3
         yep2oN0u+tidIlj0JvndbB88dVUrEahKgAYkhfWcaWUhSQGDK0zNcxSWNrolLojD3KxA
         pHSHIYe5OrpGKGfpgb84/l/XSjS0uir10AEDNUgpBi6HYCw+tZ131YvO3qjFkYOgWYHJ
         MmRfBl+e3l7idm1bV1FP8+4sXRPUVdW9h4LKam+OrxUlBU/KJeRJMajKkSwv3w35qO79
         9k5g==
X-Forwarded-Encrypted: i=1; AHgh+Rr++Umxh6+Sl86YtMtYXNPgjSBhYqwXlvKcIlT0N3nZWPSFb9RTbp/LSuE9yrI49d9ZZERSb6jQbJOl@vger.kernel.org
X-Gm-Message-State: AFuF++lGqpLOGetGygzhL2gimjaQ8DXuwXPAduDwhVMaw16LEauj/87z
	z4754n3bTdJblTImMcIwr49G54gRw7jk/ebZbz9iGDSGhUFyA0AmLOon
X-Gm-Gg: AR+sD10KBr/pSyopa+/2sYSyREWCsnkN2PJoMvH9aC1UdFUTHj6jyl1xEIZMP68UH0o
	Osxx8RKrWU2QNo0FzE0sqoK2Z5xfZOK1g0ufQVBf2lg/Th6HkPcV5MbiPE8ZRgTby9xLfqezV5P
	YKoftsdb61ZSUDt+aQE6t/soQCw7SRjNrbwL6sU4iTkEAwAm03PSxHPnglUQEkX69jYSA/zGbIK
	BpnJ/6MhutqbvJ7LhRDCZ3N/VQNQNYVGEaUAH1x7m9ksmwfi5PzOhLVatgkXT7llRTtxE3SZVPN
	ftUqbtI0q/ljVxS1eOOfWqfJ/pF+7YIn8DzWW3SYhn1vWmKPICEMuPaQqSBvOIU4KhLcnxJJG5f
	rM2Dz13/bLSSWF+lH5lBAdGc+EuAfgo1u1fpOQndi2YCHpj/IhvX49GxcfrucGYj4Iwk5oqx4yq
	84kDyTlABOajnxA2tqkalVsIAdLr8rS/28Vljod05jpMuf2blp0pvKJ01kiQfZJKzlM3I+5NRy6
	uP43CKRNZEr2MXlqv5PCaJCjLrid+YAenAjQW0x
X-Received: by 2002:a05:600c:45c4:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49ce5816186mr117844465e9.10.1788369759149;
        Wed, 02 Sep 2026 10:22:39 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.251.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023d6sm5813145e9.8.2026.09.02.10.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 10:22:38 -0700 (PDT)
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
Subject: [PATCH v2 2/2] iio: adc: ti-ads1015: Add support for label
Date: Wed,  2 Sep 2026 20:22:30 +0300
Message-ID: <20260902172230.5234-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902172230.5234-1-flaviu.nistor@gmail.com>
References: <20260902172230.5234-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for label sysfs attribute similar to other adc devices. This is
particularly useful because the label can match the schematic signal name,
identifying channel voltages easier if label is defined via device tree.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
Changes in v2:
- Implement changes suggested by Andy Shevchenko. 
- Link to v1: https://lore.kernel.org/all/20260901184302.8127-2-flaviu.nistor@gmail.com/

 drivers/iio/adc/ti-ads1015.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 0fbfa4e499aa..8be1f0c32ca9 100644
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
+	const char *name = data->channel_data[chan->address].label;
+
+	return sysfs_emit(label, "%s\n", name);
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
@@ -897,6 +911,17 @@ static int ads1015_client_get_channels_config(struct i2c_client *client)
 			}
 		}
 
+		if (fwnode_property_present(node, "label")) {
+			ret = fwnode_property_read_string(node, "label", &label);
+			if (ret) {
+				dev_err(dev, "invalid label on %pfw\n", node);
+				return ret;
+			}
+			data->channel_data[channel].label = label;
+		} else {
+			data->channel_data[channel].label = "";
+		}
+
 		data->channel_data[channel].pga = pga;
 		data->channel_data[channel].data_rate = data_rate;
 
-- 
2.34.1


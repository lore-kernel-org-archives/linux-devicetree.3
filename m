Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956814;
	b=JRXjPHd3V5XCqcYArslGGycXkh6cLxBRRe/l9Et3S1YAZwVYqDfFjtpHdgAXi/VIowCw
	 6ok14JwzqYBOTs/G8AT0LFhfcP8TRSVr8+FXvG/HyvWsdTGRLD0MQtvbGxY+paGrnfD8H
	 RarUvZMnOt5YCm5bSTkWb8bcXt9uuXE5mn3Y7/Ode/1IVckjE4y9AEvSnH+ApTJbbllrk
	 1+9YCb7xV9XQJg3yAhzJaQVvIPQ7gVGa6ZWOzAA5DFntJPBI8pyYPqVJ9KBbFWMYcO7l9
	 6/U+LypQ5OFoE63banzRelimrCFVvcJiNJwaJS9nVPB0jBtAa8y/MJKVGkbdYwmV9Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p9yngXRQlhdY0K3IAiQSprScx4advF1zvS5JKRcEVLE=;
	b=hguJBoFHCP6OtCS74s5Z0Ic37ZwgtKx6wnurYmyRMIXUQfm54EnnUgf8Q6pDqyEeja+G
	 A6atS1KgbzgAYumyIXFVpZmyLnU7bg4bAcJ/Xw3wCamlXkTM9g/rdRJD7wgstmv3fiDOz
	 Tw9j+jos69/mD+j+b218UIHhCiy+91PUwtEZZiFjx3GKUwPK5sJTMETK2wVFa8bh3+3wx
	 3YD5Hny+7wt3AUrM9fVAY6SgI8uKmaKo6JGDM47WCB/EdBGKzAH6lv63Q+9Jlv6R5QjxW
	 I5XTxmUI4+D83DbQB/sCIIAKyXOvZLXsKHf+wweubHu2Rlfq4HppM9QAeo0I3OeIE9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W0wmRzvc;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD41606EE9B
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FD41606EE9B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=W0wmRzvc
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49d05d51553so2120275e9.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 01:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956812; x=1794561612; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p9yngXRQlhdY0K3IAiQSprScx4advF1zvS5JKRcEVLE=;
        b=W0wmRzvc2u9ak/YWdAwi7ePbK/k/Z5ld27hzZcZ+69z+95DeEos7Gc5qbdixNAUSGr
         /guFC4QyITO1kI2K7uMrhE2cd2P82VoCri+8gkEdDm0taJFeewmC/tYT/p0k8kLK+++z
         0TljBCVhqNogjFK+7V2Nk3tY53RP5DanN0NNc3u6a+JUy3Oy83OlxtmoS4U4wtM2j+qk
         lTgsrq5JtnJSg8PYEso3ZxL5V5LSbBS2mLAVIdxnsvcoD9lwlZ9Jz3r/aZ2yEzOhhJ6f
         zQ/0b93a3/5/LMTVbgthcWOCQUf3yEYah/K40NXuq3VBFLQeX4VZBlnK9o+Vcq/6tFsL
         AryA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956812; x=1794561612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p9yngXRQlhdY0K3IAiQSprScx4advF1zvS5JKRcEVLE=;
        b=qVB5qiV40KHaF+pImflZ0WEFLFtDUr+L176szlkj7e9tmLxr8JIN3l/g/nDRIThI9t
         /EeD2ETib9c/yGmZf0HHC0CbBj6XKyb4cZto0VZbD12AXQvU6V7GK9wAU3MCZxu8xonU
         i1sITLxCbXxIy/zRCEbto7f80/jiDnl0TSt+JUdBPYa2dC9nK6kbcUxyPa695/hA/tda
         to41hu7Dja9DLXTEelirnkMmmbCtFqDU6XE3hGX4rzwx6Alg4jeaB8JpP6HJA0WHMeB4
         bhVwkQDm3usxGZLxrOGyDP+4GIxGZ0qrKlXHnH+9ICIIVZlg+SNyo/ODgsjI/gcnLQQl
         OSJg==
X-Forwarded-Encrypted: i=1; AKwUvBycawMBQsimFv6f7zkmOjY1zAftAsUQPdJAplsiIvyX+S1Ch0tRrlEJxuxTHGlSNFUSk5YdN48qdx0d@vger.kernel.org
X-Gm-Message-State: APuU4Z82J6Im0ezlY0hS9kPBH7NlfZdwKicdqVw1eHkrLMVN9JMrp77a
	9v9oyC108MePEAE4dLLblfeednW8O+zeotAWtlxyahoKSKMs2FXVyqLM
X-Gm-Gg: AYBFou1TzjSZhIE9FWL6Zed5e62LQzX7UVGXDZJezea4TLGoZUs7IED7CODpbmoQ289
	rVUi7VMqZn2f8qgief3OgA0PAwVew6AVBE0SBWAYAwjKLbfJrs93A5gBcI9U3fI4/FCmp+wBQ+P
	au/rboXxHcwEss+JfyhtrJGCHQDPxKXKcqz+7ROkFTyXokK0li1pPCFsF8R55E9gIHrK4nU1pkW
	kMnc+yZdX+f/3m4u9vLPm2gckU4R0mZY7SYCSipTJmLKASjq3OO7aOsDTZ6NjeaZyNfRVQqfX3B
	4qPrDqxI/iDelD+QKqoOnRaChMcGhg2S0NEF9YLLTojABOW9ad9pHwPbkLNe8R5yQ1313Kuu9B1
	WOZBMDYJAwYFlm+mzap0ZIGZv6zSgXJR1PtuF0Fe9jGqyS8qqnZg02mgvmtv+VHsUzi8/9k7SYm
	VS9TMYXrpgCiPdLTro8QcEkfEahObyCvdrvTrLijy8Q36hYs3/9pAiVwbRt8s1tITtwrYpVllys
	Cz0rfDeAW4eaPKnxfwzF5V6nq2ET749Ut9ALXgj1tC5j86j8vvZ3K0zOovtiRJiGDFGezyAtMmB
	+/1OqKmvDF483AIqoDHt7CoUiw4dDlgUZuOuQGcTcKiYBbd8WnaZoi2KDteaGtM/xknW3OEPUpi
	2X/jLfBN/dw==
X-Received: by 2002:a05:600c:c085:b0:4a7:d9b1:b684 with SMTP id 5b1f17b1804b1-4b6e5ab7bdbmr22578535e9.2.1793956812200;
        Fri, 06 Nov 2026 01:20:12 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57203a98fsm108358935e9.4.2026.11.06.01.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:20:11 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Esben Haabendal <esben@geanix.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pan Chuang <panchuang@vivo.com>,
	Hemanth Selam <hemanth.selam@gmail.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Nikita Travkin <nikita@trvn.ru>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] iio: light: ltr501: Switch to read_avail() op from manual attribute registration
Date: Fri,  6 Nov 2026 11:19:40 +0200
Message-ID: <20261106091943.35783-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106091943.35783-1-clamor95@gmail.com>
References: <20261106091943.35783-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to the read_avail() operation from manual attribute group
registration. This eliminates the need for per-chip attribute_group
structures and related ltr501_chip_info iio_info entries.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/iio/light/ltr501.c | 153 +++++++++++++------------------------
 1 file changed, 52 insertions(+), 101 deletions(-)

diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
index 302be2fc314c5..cc5d7af44d77c 100644
--- a/drivers/iio/light/ltr501.c
+++ b/drivers/iio/light/ltr501.c
@@ -133,6 +133,22 @@ static const struct ltr501_gain ltr559_ps_gain_tbl[] = {
 	{0, 15624},
 };
 
+static const int int_time_avail[] = {
+	0, 50000,
+	0, 100000,
+	0, 200000,
+	0, 400000
+};
+
+static const int samp_freq_avail[] = {
+	20, 0,
+	10, 0,
+	5,  0,
+	2,  0,
+	1,  0,
+	0,  500000
+};
+
 struct ltr501_chip_info {
 	u8 partid;
 	const struct ltr501_gain *als_gain;
@@ -145,8 +161,6 @@ struct ltr501_chip_info {
 	bool no_irq_support;
 	struct iio_chan_spec const *channels;
 	const int no_channels;
-	const struct iio_info *info;
-	const struct iio_info *info_no_irq;
 };
 
 struct ltr501_data {
@@ -590,6 +604,7 @@ static const struct iio_event_spec ltr501_pxs_event_spec[] = {
 	.channel2 = (_mod), \
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
 	.info_mask_shared_by_type = (_shared), \
+	.info_mask_shared_by_all_available = (_shared), \
 	.scan_index = (_idx), \
 	.scan_type = { \
 		.sign = 'u', \
@@ -1111,111 +1126,56 @@ static int ltr501_write_event_config(struct iio_dev *indio_dev,
 	return -EINVAL;
 }
 
-static ssize_t ltr501_show_proximity_scale_avail(struct device *dev,
-						 struct device_attribute *attr,
-						 char *buf)
+static int ltr501_read_avail(struct iio_dev *indio_dev,
+			     struct iio_chan_spec const *chan,
+			     const int **vals, int *type, int *length, long mask)
 {
-	struct ltr501_data *data = iio_priv(dev_to_iio_dev(dev));
+	struct ltr501_data *data = iio_priv(indio_dev);
 	const struct ltr501_chip_info *info = data->chip_info;
-	ssize_t len = 0;
-	int i;
-
-	for (i = 0; i < info->ps_gain_tbl_size; i++) {
-		if (info->ps_gain[i].scale == LTR501_RESERVED_GAIN)
-			continue;
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%d.%06d ",
-				 info->ps_gain[i].scale,
-				 info->ps_gain[i].uscale);
-	}
 
-	buf[len - 1] = '\n';
+	switch (mask) {
+	case IIO_CHAN_INFO_SCALE:
+		if (chan->type == IIO_INTENSITY) {
+			*length = info->als_gain_tbl_size * 2;
+			*vals = (const int *)info->als_gain;
+		} else {
+			*length = info->ps_gain_tbl_size * 2;
+			*vals = (const int *)info->ps_gain;
+		}
+		*type = IIO_VAL_INT_PLUS_MICRO;
+		return IIO_AVAIL_LIST;
 
-	return len;
-}
+	case IIO_CHAN_INFO_INT_TIME:
+		*vals = int_time_avail;
+		*type = IIO_VAL_INT_PLUS_MICRO;
+		*length = ARRAY_SIZE(int_time_avail);
+		return IIO_AVAIL_LIST;
 
-static ssize_t ltr501_show_intensity_scale_avail(struct device *dev,
-						 struct device_attribute *attr,
-						 char *buf)
-{
-	struct ltr501_data *data = iio_priv(dev_to_iio_dev(dev));
-	const struct ltr501_chip_info *info = data->chip_info;
-	ssize_t len = 0;
-	int i;
+	case IIO_CHAN_INFO_SAMP_FREQ:
+		*vals = samp_freq_avail;
+		*type = IIO_VAL_INT_PLUS_MICRO;
+		*length = ARRAY_SIZE(samp_freq_avail);
+		return IIO_AVAIL_LIST;
 
-	for (i = 0; i < info->als_gain_tbl_size; i++) {
-		if (info->als_gain[i].scale == LTR501_RESERVED_GAIN)
-			continue;
-		len += scnprintf(buf + len, PAGE_SIZE - len, "%d.%06d ",
-				 info->als_gain[i].scale,
-				 info->als_gain[i].uscale);
+	default:
+		return -EINVAL;
 	}
-
-	buf[len - 1] = '\n';
-
-	return len;
 }
 
-static IIO_CONST_ATTR_INT_TIME_AVAIL("0.05 0.1 0.2 0.4");
-static IIO_CONST_ATTR_SAMP_FREQ_AVAIL("20 10 5 2 1 0.5");
-
-static IIO_DEVICE_ATTR(in_proximity_scale_available, S_IRUGO,
-		       ltr501_show_proximity_scale_avail, NULL, 0);
-static IIO_DEVICE_ATTR(in_intensity_scale_available, S_IRUGO,
-		       ltr501_show_intensity_scale_avail, NULL, 0);
-
-static struct attribute *ltr501_attributes[] = {
-	&iio_dev_attr_in_proximity_scale_available.dev_attr.attr,
-	&iio_dev_attr_in_intensity_scale_available.dev_attr.attr,
-	&iio_const_attr_integration_time_available.dev_attr.attr,
-	&iio_const_attr_sampling_frequency_available.dev_attr.attr,
-	NULL
-};
-
-static struct attribute *ltr301_attributes[] = {
-	&iio_dev_attr_in_intensity_scale_available.dev_attr.attr,
-	&iio_const_attr_integration_time_available.dev_attr.attr,
-	&iio_const_attr_sampling_frequency_available.dev_attr.attr,
-	NULL
-};
-
-static const struct attribute_group ltr501_attribute_group = {
-	.attrs = ltr501_attributes,
-};
-
-static const struct attribute_group ltr301_attribute_group = {
-	.attrs = ltr301_attributes,
-};
-
 static const struct iio_info ltr501_info_no_irq = {
 	.read_raw = ltr501_read_raw,
 	.write_raw = ltr501_write_raw,
-	.attrs = &ltr501_attribute_group,
+	.read_avail = ltr501_read_avail,
 };
 
 static const struct iio_info ltr501_info = {
 	.read_raw = ltr501_read_raw,
 	.write_raw = ltr501_write_raw,
-	.attrs = &ltr501_attribute_group,
-	.read_event_value	= &ltr501_read_event,
-	.write_event_value	= &ltr501_write_event,
-	.read_event_config	= &ltr501_read_event_config,
-	.write_event_config	= &ltr501_write_event_config,
-};
-
-static const struct iio_info ltr301_info_no_irq = {
-	.read_raw = ltr501_read_raw,
-	.write_raw = ltr501_write_raw,
-	.attrs = &ltr301_attribute_group,
-};
-
-static const struct iio_info ltr301_info = {
-	.read_raw = ltr501_read_raw,
-	.write_raw = ltr501_write_raw,
-	.attrs = &ltr301_attribute_group,
-	.read_event_value	= &ltr501_read_event,
-	.write_event_value	= &ltr501_write_event,
-	.read_event_config	= &ltr501_read_event_config,
-	.write_event_config	= &ltr501_write_event_config,
+	.read_avail = ltr501_read_avail,
+	.read_event_value = &ltr501_read_event,
+	.write_event_value = &ltr501_write_event,
+	.read_event_config = &ltr501_read_event_config,
+	.write_event_config = &ltr501_write_event_config,
 };
 
 static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
@@ -1226,8 +1186,6 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
 		.als_mode_active = BIT(0) | BIT(1),
 		.als_gain_mask = BIT(3),
 		.als_gain_shift = 3,
-		.info = &ltr301_info,
-		.info_no_irq = &ltr301_info_no_irq,
 		.channels = ltr301_channels,
 		.no_channels = ARRAY_SIZE(ltr301_channels),
 	},
@@ -1238,8 +1196,6 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
 		.als_mode_active = BIT(0),
 		.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
 		.als_gain_shift = 2,
-		.info = &ltr301_info,
-		.info_no_irq = &ltr301_info_no_irq,
 		.channels = ltr301_channels,
 		.no_channels = ARRAY_SIZE(ltr301_channels),
 	},
@@ -1251,7 +1207,6 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
 		.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
 		.als_gain_shift = 2,
 		.no_irq_support = true,
-		.info_no_irq = &ltr301_info_no_irq,
 		.channels = ltr301_channels,
 		.no_channels = ARRAY_SIZE(ltr301_channels),
 	},
@@ -1264,8 +1219,6 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
 		.als_mode_active = BIT(0) | BIT(1),
 		.als_gain_mask = BIT(3),
 		.als_gain_shift = 3,
-		.info = &ltr501_info,
-		.info_no_irq = &ltr501_info_no_irq,
 		.channels = ltr501_channels,
 		.no_channels = ARRAY_SIZE(ltr501_channels),
 	},
@@ -1278,8 +1231,6 @@ static const struct ltr501_chip_info ltr501_chip_info_tbl[] = {
 		.als_mode_active = BIT(0),
 		.als_gain_mask = BIT(2) | BIT(3) | BIT(4),
 		.als_gain_shift = 2,
-		.info = &ltr501_info,
-		.info_no_irq = &ltr501_info_no_irq,
 		.channels = ltr501_channels,
 		.no_channels = ARRAY_SIZE(ltr501_channels),
 	},
@@ -1548,7 +1499,7 @@ static int ltr501_probe(struct i2c_client *client)
 				     &data->near_level))
 		data->near_level = 0;
 
-	indio_dev->info = data->chip_info->info;
+	indio_dev->info = &ltr501_info;
 	indio_dev->channels = data->chip_info->channels;
 	indio_dev->num_channels = data->chip_info->no_channels;
 	indio_dev->name = name;
@@ -1573,7 +1524,7 @@ static int ltr501_probe(struct i2c_client *client)
 		if (ret)
 			goto powerdown_on_error;
 	} else {
-		indio_dev->info = data->chip_info->info_no_irq;
+		indio_dev->info = &ltr501_info_no_irq;
 	}
 
 	ret = iio_triggered_buffer_setup(indio_dev, NULL,
-- 
2.53.0


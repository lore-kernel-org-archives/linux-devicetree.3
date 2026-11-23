Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465585;
	b=22fWChKQ3cMb4ziOI1K50FB69v2My3HkSWGGKUWPX2sDr3j2d8SsQhJMV/26BAI0azXv
	 mC5AS7cH6TdTVTUkmzHeISdM8GfnEwMXvdQ8cO6kucAXR5lz2KO35TJW9EmpEEmn42Fua
	 hZ9CxcYFADGbegWa+QLDnZDBfIfFMcBWQgYrBa1x4+LIkw2mwUTBQwVgMwFnnPHNZFc5p
	 rK799csUU6UC4pj8Wt0SYJAXW4Sirw7sK9VvNUty6evzyxx0ryOhicZR4/lrl/hsVJlqE
	 nyeZZVuHnHxPJEiyg7n8/ti/puA9+sFE+u6wBL11DoAX8xEO4xMgG6mszez2Rg7KPKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NQ48N7WWkZ+c+s4V0T47yLDwNjedp7a0tZsuMHqD3Go=;
	b=Q4veiZfpAG6U7RN8XBVrE66/OmuIPrYjxEmCf+WI360FepnJ/7htwQNNHe5souZhN1SB
	 FjoO91W9lGpJaaak00eL1gK+iJhWMbNgos3xmo8KzM9TcD2XGXXZN/EkhzeVUkCES+1E7
	 umsrFJavbaCmZEiIkba3v3ixdq+X9Nv+YsUNOcmJ6bPm47Glefrldw/binUIl3hIp8ZBI
	 UtTkd1bHEd9lv5pQDAAANaSX0XNCcyd90JUjnjc138ErJBNGkkVDtBE4k/4joRJ/gBuah
	 xe7PiWVTBG+H0QZhCy/OlNH4jZl5TLX2C+oMFeHCCMnHgE29wAM2LwgZwJ9V4f1ezWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=j9nSIYwX;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40841606A6AD
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40841606A6AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=j9nSIYwX
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1974464f8f.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:26:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795465584; x=1796070384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NQ48N7WWkZ+c+s4V0T47yLDwNjedp7a0tZsuMHqD3Go=;
        b=j9nSIYwX9ihcFMpmtUR6hNHIo1cHJ+LzzBhJnKdh9hkVA5oFY8tlzk4B/vc3G2Yerv
         KSRQPxgPsRMPTHbYh5GO9VFH5+0CBFOHVSUNNNanJVhYBP96/JWeB2Y2o2gxpIgNeJic
         RR0DQOcaY2imOtd39OuMfZOivZNm79jP+pOQKUU2hI/QEtlgfn3hhPcuxiIKlGJWQuGu
         ZHXx+SpBkHrRm0xHzx9ZG0I9ima2b0hPzKu0FEigvCFTa2uGGDu9qF9J4TIvghjNw9SN
         xvAFvd3VaEAMWl53kjYY9jh4VNtdt7u3Lx0q0OGAZPqhUI2QLd06TJoeKip/5Jol1eNY
         zzQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465584; x=1796070384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NQ48N7WWkZ+c+s4V0T47yLDwNjedp7a0tZsuMHqD3Go=;
        b=rVH8fN8jHtrVMmmgvlMqrfEiq/ggME3rHhF1kDtOOgbpfuMZtnHbXHhp7Exa4ujHWb
         65ZvX4KNqxmXrgtAOhPRPqdg4dbJkOOSqDsvuZGPvwDhjlLZPAHAeeBuum7/ra3tiEWk
         eo12YXDvcNu+XH7r8q5JPZVZz2vVd+ffmGG7rTzI/xfLvrAUE1VWEH9e1f+I8rHGdJSQ
         nPdh0H/5GYVlXMr9HtDSoCFzfLcgEW6batvF3bZpD8dKINATGhpmUXsuHPXbF5n1FynZ
         7qTSBmy3uioygY3e23JgzmqMbzzM020Ip6K9h5ApOOQzRMB/e596Ufg1kZHKcf6sf/Pa
         qz4Q==
X-Forwarded-Encrypted: i=1; AL+hErHDDcON3YxUPhd+i/Kl43Zu2uBnhZB/4ZUZJeXn5mjRizkxTu9qqKu6dvBYPrxRJtOj/DvW8FagSuBG@vger.kernel.org
X-Gm-Message-State: APuU4Z9baa5VgIQ8Y25eFBITUg7YHwzWSGvgZ4s8HlX97BcvO5aQJb0r
	158H/SSPeWS+XA6YGHnxl/d1ooocXvDM6qSlf0SFZQMpmhekZQzr4zxKQXiBgDSndM0=
X-Gm-Gg: AZFdTZcR7nqcoSW7kIgvsK+QB/yw4X9F5jS9OpbaDTuZmyJDeDjr0lKzHcwNU0of2D1
	m2GbV3zXtsx6F0blXdWX7UK1BTAep6C8mRnA3dAn+IVXyrCQxGHDEhb5Ixar/SNIN2NwMFfhYIg
	9JijTFoT5Ttaw4Z1FabuqY+Z1ep1wdKeW8CK7Y0Iy5ie8rIJoYC8LSftcNdalHYOpjySn6XptIA
	5i0l6SdaltCUgqUC/CmAd5M7DNQWRH9xtl/bLkSFZP568s4pbBMnmrAqpNH8JzO1zVeDDPP9qFo
	D0exU4qfY0HR6dShTGoOUhBOzCaooJGB5HTkY7+EzvpaBnLtBEysFwlzj1XO3Nk1kA0Yz52nHxZ
	9UbbFDzxDi//Y3q8h6By8+auVzArKLp/dosIZcILAgghsDe8Tay0oifpAa03jSZynERd+SBsBz6
	cwc8QFmdqE1OM/tSVaGnnxoeufmEddbcFHZ1Ph0hmXx0INVyBu5/GsiwHQ4um4DY3eRD3r9N1yw
	0f1rQod00vS1Q0mjj9Qm8NEMy8h2Z4J5OTvGfiFqPehMQDR9STbVsEpkrzyRBxsspWfGkJ90sb2
	ZXtbP4ANvUYw4o5g9ofZx/HWWcQLwX+3bw+1pwly+crl2XA/rRk1Vsy/AD6SiQjrDWZSdDsBas9
	juQQq168NPxE=
X-Received: by 2002:a05:6000:46cb:b0:48d:ecba:3cf8 with SMTP id ffacd0b85a97d-4abb3956786mr18544591f8f.43.1795465583237;
        Mon, 23 Nov 2026 12:26:23 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm20108713f8f.46.2026.11.23.12.26.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 12:26:22 -0800 (PST)
From: Gerard Marull-Paretas <gerard@teslabs.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Frank Li <Frank.li@nxp.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] iio: magnetometer: mmc5633: Add mount matrix support
Date: Mon, 23 Nov 2026 21:26:15 +0100
Message-ID: <20261123202616.17334-5-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261123202616.17334-1-gerard@teslabs.com>
References: <20261123202616.17334-1-gerard@teslabs.com>
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

Read the mount matrix from the firmware and expose it, so that user
space can account for how the sensor is oriented on the board.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 drivers/iio/magnetometer/mmc5633.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/iio/magnetometer/mmc5633.c b/drivers/iio/magnetometer/mmc5633.c
index 316b431477dd..adc08cb28600 100644
--- a/drivers/iio/magnetometer/mmc5633.c
+++ b/drivers/iio/magnetometer/mmc5633.c
@@ -92,6 +92,7 @@ struct mmc5633_data {
 	struct regmap *regmap;
 	struct i3c_device *i3cdev;
 	struct mutex mutex; /* protect to finish one whole measurement */
+	struct iio_mount_matrix orientation;
 };
 
 static int mmc5633_samp_freq[][2] = {
@@ -101,6 +102,20 @@ static int mmc5633_samp_freq[][2] = {
 	{ 6, 600000 },
 };
 
+static const struct iio_mount_matrix *
+mmc5633_get_mount_matrix(const struct iio_dev *indio_dev,
+			 const struct iio_chan_spec *chan)
+{
+	struct mmc5633_data *data = iio_priv(indio_dev);
+
+	return &data->orientation;
+}
+
+static const struct iio_chan_spec_ext_info mmc5633_ext_info[] = {
+	IIO_MOUNT_MATRIX(IIO_SHARED_BY_DIR, mmc5633_get_mount_matrix),
+	{ }
+};
+
 #define MMC5633_CHANNEL(_axis) { \
 	.type = IIO_MAGN, \
 	.modified = 1, \
@@ -109,6 +124,7 @@ static int mmc5633_samp_freq[][2] = {
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SAMP_FREQ) | \
 				    BIT(IIO_CHAN_INFO_SCALE), \
+	.ext_info = mmc5633_ext_info, \
 }
 
 static const struct iio_chan_spec mmc5633_channels[] = {
@@ -485,6 +501,10 @@ static int mmc5633_common_probe(struct regmap *regmap, char *name,
 
 	fsleep(MMC5633_POWER_ON_US);
 
+	ret = iio_read_mount_matrix(dev, &data->orientation);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to read mount matrix\n");
+
 	indio_dev->info = &mmc5633_info;
 	indio_dev->name = name;
 	indio_dev->channels = mmc5633_channels;
-- 
2.45.2


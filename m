Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374523;
	b=pd9b0z3iPrS006R8V8/fd/Oy5hDhLrn0vtSXvac9bBzVGLZzKj8XdaXjf2/+FJ73NwiX
	 Ef/4m2jQMBbxAL+v1ojcN7ndCrGTJyeGqM9UjxAHBODbBpXiYEb6J3/ygAY/dNFd/GOC5
	 lNM8zolECFZBd5gQjRrcGANr160IPGRX40Bg+TJdiXjejjhiGum1psZPS7nrrIDOnHDvd
	 CS3jPpMOo1g9VrzEXo08z7tr/zTrmZUvfaW4OhGhpUs/LLvZnyDFeiCoaNWsr6ExwIDbG
	 flqHNW8NLRTtHqtc9DEtZWcUNFz5EvGH9ne6NM7K1BZb55DtjBB8FEvhDONoUEDX2qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dAs1mqfrVrH1ol/B1nRUX6eBBIxpRuHBybsWCr2GDvU=;
	b=5GZdy88ylierUSDKtdFVMBxrRPO5IsfyLzS7aGXW8wSZHuHEY/K7gv7uzTLSwFiITeUd
	 gs+vA/6irOKC785hbTR85jmbNdrueyhHHp+6nPhvSR+DKqNk+4kmXYWzOgeR9gyCxAS5j
	 QtANJnYw7wJgbEMnpxFmTqTNF/eIbbtRVX2hYC0jZ9zYqGMsjSmMl+piyxMIXzTuIQ8x9
	 Y9jybNXTQBO1ddS6PDI+jkSBbhcWpqwzXYHMn1o5mfz5Mciv2qa6965mOOmD5Gy/z2nPr
	 0uIOusNYtoz6zaie36ctam4cBSxAQMP9s1hrJLRHdTBRJpZOKNhRSMMx2ZVR56qKhqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CK8UnIGY;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67F1606A685
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 19:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C67F1606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=CK8UnIGY
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so18939805e9.2
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 11:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795374521; x=1795979321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dAs1mqfrVrH1ol/B1nRUX6eBBIxpRuHBybsWCr2GDvU=;
        b=CK8UnIGY3tyNdi3KsdxWUFgIsuevJezdcxkZ0Tvxgvwb2yGWbic7kemqR3xCy9RriR
         XtDRytV0gxbfFtkO0gju/ZJjOwfQSDSzNwbE2g7oBcO6OD5XDKZY3yENX1kRAqYQp3zA
         IwPRo+10jO3xlCxlC9rJEmKQwVuaa92PQ1YcuJhQgbJ3hEbVn674bfv2Oq/ccAmP7ysu
         KVDQURX/udZ5xXi0EJIg9v9FOWsaYl1Di5oFGsQT3JZxPyVkYIAlhsMQvL7mDeeJQ4a7
         hksPvNghpbg7JVmb/g1u2/amPVy2WQnPV2iGFZmKp/ICzFRez1mEB0M0AqSS8H854Kab
         nQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795374521; x=1795979321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dAs1mqfrVrH1ol/B1nRUX6eBBIxpRuHBybsWCr2GDvU=;
        b=OrHWrolflSPL8vAloF/lUTpKuCj8y/9T5KGD+Ui0Ggaiz1BaKZVfU+Us4HBkli2cVL
         7T7gMMB5147CKt08eNj/ee4lD6mLHukHjMunO0tS8o+1uDqpUuAV7WAxpmFYD8XqkZok
         BzBlc01XbenxCzitThHgTs65wKnadeb6xOyqtqxah4nyIZ8NL+hgQJBBbfZnhvC8VbY3
         PABzXKdiC1hiLgAQFmKtz7s0rpEQDMac4ydekCk6ehzNohVnHNrddnEZvxTXN7ksmD44
         Do9KZCAryAh8cdIFXAFTPcHnjPJw1kMP5GtNi1ge+wVQMxlaFpovMIHOAICjhAeo/EAf
         K5sQ==
X-Forwarded-Encrypted: i=1; AL+hErHx8v0SObMrBChEYa1aBAphEYb+dQFaZf46EDLKjI2fgUxkD4scile4VmnuMk1gafV/TCl/MgKsmK9I@vger.kernel.org
X-Gm-Message-State: APuU4Z8SYi/WI0HFshXmTEfqMItjVV5R7dxG7UR3saXjGpepHiFKfNJB
	VTtot0so5l4dJYCPo+cUpCsWHBtGkxp8ttqvbkndux3EhlGrAFe/eWcvUIHd8V/kvzk=
X-Gm-Gg: AZFdTZeIXnwC6rTZI3kxTA3YmvJZQzqkE1jb+qQf6TGBLM/CPUJ/5HS/B3RzIdrWcwX
	LuEVnOLQHkCsPevCGmTtZcofkiRAx2mvzdcSgItwdpZDe0d7mqAkn5aIlMKOSoqd620PeOSn6Fr
	n6f2mdtkXvf/WP/VRJjQpXl95qFrWgeorFA6yj7idbVhy6EpY17AgjXLa9h+N4M8YPB9Dw5G6Ot
	ybABjETKrerIUQAIoXlZTjg7pak3ZNVxFkaOFvpQ4kZXFXu9v7og7QN7JtyU4nv6G/2cIznmQ9S
	OISpgcIgYghlYusrD8AFagdhygqGzAtt0cxoeaD0vifmzDMTHQpqQrO3Zno3BINV327Ltlt/R4x
	I6isLYmIwEvauahKrzRntrPQ/9jPqP2O+zx0Xd3RFf+QJkTic8Juu752bAUCOkRFUxl0VkkGZAM
	6U22gYXCfV0XhU74o4lIJQY25F/WUzOp2NAoMFg956ZZINhy4E2o0Af7ilbXZt4WyFd4g2DqQjx
	CD16kwTDBUPY0JkWn8GvyTFRtqKphldPgJRvZ5d2ncOOYPBra81yIp21Fu6dgdl82pWCzvg9Nsi
	O/GMKLpNlayzPBOXEw0c8OS0BBzeC85jt8IWwmi9OxcEpY9FFzTs2nVzoiuLCsxqk5Yb7LLCtHU
	Vxcrc/q4N5Hg=
X-Received: by 2002:a05:600d:600b:b0:4a2:167a:c939 with SMTP id 5b1f17b1804b1-4bb88815f1fmr200246095e9.21.1795374521196;
        Sun, 22 Nov 2026 11:08:41 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm103080395e9.3.2026.11.22.11.08.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 11:08:40 -0800 (PST)
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
Subject: [PATCH v2 3/3] iio: magnetometer: mmc5633: Add mount matrix support
Date: Sun, 22 Nov 2026 20:08:36 +0100
Message-ID: <20261122190836.66111-4-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261122190836.66111-1-gerard@teslabs.com>
References: <20261122190836.66111-1-gerard@teslabs.com>
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
index 79015c7984de..f9ecb3737cf6 100644
--- a/drivers/iio/magnetometer/mmc5633.c
+++ b/drivers/iio/magnetometer/mmc5633.c
@@ -83,6 +83,7 @@ struct mmc5633_data {
 	struct regmap *regmap;
 	struct i3c_device *i3cdev;
 	struct mutex mutex; /* protect to finish one whole measurement */
+	struct iio_mount_matrix orientation;
 };
 
 static int mmc5633_samp_freq[][2] = {
@@ -92,6 +93,20 @@ static int mmc5633_samp_freq[][2] = {
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
@@ -100,6 +115,7 @@ static int mmc5633_samp_freq[][2] = {
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SAMP_FREQ) | \
 				    BIT(IIO_CHAN_INFO_SCALE), \
+	.ext_info = mmc5633_ext_info, \
 }
 
 static const struct iio_chan_spec mmc5633_channels[] = {
@@ -480,6 +496,10 @@ static int mmc5633_common_probe(struct regmap *regmap, char *name,
 
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


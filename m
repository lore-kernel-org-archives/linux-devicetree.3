Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463391;
	b=JzWjrXstEh3iWngShpVjafcTsHgNJhltxNfb9NRrNyK3rklWqC5ecsqc/iJ1/qWxoJ/F
	 Aqlc5nYdQVbUTZFmYbsv9YPeWFURl0VPDhMgAgASkXZLZeIlgeSHHvglm0BjstjLXsHMZ
	 P3kgWf3cOXTS/SfrWRBrlD+garYKlmGJFJCxx1vqhN9wZcYLBtPYP50CAABi8/M28dvAU
	 WMdm4RUXImvmO0ahuQ9vNctHNgolu0D0YTyDX21WJrO0YuVtQiHB9getKvM2TMTgJOnud
	 Z3ihoUopgzORZ6dyihd/EgPMuxtGM8rs73DPJJoAO/HkjAbSC/D7mMhB+sLJ7QHk0Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FKRBXLDYVdFCJ4/5gtHKzvLnfTFU8JtXH7QpWXH0Wyg=;
	b=EASfv+ijBtCPw2Of96+SEef/LjYQAFpyi0qMqSTGWjj3d4zgK1nzvaWBXePOE/PhPFVw
	 hdwyxta332DOScuUEAqeGq4oFXrPg0Y9t/jPCkVRa9Cb350Uqm7hFgFV1tTAYngUzULKN
	 1iBZRdGNrLhjlk/FB0ra+FsrvYsbsbQRjwa8pPgTmFN8bokRXB7LKOkn9jH8ym/9Jx4/x
	 AVN/GZG9ORUaafFIDaLZLQ95et4vYZqe57silFq/sxAfCHFSqH/s+aOX2DCSK7tXjz2dR
	 M6kQNEXZW9qYD5GKPrYu0DxxaONlOotgVf7Gs+H5p01XKC9Lvxq4eqSgmxQfXj1OlVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WuKwUk3h;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD32A606A6B8
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 19:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD32A606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WuKwUk3h
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso45758105e9.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 11:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795463389; x=1796068189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FKRBXLDYVdFCJ4/5gtHKzvLnfTFU8JtXH7QpWXH0Wyg=;
        b=WuKwUk3hvyLU1RhLkirm6JV18FNUaB5chi1cvXL3xcm/x00Xuj7MeXyhGTFp8PSmAz
         UxM63nCjqxRmzAdZXdCUeBiko4UXAPeJXhka/n9S9hkzYXEC5OoJ2cNw1HGbe8POjfXG
         kd91ZZ3CAqLUMOeGuTRbq2Rqgya0K7g3sw4mFp85dVXfv6JasJO26RLWYkcQ2wu5gc/Z
         PtSb1j6j5IS+XaXuciyb4IVZaEHpLtctn3/oQc1+m8N8M90wZE8qGsQYWkEIaXIiEZpI
         IZrHBF/fudW01q85Lbg0hj4jRc2uAwRDxRWx041VZVOYYh+tRGctjhOiV+RrQMBILiUJ
         KL8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463389; x=1796068189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FKRBXLDYVdFCJ4/5gtHKzvLnfTFU8JtXH7QpWXH0Wyg=;
        b=cq0hG4cWb3dkfbFmQdxVwDwDDdNQdtTYtE8Bq6Uk2Uv0pYC1QA9ELuGpIC0c5oIvbM
         6OwomohtQsgBRTyjuxh8qi5SUUjyC75fZrdGVOSYI7ziI3/8vR3qVtgK1v9EjkYSu9aX
         4sP6ZTarHMFp4BiOg1Fjt76/eOZPbWtjHuW4zqeTjOVUNRAit58Oh1sARTvG8IEU/8q1
         taW853np2VIpy5nRt88m9Zag2xcQFjDsoC6B4etck3voXJ2ppQv8nMBStS6Rmxqy2EBp
         AsuzJNWwGXH4Rs0yIJsTohSJlKASuZsIdXJe/5ikPyCHE9/zwg6XsgiRpWp8Sxeur4jd
         WDkw==
X-Forwarded-Encrypted: i=1; AL+hErGKDo5/UNo/P1gWw/ct2EqVXeyq5sZcrigyVujgZ70Z9sr2s7Ry8YfChRealtMLFP91k6CFDIpqzw96@vger.kernel.org
X-Gm-Message-State: APuU4Z8A35WzueAvs5inVl2AzV8moqt3q7W2uXYheaK/3lgUnE+XMtgG
	x6sO4MNLzTNTrdyuOucTUOrGknCKzxkpKFatdWowUqo1d+/4YzMcyihm65i4JPrQ6mw=
X-Gm-Gg: AZFdTZcKYu8GhvhpX7NjQETCgx2g1QuN+RESQX6OmxQUrgikgNUKhLhxMIVdBIX4dtQ
	7bXZmbbThKhkPZZcoNsdyeQUawYz6QVazK0i9B2YHdVyXGvB8Dd1IAhzdoJREypYWLyd3IkHnel
	cLcbCQdN6yblOJhIkbKPfEThAAUweK2oM4Xp+PFKINPx1R69dy9g3k7p7Htyz7o+idTlTZg0TQS
	BbUFBTKCdr1nOjoOGWN92mb43AhiPKQxJUczqE2KWqm2Fn26haW8e3NWUUHZdMYnuu9/2T/N+85
	yGhfluZYiJdxBYQpno0iR9diXdMDL4VF9g52Q3RZ//URtlbSMBqXEyEQ6HRS652XyIfjQh1I8JK
	FeBvYV1U4QpTZrPbP8D2APHxfZDEmVclY7gGse4SYOLAS1oWXJ5vH5B4yOHFwujBdBcFMXKaugD
	40vU96iPAGmSHtKsODhA+8FrgSmDV+ySzMa14zlPKb4bOf8zMLVWk4S5Y8Gs2/28VwrsjZVTBJp
	dOWW5h7qvv7eomDNRKsJQNUHcsNllHEyMpfz2r62wq3PRMcl9HDFvkmnBcxYAX4o64YKj72ihcg
	6Av+ad1iVLj/jc88vcTFsTiDha0TDQUILsNyl0t4SM+h1ch3ODi+TikYD8dwzllNwvu+Tg4OFNV
	9tzDkjVKlEJQ=
X-Received: by 2002:a05:600c:5487:b0:4bb:5de1:e92c with SMTP id 5b1f17b1804b1-4bb88813157mr261425675e9.26.1795463389367;
        Mon, 23 Nov 2026 11:49:49 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm300924125e9.2.2026.11.23.11.49.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 11:49:49 -0800 (PST)
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
Subject: [PATCH v3 4/4] iio: magnetometer: mmc5633: Add mount matrix support
Date: Mon, 23 Nov 2026 20:49:43 +0100
Message-ID: <20261123194943.57601-5-gerard@teslabs.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261123194943.57601-1-gerard@teslabs.com>
References: <20261123194943.57601-1-gerard@teslabs.com>
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
index 584ed957e0ac..c92c40665e6d 100644
--- a/drivers/iio/magnetometer/mmc5633.c
+++ b/drivers/iio/magnetometer/mmc5633.c
@@ -85,6 +85,7 @@ struct mmc5633_data {
 	struct regmap *regmap;
 	struct i3c_device *i3cdev;
 	struct mutex mutex; /* protect to finish one whole measurement */
+	struct iio_mount_matrix orientation;
 };
 
 static int mmc5633_samp_freq[][2] = {
@@ -94,6 +95,20 @@ static int mmc5633_samp_freq[][2] = {
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
@@ -102,6 +117,7 @@ static int mmc5633_samp_freq[][2] = {
 	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
 	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SAMP_FREQ) | \
 				    BIT(IIO_CHAN_INFO_SCALE), \
+	.ext_info = mmc5633_ext_info, \
 }
 
 static const struct iio_chan_spec mmc5633_channels[] = {
@@ -482,6 +498,10 @@ static int mmc5633_common_probe(struct regmap *regmap, char *name,
 
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


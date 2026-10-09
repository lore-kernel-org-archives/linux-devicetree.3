Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D21D518152
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 18:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571302; cv=none; b=HNiix+NSCyq/Z7+jClv1UuJPUCf/WSOVdcILde3tgjvU+FfxpqLSd5LHGRDCo+06xScGJYp5vSiEIfF0v5EwaJfaeZqymjZ8oivxELRnbHiLpZIK2jQ+0XE3CA26wWhWj8yNWxB1UaxxUl1lgtqUmNuovAbxS1AQz6FrZIcuZX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571302; c=relaxed/simple;
	bh=m2hW86t73Z61y1E4Qe5OIGQnu8oxYi3FHfoxX/depZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pZFQF3ZsE3wWd4D2OpW0vwi/hNix6P2SNpuRsH+/XmIV63WAQvfZ1IRiSsahVwRtr7P8qSzycA3tSeAwdbNH3l2I6Ejmruqh0dAt2beFnbbEchWI1Y33e6XU3YaPP2ZuVcLQBwa85fiEBUI9al2PoTCGY6eFdM26Xyk9y6ooifQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9gVdX9r; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9gVdX9r"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso1845075e9.1
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 11:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791571294; x=1792176094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tW9nxfGnLz8J5bzFvumGC/5zr3/WbJDa5A5l/9bJW1c=;
        b=V9gVdX9rbLwfx31mTRZ3kya0qU7XR098v7EAGl8PsSteqrN8lbJTlTTRtr+cWgWJwQ
         wnyz+Tzhb5M/AL++Uxfhb8srY9MXOlIQaAr9jNcus6qIkGHM14+F6t3ICT1jN6pkhYNz
         HYuMrH8lspCMrCV8zzilfDSwGtss74Qr3jG3m/SJ8edsNp9feBIoh3jOgyIsTBIXOQNl
         IN6keZGTEBrdqM9WCLeM5W2OZRM84nIsezDWG2icXlDiUvEoKTRsF5gnW04hS1MenWE7
         KhHdFCcA4jCa19k3B9NG+u4pygxecfTJljjop+O6Y3Jw9n14oPoYVTfzthv96NeVQv3K
         awBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571294; x=1792176094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tW9nxfGnLz8J5bzFvumGC/5zr3/WbJDa5A5l/9bJW1c=;
        b=pqwC2FX90DSqDfo9LGh1z2gzg0XtPWDK5vLY8IbuidaQxJihjqKDgpjla824Qh7zzh
         oxhE8+C/kPMNtuqHFyp9eAjw0gAZ3vfVxyAPvcpyZnqNtnYVGDF65xPP2YTmt8T7Q/Rq
         pOKPAUdIPR5eD9VDHV6VghgzSjzDa0RT3cqHyec9c/h10ODVQQbXrKEu0UIR5sZACit7
         VHe5l2ajaHDT7LUsWjNba2eN1Vi3giopIajXczVXmZNionzPSZHB2VD+tcQYAY0OKjhZ
         VwS7mpbysqcBzn38rAew2TSv6HZP7Rz35NwNZWtqnyvc8Wi+fljTXM80gmn4RR/JYuOv
         QSXw==
X-Forwarded-Encrypted: i=1; AKwUvBx/lh0lwPT6Db20dJHhQ9QUHQGOX/jWmt6s00VGIVZ7dcddOBsUoyG9hjsJSnkjf3nSrigGlOOcHq0k@vger.kernel.org
X-Gm-Message-State: AFuF++lhvzHotNmd+2SAdaheVW5gEWHZp3fwYyDU2SiJ0FQ16RwzGQYu
	N1Gpo54DIfPv+AUmR5rxCiTCuYY/M6x0pZfKB8ugs+xx125kHdRav8pB
X-Gm-Gg: AYBFou13cvA7iLpwWcxMaCzcuBu40wHrYbAJTnkY8MYLKcv/LzWqfftBhHqfA8yQR0t
	BDf+TKtzYCChXSwswa0tD31khv4eqKZnThheBSqVjpUgiU51OcVgGGoWxq4UQ7+XdVBgKGegst6
	qUdnbm6CKl02ffCJuv619SPs206EN0K4h6OsH7+rFiVdgTZcFcHQjyO8G9EQFMk8imbKUnHtjVV
	+HyV+ZBud9gf17Tu7Z3DR6qx0zU7MWJozKFKBXqbAlbKMUSCp3i2inUxplRE76gsX5/hHiG+kyI
	GimEG6ugDz1kJzUc9GTxeEUhT/qCRmXsdsy0vzsNNtA2wxisUDhgTkp6SmUqyjPJOIwdvdAxHcw
	dPchC6JT4XiDRdSqA2PEUmkqantItO3GRx+3tqEA1WK+A+uedAXgAAdqlY1xT7bNKGzJ6rQJ+G2
	ITn7mY0f5Yi05QOcVo9CEY3VlJ3ohufkZ3Kd0S7aPWPtCzdHFYudtiOWQUknaKTZxI1habvAGhi
	WEquL7J6vrGVKNTffpFykZNkHUTCaBKF/wCF0F6WFviH1wYcPYWSCw3N8aXusPvN3gZ2AGa3RGF
	2tnrueZjTElyptmyLQ==
X-Received: by 2002:a05:600c:8b74:b0:4a0:2847:b6ee with SMTP id 5b1f17b1804b1-4a18e4fb8c1mr51194335e9.35.1791571294101;
        Fri, 09 Oct 2026 11:41:34 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e93d:161b:5ff8:cb57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4225f4sm91761705e9.0.2026.10.09.11.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:41:33 -0700 (PDT)
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
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 6/8] iio: adc: rzt2h: Prepare for SoCs with different ADC info
Date: Fri,  9 Oct 2026 19:41:20 +0100
Message-ID: <20261009184122.1378797-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261009184122.1378797-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare the driver for RZ/V2H(P) support, where the ADC supports 8-bit and
12-bit conversion modes with channel configurations that differ from
RZ/T2H.

Allow each SoC to provide its own IIO info structure and use the
chip-specific configuration when registering the IIO device.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change
---
 drivers/iio/adc/rzt2h_adc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/rzt2h_adc.c b/drivers/iio/adc/rzt2h_adc.c
index 9f027d524997..041566f3059d 100644
--- a/drivers/iio/adc/rzt2h_adc.c
+++ b/drivers/iio/adc/rzt2h_adc.c
@@ -68,6 +68,7 @@ struct rzt2h_adc;
 struct rzt2h_adc_chip_info {
 	const struct iio_chan_spec *chan_template;
 	int (*sst_to_freq)(struct rzt2h_adc *adc, u8 sst);
+	const struct iio_info *info;
 	unsigned int num_channels;
 	u8 features;
 };
@@ -764,7 +765,7 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 		return ret;
 
 	indio_dev->name = "rzt2h-adc";
-	indio_dev->info = &rzt2h_adc_iio_info;
+	indio_dev->info = chip_info->info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->channels = adc->channels;
 	indio_dev->num_channels = adc->num_channels;
@@ -779,6 +780,7 @@ static int rzt2h_adc_probe(struct platform_device *pdev)
 static const struct rzt2h_adc_chip_info rzt2h_adc_info = {
 	.chan_template = &rzt2h_adc_chan_template,
 	.sst_to_freq = rzt2h_adc_sst_to_freq,
+	.info = &rzt2h_adc_iio_info,
 	.num_channels = 16,
 	.features = RZT2H_ADC_FEATURE_CALIBRATION | RZT2H_ADC_FEATURE_SAMPLE_STATE,
 };
-- 
2.55.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795465584;
	b=Tg8eSAsaSDRGTOHnKb27Ckl3kM1AWUVeqt1mXnta68dF/qnRj6udqqciTsOH0ghcwXot
	 xZ6trmsRm+xVDHjeLKcNTZI1wcQcZ3O3i9pi2eX1LOIm3d5NL3YYD46JPphu+XrKS8+R8
	 D85g7sSSz8ATx5CKLOiKcW+dz9Qwtip2zirfHNvf3PJm6VY6r61nUx3BrcA1KpAKdY7oS
	 PgmKquFq3aSLmv7HMe0nGQkm4nHFPvYa04EJdQTAa7WxlTf+lFN7yBfzNdTCtYufHsHZN
	 Xvyqf/Pqgb2iqCYL9PC1kmt0HybP7Rf5YP74ax95gFgcLckqK9UHxQc24UQeLufe+eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795465584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3oFVVXZVVAH/dGJyLdtEppjG6zTY+6XCUf3lByoDT6c=;
	b=v4F2cSIeE4SVrCnJpdfDUaEhByi0SUNNP0iGwpddsOZ356+ZkWo3B0yYpDwN0C/oYRVj
	 RIN+GD9LuwtrQAVPoGE6SM1dKjhn0r6GMtMJHHTBxVVMfxQwdFhZMJ0jkYXlIDtoGCuLh
	 qfCYc0txo0tg8dJG+SMlF7iU2Bb7WNN1o3EKLQ/bHr+weGm15C6HnBMQfwQHS+aIIqDSk
	 rYyaHTjEuquScqFgLT7OQh/yafToCMZ0khQffGFeOcA0ZYVb3KwHgkWNabvZmxmu5ktHl
	 UAe9WL4NlDiVNoFDiX6nNbiPCJfbmkw30DaHBHt75gvxECJGbxZPWwwvbVie3GWMWGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=teslabs.com;
	spf=fail smtp.mailfrom=teslabs.com;
	dkim=pass header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ei1iu2Fa;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58E5606A691
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 20:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D58E5606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=teslabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=teslabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=teslabs-com.20260707.gappssmtp.com header.i=@teslabs-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Ei1iu2Fa
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso26965075e9.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 12:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=teslabs-com.20260707.gappssmtp.com; s=20260707; t=1795465582; x=1796070382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3oFVVXZVVAH/dGJyLdtEppjG6zTY+6XCUf3lByoDT6c=;
        b=Ei1iu2FawtRxzzGB6bQgwPKaMQeP5zfk3orsA67e6Icah8ewSS5bB/J8bbQi5WGlrg
         5Biy/6uYR8C3yQYgd4RozUTBeJAWLj7QeCDF/eirO5+6r1/hKZUjzCD/mIjtLgUxcFEK
         CglMk+9Yth8FGsUhcFSHQdZT418ak3Hr8sGYDqZSBguH5877udN3J3H/i2k5ouAnC0bI
         b+SgP4DIyWkZGYTjVLs1OGh36abk+kGUxDBAgrGKawr+s+fu6fd5r0zmgMd/miGGewe/
         tEIDXh9WzPQeVw1EcJP9OrkL6seOAAt/rqMtpTuxodgHV3Qm/j5ToAGTzzBgLThSwN/I
         F0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795465582; x=1796070382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3oFVVXZVVAH/dGJyLdtEppjG6zTY+6XCUf3lByoDT6c=;
        b=rZHXqWjF1tcLl7HA88QdrwmAF3EqGkXRLTS7NF/YTOi0+X/C2QnTXPpFVS9OKsKOxq
         0OAbugJiE/AhPazoV/+T7Bq4zsW+HEHsbNh+ybrfHDWom0oPVcD0sA2Y8Gyj7w9MENvK
         dtho4p+k1Wgl5yrUNiJD9wIwBGoCQ85/Vc+QyrJFPYA6OmfvdKNh+OTVGXZffQgxjUNN
         2u6bMpEUE89/lcaW63aifOeOm/n6g+cE2T60r47QqhWx+BcB03HPvGsbid35qTSRIeDZ
         I0nxP5r2hpHaO4I5rjmEWLjewJl/iSvi0P5pd5+cRPgDHhbE2IrsN3ncJCfx9NtxpUPT
         ZDMA==
X-Forwarded-Encrypted: i=1; AL+hErEnBIO5CbUYxXWzLceKcIMqQqJXSVY3xjRp6L0/qN8f9xXkgV2ffiiaJE90VL0VwEGbbl8dbt41wSxE@vger.kernel.org
X-Gm-Message-State: APuU4Z9pEGkxTqJd3TSH6FHf1cxMeZiiJE0EoH7cWJyn/wexfkEC6DgO
	V2U2cFRrhSG/p3jKNJI6vPBW/Yt3fGka+0anbGkDVJZdWlmDqksPgCIVwIlWXEGlvZE=
X-Gm-Gg: AZFdTZc6q8x5RruplGzQki5OelG4KtU3COzCtzL14Hevy71UaaCXh6QFf6zeSHZGI71
	yjFNOTA4K0HKCidT/p2KwCrfpEUPQy8vJ3GCHhJTCDj7lMyH/ORyWGm4zFmsATFKxOu+Z7MAEch
	Zmbmg5kBV6/Am6ND6NmI9U19mMSZyeHobuMm2blctcgiYmd8+b/HR2IlzEJkUaQSApDD723bEfC
	b18mU+DFdUGrqU9xqXO+LW7jB5XG+mUheXzYQprOP/VXdOmAS38Xef1QI2UymxAJhXuNkM4oL4y
	54MMJQ0XRzrO3hhW009Y0TIklOovV4p0vouXPyjoAp/VFurow+gj8vErNjm1mBE/5WeQhCmSTMA
	WWr4fKWvZd+qFAywpfLVNRrg26hWlzt67cCnpA6vgpl4ZqOdCDL/h1SW0GijrYHDutEIA70g6/r
	xlL7pjbVKBZgfZ/vhd4ZxNvmyxOueKqe4audkiDHEJC4MzX9ZpjA2ZAbLdsShQaM0JWnEfi8OHX
	EU8P697/oscCBTOKEOgqTi7tt4/hheCzj5sQuItpbyNpvF1io5GSokvTCd6N9/gbr+AL/sBhz8K
	yIpbUtxG0PyTt1vXWRJ0pdFfXbynyS/O85qBYR2xBkitFI7nPxRSGO6IJgacaiCYFKrzQQAxo9U
	U4R22DSSiPQU=
X-Received: by 2002:a05:600c:1547:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb8880974amr290934055e9.8.1795465582225;
        Mon, 23 Nov 2026 12:26:22 -0800 (PST)
Received: from localhost.localdomain ([139.47.121.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3c4dsm20108713f8f.46.2026.11.23.12.26.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 12:26:21 -0800 (PST)
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
Subject: [PATCH v4 3/4] iio: magnetometer: mmc5633: Enable the VDD supply
Date: Mon, 23 Nov 2026 21:26:14 +0100
Message-ID: <20261123202616.17334-4-gerard@teslabs.com>
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

Boards may switch the supply of the sensor, so get and enable it before
initialising the chip, and wait the 5 ms both parts need after VDD is
valid before they can be operated.

Signed-off-by: Gerard Marull-Paretas <gerard@teslabs.com>
---
 drivers/iio/magnetometer/mmc5633.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iio/magnetometer/mmc5633.c b/drivers/iio/magnetometer/mmc5633.c
index 92a09316ccdc..316b431477dd 100644
--- a/drivers/iio/magnetometer/mmc5633.c
+++ b/drivers/iio/magnetometer/mmc5633.c
@@ -27,6 +27,7 @@
 #include <linux/mutex.h>
 #include <linux/pm.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <linux/time.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
@@ -69,6 +70,11 @@
  * Operating Timing Diagram section.
  */
 #define MMC5633_WAIT_SET_RESET_US	(1 * USEC_PER_MSEC)
+/*
+ * tOp, time to operate the device after VDD is valid, per the same datasheet
+ * pages as tSR above.
+ */
+#define MMC5633_POWER_ON_US		(5 * USEC_PER_MSEC)
 
 #define MMC5633_HDR_CTRL0_MEAS_M	0x01
 #define MMC5633_HDR_CTRL0_MEAS_T	0x03
@@ -473,6 +479,12 @@ static int mmc5633_common_probe(struct regmap *regmap, char *name,
 	if (ret)
 		return ret;
 
+	ret = devm_regulator_get_enable(dev, "vdd");
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to enable VDD regulator\n");
+
+	fsleep(MMC5633_POWER_ON_US);
+
 	indio_dev->info = &mmc5633_info;
 	indio_dev->name = name;
 	indio_dev->channels = mmc5633_channels;
-- 
2.45.2


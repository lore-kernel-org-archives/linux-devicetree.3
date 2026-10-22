Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690494;
	b=FtsP/+UE3/u4+lm6xJVqg5jpEoQjlqWCqiwq65kz2ffXnRIMHz/RrBG0x+yrLhOkGDlh
	 gNEQLbOaxItgx701Br+RO4CCiOGcirCnwOu6iVOmE+f0kG6yrt/QcMHL+WOHg5lwo9BJ8
	 WSZAmT4JtYvtIUnzItWU9xcyno7Y5w+jzYC4V5didewCoYPFTKko9Petpp5XPgk7Cl18q
	 AXQ2eYP8JjJBaf+osXXuXgivk4cvVB/yrUoTc5AYmAv0v66kyn9NgiOaSPhpxZ0ZoFdwO
	 QVFhwJEhZbMqD/KW2rGVWmgjQfJ6MmOB8irvmuZ45m+kEwfGt0muUx3356aL3LycA4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Dm3Iqmw5Hh7puhN5qtgLJL8Ms/kK/NEm7YUHOhJMh/0=;
	b=Sq3J7DHgcNjOh1+OAfH5uCC/5crCHRLyWolcJXJL7N1U8NMFKGi2CTvkABeeqVQ6GaQy
	 yvC8R9mryCIHUmc8SkPva1oQG6VkDincsXUKdMcHhhzr+T47wuHmmTFr1rr5mCjoVbFnU
	 arDV8cO1Wz7JqH4I6yicW3rSTMcOVVdp/7fzODbFkN4F/vQ8F7wOyGrKxDv/psRJwg1CR
	 o0hY5k3gZYpOmUdqhqNGqvvndV39qgvYjZhOsmCPLqdJ4bIiHMvvKdRtfM2saP9LjvbNC
	 2vEHCw5QFFVMor8/yelRa102jir2iluFqKR9oB9rqPX8ZbEc3Ft4inx8F+xpYAwO4IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=g0O7zin1;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDD660A5BE1
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EDD660A5BE1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=g0O7zin1
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df8fe8513so66132f8f.0
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690487; x=1793295287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dm3Iqmw5Hh7puhN5qtgLJL8Ms/kK/NEm7YUHOhJMh/0=;
        b=g0O7zin1c1AmzSb+uzTOeh3Izi0txptvBW+YXTHxw/OLVLyXnwQSKaDpWxdS2fL7Bb
         l9h1DYSoQOkrfBD3ZqLrwQukIMsxohB/YTYryLPxaNLqHWs4TupcrpdJND/z9ULqESAX
         EM1CKJAJQcevgk4HKqQvk9NpimB5mlh/lkEqplAfOsb8wB1GtzWSLbFX78xa5zA8Tsn3
         huTn5POonZ65lwRmfQ3mc4W73kVIPGYl39bU4ge1FVqC+QkuF6HUApeNwtA5CkOfaCbH
         sH0UHGGm+N2zQMNJhSg4vcEcDfKx92TXJt+yvqnT+mOg1r8U2rLLmqzqZIXm2N6leFy5
         OTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690487; x=1793295287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dm3Iqmw5Hh7puhN5qtgLJL8Ms/kK/NEm7YUHOhJMh/0=;
        b=vXrV6IzXWY1Kwt37FfWMJPh8yVHOtV6T3JcIes2Cy8LeG/jlY4DoZT9jkuXuDzPq8Q
         AZNhghbONLI/SOTsVaW17erv0Yy5OiRMJhlywHwc5XCmELzymlmbGIjqyEaRr3nLbedd
         MGuTW9YzuwzGxCTKhtdDvROYKMdMCm5gG9ctQXJtG7uHO4Mi9m79HWWsfbD6z2xww5HS
         tY8s2XQ8gQJCTjarARtM5FL+/0zqsDqMcIDvP44aTh9LA1+lW0XTpSTOVbKVd64GsqQu
         VOvCeZJXBGzf9Jh73QkPAKA0GIo1blD/CdtUrcvjO1PRt7f1LYQkrrL7jPOY0vlYjpdv
         wxZw==
X-Forwarded-Encrypted: i=1; AKwUvBwMPVKFEijZj7YWOGkP8jOMYUCTRJj3OH7Pb/X3hryqsU6ZoIeNF3t0uXA5Kl4xsN5XIYt4EsIBgUDz@vger.kernel.org
X-Gm-Message-State: AFq9FYLLFDQpnJRTqS7OsWm6RmOlvkK++NHoeajUQdoalU3zvRl9KGlU
	uEKqUxxwJ6yJla2nhi6TrqpkKddDJi7xHhv6bOwSwlLxNbF86v0FmamFWqO2bmxMeos=
X-Gm-Gg: AYBFou30sBscb8nN4ghhbR6DFgvWQtW3ELNSlup82kjiYI4c7ttbhd+s/R7AUw/V45G
	QbRCQ4gMZvT+eH9fdkMrj1OESsW5XaO9LPAY04KwAd92GMRhUunRdghCTz/HcjglRzQDr/iERoe
	r/+4PaJoSGjqpCzjY6VME9Q2zV3UJCvzuBvbaPimHXraGal6/C61biVn8ihnoOub9mqZ2I0xZXV
	ZitkbsKJVwk0mrNjohO3oJgYgMrtGdIxJifrLDrthP8rtONESBFQp1edST453+xNC5IsCZoYptB
	NjUklUQrk1+/mFNQMd+OtGr0aGZAip7dwIaF918J+4Cgr4+61LVO6HCzM25S/V7o4YzYNZNmleg
	eTi0Aj5YEUHscARRwLPQFJ3HDOSVxqb7BLEftP+V9TGwx58AjAON7d/i6eq+QiBD36lMaelxCyW
	ZWAgN0ICLnRpt6Z02lvKS5oyjMnVZApUj/q1v9XbCCwBC3nWo1l67KezFQ/hZ3CcJklGwUeIRRj
	V+9/CeGsEOwM0OOQsZ9aE7FrA1zxRGccO5/wwx8TdOdZvIWaLUG2Z7VVfDRfDvwwQ80DNPAe/Jp
	G/f+8GzyqnxclxU+W9L5OP6SsjSB07E=
X-Received: by 2002:a5d:5e8b:0:b0:48e:e98:8b6a with SMTP id ffacd0b85a97d-48e2643106dmr13216999f8f.4.1792690486817;
        Thu, 22 Oct 2026 10:34:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:45 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:10 +0100
Subject: [PATCH v6 17/18] media: sony-starvis2: Add support for IMX585
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-media-starvis2-v6-17-374343f55fd3@raspberrypi.com>
References: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
In-Reply-To: <20261022-media-starvis2-v6-0-374343f55fd3@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

IMX585 is an 8MPix Starvis 2 sensor, so add support for it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 307 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 307 insertions(+)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index b526ea3ce2e4..5c407211edc8 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -14,6 +14,8 @@
  *         pixels.
  * IMX832: Diagonal 6.45mm (Type 1/2.8) CMOS image sensor with 2.12 M effective
  *         pixels.
+ * IMX585: Diagonal 12.84 mm (Type 1/1.2) CMOS image sensor with 8.40 M effective
+ *         pixels.
  *
  * Copyright (C) 2026 Ideas On Board Oy.
  * Copyright (C) 2026 Raspberry Pi
@@ -1096,6 +1098,288 @@ static const struct starvis2_variant imx832_variant_def = {
 	.shr_min = 4,
 };
 
+static const struct cci_reg_sequence imx585_common_regs[] = {
+	{ STARVIS2_REG_THIN_V_EN, 0x00 },
+	{ STARVIS2_REG_VCMODE, 0x01 },
+	{ CCI_REG8(0x306b), 0x00 },
+	{ STARVIS2_REG_GAIN_PGC_FIDMD, 0x01 },
+
+	{ CCI_REG8(0x3460), 0x21 },
+	{ CCI_REG8(0x3478), 0xa1 },
+	{ CCI_REG8(0x347c), 0x01 },
+	{ CCI_REG8(0x3480), 0x01 },
+	{ CCI_REG8(0x3930), 0x0c },
+	{ CCI_REG8(0x3931), 0x01 },
+	{ CCI_REG8(0x3a4c), 0x39 },
+	{ CCI_REG8(0x3a4d), 0x01 },
+	{ CCI_REG8(0x3a4e), 0x14 },
+	{ CCI_REG8(0x3a50), 0x48 },
+	{ CCI_REG8(0x3a51), 0x01 },
+	{ CCI_REG8(0x3a52), 0x14 },
+	{ CCI_REG8(0x3a56), 0x00 },
+	{ CCI_REG8(0x3a5a), 0x00 },
+	{ CCI_REG8(0x3a5e), 0x00 },
+	{ CCI_REG8(0x3a62), 0x00 },
+	{ CCI_REG8(0x3a6a), 0x20 },
+	{ CCI_REG8(0x3a6c), 0x42 },
+	{ CCI_REG8(0x3a6e), 0xa0 },
+	{ CCI_REG8(0x3b2c), 0x0c },
+	{ CCI_REG8(0x3b30), 0x1c },
+	{ CCI_REG8(0x3b34), 0x0c },
+	{ CCI_REG8(0x3b38), 0x1c },
+	{ CCI_REG8(0x3ba0), 0x0c },
+	{ CCI_REG8(0x3ba4), 0x1c },
+	{ CCI_REG8(0x3ba8), 0x0c },
+	{ CCI_REG8(0x3bac), 0x1c },
+	{ CCI_REG8(0x3d3c), 0x11 },
+	{ CCI_REG8(0x3d46), 0x0b },
+	{ CCI_REG8(0x3de0), 0x3f },
+	{ CCI_REG8(0x3de1), 0x08 },
+	{ CCI_REG8(0x3e10), 0x10 },
+	{ CCI_REG8(0x3e14), 0x87 },
+	{ CCI_REG8(0x3e16), 0x91 },
+	{ CCI_REG8(0x3e18), 0x91 },
+	{ CCI_REG8(0x3e1a), 0x87 },
+	{ CCI_REG8(0x3e1c), 0x78 },
+	{ CCI_REG8(0x3e1e), 0x50 },
+	{ CCI_REG8(0x3e20), 0x50 },
+	{ CCI_REG8(0x3e22), 0x50 },
+	{ CCI_REG8(0x3e24), 0x87 },
+	{ CCI_REG8(0x3e26), 0x91 },
+	{ CCI_REG8(0x3e28), 0x91 },
+	{ CCI_REG8(0x3e2a), 0x87 },
+	{ CCI_REG8(0x3e2c), 0x78 },
+	{ CCI_REG8(0x3e2e), 0x50 },
+	{ CCI_REG8(0x3e30), 0x50 },
+	{ CCI_REG8(0x3e32), 0x50 },
+	{ CCI_REG8(0x3e34), 0x87 },
+	{ CCI_REG8(0x3e36), 0x91 },
+	{ CCI_REG8(0x3e38), 0x91 },
+	{ CCI_REG8(0x3e3a), 0x87 },
+	{ CCI_REG8(0x3e3c), 0x78 },
+	{ CCI_REG8(0x3e3e), 0x50 },
+	{ CCI_REG8(0x3e40), 0x50 },
+	{ CCI_REG8(0x3e42), 0x50 },
+	{ CCI_REG8(0x4054), 0x64 },
+	{ CCI_REG8(0x4148), 0xfe },
+	{ CCI_REG8(0x4149), 0x05 },
+	{ CCI_REG8(0x414a), 0xff },
+	{ CCI_REG8(0x414b), 0x05 },
+	{ CCI_REG8(0x420a), 0x03 },
+	{ CCI_REG8(0x4231), 0x08 },
+	{ CCI_REG8(0x423d), 0x9c },
+	{ CCI_REG8(0x4242), 0xb4 },
+	{ CCI_REG8(0x4246), 0xb4 },
+	{ CCI_REG8(0x424e), 0xb4 },
+	{ CCI_REG8(0x425c), 0xb4 },
+	{ CCI_REG8(0x425e), 0xb6 },
+	{ CCI_REG8(0x426c), 0xb4 },
+	{ CCI_REG8(0x426e), 0xb6 },
+	{ CCI_REG8(0x428c), 0xb4 },
+	{ CCI_REG8(0x428e), 0xb6 },
+	{ CCI_REG8(0x4708), 0x00 },
+	{ CCI_REG8(0x4709), 0x00 },
+	{ CCI_REG8(0x470a), 0xff },
+	{ CCI_REG8(0x470b), 0x03 },
+	{ CCI_REG8(0x470c), 0x00 },
+	{ CCI_REG8(0x470d), 0x00 },
+	{ CCI_REG8(0x470e), 0xff },
+	{ CCI_REG8(0x470f), 0x03 },
+	{ CCI_REG8(0x47eb), 0x1c },
+	{ CCI_REG8(0x47f0), 0xa6 },
+	{ CCI_REG8(0x47f2), 0xa6 },
+	{ CCI_REG8(0x47f4), 0xa0 },
+	{ CCI_REG8(0x47f6), 0x96 },
+	{ CCI_REG8(0x4808), 0xa6 },
+	{ CCI_REG8(0x480a), 0xa6 },
+	{ CCI_REG8(0x480c), 0xa0 },
+	{ CCI_REG8(0x480e), 0x96 },
+	{ CCI_REG8(0x492c), 0xb2 },
+	{ CCI_REG8(0x4930), 0x03 },
+	{ CCI_REG8(0x4932), 0x03 },
+	{ CCI_REG8(0x4936), 0x5b },
+	{ CCI_REG8(0x4938), 0x82 },
+	{ CCI_REG8(0x493c), 0x23 },
+	{ CCI_REG8(0x493e), 0x23 },
+	{ CCI_REG8(0x4940), 0x23 },
+	{ CCI_REG8(0x4ba8), 0x1c },
+	{ CCI_REG8(0x4ba9), 0x03 },
+	{ CCI_REG8(0x4bac), 0x1c },
+	{ CCI_REG8(0x4bad), 0x1c },
+	{ CCI_REG8(0x4bae), 0x1c },
+	{ CCI_REG8(0x4baf), 0x1c },
+	{ CCI_REG8(0x4bb0), 0x1c },
+	{ CCI_REG8(0x4bb1), 0x1c },
+	{ CCI_REG8(0x4bb2), 0x1c },
+	{ CCI_REG8(0x4bb3), 0x1c },
+	{ CCI_REG8(0x4bb4), 0x1c },
+	{ CCI_REG8(0x4bb8), 0x03 },
+	{ CCI_REG8(0x4bb9), 0x03 },
+	{ CCI_REG8(0x4bba), 0x03 },
+	{ CCI_REG8(0x4bbb), 0x03 },
+	{ CCI_REG8(0x4bbc), 0x03 },
+	{ CCI_REG8(0x4bbd), 0x03 },
+	{ CCI_REG8(0x4bbe), 0x03 },
+	{ CCI_REG8(0x4bbf), 0x03 },
+	{ CCI_REG8(0x4bc0), 0x03 },
+	{ CCI_REG8(0x4c14), 0x87 },
+	{ CCI_REG8(0x4c16), 0x91 },
+	{ CCI_REG8(0x4c18), 0x91 },
+	{ CCI_REG8(0x4c1a), 0x87 },
+	{ CCI_REG8(0x4c1c), 0x78 },
+	{ CCI_REG8(0x4c1e), 0x50 },
+	{ CCI_REG8(0x4c20), 0x50 },
+	{ CCI_REG8(0x4c22), 0x50 },
+	{ CCI_REG8(0x4c24), 0x87 },
+	{ CCI_REG8(0x4c26), 0x91 },
+	{ CCI_REG8(0x4c28), 0x91 },
+	{ CCI_REG8(0x4c2a), 0x87 },
+	{ CCI_REG8(0x4c2c), 0x78 },
+	{ CCI_REG8(0x4c2e), 0x50 },
+	{ CCI_REG8(0x4c30), 0x50 },
+	{ CCI_REG8(0x4c32), 0x50 },
+	{ CCI_REG8(0x4c34), 0x87 },
+	{ CCI_REG8(0x4c36), 0x91 },
+	{ CCI_REG8(0x4c38), 0x91 },
+	{ CCI_REG8(0x4c3a), 0x87 },
+	{ CCI_REG8(0x4c3c), 0x78 },
+	{ CCI_REG8(0x4c3e), 0x50 },
+	{ CCI_REG8(0x4c40), 0x50 },
+	{ CCI_REG8(0x4c42), 0x50 },
+	{ CCI_REG8(0x4d12), 0x1f },
+	{ CCI_REG8(0x4d13), 0x1e },
+	{ CCI_REG8(0x4d26), 0x33 },
+	{ CCI_REG8(0x4e0e), 0x59 },
+	{ CCI_REG8(0x4e14), 0x55 },
+	{ CCI_REG8(0x4e16), 0x59 },
+	{ CCI_REG8(0x4e1e), 0x3b },
+	{ CCI_REG8(0x4e20), 0x47 },
+	{ CCI_REG8(0x4e22), 0x54 },
+	{ CCI_REG8(0x4e26), 0x81 },
+	{ CCI_REG8(0x4e2c), 0x7d },
+	{ CCI_REG8(0x4e2e), 0x81 },
+	{ CCI_REG8(0x4e36), 0x63 },
+	{ CCI_REG8(0x4e38), 0x6f },
+	{ CCI_REG8(0x4e3a), 0x7c },
+	{ CCI_REG8(0x4f3a), 0x3c },
+	{ CCI_REG8(0x4f3c), 0x46 },
+	{ CCI_REG8(0x4f3e), 0x59 },
+	{ CCI_REG8(0x4f42), 0x64 },
+	{ CCI_REG8(0x4f44), 0x6e },
+	{ CCI_REG8(0x4f46), 0x81 },
+	{ CCI_REG8(0x4f4a), 0x82 },
+	{ CCI_REG8(0x4f5a), 0x81 },
+	{ CCI_REG8(0x4f62), 0xaa },
+	{ CCI_REG8(0x4f72), 0xa9 },
+	{ CCI_REG8(0x4f78), 0x36 },
+	{ CCI_REG8(0x4f7a), 0x41 },
+	{ CCI_REG8(0x4f7c), 0x61 },
+	{ CCI_REG8(0x4f7d), 0x01 },
+	{ CCI_REG8(0x4f7e), 0x7c },
+	{ CCI_REG8(0x4f7f), 0x01 },
+	{ CCI_REG8(0x4f80), 0x77 },
+	{ CCI_REG8(0x4f82), 0x7b },
+	{ CCI_REG8(0x4f88), 0x37 },
+	{ CCI_REG8(0x4f8a), 0x40 },
+	{ CCI_REG8(0x4f8c), 0x62 },
+	{ CCI_REG8(0x4f8d), 0x01 },
+	{ CCI_REG8(0x4f8e), 0x76 },
+	{ CCI_REG8(0x4f8f), 0x01 },
+	{ CCI_REG8(0x4f90), 0x5e },
+	{ CCI_REG8(0x4f91), 0x02 },
+	{ CCI_REG8(0x4f92), 0x69 },
+	{ CCI_REG8(0x4f93), 0x02 },
+	{ CCI_REG8(0x4f94), 0x89 },
+	{ CCI_REG8(0x4f95), 0x02 },
+	{ CCI_REG8(0x4f96), 0xa4 },
+	{ CCI_REG8(0x4f97), 0x02 },
+	{ CCI_REG8(0x4f98), 0x9f },
+	{ CCI_REG8(0x4f99), 0x02 },
+	{ CCI_REG8(0x4f9a), 0xa3 },
+	{ CCI_REG8(0x4f9b), 0x02 },
+	{ CCI_REG8(0x4fa0), 0x5f },
+	{ CCI_REG8(0x4fa1), 0x02 },
+	{ CCI_REG8(0x4fa2), 0x68 },
+	{ CCI_REG8(0x4fa3), 0x02 },
+	{ CCI_REG8(0x4fa4), 0x8a },
+	{ CCI_REG8(0x4fa5), 0x02 },
+	{ CCI_REG8(0x4fa6), 0x9e },
+	{ CCI_REG8(0x4fa7), 0x02 },
+	{ CCI_REG8(0x519e), 0x79 },
+	{ CCI_REG8(0x51a6), 0xa1 },
+	{ CCI_REG8(0x51f0), 0xac },
+	{ CCI_REG8(0x51f2), 0xaa },
+	{ CCI_REG8(0x51f4), 0xa5 },
+	{ CCI_REG8(0x51f6), 0xa0 },
+	{ CCI_REG8(0x5200), 0x9b },
+	{ CCI_REG8(0x5202), 0x91 },
+	{ CCI_REG8(0x5204), 0x87 },
+	{ CCI_REG8(0x5206), 0x82 },
+	{ CCI_REG8(0x5208), 0xac },
+	{ CCI_REG8(0x520a), 0xaa },
+	{ CCI_REG8(0x520c), 0xa5 },
+	{ CCI_REG8(0x520e), 0xa0 },
+	{ CCI_REG8(0x5210), 0x9b },
+	{ CCI_REG8(0x5212), 0x91 },
+	{ CCI_REG8(0x5214), 0x87 },
+	{ CCI_REG8(0x5216), 0x82 },
+	{ CCI_REG8(0x5218), 0xac },
+	{ CCI_REG8(0x521a), 0xaa },
+	{ CCI_REG8(0x521c), 0xa5 },
+	{ CCI_REG8(0x521e), 0xa0 },
+	{ CCI_REG8(0x5220), 0x9b },
+	{ CCI_REG8(0x5222), 0x91 },
+	{ CCI_REG8(0x5224), 0x87 },
+	{ CCI_REG8(0x5226), 0x82 },
+	{ CCI_REG8(0x5b3c), 0x07 },
+
+	{ STARVIS2_REG_WDMODE, 0x00 },
+	{ STARVIS2_REG_MDBIT, 0x01 },
+	{ STARVIS2_REG_XXS_DRV, 0x00 },
+};
+
+static const u16 imx585_min_hmax_2lane[] = {
+	[STARVIS2_LINK_FREQ_297MHZ] = 2984,
+	[STARVIS2_LINK_FREQ_360MHZ] = 2464,
+	[STARVIS2_LINK_FREQ_445MHZ] = 2004,
+	[STARVIS2_LINK_FREQ_594MHZ] = 1512,
+	[STARVIS2_LINK_FREQ_720MHZ] = 1260,
+	[STARVIS2_LINK_FREQ_891MHZ] = 996,
+	[STARVIS2_LINK_FREQ_1039MHZ] = 856,
+	[STARVIS2_LINK_FREQ_1188MHZ] = 856,
+};
+
+static const struct starvis2_variant imx585_variant_def = {
+	.name = "imx585",
+	.id_reg = CCI_REG16_LE(0x5a1d),
+	.id_mask = 0x3ff,
+	.id_value = 0x259,
+	.interface_sel_reg = CCI_REG8(0x5b3c),
+	.mono_id_reg = CCI_REG8(0x5a18),
+	.native_area = {
+		.top = 0,
+		.left = 0,
+		.width = 3857,
+		.height = 2201,
+	},
+	.active_area = {
+		.top = 20,
+		.left = 0,
+		.width = 3856,
+		.height = 2180,
+	},
+	.pixel_rate = 594000000,
+	.pix_per_clk = 8,
+	.common_regs = imx585_common_regs,
+	.num_common_regs = ARRAY_SIZE(imx585_common_regs),
+	.vmax_default = 2250,
+	.hmax_min_link_freq = imx585_min_hmax_2lane,
+	.hmax_min_pixel_array = 550,
+	.exposure_min = 2,
+	.exposure_step = 2,
+	.shr_min = 8,
+};
+
 struct starvis2_model_info {
 	enum starvis2_type type;
 	const u32 *codes;
@@ -1186,6 +1470,26 @@ static const struct starvis2_model_info imx832_autodetect_info = {
 	.auto_detect_mono = &imx832_amr_info,
 };
 
+static const struct starvis2_model_info imx585_aaqj_info = {
+	.type = STARVIS2_COLOR,
+	.codes = codes_bayer,
+	.num_codes = ARRAY_SIZE(codes_bayer),
+	.variant = &imx585_variant_def,
+};
+
+static const struct starvis2_model_info imx585_aamj_info = {
+	.type = STARVIS2_MONOCHROME,
+	.codes = codes_monochrome,
+	.num_codes = ARRAY_SIZE(codes_monochrome),
+	.variant = &imx585_variant_def,
+};
+
+static const struct starvis2_model_info imx585_autodetect_info = {
+	.variant = &imx585_variant_def,
+	.auto_detect_colour = &imx585_aaqj_info,
+	.auto_detect_mono = &imx585_aamj_info,
+};
+
 static const char * const starvis2_supply_name[] = {
 	"avdd",  /* Analog (3.3V) supply */
 	"dvdd",  /* Digital Core (1.1V) supply */
@@ -2025,6 +2329,8 @@ static const struct dev_pm_ops starvis2_pm_ops = {
 };
 
 static const struct of_device_id starvis2_of_match[] = {
+	{ .compatible = "sony,imx585-aamj", .data = &imx585_aamj_info },
+	{ .compatible = "sony,imx585-aaqj", .data = &imx585_aaqj_info },
 	{ .compatible = "sony,imx662-aamr", .data = &imx662_aamr_info },
 	{ .compatible = "sony,imx662-aaqr", .data = &imx662_aaqr_info },
 	{ .compatible = "sony,imx675-aamr", .data = &imx675_aamr_info },
@@ -2034,6 +2340,7 @@ static const struct of_device_id starvis2_of_match[] = {
 	{ .compatible = "sony,imx832-amr", .data = &imx832_amr_info },
 	{ .compatible = "sony,imx832-aqr", .data = &imx832_aqr_info },
 	/* for non-conforming DTs that rely on runtime check */
+	{ .compatible = "sony,imx585", .data = &imx585_autodetect_info },
 	{ .compatible = "sony,imx662", .data = &imx662_autodetect_info },
 	{ .compatible = "sony,imx675", .data = &imx675_autodetect_info },
 	{ .compatible = "sony,imx678", .data = &imx678_autodetect_info },

-- 
2.34.1


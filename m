Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690477;
	b=QYci99Kdgxd2sC4PioIgWHZs9Mj221HdKIjptpo7j/90lHMx5XS8EezVvgXeK1Vmaiqu
	 5jciG/7iotSU5RD4l33jQNKYZwDHaabO5mi8WxkAyw+2Hymwsb3SA5CbY9O3qhiONKyM1
	 3z7RMSzufjyqwcswmxjk0sEnl3qYb51fjzUlENugmdImOMOP/IR4RI9tHftw6E0bqfIRK
	 PGuBxbjeyIaZ6ciHfdQO4UDoS4O1GaGO51B4YvQkSwj+vR/GeaXve1bn3m6qRlNo0J9iN
	 TC06Xw3nB57aBhEZFo9WXBJhLFBoQn1cmhxsEbg1kYrHbIkyzAZlUabSzXyFrgf04TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tHlWMfT2Vn1jhxwuk47U/QSe3Sx/Rh/6scTTXAvnAJ4=;
	b=uP2L3tVe4fEuynGMxnPgtNOSK2gN6TLpOskNKxihdIzEl/1mYwukjIBdwd/nXxLNUFAl
	 sgEYtBPcjAuUQS3uuzoiJ3mgLLP2QNIWHu93VoN6I/Y3FecPNcrHrQZwhCF21aLUC/bXF
	 3/dukw/fmmxCwZyC0SjQr70JVjloiMniy6Z9BVIuk1t/wuLZalfM/jpCq+a/pfIHFWjKp
	 ixGwICAW7qVjoGBvk21pC7X5lJdW6DF2qV72EQL0XvOU3psNDFEGqMPEaLx9amRh5lYUK
	 0pIlYcwUFPWGZeOt5cNtGJuNvvjfnaUs3ayrU6vjuqRInrwK+wuSooIb85CgLHiGHWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=Hz8jK3d+;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB12D606A319
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB12D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=Hz8jK3d+
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d05d51553so515735e9.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690475; x=1793295275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHlWMfT2Vn1jhxwuk47U/QSe3Sx/Rh/6scTTXAvnAJ4=;
        b=Hz8jK3d+/7oEwRtXqRZMtdhfq7MFY8o/ekyuqOcEE7muK94sJhmnUcxBQ9dqOPU+kw
         lPKv5D53LnTlvPmLXFiFsew4Hl0ljGdeGGbMx/TNOpkDTVmG6646/pNjjfcR5grueRKR
         fZRfj71/1PdrbVJyKenanHLh2JbKLWIOIOQQs0ADAdXsgkUGG1hQ+KW5J++cFTAWziVr
         5DXgKELTQY7RKM5EX7Wrw/bj6Y47fkcFTd1TWYBM15JIkYoEoCQS6PaPwvFIgq4FnysS
         y2GErTSI37mqIeqF2j2TS2Vq4k6aA+SxBdZtKLrxde/ujHMkkMoIsaoNwZedrraMGDHq
         9rgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690475; x=1793295275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHlWMfT2Vn1jhxwuk47U/QSe3Sx/Rh/6scTTXAvnAJ4=;
        b=l4sF7ow6wiqC0jxgZHgiyQe6JY9RpfmFgE91AjXlaYuVcEV0KSH4gqGFF0E1ct1aaF
         KT3XaWAMWcBUH6c00Jlkv+Er2xXlQ1DJs40TwN3BMdd8sgylzbHYFDmiMfJ5dkGfo6Or
         khrimCwfrsul+5fh9YohdOtJ4LoQG3mvAMtQPeSop5O9fX47PN9XXSDnZoc4aCGYW1CE
         xvahjNtKZ6RLNFxQJIF/hcIIyiPvMAR1zxWef6DyfRUtAYAAhcIVy2kIua7Ti3ppTa5p
         VXKnNVitnao/9gQEo0kMPhqxAFiMDOW9/6dtXM1PxPyBrRrzCZJuMBQVOzZKpDLFxGTl
         B1gw==
X-Forwarded-Encrypted: i=1; AKwUvBzthagxBlisHgUfPEhXyKGL9zQn5avX3IU4AjlmSdNRBPM6zYCiwcMZvqgi+eFFHwpoCL07XMIOiM53@vger.kernel.org
X-Gm-Message-State: AFq9FYJANEa4IJ3hdd6wsiutIoavA5xf3/WyiMqzd30gOBXx8tVC7sFK
	mDY0cV7qLojV5tSf4hVks7eZybVZeMNDbtpzk002gvyDoRdA6kuSo4ALVABEJUabNw3q1pqRMFY
	LHXclImQ=
X-Gm-Gg: AYBFou0pE7Ii04IZAszGgwwvvdBPV7Vl/anVpoItLKOmAE2rmZs56AiDj7v02fwym0t
	Xi0nI0LrlrlNxI7jdpo+k00k+jssouQdnmLzPsEcCoUtnZGhHaXKCFghbZdcZUSxWOR2rcKss4R
	LTiwZX0nh10J2eswWMP0dNgKvkGdMmTm0hD91zyb1cNyyuFhSEkHHg7+F/T/3762Mrn3XT6fpYx
	3+GZUmRBg9TNdlRzRI0gqvPRYrRFa1+HukikCklNDeNoMhKEywA/CR6EYpWBcsj3oWFrNJXM0tP
	bfUCY4sfIaewc95OWDaELYeAYDW9L74DnGGXKoySTVacIXI2Nq5GNrdLai9LXUvybTyWRamUakM
	aNo4hMCtV2G+/3MURQL8rer9iiKKta5g3WjH5hovEGPfQukT5evf9YQPmML/g0uLsvwL5S+Qa+4
	YiTrB9pXcLV3al2ew/2RNxiRNwBvkdkkb+BIUXQgArVPfOOWB39FBPT0h3RpTFIn7uB5bWb/fwQ
	5H+y4vlnk7q6aSc0eiu7S4SRZHbVBDHW34hAFL9Fp9TJRGc8vs1kLvES6SoRAXgzuusE/gNWijb
	QI92S5EtbyWNZ5hwbHNajvzYCyKSHtg=
X-Received: by 2002:a05:600c:c094:b0:4a1:faa1:3813 with SMTP id 5b1f17b1804b1-4a1fdd26e79mr104625315e9.27.1792690475189;
        Thu, 22 Oct 2026 10:34:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:34 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:00 +0100
Subject: [PATCH v6 07/18] media: sony-starvis2: Correct the exposure range
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
Message-Id: <20261022-media-starvis2-v6-7-374343f55fd3@raspberrypi.com>
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

The software reference for imx678 lists register SHR0 setting
the shutter sweep time with a valid range of 4 to (Number of
lines per frame - 1), and then gives the example of all-pixel
scan mode with VMAX=2250 and SHR0=2249 giving an integration
time of "1H + Toffset" (further defining Toffset as 0).

The driver defining STARVIS2_EXPOSURE_MIN as 2 would therefore
be contradictory, and doubles the minimum exposure achievable.
The maximum exposure is derived from STARVIS2_SHR_MIN which
is defined as 8, when the actual minimum for that register is
4.

Correct STARVIS2_EXPOSURE_MIN and STARVIS2_SHR_MIN.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 340f2ff0ef87..84f3978e1eda 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -62,10 +62,10 @@
 
 /* SHR internal */
 #define STARVIS2_REG_SHR		CCI_REG24_LE(0x3050)
-#define STARVIS2_SHR_MIN		8
+#define STARVIS2_SHR_MIN		4
 
 /* Exposure control */
-#define STARVIS2_EXPOSURE_MIN		2
+#define STARVIS2_EXPOSURE_MIN		1
 #define STARVIS2_EXPOSURE_STEP		1
 #define STARVIS2_EXPOSURE_DEFAULT	1000
 

-- 
2.34.1


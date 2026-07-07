Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF90442137
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 17:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443990; cv=none; b=ZlMEXC22RDMRXviSK/KrjEoIRHH6DS5iNQGcn+7+Bz3mAENH6HJA+dLiM/8MuqB6YJOM6vesZ4ZHlvSNVuoE5eEcj6wRDnPuIjtM7wkro0TCY1dJXxrQbTl5SnZr4RXNJ5Hc4YDh0P5luJ6SIk448a81Wi5PdCxB587dckhFzFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443990; c=relaxed/simple;
	bh=1ncUOOFG8aFwZ1E1ed5HqaMIIZDYZDzkPia0ZCaQGPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pm07Jozui0u/Fl8QB55MDVPPylSsBx3MokHI9e2ECfYzQbV2yBjXlSV4pLB/p71gShXXYPYPnqKQqh/604V3rjR2aLDAS7jdOvTimb5AG8esXVbwt0fRR37nAW+WXvs9E1aljP76hT56Td/9JRN5WAGAvFvhR4xoMmGL9X1zanE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=s/4bF+yZ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="s/4bF+yZ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so41788785e9.1
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 10:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783443987; x=1784048787; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/invQTjEK1SgX9YA4WVxUR62GCT3bwC2Kc2SnLT2WQ=;
        b=s/4bF+yZaE18RKlJ+zzmUMq8pwZcUZAHGNp4B9pWOLJ5onXlg1Rb/JoPGIHwx3hLeE
         raSsnLSKOv/fSZPjK4QQ6K5sUdnNo1HugXlO5wziAblG0bT83a/10ZNRlf6TRUani9GO
         5fiaw2dlGi4oYa+PbDSp5Xm9Hy58sHl+Ce8/N7I835D6iVYgYmyRkL6+1e3ymvyIK8JO
         9Nqh7o4cH1T/JCsvk3iaYSOXexxMBDG7EGT+OnQcxDHXQ5rMExXsm3vvZjkGGifxL+aK
         LjFUaHQ2vkUpzIyLYu6Pi0j0z0XztHKMY21axDk7JdnQcRq6gM9R2mLlGWO2S52AMK9O
         sDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783443987; x=1784048787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/invQTjEK1SgX9YA4WVxUR62GCT3bwC2Kc2SnLT2WQ=;
        b=kAGejhNovegItdg70HBqucnjT7l95mg4cuCyhTJNyFi8nJvHGYB68OGTJD2mrPULoM
         weGYYML1e0KwWdG9bko2kjkUqVxy9Hms/YwdkmUKL+2DJbZFrIcaSX42gHq5LUe7xeRj
         mGwGLajzaaj45di3ePOZL9G8H9UYNznAZn/1/yc16PdRWkOo8qpnFi6PP5FIiyqKbBPA
         47z1E5gu6sa3UwnlN6wp09Tjp+gB8qWmc+hJPldu5oFoUmALRpU1B+JgbFT7fjXcfIEz
         giR06jsgIZQgCP6X8hfHp4XEPCKzSMd0TFwD42RLFvCkcLf4fjMqUdcxeXjXN0bIxIem
         2LKQ==
X-Forwarded-Encrypted: i=1; AHgh+RrW1Aogav0U0EB2RvzfhkukJft8NS/TT08wWXt0jBPvSgk2f4rV26XzY4XjTpqBAh0Jwy1F8gig3j7r@vger.kernel.org
X-Gm-Message-State: AOJu0YyYjOEbR01apW+zeNItFGkcFZ8vvdUI3TnE1gPF4VlBgU9DmQZs
	rY8U52GXa10y+N/WfuN0dbrS+ubLY4+fdqbAy/t8Uwa/hjDbPKc3wvVrdt9TTGw/ipA=
X-Gm-Gg: AfdE7ckRKlA254pyALKGbZUW5oFPcsAGmYKQqeyKv7MprUvdT4TRn4DQm3SjZdmgQt5
	JTDjhSTH48ng66hsP5nH9kUV5DrAqGVBbZg2Wem1FbrX5v3zdn+1xFJQmdTiaeMjP60q1bYcBy8
	uVVBrSnU2HOG3hk679f3SNhUxXNaMTK4dAeAL3hAV7TAqjuUx9eb0w++/AHTs3fEGON225l3QT1
	r7JdCLno+4ooUmhuAnxNz34de1iceCZkoeQIU+5FNlxrR4p5Jo52t06tQmNwwOM29IIiNQsXr5m
	wKdwr02duIjbIIrhHeG+V4DOB7DqC50yDLA8MX0iyGdNrso1sSgVtqZ79v6LCbIUAQAVgAYPMWe
	tF3R/D76KxUQHXsYhcNsbYNY2bzACh+H84wRir042CNiihBZcNNSPwEklcCYeLNfoTQbraLJprG
	CvRpsd1Zoxe5oi9QAg++pPg/+xBfVqq9wCUKfDUkXe9tp5zbXGZ8HkrATz+sEPZtt8
X-Received: by 2002:a05:600c:3e14:b0:493:bc4a:e7d3 with SMTP id 5b1f17b1804b1-493df0a08d1mr67418075e9.39.1783443987256;
        Tue, 07 Jul 2026 10:06:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa0f21543sm33644487f8f.35.2026.07.07.10.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 10:06:26 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 07 Jul 2026 18:04:46 +0100
Subject: [PATCH v2 14/20] media: imx355: Set the colorspace in the format
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-media-imx355-v2-14-1683ec07b897@raspberrypi.com>
References: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
In-Reply-To: <20260707-media-imx355-v2-0-1683ec07b897@raspberrypi.com>
To: Tianshu Qiu <tian.shu.qiu@intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Acayan <mailingradian@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, devicetree@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The colorspace fields were left set to 0 when they should be
set appropriately for a raw image sensor. Add those values.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/imx355.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index c710dda5795b..ff9eaec39fe5 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -737,6 +737,10 @@ static void imx355_update_pad_format(struct imx355 *imx355,
 	fmt->format.height = mode->height;
 	fmt->format.code = imx355_get_format_code(imx355);
 	fmt->format.field = V4L2_FIELD_NONE;
+	fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_601;
+	fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
 }
 
 static int imx355_do_get_pad_format(struct imx355 *imx355,

-- 
2.34.1


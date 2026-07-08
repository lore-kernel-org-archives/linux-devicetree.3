Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEB2481648
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522168; cv=none; b=m/WaAxIx/+S2ER3NAxgX2u693TzTJoeFHbwHuEdOQCmv8elHG9khIIr11SSJ0bVFMOxbi6nGCw1Hy+LY5Avp7VXlH7/rDcqVgOtuq0FyE9NBcC2QQ+zJXp1UqBATJrAAOQV6v+gawJLVtCAF+qAjRUSYE//YZUF6SoRoqrkiMRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522168; c=relaxed/simple;
	bh=AE+i38URadyS4ydSRjafOJeNNrYwdTlnwBC+7VOFlkU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=USEiFnaWZWCDVXhlu40rW8ih/9ggy+vg3K3tIAQZNv1sq5akiCN8svNhLsumncPoUH5/rfb/nrhrZZdEUOx09DRspkmckKxnEjHpaX3e8Q99J5GSXR/+ahvu1HAYPD/1HdrC+ifmqkYzh9GCa7gC/WaukVyuwaRud0kEVpBZL6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=phnLMqFp; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="phnLMqFp"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493c733f15aso6817255e9.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783522160; x=1784126960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOdbzYUWhs5HpVXO6M+i3dw4wtd6/MeyqYVT2Wwi2z8=;
        b=phnLMqFpZ7VlYI3qE0FKGEFc2RCwLe15w3KeD2zTz/QI+rHetv9Q3EAJkAzjDRZmK3
         3NQ3THjG+F/D3lpXFsD85JoHNFRO+Z6LgnU9A6FxckdBE+F2Ig2Z9tgQFsf4PWhYCUxq
         5wRG/Tveb5l2dOrLbAx78hbKaCGKZvM/Wxw8pi27MW4acFXsljvq242GRbAzbcuLoYNG
         fAFNkjqWf+VrqbtB3b01wM6U90OSbJ6ln1nd37kWdm1y2qHK3+sG5JYljMeBlGncZIoa
         37j3zx+rdG9+BKtpBiOiR4g4B1r7F7cxFq72+yQLafiilTt7YGNr47L31G5lIoptng6S
         4+Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522160; x=1784126960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DOdbzYUWhs5HpVXO6M+i3dw4wtd6/MeyqYVT2Wwi2z8=;
        b=XHuqIaPWbmvt1gaFyuOIZseIH1TmIxGmiJ+IGKOMkB8HyWHWVf8ei4Lfwxes7vTRK9
         3HhdklTSOEPGwpjMGwMNDl4dDPVTPyao1e60O2869ztO1gRXdwycN+81GPuoXiRXdPJQ
         vh519Cx4iDkmUTjkzUT6IsK/BANQhSDjierol5qDzi7+cI0ig67Pl0Pkix83SOOM1jM3
         NwL+TPBzAREgLtn5oU2P4nuEBzR5lcszai7xaFT2b2HQK9BkuBlgOfoVg53A9SiO5S8k
         9cGlcfTJw52l35o5n76znjdb5LIlp77aqqiKnr2IQBP2bD6gtZZzFamVUFj0ginPMdc8
         kYug==
X-Forwarded-Encrypted: i=1; AHgh+Rr7Iba1Ppy4ur8IXme4RyuplvhgSDA8nHQqjFwaUwiaC831aRl4w/MMFWut7mBN2OuAIxOkifl5CmOG@vger.kernel.org
X-Gm-Message-State: AOJu0YzcQCdKS4JBsCl77+miykt0FIWWi4o/m44Fz27W4FcvQqCR7lWV
	yPyw5z7XCx+OlIJmgfXgwQujd90hP8R0nhhgknqLuyIqTFqmyKEozzbKPx4nyRwJl1M=
X-Gm-Gg: AfdE7cm0fzkp5gpJHEJhmAe6MTM0tNzq/IvY+UdlH0kYflUfvmxmZyOC8LSwMI0vjI/
	NSmT3zsS/22hFHM7+aplAgQrx2jnd60jXRSY/ccvLlfDnTqvOz9ktofLrrzsnlrpZxfsDD5zieR
	IfdCYn40ZjHZpDlmcntDmEfqHZhzEr4851w+i+lNy3ObJvUmU62pQn2T3GyPyYqyRMGZjZpWeD5
	u7TJx9f+OPvE0ipkCxb6LBD07mcDBm/pW2ZXcfi2xF76yLPYZSn/j6efUo/qdO9w8x5Iwq1Fvfv
	iHKTVC4owd46CzxWShDFMOMUNc0jwjjsp3Eq13V5Z8ggxUaxpTrjdowVr08y1dxLoLAEySlH3Yc
	Ivb8YaowL71EeYzbMV6N/SPaxrOl2n5bf2qFKHCoj1q5/KXL3Z/QdX1IcVf+pTosm2c7bqvZBiN
	HHCZQdUKjuJCk2wUS7logj5vHaNTv+49vS6QSXYzZWeKoxH0gNlGyT7a4bGrwsrZ6nEqGPx4TuE
	58=
X-Received: by 2002:a05:600c:8b05:b0:493:aaa2:f034 with SMTP id 5b1f17b1804b1-493e68cf39amr29755245e9.26.1783522160563;
        Wed, 08 Jul 2026 07:49:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm135363315e9.13.2026.07.08.07.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:49:20 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 08 Jul 2026 15:48:50 +0100
Subject: [PATCH v3 14/20] media: imx355: Set the colorspace in the format
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-media-imx355-v3-14-9df386a623d7@raspberrypi.com>
References: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
In-Reply-To: <20260708-media-imx355-v3-0-9df386a623d7@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
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
 drivers/media/i2c/imx355.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index b27329143e48..2bf8da7469fe 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -612,6 +612,10 @@ static int imx355_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	try_fmt->height = imx355->cur_mode->height;
 	try_fmt->code = imx355_get_format_code(imx355);
 	try_fmt->field = V4L2_FIELD_NONE;
+	try_fmt->format.colorspace = V4L2_COLORSPACE_RAW;
+	try_fmt->format.ycbcr_enc = V4L2_YCBCR_ENC_601;
+	try_fmt->format.quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	try_fmt->format.xfer_func = V4L2_XFER_FUNC_NONE;
 
 	*crop = imx355->cur_mode->crop;
 
@@ -738,6 +742,10 @@ static void imx355_update_pad_format(struct imx355 *imx355,
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


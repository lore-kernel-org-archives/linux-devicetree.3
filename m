Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2E844BC9F
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 11:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784115867; cv=none; b=Pd2qJDnAWSC1QbcgD6kuDNMDlagn+Rn61XR3Z4JtIViZXrJcIeTsPRfMZ37Q6hi3phLRIAB5gbXW/1zMZY6lt87y4yhW7wVQApiMA+uh5l8YfklqjUpFpcZtZ7sP9vRVM4Hj/GOU/CLddCLf1AnFMWYSj1WS+ddQq3XuD7nGfUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784115867; c=relaxed/simple;
	bh=M5cgImqp1X6ATs2zX8UAJD/o0x6k2f4ZZAV3K3styBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uTkBb/HcQm0o2J3bRL4Ms7Sdxkg1TV4jHQ3bFoy1RyxLXACtkCafNhGl/UjDoY/sEAmUW0N5jCQi0hs2ubZladMcBzM+mWYiTTcN2Q4Fnf8Qgw+pZKo0Hm62N+PT+ldJw4DH6dTXt5ZqBCwNk/ybCL2BqQCz1GbElpuY0oe1zeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=l/guKJlf; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="l/guKJlf"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47d6c634f45so3033920f8f.3
        for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 04:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1784115864; x=1784720664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8WwpwzBvrJSugqb6BxcRR4O4z6rF0/Sty/g6S/wo/w=;
        b=l/guKJlfeRznmhQGz4zK2j3sXKEOnwGSxZN0nQF6PF7po62nMnErc+r5mEbQoVEHPc
         K/n5LEUbMGzBCj855WnnqDzMMs1Imt5OXzkJoxZsOpT6BqUUFSdvLuv0JOzXL1SFO4l1
         yKKRbOVqgxWMaAmRlZb2zoONRuNh/4Cl6Nhrn/FIRqwjFjniE6gcLxJliFs7eW8uEZFq
         1rxgcgXAvezCUNjj+QypV4e61AWhytgFakzagQEpyS/n4s6ysKc63nUCDVOaBhS2YnHB
         HD0RKPgpFDiqVB2GS/3haqRyfM5Zbs9/hjKoTNhPZt8AQFyHZae8KBzItDDYFZlxY/dO
         Gphg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784115864; x=1784720664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m8WwpwzBvrJSugqb6BxcRR4O4z6rF0/Sty/g6S/wo/w=;
        b=CPMaarG/2utFG3XV7AWnDoSn9sQRmVw9oiz1416TdeuSr7nzOJiKY0TilLUpe3mAcv
         E6CoYOciBIIjVO+FahJX21ZhRL2F+pAxEWnlnoYMwsWbN0yWVooMzeTCN51zDWnxxgbM
         677U/S0mMY0ym7L5rqvHVY8rYf6mOVW9Ryi6fma5lPT7kDwq2LN/y3hxqekzfiWDlrw/
         iELyqcZ2L2Qcfg2athqRvx6fh+lTwlS/gDZxiI6n073dhBVlpJD9FFv0UhmS1b8bWn1X
         XRojHCbjkXhcn1dUUR+J9r3EILKWlsN8f34vOxKoAXXGrjMcV/ltfHD6phPe/J/eQu2+
         lqOA==
X-Forwarded-Encrypted: i=1; AHgh+RpdEFJgk1y6XWWjvXucpvgZYSoqRXLdVwmlFGz6GnjgvNcLg5RQ4UCdgGhujkFsLgX3CoMT6AdT5AfS@vger.kernel.org
X-Gm-Message-State: AOJu0YxK3T0vMnDvotUrmjKWMIsEcARgm+/qQwjDQPvxfEMkMwj9iH0u
	lsFVu2t+48GJHmhDAyM+jD2KzwsIeE3wEMUT9Hfzl4nYSJNEMAQ+vZ9HDG0QafkR9V8=
X-Gm-Gg: AfdE7cmEca04cN3C8jlZj5y0VOQih3iq5sUQtIGSs9igm5i2WweEaxY5vF3MtNy3d6c
	T/7iH/GskhPvwHh/rfJTZ56VGTILAgLlm6ac0S1+M1wPD5Ju5918UhWirtMhRgVkU6tMBHL2k3/
	uwOxmA1pk3nlPkIpaav2B3U4lVolYTOgUcF8vxZR3PXccI5OF2leMBu+r4uh+49DPqlEsSLjeDK
	3CYtx35nQfE0YJl3lEKk2X/93X+sLAx/EXTbrsnIz2DGe8G7YVpYaVxXz6aDFlVCJJB61mEvNlO
	zZEAYdoAd0Ijc5mKBK/kpwOzeqXX5rXPXmpoojIxlzs7UfK7ONeJnKU+SjHKWB+QsGBIYB/wtu/
	5ZDC3B17vIM41TTULk8/hFVcW6wssKbr4B98HlVQ7ZM6esrbwPtXlMXvYJL8kCrxeXltOHZ/yyD
	XD6GP6GL3xdjL4+BNDSKNdTWlqZ7wt3VAcOokkjGY4ww9YCFhFPTB5n6WpoUrlrlm6
X-Received: by 2002:adf:e186:0:b0:475:6c34:2120 with SMTP id ffacd0b85a97d-47f4887dd78mr7554369f8f.18.1784115863656;
        Wed, 15 Jul 2026 04:44:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f4829896asm14005425f8f.23.2026.07.15.04.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 04:44:22 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 15 Jul 2026 12:43:28 +0100
Subject: [PATCH v4 15/21] media: imx355: Set the colorspace in the format
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-media-imx355-v4-15-f7f966fb9ffd@raspberrypi.com>
References: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
In-Reply-To: <20260715-media-imx355-v4-0-f7f966fb9ffd@raspberrypi.com>
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
index 52bdfe636231..fa8a6851b44e 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -612,6 +612,10 @@ static int imx355_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 	try_fmt->height = imx355->cur_mode->height;
 	try_fmt->code = imx355_get_format_code(imx355);
 	try_fmt->field = V4L2_FIELD_NONE;
+	try_fmt->colorspace = V4L2_COLORSPACE_RAW;
+	try_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	try_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	try_fmt->xfer_func = V4L2_XFER_FUNC_NONE;
 
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


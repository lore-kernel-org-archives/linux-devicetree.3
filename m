Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283524;
	b=asUgXFsI46A6KuZg1Xh7mhVweFvwTGLatkWbq8eWb8x6Xry95SLQL17fnRzLVDR/l+9h
	 uavblEdDNG3s6lT45Mr/MwsMMvlwfmJojji4qMnUjHaRNEdoiNPxqJM+iF7k94vUORqSo
	 Bodw7ljzalp5Wibuh/ZzwwTdhW5LktJiEqzxRLnBiWk6wdUB8ZJD+8aa4wlm8NaU9eUYi
	 j91FrKZT1+dDndMLK+QhOE/8zrT5vcWCuLOb2xWnL+NQKXP+Sd4Cv31c8OgaqcL69DQtJ
	 v148v1JdEodfe+43o5QXEBMgzZc8tnAh0kvz/xnxRtqv/QQYsa9aRkohDKad3Jsz0LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9oRqdB++2GBtO6OCTBhjNHrcmPfpGdib9AfbOdOg6oY=;
	b=aQc7WsXEP009gqnFODJw4d84duOK5WMJVrJuP57Q2+yIxxJQ6V9TY/KXl8S0FUr/SaqW
	 lXGruATb7or/8QP+I5wfkr0hmXFWVbjpVkScXk108Yk6emVj9GyaGE4Zn7Two8K1Ua9ef
	 hvnJ1RRF8vavL0cPCaq4uy+9lLe5rUCJUie+nd5PW94e4xAxYPWKKncme3eO23l9mPuAg
	 WH4a7QALJT8B6R5SS72KXrw44nQmPHrBLtknMzDfORL6uiN4AH4tzt7AFn/fs2H9gLkQZ
	 xL8WEqzH5ZHRVd9ZYZYPYKIpY3IbC8AiZODlqjIW5AfnXaIV/FoDYxlE5tBold2oqMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=dhOIy7ji;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541B4606A339
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 541B4606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=dhOIy7ji
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so16063185e9.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283522; x=1793888322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9oRqdB++2GBtO6OCTBhjNHrcmPfpGdib9AfbOdOg6oY=;
        b=dhOIy7ji+W6TANGxzif2oMq88Dm7wMUE2qvC2UegV47Jc/ZPGCdEcPXmtNrZb5Sbb4
         YInMAP1Z0sjxqTUkaEwsh8HiY5ycIA1cWtTSLeUAklibQONfVo0O1r6l6t8CsXQzWumG
         GC8FmGUj7fGdZIA07dyC4ksOChVOiNGdTtfiIMMeTKwCgloi4HWv8ztOG/+1qVhc/H67
         TlpDsbhQpKdeZXNmov1WnX8DPs2nRGnz5eRJ6J2zZg87GG1MtZeGxfeQc/vyQ/xLBZJW
         0ffWjtD3z49GopF4q+k4Fi3EyoNRTgV9I1hj4qW91j+AmKZy4lvWBO0r7VGiA96qRLHT
         Y+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283522; x=1793888322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oRqdB++2GBtO6OCTBhjNHrcmPfpGdib9AfbOdOg6oY=;
        b=2SnbG+b3aYacjJXXfFCzlQI4sT5+7MahMiTAd1EYG4Fe26qIBBo0nmcYBOG8N/wci8
         p7YkEbi9VSoKpAejzVBpH7GEXHSoILTkv2SF1d44zDkal3pS8MM9srjYGGAGmsOLbyW6
         BbCJYZ7huQZL38mdzLSScuoSHrCO2LwenPtKm48buDFa0ps4GkF2tsifTozL5HNk1piT
         8QIHSh5BsjYj5fCM5mkfjGOQVYA4xTeuk1u9ZSfiWl+Z9pYXK59EiQ6otRNPDN6OU7Wx
         2YbdbRv3kmIyLrg8ka/eHVJzJUB49Z3c6RQnlZKT5e2O9asyemuzZqEP9PeD7tGUIJB+
         mAKw==
X-Forwarded-Encrypted: i=1; AKwUvBwZjJBoh1lT2kWeDdP/LTxqWXsuG63DrWVJNAFbiKf+yY21JG/T19n5gf0d2hcC3YihMv8vapq7oE6Y@vger.kernel.org
X-Gm-Message-State: AFq9FYLeunAZoZLNkLajVqN4HXnJvVzMzbP38OZsWmeQdBDQczEFE60n
	fe4kndnyRUwKLIVxt6EmwBu8DHIBl/bCUhpbDvubRVxFylKbgKMpiixC6jxVy92oqtQ=
X-Gm-Gg: AYBFou3kZySiOuYoQDXWsaSAk6xvZig5/UYly0UDOerk4dZgPrDjgmFL+9XxUly2zFa
	FtHTB0E4+i9z0XjeILVJ7ITBGJm1Q9wV95NMoTi930I00lGHNZTIqEnx9/4pCR3Nj8EPeyC2fiw
	244Hwa/sdKnqza3xYWmnVnLUYpuQ0R9vK46SOT8OD2blou4ekDTEO8CK9rXgUZESUKm74RDdIL/
	dansnuArjn08oBAKD4FWJ1zFsEZiRVul+PB/yVeTcHMmKBYJcSyPSkj/JwvzwU3UePid8FmIE9W
	vpGqE6raxQM30hM6uVyKO+kBQMNs7L1KiKSoemxzJ6okoiM/zifl/JI42axvXi723q1JwYBiC6E
	eI427vrYCU3Bu8KAwDH0wZGP19M+Ljguav0zj4LGy2vd5HwGj7OJmycV6rAa7tr+OoLHY8oXxt/
	bEV3JjJj1Uk1Vh+44CuTLLT/AOpskeU5QZBpWu5PmOOeg/Kpb6QoSlMsEiigFiaPae194ontwjc
	XO5JbpLQff5XM0LfFedlFhl0vqNw30QBQbS/qQ6tRsXcm/r0tlwIbVX3iCOtGpusxge09Gf3lVL
	RyaOeEcwNGmq9l4zz4V9T3mv0mFxTY4EsqA28cqW+ReFvQr4V3NLv4Jldh77UkF5RfxuOLq0INb
	oHXvX
X-Received: by 2002:a05:600c:6209:b0:4a1:702f:c736 with SMTP id 5b1f17b1804b1-4a9640f231dmr129989245e9.3.1793283521614;
        Thu, 29 Oct 2026 07:18:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:41 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:24 +0000
Subject: [PATCH v7 03/18] media: sony-starvis2: Always program the sensor
 in window mode
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
Message-Id: <20261029-media-starvis2-v7-3-b33a1332fdfc@raspberrypi.com>
References: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
In-Reply-To: <20261029-media-starvis2-v7-0-b33a1332fdfc@raspberrypi.com>
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

If the requested region matched the defined active area then
the driver switched to all-pixel mode. This left the possibility
that the active area was incorrect and not reading out the area
expected.

Switch to always requesting window mode to avoid this potential
mismatch.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 134fececac5c..31aa1ec6ba40 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -923,9 +923,7 @@ static int starvis2_program_window(struct starvis2 *starvis2,
 	int ret = 0;
 
 	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_WINMODE,
-		  v4l2_rect_equal(crop, &imx678_active_area) ? 0x00 : 0x04,
-		  &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
 		  crop->left - imx678_active_area.left, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);

-- 
2.34.1


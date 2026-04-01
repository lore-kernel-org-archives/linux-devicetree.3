Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E75047279C
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 16:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775060753; cv=none; b=SodZ2DC6YM0wwKAcusZf327UdWd6fFbXoHFKBXbGl9G8Ta8Woac6ItHDo33bjnHG0hLUhDx0ixc+HM6N+bik8ZDbnfx11ngVOAd4QoOGlNZGVwRpldXTmRw1lti0Ot7c26FlSzaNobFMR3lFZVk6F1sHu82uzYo7JbVguCcSNOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775060753; c=relaxed/simple;
	bh=8dXLQMW8sVIcuzDqL6BA+V3ONKfbGvxIejWx1vqWCqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ebmsk6e0uNTqglpH9/I5mJHx+ZtxLSzUtNKsM4sgCKIvpvf6J8RjUuFZeJ+kVdIX/JE4QoBK50ie+CUEeTqp9Q80S1cSrwkc+jraHdJFAhuXNe3HNYH4AVQKfcmJ1EheaW4HXcS6ctlroXgNXeKwvfkCL+2yHHZvNalSTk2VGQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mirrorstack.ai; spf=none smtp.mailfrom=mirrorstack.ai; dkim=pass (2048-bit key) header.d=mirrorstack-ai.20230601.gappssmtp.com header.i=@mirrorstack-ai.20230601.gappssmtp.com header.b=qD7jEojr; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mirrorstack.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mirrorstack.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mirrorstack-ai.20230601.gappssmtp.com header.i=@mirrorstack-ai.20230601.gappssmtp.com header.b="qD7jEojr"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35da9692ec3so3063844a91.1
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 09:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mirrorstack-ai.20230601.gappssmtp.com; s=20230601; t=1775060746; x=1775665546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WYbjRDMYvPXm7PwKTidWBLBGSVwyNzNOx/MgyeEmpgE=;
        b=qD7jEojremObzSB6ufDiJ2ljuL1Am72xsEl5c20ThlHvZ17AuVapEEzS5FH9TZU783
         h3HmDUl9OJfvvsQ8ydUgKGlfbjYTHiJ1TizYvq+LwOq/7aIUUq3MSNrfAkyVz8L/Kp27
         nEDUQ+7Ztdauc6aLIHJO0F5r7TB59r9JXr9fr0jmZulJilEQ8dpIOsFVhYkfsmVEB6oj
         cWBSNXpSkiuJZ0AxX/y7Mba1MlWMbkmBDYAICEc69hL5Eu8X1uNAyI221fUJ1vffvBwe
         zPynoWFF5dvPn168ucoPEFsFiZVgoUOHBKLdDbFmVSdqi8TntL3FX3yFOyGyTG7ZxcVl
         Tetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775060746; x=1775665546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WYbjRDMYvPXm7PwKTidWBLBGSVwyNzNOx/MgyeEmpgE=;
        b=KceqNqUbPLdmiMocim6xLTKUeD5LgJH85+Tn3/29mQmFBrb5qPuK8Q97ErELh3xVsp
         AP8q4bRF2duSzdNVlSvFrYq5MzxONlttMT1cU1kiiGmpKVFC0zJz+EUcMOwA/owv/Pm2
         XAGplcXZkqlxvEQ9tpw4gJR95GQ6zAzzuWq9U1xQvVcNfbANXbrB2ba/bfdW1Vjf2Sdw
         4k5CU3QHdsnvJ9szwVa6pHe98HRjss6nFz1uHIc/yqBve+JMDk96WyTi66mJT7WH88L9
         UMn/0+5OEwgE8YQCs5G2PDcaXIlUy7CMjbzzXfpjcGS7PFrfNA+bCejw2ejBZycaNQe7
         NYxA==
X-Forwarded-Encrypted: i=1; AJvYcCWaAyOMjsCu3xhE/qRKKOL/6+K3fnKjNAOBPLIypPI5vaSWRGhgnZKXFEltA3BhdN/v1uUW9WpHgPti@vger.kernel.org
X-Gm-Message-State: AOJu0YzNWnAFuXsk4+awYxJiY94BUJZubW5Xjgv9dbH6d2w18+9kFqQT
	0LJzxIItVSaMuZ2ez95Zj062Ys1bEbno1IWPwWjUtNzMYkkTsIEy/r6rP1EnubZmOUMDmxCZ81T
	lHGBBUJSHMQw=
X-Gm-Gg: ATEYQzxq6csoRcTFc6CuYooAFQFV9OxBRJvkPbKo3CkBol/Of6yRgfc8dEBTzf3z2hz
	I484BJvRsZwq9OO2Di5QzmSaH6ycbjSL//xdidc3x5YnYvlrmJYJK+x9atJZcdicCSx/MK1jZqR
	EO6NyzHiflB4rwzrnhz0ieP57S9iD5+Vz01kpO5ieTpBw4m1z0Wf1w/pywcpXhqRQj7uABf8syj
	HK3Vf0wpIwULmVhZehoPWiploJk6X7nvdfpfWrK7sr3snLcx/biBhLfPTfkjEJvfOzcY3TbZImT
	BVU/BavMkKQW0uhCTkeexnFZcyVpCWKKE1GE2fIl/FpXWtJUFQk5rG0NjFQdNR+WCV1hzFUzn8X
	AnW/+EahCTDSh6CKr6TUghzg8h/A9n459OFBSfZqfyap4D7P/T7JLXKNVpMJIBMANpbx0q4hVfD
	0GCH62N9jb7EXtPd73f3KgEnYwbUW7lrgk+znNy8UIVJRi0yBYEWEPVZV3a4BAAjUqds1xyuv3/
	G75HfPVlW6lRYHjB22h42i11darE7XhgdKXZPbM+Q==
X-Received: by 2002:a17:90b:5107:b0:359:f3b1:6811 with SMTP id 98e67ed59e1d1-35dc6e77e5dmr3618101a91.1.1775060746179;
        Wed, 01 Apr 2026 09:25:46 -0700 (PDT)
Received: from ip-172-26-8-186.ap-northeast-1.compute.internal ([2406:da14:e8:bc00:e546:17ee:7142:6d05])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35e34eesm281813a91.2.2026.04.01.09.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:25:45 -0700 (PDT)
From: Sheng Kun Chang <nothingchang@mirrorstack.ai>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sheng Kun Chang <nothingchang@mirrorstack.ai>
Subject: [PATCH 2/3] staging: iio: adis16203: align MODULE_LICENSE with SPDX identifier
Date: Wed,  1 Apr 2026 16:24:56 +0000
Message-ID: <20260401162458.88110-3-nothingchang@mirrorstack.ai>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401162458.88110-1-nothingchang@mirrorstack.ai>
References: <20260401162458.88110-1-nothingchang@mirrorstack.ai>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SPDX license identifier is GPL-2.0+ (GPL v2 or later) but
MODULE_LICENSE was set to "GPL v2" which indicates GPL v2 only.
Change to "GPL" which means GPL v2 or later, matching the SPDX
header.

Signed-off-by: Sheng Kun Chang <nothingchang@mirrorstack.ai>
---
 drivers/staging/iio/accel/adis16203.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/iio/accel/adis16203.c b/drivers/staging/iio/accel/adis16203.c
index 830ff38fd..0ea127c9c 100644
--- a/drivers/staging/iio/accel/adis16203.c
+++ b/drivers/staging/iio/accel/adis16203.c
@@ -310,6 +310,6 @@ module_spi_driver(adis16203_driver);
 
 MODULE_AUTHOR("Barry Song <21cnbao@gmail.com>");
 MODULE_DESCRIPTION("Analog Devices ADIS16203 Programmable 360 Degrees Inclinometer");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");
 MODULE_ALIAS("spi:adis16203");
 MODULE_IMPORT_NS("IIO_ADISLIB");
-- 
2.43.0


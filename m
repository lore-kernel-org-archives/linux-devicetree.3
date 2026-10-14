Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454DD568529
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 17:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000480; cv=none; b=C9UtunZ2EmhB+29chnUaHXY9MUI7DP6pEd6dE5VZ5zbjrA9+CwXrqfDRV4sDo1YvnvZX7F90Xqrakuvikyi/xjOXaz5IBozpNmR1LEhEi4N1uvga3F8NjpzT/2wbTR9AEJspgSTsSfHCifjd/UEkZya28/Lwvyjxkbo/ZVV7xnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000480; c=relaxed/simple;
	bh=UTEcywKoFZD90m+SBWAiEojtxQjD/HhlRH5a5/aZPb0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JDcUE5Q5HCBI7y5iKF1rYozSyCsLJqSlTqybsrQoD4v6W8RUQclkATtoY8X+5IztsGWTALHkkaq98Odwf5zJDng42dLUB14ng48sda166BDQkgvQhrt+O2wG3K7Hxnr6G3lF1bhYbhTF9NVz2zGYz5ghvC3DzqupyJt/nOCoFnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=lvrC2qT+; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="lvrC2qT+"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49e73611928so40342505e9.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 10:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792000476; x=1792605276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mGoIpVElJWVjTezAvTp64hzKh5QoyZgdDO1ru90XKus=;
        b=lvrC2qT+8RmBO4KHcEB5Y0mZJYuC+JTDnplYoAQW0jMaL4ly3s3dNqhH8yi9OR0yXp
         9CdbSO85kIne+TQYIfQVj0T8RdH15GMfopyY8CnagGotx7wSUFUhCmJuFwf51HdUpAwj
         mwN5Y/lR6XlYkQt7XvSLmhaAUgtUboXv3q4ycjwvROSo7wAQKFo56CFDWbCB33+PKqJX
         +ts/MNPOAo/sRwyXxdBXxrqI56z0b8tgxMqw/ZqxngkDWV56YygcG2dXsSPJaZH5j3Vq
         Kb+myaCd/VMqxqpAnItXFa4W/Nw1vj1hYpRgKF9sRfk08y4DpBHMUdSBUdpcuBx6smW4
         rCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000476; x=1792605276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGoIpVElJWVjTezAvTp64hzKh5QoyZgdDO1ru90XKus=;
        b=BMSNJ9si2TbPlqrDvqOyw/Fi6HwKfoOx8jYwLZbO8Sayozib9NLhmC68Ej4YdJM6HO
         cxWgN+n+Vt6sNQrFfP7Dc0FnoHVXv9Zfmg492hh7PrMM66hAyWAtFNMaQbD/7sAb3Y4I
         e2VQ5BN77xKRw8pkuqKDg9R6vVsO+qgzL5pv56kdk0hpKODnyozNKtnMBJtApCOlUn6v
         XYkn9b5/oLhiSsddrYDMzDV1JdbXAHGVOlg21VUhUb1JXLxOyT962eeIAS3cvHzmSrrT
         RAv61FKgIF86+/KJg1ADuA0KYplqooccgkYBb9E4kSOQLLReF+KsofanwyWvqPWMHWzo
         k2FA==
X-Forwarded-Encrypted: i=1; AKwUvBw8tVw/vdyL2V6Ttk6ZEhlhXc5MG5L17M2MeeAn0/QigQYdfbwlyHS0a6SYuoigfkrY12yu/IrPF2mB@vger.kernel.org
X-Gm-Message-State: AFq9FYJpnqcGQoPdO4sCcXwsCW4Zuwml635OtBLqfWs9uy7jD1tnU6pQ
	wJswuqqoILKqReJx7x/jzvRTqpdU95bXiE0QzTuS724Xz1qKJr0pw+I0cyxRBgG8MbU=
X-Gm-Gg: AYBFou1FYHx1sCR+Jo+ct6bInILOYhGy8wek+6jEGpQ1vSk2ci6WpfKGztrGcV5gbLL
	uou1Ym0FZFJ+X2iTrADdy/iW6far6ZsB3D/P72uQG+a3bT45y9CFIe9GR0bkIowK0QyNK12hR0Q
	GAqLwf5zJGsAhlX7C5PCUEa0LevFfw2afh0yCGlgszMi9K9k6L6e1lCJ9rA5ufL939mTFFD/ULl
	6Y/a747iQn/TGOS++0cJjM9KL0gqzcyh5oTx9b/epfN5UiKyOH+aFNQEL7fSYr56AD3U2ws+fMr
	WVJIVFr90RC3KOABEir8R2hsTU1E2FEdXnwKEsS9l9cvo+2gnrUB6JeR1LKF8hdlERIF0Em1Aki
	TUAq0Cu2Y/hzGmLc8OP5Gk6aEuuypK2fmD1tdgJLNWR3UlKWpqx9aZnXFn7CE1YVp/ZQ2vSoitN
	ycEhrq9vwS12WDY7ix5kBSvSA86lXTb++InZa4L1Srme/gC/9Eqwfs6SDfsVpIQncrFMerGMEa/
	b619M68tReXn43+6VvJoUy0crF6G9T1NCkfwajFnIvV5LFc/g==
X-Received: by 2002:a05:600c:5254:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a18e4aa11dmr338035925e9.16.1792000476408;
        Wed, 14 Oct 2026 10:54:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd986095sm8188395e9.7.2026.10.14.10.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:54:35 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 14 Oct 2026 18:54:28 +0100
Subject: [PATCH v3 07/14] media: sony-starvis2: Correct the exposure range
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-media-starvis2-v3-7-c958362b5d06@raspberrypi.com>
References: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
In-Reply-To: <20261014-media-starvis2-v3-0-c958362b5d06@raspberrypi.com>
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
index 72fb037d7dbe..4fade8671bb5 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -61,10 +61,10 @@
 
 /* SHR internal */
 #define STARVIS2_REG_SHR                  CCI_REG24_LE(0x3050)
-#define STARVIS2_SHR_MIN                  8
+#define STARVIS2_SHR_MIN                  4
 
 /* Exposure control */
-#define STARVIS2_EXPOSURE_MIN             2
+#define STARVIS2_EXPOSURE_MIN             1
 #define STARVIS2_EXPOSURE_STEP            1
 #define STARVIS2_EXPOSURE_DEFAULT         1000
 

-- 
2.34.1


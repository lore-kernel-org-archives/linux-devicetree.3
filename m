Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6EE3E2AA1
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 15:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792079894; cv=none; b=qLGEgy4I/glFCDJoCYdAXn+DYMwfwEpjgpGl71P+F2CwvMD0nRLvmW51MMowfdk7jUelgfy4dlzt+dtVpr2JhJquC9TIG5I+dtz3O495r6E+WDA1lb+ABif5ZzbwTlsIr+5voIWS3QS7S4mhuz0OEjg23A7AmvoSjuiVVGu3dwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792079894; c=relaxed/simple;
	bh=sLWl2JQyqeVAhWGermIWldFQTk+p5V7tPme605FCGQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UqvMYExmQSdBOM5PUrjYGnQgQwYIeW3OcV1uHCGLaJbwQspOOT3Jzbt0iOwA39ADHq3b+MGEQiB0QjmWjJ53cI9t3VInlvasG/4dpB/rSNeYaKi1P5G7YtAlQHF+q58yslSHXBEY5++ann4+NJ74zmmdzFxizln4dDRNRBKjwmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=DytEZA3Q; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="DytEZA3Q"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4649b35bso599548f8f.3
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792079871; x=1792684671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fPi1pScmOBdXgs8foC5HPXZ0T/2VagZrymR7BUhJAbs=;
        b=DytEZA3QcNhJ5Smqn6mkSHuHblk3pgOFPEBPKAmL1+Gs8k4O8miWjjc63HXeNM8xvE
         eaFyAYfeZ0V52FeopEph6UvEskE59AgtvoFJ4shhfB3vXpKky8Qija1yJMScyd5dv53+
         vbuHyxgKi+9NlXpr87IKaL8BV7LpP5YDQLvEu5e7q+HaaLWdD+AoN754IF4tu9vtnXb8
         Yh9eyVclAuBA8mjy2aePvY6+2BOqj+RwQuuU80mpLmMzzWgA0F7GhxtshDCSDdGDUy2t
         mod6KW7PWW1XRIE8SMn/C1eeAxaeg/r3OqAWDi3lgNK4Wd3BD57zLdVOwbd/IYQW/wXI
         yTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792079871; x=1792684671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fPi1pScmOBdXgs8foC5HPXZ0T/2VagZrymR7BUhJAbs=;
        b=Uehfj24R2vtov7Tm7Dx5tAGSilG4r4Ih9lCuHDLQXeTh7YgJNVjB2uLTOn4Z2Y6uaC
         D4UQEbbwJ2cwmBtyuWE3uCQZS8BGIwuIgBQGijQi8J2oi/XHg9Wwi0SZxHQAqQHfCsvr
         6fUUjN2aTyAzOg4z9ghOAfL/aEPje9jyDKrnzdJL44ce6qx/7b65SXGgTD4+2lfA+IqC
         t+qflM9Z3pR8MPUslU+QOSJ+hfWkt/bq4GhO3WAXHbRr/zR+Bt6oyww62NLGCJhWLQ/E
         cAKfUz5AUr0eFQJsRIMR95W+jllzUf6uh1oOGQaMCRhsG/WUYGB2xiD8DZC6agWMfpmN
         KuYQ==
X-Forwarded-Encrypted: i=1; AKwUvBym/sCUCxWbmBXvEKX2WBKSuoRxNMJkPI5uAizojGgRN2jCGz/UsWa6jtV5VPrwHLr02+At1aaOrWua@vger.kernel.org
X-Gm-Message-State: AFq9FYK6fS1Ksu/6zNLZJ45qdkiLTRNxqeJenTJbe2X18gqxbKpiaFF7
	lyQFFVkXN98gEgepKUE7z4CBJKuxzdkMp1iVYZLubEMzRpFYvod/wE0IU5UwTFCuMgc=
X-Gm-Gg: AYBFou3t4xtlXjRHvubj+rcApJRTYscT50Zw5e4Y4GpUoHKy1v5dvC+0kC2nj0KOEu1
	gpv08V1dJ+UjxDETKETZvpJD2fim7j4dE77Fw9/fX0q3DnO6WDxQfyHZABKek7CsQ1MIJqIexGw
	e9rZflyFwd2CR9uKqqu9h9mDQM9u4iFLavGFMQY+01Ntpudu06TO0RZSRAYeZqVd/o4GZwSkzLR
	fj8CyHVJedRupZ7WuO2GjnKDSpCsMxlOXZeEJTY1m9vdlx4V1iy8fnZPaSSbRqavbhVl5kSV8p5
	7e39y3Ix5PBH9w+7R+uNEgndo8w5qx+psVGOgrgI+HUOf8vG5rkfVNcfTbrgrxgzF7jJKe7sS7L
	AZ1c7qVR7O6wtAeAArtbDXnPW5IyvoJ2JApgSBBEu622c89v11eUKYl7MAJL5yQ0FWyiQ/3RqFU
	wy7pv/h19ZEXKs8s1t3Xms8nFHrZ+LP3sv81/gf9BmjuEkEQitbdUnRjzSdnakaXTUQ2zkvkHhW
	erqFDRhCgSIs6IIsCl2ahzBlAwXnjyl62kZGtEQY7F+VXCZ8Q==
X-Received: by 2002:a05:6000:298f:20b0:489:bc38:9438 with SMTP id ffacd0b85a97d-48dbaae70a1mr31060964f8f.29.1792079870916;
        Thu, 15 Oct 2026 08:57:50 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaaaebsm19877251f8f.14.2026.10.15.08.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:57:50 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 15 Oct 2026 16:57:40 +0100
Subject: [PATCH v4 14/16] media: sony-starvis2: Only update bits for window
 mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-media-starvis2-v4-14-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
In-Reply-To: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
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

IMX585 requires bit 4 of the WINMODE register (0x3018) to be
set, whilst the bottom nibble selects between all-pixel and
window mode.

Switch to using cci_update_bits so that only the bottom nibble
is updated, thereby working on all supported Starvis2 sensors.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 1dec5d923077..8585f5c93dc2 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -88,6 +88,7 @@
 
 /* Crop */
 #define STARVIS2_REG_WINMODE		CCI_REG8(0x3018)
+#define STARVIS2_REG_WINMODE_MASK	0x0f
 #define STARVIS2_REG_PIX_HST		CCI_REG16_LE(0x303c)
 #define STARVIS2_REG_PIX_HWIDTH		CCI_REG16_LE(0x303e)
 #define STARVIS2_REG_PIX_VST		CCI_REG16_LE(0x3044)
@@ -1458,7 +1459,8 @@ static int starvis2_program_window(struct starvis2 *starvis2,
 	int ret = 0;
 
 	cci_write(starvis2->cci, STARVIS2_REG_ADDMODE, 0x00, &ret);
-	cci_write(starvis2->cci, STARVIS2_REG_WINMODE, 0x04, &ret);
+	cci_update_bits(starvis2->cci, STARVIS2_REG_WINMODE,
+			STARVIS2_REG_WINMODE_MASK, 0x04, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HST,
 		  crop->left - starvis2->variant->active_area.left, &ret);
 	cci_write(starvis2->cci, STARVIS2_REG_PIX_HWIDTH, crop->width, &ret);

-- 
2.34.1


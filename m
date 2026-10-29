Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283528;
	b=WLbOmVfh9ohq/WMhroZmDd/hd74LcA7WTtJnHzho94dx5NeQb4syWqcMNjxCqsqovGyt
	 S7cih9A4P3a1FHKMgZQ2/YHYvysAQ9Gwowxbv5mStaX3GhbGlhjsMxN7rSHplbKX1AuFI
	 aiJWNU3XrB9TBRy1G5armo9wG86qD/Bxv2jj/NNLM9iYs+In42e1QiJpivMOSYNxxdLJe
	 ziKe8bj/c/EjQBBesS5bWWkoPFyldTQmK4I5mcU9685L+RlVXMXl5GYz6lbqpmYnSrZiC
	 miTie4+ePkFBskVxVsg4czM3q2Fo9prGzUbJsszZrYZLy8d34aYki+pb5PbjnP0FHiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8ukfyerQ0BNQwVLXMA6bWcXy9Z460lzQtyxZ+Xp8q7Y=;
	b=jahxj4yfLP3cY3efgrazsCsDa8Wpvy02F0ERdaK7qKRMStdsz7NbjIlfd3++iGzHGsCY
	 c3E4Auh1dIMVCSI+PY4L/iKtAM2Tf3HXmuUiaKA4xaC082TSaEsaAm6QQ2OzFrV2T7zVF
	 trOtKh7uuEJIqwU29LJuC9J7TEaU9L+Ccm4RauJ+ExOqmDVVUm2MX50SfoqziUOd1jXKK
	 T4lmx9EFA4g2orCkBMZHF6hy/L15ETKsVHrblM7xXNiOvyG/wiF4WNv7LuaxaMGQxUO2m
	 pkYeAi8vrmlXwt3ylpHIZfkiiLhXrFHxCgKL8wLmzovAg6FrPSdkDFkUWo6R8pJqMrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=erYCAd+Y;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E171B606A325
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E171B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=erYCAd+Y
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e20edd106so1726315f8f.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283526; x=1793888326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ukfyerQ0BNQwVLXMA6bWcXy9Z460lzQtyxZ+Xp8q7Y=;
        b=erYCAd+YzEWa9UGAOz3SXnve57b/PfEiNXFDorTVJd9u/DmTRd0cbA6tqR2bF4MOSU
         9NT9ZYVcOv8Xhuh/STL1V5VcOTlpe7yWe0hZov3//bPJIBIFgqmTz7UoJWlanqMLg8vG
         gc9lVwOMxCzCl2/igOCi9oUHT0G8ViVIarprTVY88OPPlCnolpWVspD9SUTz+hhrLdHE
         LNXY6kP7jDv4hJaFbpIYdzwccd2sbGi/JW/NLqTAbodSxlxIV5WoIsxdOICh5qqviXw5
         wx/YLRkUEVushHX3GHwz0wrk8qlDeLgTvA5J9v0fnEf9P4Kpm6TK26/VRRx4oAFT7Uee
         A2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283526; x=1793888326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ukfyerQ0BNQwVLXMA6bWcXy9Z460lzQtyxZ+Xp8q7Y=;
        b=V1ZnfDIyqtb2O1B5+pZkfiYrK70r/KmEUkLsMvYb9018OiP+1LIr0RqNkWX2+kvvDl
         YIkylH+jYTWLzrxDMzDsHcU/LU4WCevyTulJgIhbQ5wCbEqxMqJlmFt4dW1xNNm8Oupv
         gQ9cjzxQuclFAy3MckLDSt4bVVIE4Xzbx2dS1UAGKLGJGtWgDSR9DiUoVeMKfPnt4BNK
         M+y7imjwy0WYx003RG5PfVtSaLUBdlyo06NeAr/Eyu9PChUCMgq65Sd8H4BsCmfF6pK8
         3rSs4gb5RSnNJC+R/qyy9m36wzwy5s1SKwp0+y/PgbQgqFrjM2hd34lFJlRLAK55CbIU
         Nsfw==
X-Forwarded-Encrypted: i=1; AKwUvBxXfcVvBC3VdtxOUOoZcGd43q5nQfzJ2m9Fh60AWkUrMEmqewRpQgMoAL6Z3GzspJM6coZ3VrniNvzK@vger.kernel.org
X-Gm-Message-State: AFq9FYKfOrvYQQHyhAWHWX38VC4jLutwZUofskdtnlg55KaI7iQ+BydX
	UgcahTxILzVTPtVJJeNT10+yOSUDa4RVnJUccH3e1wXPjR0iPE00Hk2dYa9hC/r2YCs=
X-Gm-Gg: AYBFou2XzYefTbfoNicLvXJjn55bd6Dtih2xUjPtKFMS/hhbyw8N2xOuCjwxaXRS8Mb
	PYkhrP5Q0r+bmo14u4bdOTmnzsCpeRaNCplT6PK6ZvYiSa8cfZsgS2BSmOwJvArdTXRSG+kzu4l
	ZGPBndt9dcf05yWFomDvZ7tImnQ5XWedx1dE9F4qtqVs/obOLz7fFy/39EP/SdOZqOJWbDCsGuO
	LDfaxKKAA5MmpJPo1egnGNQ+3iaaAX+0OblOWxNVnGrFZhmV4Mj/7cuLMNYp1RBrzD4vhUr4Vs9
	Xl3MAwnJRe4T/ihBgtbinOn0oiXenortf8je3ZQ5mxgrhTLYHNU2sgT5MH6SOlcOTYDFutuNBvG
	c8oQbSI5HPFHcivanfUV3f4BUKbLuEapZhZLWu32R7HWyifQXMdWFd0tkJdOd/mzSMTYMoEukxd
	vYFMZlPH6PUs3JHNEdt4OjgWBOSyh94EYYNTQIMJ7vRdTwB9NYwwRloSmkT/ypD+RQVS4qU7fyN
	8obv+Cu3B4WafGeTpcDRFWOh7PX43IhZnqyOFZH6j26aZy/IMJ71yHOmQfHmlS0Ve/XBrh0rGE9
	i7zW9Qj6e6ilGog9sU+zWOjjAqOrxgwpCMKrT6mKoTl3ip8dR3uRALq4cv9oT+IxCf5rVS63dNf
	KLqfE
X-Received: by 2002:a05:600c:37c3:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4a96701830cmr125321535e9.25.1793283526321;
        Thu, 29 Oct 2026 07:18:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:45 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:29 +0000
Subject: [PATCH v7 08/18] media: sony-starvis2: Put module into standby
 after identify
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
Message-Id: <20261029-media-starvis2-v7-8-b33a1332fdfc@raspberrypi.com>
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

The module has to be brought out of standby in order to read
some of the identification registers. Whilst it would be
powered down via pm_runtime, should that be disabled it would
be left in streaming mode.

Restore standby mode after identify.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 84f3978e1eda..95da8a9e671e 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -1162,7 +1162,8 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	 * This sensor's ID registers become accessible 80ms after coming out
 	 * of STANDBY mode.
 	 */
-	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT, 0, &ret);
+	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT,
+		  STARVIS2_MODE_STREAMING, &ret);
 	fsleep(STARVIS2_MODULE_ID_DELAY);
 
 	cci_read(starvis2->cci, variant->id_reg, &val, &ret);
@@ -1170,14 +1171,15 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	if (ret) {
 		dev_err(&client->dev,
 			"I2C transaction failed ret = %d\n", ret);
-		return ret;
+		goto err_standby;
 	}
 
 	val &= variant->id_mask;
 	if (val != variant->id_value) {
 		dev_err(&client->dev, "Chip ID mismatch: %x!=%llx\n",
 			variant->id_value, val);
-		return -ENXIO;
+		ret = -ENXIO;
+		goto err_standby;
 	}
 
 	cci_read(starvis2->cci, STARVIS2_REG_MONOCHROME, &val, &ret);
@@ -1185,7 +1187,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	if (ret) {
 		dev_err(&client->dev,
 			"I2C transaction failed ret = %d\n", ret);
-		return ret;
+		goto err_standby;
 	}
 
 	detected = val & STARVIS2_TYPE;
@@ -1207,7 +1209,10 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 	}
 	starvis2->variant = starvis2->info->variant;
 
-	return 0;
+err_standby:
+	cci_write(starvis2->cci, STARVIS2_REG_MODE_SELECT,
+		  STARVIS2_MODE_STANDBY, NULL);
+	return ret;
 }
 
 static const struct v4l2_subdev_video_ops starvis2_video_ops = {

-- 
2.34.1


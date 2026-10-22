Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690478;
	b=ZK2gU5WbiLUOqxMFyE88kXsKazubbjdOmG0YZze1pZGtRKzP1SeySPJgDH9Y7STCrTEn
	 80nr+UoUuK/aPVPlN+SCfttqnHEMlMzba5/4vPBBmC+ttX8U4GnOAQmJILlFx4hVfCP5i
	 pTIe5VlvREOTw1M8YwMySffqxibq3AF8BFx0qwd3xNi6hDQix2p1DstcxXMcr8Tzne3KM
	 +EANJm7Iw1U9f4sizm8k4pDLW6LrbTfuJ2jmzjOs02HcSao4wzXiUpdMvhUJ74he2Ljha
	 v5knX1ac6deNWQn/NzcHyxdmi2IYZcXxnudscIQguW2PfMY4tRKKS7T1Qkr4eDiDnOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8ukfyerQ0BNQwVLXMA6bWcXy9Z460lzQtyxZ+Xp8q7Y=;
	b=NooDsi6OjgLCbh9RP60IkDS6bL2+9LK5Jm5aCLt23DHXfl0o6mV9yONrifWRI/roTxzr
	 VPzSMIbiKcQnmgcYKY0hNs0Ybi5bmJufvaKIDalvJy/6wDmaKUm5xrOSltG5o50Av/jv9
	 DLtY0ZwcuBMRV40kEXf41H84WE686KtXBJWXQ/BYpEo1vHOBFAtF429eae9RJ2FlNQz9+
	 2PIwuXeCNxmfTJu8LaefPS07i2o7YoVGfx+eXFRFdWe8wkT+IwDo0IpRdO9vMbw/OW8x0
	 0UPX48NJVgegZDF9G2qJQuNcgGKKqSN1hNaeHAllTczbOGm2+JxlliN2MrQk/AOaHow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=GuSzEIZy;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D699960A2633
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D699960A2633
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=GuSzEIZy
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so545935e9.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690476; x=1793295276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ukfyerQ0BNQwVLXMA6bWcXy9Z460lzQtyxZ+Xp8q7Y=;
        b=GuSzEIZyN7jOQxTJ65Rk9qi0lbnn8bP/ve+H7SjgcOlVqiBy1i6cOhzLImlATHmmZS
         B1YWxP1QHNsIzv0uYQtYUZ62IeIUtdlKvmCQBVtqH4qKRujPFt860Jemstx0U39zWEWW
         aMPQ10bQpsgLub8+5dtEwNCMljs5IaMW+yB0HXR90DbwqXy+K2z/7ggG+A5wZIPxW9gt
         kFbMqmd1ru8FFYo+lDq1W1+CQZBDSMfC23uGDRCe0t2iNZATbjI+QNj74EsdexkMEeaZ
         kriBCRQxXskyoIGUXnY+/vY0nJ5QrydHSDx4NGDWx/BB7FtoQbDP349bg7ZyHeRtfyt4
         ttUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690476; x=1793295276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ukfyerQ0BNQwVLXMA6bWcXy9Z460lzQtyxZ+Xp8q7Y=;
        b=x3irfnfeQVOLO0IfVYb/3cDrAiVS/13crOhSlzzP3LBuJFaByMx/x5U14F0DTM99nX
         O6fOJn3/qe/HXdZx9nJqUc0Qf4uLUWA1HpA5ExRNFmRDuPwGavV6kbmJOUGUJcOn+2rY
         p6R9r/L/US6dftvxsRmxQ5Wp2vSn3SotpuficCblUxGk12lgsuc129JxpUuMHyDCxIwJ
         OgLSHu25s4MzbtFfas68LE+7PB7gJA1mK2Pfapjtwb7YVOhVasC3o3/COFlQVZcVG9OS
         HMGf+w2L9f1bt4AL+H4jrDO8vgHJWvH0bsf4fPcLjJCWx4jALgDWK8a2ocMdnOi0h8+M
         Qy/g==
X-Forwarded-Encrypted: i=1; AKwUvBwP1Gnt+Q/bsV7DSG1qZKNNTM8WT6vF/xL+TDST5xSIqkrUNlr7O2ZrPLWObET84K7+oUMUj4sMOoCc@vger.kernel.org
X-Gm-Message-State: AFq9FYJj9FFKj9v9b9V8Moe3olhxvWyK3eeVcbKQEFU62+hrT0V0Rok3
	pVo3ifHzaiAWOAsFtZSoDUWZmTLPV/y2H/eMEAFRXyXJi9pollPNk5gzWXWv0ax1138=
X-Gm-Gg: AYBFou2QWiI0G4rTXXCn9FN3azc3yh3vCkuE5KWRrM7rX7j4F0iPSt+hjODnd9H8Q5R
	1SPKI6jko/JpLG39Up1P5g0NbasG+0KK4TPUe6cqGMQr1rVUeIpagF4fkPR4D+O06Nrjds892cn
	cHpbybskwNg7bGD1sANhF1kno+4pEKfXGnoMHVpUm3pJpJd0+OLWW9njJ9zO7LgqGzYYfFH+Ajs
	vL7St1SirD1AAt2DQUsLAkZJRpyj84FscgyzsXOVLPDH5ou2MsZo9C83GQY0qXFcJxsEwSU0l/7
	tMWnC2l7xpxFJh2L+wmmVz1NZUJZPUsocQU4TH8pGTV4bTnC6b2F5EGT7SmxKv4oJmLXpZQKB2x
	CVRP1Gc1qkhJlYQ8sfGzjer1LHqeslooU7TNmsJIigLt1QX7XwRQTrDNCwB0nWLCO8lKBz/g6RB
	9jJOtSMQ5RwnRYQFshAhKRbeM24Hl7f1Z6qJuYxwmPdNAcs7Yz97U/VyckAzYtzavULg4shrW7r
	6JNBQaWRwK15S4t/nj/gUHjuJoUN3Wj4Z3udbNgCXCNvtsNnSV8JoYdIpq45+DdtdRhhz7ITubx
	ZX1Ij0bbNt5t8NRZV2RtUyDepyolBwQ=
X-Received: by 2002:a05:600c:13d6:b0:4a1:d2e5:aa35 with SMTP id 5b1f17b1804b1-4a1fdd2344emr84423855e9.19.1792690476284;
        Thu, 22 Oct 2026 10:34:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:35 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:01 +0100
Subject: [PATCH v6 08/18] media: sony-starvis2: Put module into standby
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
Message-Id: <20261022-media-starvis2-v6-8-374343f55fd3@raspberrypi.com>
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


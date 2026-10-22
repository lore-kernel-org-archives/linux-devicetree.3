Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690478;
	b=cYkRw8xs1819m17cx85eX15Tpz60nCJWrOzTIR2Pd1TVfdpSiTPb6p6dEFXg1Nm3EG3R
	 6n5sdtZ/ht5elnzMhUHo38GOC2UCbNez9eTQ4Vabl1OSF457+TuJo2RBcF0MraSUbbKU+
	 ziyvO/GM9rf7F3la+O+p71Csy0qPR0fWxYWYl/sZbN+twW2qVIdC2ru2XlDh3bBFveSSn
	 oEX7lekOaj04/Yhmrnxhms26aGwPp9SfsKhYUZPXZFSHz3R/CyDB4P1cdTfVy13B/yFkc
	 EwlviOAd3SANRnZOzR8taffPt8Dz9oyQ5WOm03NdtTrlQvLX9c7YQM0OcCrkLjZsMsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9oRqdB++2GBtO6OCTBhjNHrcmPfpGdib9AfbOdOg6oY=;
	b=GO5ofi43Lj6/y2iPns9/uNmiBvUi48AccoLV22uIyJEyK7E4/IAUHaH9J52C6OenH3cb
	 wrkonouKOQfmMM5FnGE4eb5osVByj3iaVdARNpRr/oMo5dcAyYaDLENb83QQD0zPfy1cv
	 CkECo8BTO0ByQbmgDcZOgX8OrlFKsdN9HsWVez4t3s4Oc+r9H04S4KiLYD6mBEfOsmndg
	 dnEQSZPib7gwkOdwHtXiuaGbPwwXwdWbd7uZxcppru0wuvtnqLwE7eB2TqNjg8W+hZ75N
	 QdbCFgZF46hlHsVP1/xurTdeS0cLovGemDyYSSARvkeCA6WclewiFuhFKPbMkJIBLfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=redEqoEx;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B84606A328
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4B84606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=redEqoEx
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso782165e9.2
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690471; x=1793295271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9oRqdB++2GBtO6OCTBhjNHrcmPfpGdib9AfbOdOg6oY=;
        b=redEqoExeBfRPB4HydW2hut2CDqjFdcbosZhclRkDYRZsj0r3PNwR6k4MeKJoP6J2T
         NvEjW+piKiCzWFYDMcWAD4b0BnBVr1nr33fMTixOcyVm1nMlxPjhZceSCpxsR0a7/ILu
         xmgwlev7nIsAQdVM7n/9M/yLmU8HQeCdUKW6ksHJhnSsdu0BkocGKStaYxaa/U4WbblS
         2xrnWk94n2NwSKa39n7s8DP0axdnQIzTkbhR5X18V/0eAaYOTEEgmqwtynxEb8vVzzgJ
         gsblAOloKSoprmBR+c2APf/9RU7mH6QEDaXNsG2qRYCxEEt74UKRGhnU7nETP4ni9BEl
         rxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690471; x=1793295271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9oRqdB++2GBtO6OCTBhjNHrcmPfpGdib9AfbOdOg6oY=;
        b=PPx/ZUoMN9p8UKTmSVqwt0TD5R2bouVvRpjrA5TYJtCJoNpb5HoLbN47zVWQqHwqgK
         SRZ+EsPEDsM7Zz9UzVwfMzvAyOO7iNZIDleCLsJslv+LsGwqyP0/AgpATJKQ3YPzamMd
         u60cZ0+vpHi/y6wp6Lr5G/ox84RwL/1GuJZqFdDGXqNBmcsLyKX/PESB4tgQoOzyRjOK
         rnCSNPs0a4f7zOyWGiks6fGs73exEeCFNBwB4XL8uZua6TdqONDCtGzTGKQMFoN2h3VK
         +BCjpaHOX+IxoToDmeuO2DlvaIyQLSapKMI4mvc3T9DJYioqKSxbyE8THccbosFUQ0Pf
         aTTA==
X-Forwarded-Encrypted: i=1; AKwUvBxdcO5shsnGjdPQrjadIoTSaGOkSZC/La2pt2o1uPKvLBmZOxfZ2f/cngF3GJdpYY/Saw4+fJLyqBfb@vger.kernel.org
X-Gm-Message-State: AFq9FYJFe4TkUM/oyTekHn9q/cA7ZfJUAmt8tC6hP1dsFjOSl3MftqPL
	Vrr/+/VGPTZdQ3lEOiH8XEG4WQQI3+5ceF2Gss6DWpX1BLac9PNxUvIbrLvplmzjc0Y=
X-Gm-Gg: AYBFou0r5ni/4y/0AyZQTZSekWHj6T5nehQoskKwQ872BNqgPU0hO2urjgqDiF2A6Qv
	GxioCAUeM/IyAbDIKn4EtXPEDcg5chu8FyJOEuftgq4fDkJD4AAPEnrz+9ZceN1m+R4hNqB87ON
	nnAJ9aM7dlX7BsNG1DV9m0/ICv792tP1lXEOwX3cbxzzWgeyEumGHtK8gBxlkN/G0q4bwJijvor
	k/0niIf+3Z+svQpRvjih1hS2n6ivyyrNH6jjTxdi07phAF2jSWgBHEUV7SdHWLSYuPBuADfX6SW
	acRzR8Lfs/f+/I6AZIB9qwJy9pgdd2rua98mTD5xDBejWtk53w1I8D99cIIi6W+yPrlWvTrCBrK
	dHYunKZxf+BRhG9nhvKKZQjImPnnLzltQyk40coA6OV/Lz2o51ZNb8Oj57slEORAmCb+Am5tn7G
	VSBEu6ZoobvbwD8DKG+Vvnsm0o8i5nACXFNGgXL37l4ENWUD/xekTgRIMPEe8hTbjLV87knyo72
	d9b0+YS/wKykp2pIK1/Ty6UKeohBXpjMoSt/a97cSITZW7Pwg7GKrzrDc2PouV+11f+p5e8Mdj1
	V7niT38tdibNzyacCw4En5fsRuLdM3s=
X-Received: by 2002:a05:6000:26c9:b0:48e:1299:663f with SMTP id ffacd0b85a97d-48e264f1802mr13082880f8f.56.1792690470487;
        Thu, 22 Oct 2026 10:34:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:29 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:33:56 +0100
Subject: [PATCH v6 03/18] media: sony-starvis2: Always program the sensor
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
Message-Id: <20261022-media-starvis2-v6-3-374343f55fd3@raspberrypi.com>
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


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690487;
	b=wRpHX7JDv5nqBP/dsTYCVYfB8aNix7/L2FSrndCFPG787smOGqqKRfLM/H/AqHRPAjQM
	 FsCt1x9vP3wowA7T9BuifkjDNLQXdX0ClVX5wLDp9PdNdKp4fomQlySnDsAit+oR8IjVR
	 chKNq9xOlYNKfXSRwSjD45fmslYOo52xnzEcvulNwUxl0j9eN0XkE1o9e3mGIv64Fwmw5
	 sRPs2+xfb/rPQ6deWKgGKMvQU9pAOyRoE7ycMcvTDHvFMT1c+VRxXTtAJcDOtbCW/ltyo
	 VgYx/ROtUbmja1C40Ca1xwjPXpuwfqevbislk35mifQQgCVwToooCgemnLeVoxpRICQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=SpPolyfzJYMmE5VU9BMzMFqCxVbYb3ZUGO3YoElucf4=;
	b=J3MNfdADZNzCIWeQRpRphOOlheudZX4nv76MjIv2cmoRzqzd4uy5hm5GPLXAoWnTEx+J
	 II7aZSdvgh/2T9RabTu+sisVKSVhpQOV8Yp9/CEqQo4QAjJQmeecCRWBdXY2R0GsmJXxq
	 E8r4sUdTI7anVS1VcZcM7BDCvgItlGp1/UMunpCpaUhIgY8g21xB3TvEDE9uI8D2sxpmh
	 BtH9gSQeavQ9pfvwNARd1bAk1QljivMv/fs1YN/N0L49T/pPa8eycZAsg5zlWptUK8a+B
	 1a2JlBGZ8LomTVZYE7y7krnTBBDrW5SqxXcC+bu30YuP9v2kwcfurZDLa7UicIat7bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=ccXMW09i;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F880606A320
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 17:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F880606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=ccXMW09i
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dee593f18so37998f8f.3
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 10:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1792690485; x=1793295285; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpPolyfzJYMmE5VU9BMzMFqCxVbYb3ZUGO3YoElucf4=;
        b=ccXMW09isYUy4ucoPunTFXnFO/iXlPSy6aXP4EVOxAe+qe0fateYkqiy6N1AUhgjC/
         Ks1/d2sr0e/kjoLoKqnFgKGZsed1bFfxVMFHkGE6mfaXS7uEqQlJqUWvQhkIRxAV0B0h
         +SCyFrIIG+wt5OUh+ROZbCwgRxxFE64TDlaEjXE4UJP8+vHnCR+zoRDw1XqYr2FbeHew
         /4d+BBdixZykwXTHrz8PoUCVgVa7rMit/zHcJYXonnjWFKO0e59cnT2Q2rgchmGGmPvU
         9TnG0BFxQdg5lIwKYEXKiTRCR20UWIvipDKIaHASNfKeu+xX+ae4/J44eYqskzbDOfzL
         j5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792690485; x=1793295285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SpPolyfzJYMmE5VU9BMzMFqCxVbYb3ZUGO3YoElucf4=;
        b=qf6NwS0Bdtw0XKtL6LXoevd9w2TGyhMbp74zInzfp7AK3PRxvmiFwe2tMyWngjS/pp
         LI5h7CYAB0MxIgEF4XYIn7U0SP38p9NrV3NkpB/g5V0vo56+46DrjMuHUyYSF1zk+79C
         KEWStImxb6cftvFIZZMxLwSHhspp9jRYQd6m5qwc9/P4P70WwTX6uVekcXBavVqkt9IO
         Y0YOCFo8wWCBFDZCbMTaWPxHPwoCoGuvMRiz3H4R9O/3UoMOZrCqXd8ijL5JYdkoy8qy
         lFLLxpicTFqw+x8pCOP7K1nsJzF+d0LQNgj4jd/E6qNQFysIIeil9KIyn/oK7l2BU57B
         5D5A==
X-Forwarded-Encrypted: i=1; AKwUvBx8JsCXLvenESuoF1gOW9WviufX8AUWapJdBsXRgWkughTFifVXnrtfPg3ipRjCGnMHt5kSWCgMVVXv@vger.kernel.org
X-Gm-Message-State: AFq9FYJU0UBtGC02bwxx4TbSdeL/w0b3AWITBckhjr6S1FA8Slncx/sf
	lbOSTUBxTuANjglsp/No5WPWXZCRSoXRUDalbQAPuvl1ey591EE5RYpjnANriZF/FvA=
X-Gm-Gg: AYBFou16NpkYDXh6ODvQyzRKEHEmZeOGNredUqp0OeKQEnxDUEc4j7VDYFwkGNVyzLQ
	+dkpvAh4nME0vXYzpDidy3T47aDkTFfUjLqTnpDEmlHcHWG9Lg5GYPEuET9WMfWsicpnLyOABwh
	KawkeflWFsbxSOKxNJ7fAkbvOWOqZkXxJcbCcyVwddPi4zblCkQ+Sb9Et3h2w/YtXP5Pz8iS/Mw
	b7VMW8jokebE8d/tEAd8UhZjaCZeyuRMLqxAeH/MEB8fXsTHlCjVbrAIP8XibB2C9IK6oBkUezD
	mcceMpWx1Jq0NhVBPzbJbs/iJabw11rJ4ttzgfxq0hVH5koE92g7LM0UHcA4Xqcf3+A6VZ0R046
	lUotxEeEX0vAhPZbSsJZnBfHQ75Ond4eukEwGli6cqp2dsVYATLIBJoAsm+h8vLChEEYCchRn98
	ky8db4njBLbhmz8aC0SdTY6NlEjgbe91RTXy8lhdwMO2FJiG6kVB3IFZdy5pE+JlQuRBhqPJY0/
	9VRGXFQd4iKIUHR8ZUtxviU925QiKDg46P4fEw6mlBZUTV3MyXdxkUXJl407nPsu+VH7sPlsVnr
	OQU1HLcX3GIrNDnOC6DFOiTuzXkinp/1FQiFFqmNhH8dNTL4tgVI
X-Received: by 2002:adf:d00e:0:b0:48c:7083:be67 with SMTP id ffacd0b85a97d-48e264cf195mr9675789f8f.42.1792690484990;
        Thu, 22 Oct 2026 10:34:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e25828cd1sm13572410f8f.22.2026.10.22.10.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 10:34:44 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 22 Oct 2026 18:34:09 +0100
Subject: [PATCH v6 16/18] media: sony-starvis2: Parameterise the mono ID
 register
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
Message-Id: <20261022-media-starvis2-v6-16-374343f55fd3@raspberrypi.com>
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

All sensors to this point have used register 0x4d18[0]
to signal whether it is a mono or colour module.
IMX585 uses a different register (0x5a18[0]), so parameterise
which register to use.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/media/i2c/sony-starvis2.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-starvis2.c
index 15d5a066a556..b526ea3ce2e4 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -97,7 +97,6 @@
 #define STARVIS2_REG_WINMODEV		CCI_REG8(0x3021)
 
 /* Sensor Identification */
-#define STARVIS2_REG_MONOCHROME		CCI_REG8(0x4d18)
 #define STARVIS2_TYPE			BIT(0)
 #define STARVIS2_MODULE_ID_DELAY	80000
 
@@ -629,6 +628,7 @@ struct starvis2_variant {
 	u32 id_mask;
 	u32 id_value;
 	u32 interface_sel_reg;
+	u32 mono_id_reg;
 	struct v4l2_rect native_area;
 	struct v4l2_rect active_area;
 	u64 pixel_rate;
@@ -649,6 +649,7 @@ static const struct starvis2_variant imx678_variant_def = {
 	.id_mask = 0x3ff,
 	.id_value = 0x2a6,
 	.interface_sel_reg = CCI_REG8(0x4e3c),
+	.mono_id_reg = CCI_REG8(0x4d18),
 	.native_area = {
 		.top = 0,
 		.left = 0,
@@ -782,6 +783,7 @@ static const struct starvis2_variant imx662_variant_def = {
 	.id_reg = CCI_REG16_LE(0x4d1c),
 	.id_mask = 0x3ff,
 	.id_value = 0x296,
+	.mono_id_reg = CCI_REG8(0x4d18),
 	.native_area = {
 		.top = 0,
 		.left = 0,
@@ -972,6 +974,7 @@ static const struct starvis2_variant imx675_variant_def = {
 	.id_reg = CCI_REG16_LE(0x4d12),
 	.id_mask = 0xfff,
 	.id_value = 0x576,
+	.mono_id_reg = CCI_REG8(0x4d18),
 	.native_area = {
 		.top = 0,
 		.left = 0,
@@ -1068,6 +1071,7 @@ static const struct starvis2_variant imx832_variant_def = {
 	.id_reg = CCI_REG16_LE(0x4d1c),
 	.id_mask = 0x3ff,
 	.id_value = 0x340,
+	.mono_id_reg = CCI_REG8(0x4d18),
 	.native_area = {
 		.top = 0,
 		.left = 0,
@@ -1675,7 +1679,7 @@ static int starvis2_identify_model(struct starvis2 *starvis2)
 		goto err_standby;
 	}
 
-	cci_read(starvis2->cci, STARVIS2_REG_MONOCHROME, &val, &ret);
+	cci_read(starvis2->cci, variant->mono_id_reg, &val, &ret);
 
 	if (ret) {
 		dev_err(&client->dev,

-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283533;
	b=AUUYKVIzOq7gDvUL0Sk73LOXzmKN1okV8bJeP8ObvrB9JUKAlWSO613ma9HW9lk3Mw50
	 Tjf7WGr2l6k145jmM/eKP1/+/8Stw9OnAOmRLyUD8RoVATXRa5jqfh2AV83unejzcRqj8
	 mL97DDORnh41njcxoYhxdUyQpG3CR1bFjMCOLJgd8e0KBtC8tcxhi0LIRZoBZy6Uie7zS
	 NQf6A+CkN5hPa0KPPCU2hZDs/KEEbHNXVyQ/enNbBCXUI13M8krJajnXbioXSy33xpqtM
	 k4wj/qXyzzP6Hews/dsE6YM+017OXMViozHvF1NIfmSh9M3VYohBKX9Oy3dHaReSOFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=djTWxpT1ovKkbA0vbSvCTa6GvH4LLAvCDTO8fermq8s=;
	b=vRCWhC/cmOF9NvREaCjtFyChwZLa4GdqXJD5lKvgZT6O8ZChEVRyVYj21LsAHQWFcULL
	 gmnBBdn1DOWJjw3a6qAZuUIrm1TEO/m63dJYTy4Q+NApq++Pk0OgBV24dspUQIeOZTOsn
	 bW/xZLWv5JTWafcmgYHe2GATxxtoRBOz7u86SbQar0I9eSBDiYeyz8UrZ9Spphy82g5qd
	 bejHK/+HIDDVMoiOKe6fkDgQbsamdorUTjvTnxwGkkMj8gVDIMuo9YyWAlzZq+wClRfBH
	 M3XC/DMdKkRTsH38IvNVuQCozZcH4riESXZo8M5Jp28lgUcDgfbVe15SjO5AZm0Zvjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=QhnmnWsU;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AB0606B6FE
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53AB0606B6FE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=QhnmnWsU
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so11242235e9.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283532; x=1793888332; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=djTWxpT1ovKkbA0vbSvCTa6GvH4LLAvCDTO8fermq8s=;
        b=QhnmnWsUnRd5bHwtpI5KZOuYEAr3vXbrhyKeTMDPR0RR2Bb/SXnIyYtlgk3WZqHwFz
         brsf+OiECI4jf1kP3Lwmuy0QHAyQ6ityEuPefx/O7cx2C+sZh5CXhRYHDV1ZuCciE2Jl
         yObJ/XsNaFN4rPUDOP/Ft5HXC0jL92cfkWctTm/pnX6Z07FN4777+PCTpm2rh2VGqiV7
         KfEVlcHcoAjBoWrFfU9OsFkTScGslUgkBpRCn5gj2gr0gD34atCUcL1SyM1zncqgjNvS
         uX3N0w5FVggMYTU4xf24bSvkP9KLwlAvAtpPVRucZmzZmmVvT+5t7zAdpJYLMXEH0qOl
         ut8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283532; x=1793888332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=djTWxpT1ovKkbA0vbSvCTa6GvH4LLAvCDTO8fermq8s=;
        b=ZBkCm9dyKeKq+vX8/X9iblRBBwXdTkELIkIO0t/O0BXdi//KyzY2zHItcjfTvvdBuE
         okxo0nSymcz0NUzUeIRu5sScRKWcQla9gEybirqxwUCNpBz5eP5rxYEwab82fCL+1lOG
         U0v566m0LRVuIz99JbIM6/VjfUMYQCZ2vpYAWk68mn+CR4SAIWm3qmu0xcfu1F57u99p
         loo9Fk1vXh4iJnaMJzLqx7gyMIbNF4w885n2jIaWD+kTEAoOML9kFyk49/hJxzMrOIPL
         7TWIvXBOPq6aoPjORKthSuh5Mb81p3S7vgkDlCZGSnCH6iZNvh2CEzdWp8VRviy1TD1/
         ON7A==
X-Forwarded-Encrypted: i=1; AKwUvBzncEdy/0Mowg18XtU7j52m9qyBw2vH0r22vzn7rq3yKXFeVn7C9ZrrpYwsoI/xenTOlbRoWU4/bka+@vger.kernel.org
X-Gm-Message-State: AFq9FYLwhTeZgVOYUnvJWhqn0C1slg1LxMOJD9CCBizn1WnognfYVWFB
	VYirzxA/IIMUMa/717WiTD3UAlhRnQUmhdQYfveu8JihssEBoN6Y0jfDcXDp7MwKKkw=
X-Gm-Gg: AYBFou2fB6QqECA45RUw9/7U9wwnPsLXNz+ErkYYh3rQZpYooCBuRWUZvF+4IYspTc2
	51N6OH8TVvpNbUn/bfDHIEEVZK73MULqVwYcy/3PkoNMu4/ATPtp2cpdJMLJQBHTt8GnrJms3Rs
	XsqPmMnZ5GqFpWhr5fupvtt85OTlnlVPY4l5xai4zrBD7b5clWrAOTAjeUmPUBFbQRn/sNbejV4
	kskkLVBML5qCTL7XKX36CcjB5SrTzV4kcp9lJ0uOixeWSiQMpSKwb5hUbXHtHjkdkh21CmGo+aF
	f3AEzNFv9WzF7qOlbZStbfqGoReYSf5IsiP/T6/W+FTQo0pBMI31hTNJn6rxIF1nEw2J4nijFWZ
	xsHKdnNufjPl2T7cwY/s66vdN3hUGzonfUEbsaugJcjoXWehPpU1TOYlp8kBcBgmKaj7Qwt6qO7
	veUfy8mPeLNU+w3m7KSPWLtO/PW5LWSwSQLV/v5k5fEKaEn/da2xp/Mtp+BZ47ZSMAXlsf+PtOE
	f8zFa/q2pGGqPHVzu8r3sydFarJr3NDBTfffELtEtbxnQmWXWdBiegHA3OLSY6XIAswQfMD5xXx
	ziM1xD2vAgIR1JhlAJrz6sEbgKAXfuRB4cf17YuanTrAiFuaWeL7m/YlFzaVFg4SmAPDxrn0IM4
	4/aSWiHf9pvvVlTQw/SFheOX7XQ==
X-Received: by 2002:a05:600c:8b08:b0:4a2:1960:6fa with SMTP id 5b1f17b1804b1-4aa86a42502mr68687295e9.4.1793283531711;
        Thu, 29 Oct 2026 07:18:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:51 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:35 +0000
Subject: [PATCH v7 14/18] media: sony-starvis2: Only update bits for window
 mode
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
Message-Id: <20261029-media-starvis2-v7-14-b33a1332fdfc@raspberrypi.com>
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
index 645417cc08fb..e64d943369b1 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -89,6 +89,7 @@
 
 /* Crop */
 #define STARVIS2_REG_WINMODE		CCI_REG8(0x3018)
+#define STARVIS2_REG_WINMODE_MASK	0x0f
 #define STARVIS2_REG_PIX_HST		CCI_REG16_LE(0x303c)
 #define STARVIS2_REG_PIX_HWIDTH		CCI_REG16_LE(0x303e)
 #define STARVIS2_REG_PIX_VST		CCI_REG16_LE(0x3044)
@@ -1460,7 +1461,8 @@ static int starvis2_program_window(struct starvis2 *starvis2,
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


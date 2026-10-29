Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283528;
	b=4zeP+jyXacNC9fPOXG/lPpRs3TewdFfRyh3+GedDLWM6GZ9W46m0+Mlyzoy/FMVKIpUd
	 cmAIt9Kqph5nPID0rHRb7fKvcn9FEd2+NRd1PbpclH0h2f5E4aUY4f9j17iPDrfIuT6im
	 ggGiIGqB1DbZEZT5njPf5ZvgX9lSqtTJTRZUXoQmjMmGib9U3cpQel94HNtSdsPw+KnF+
	 /wQfOJM7mRcscdiDStc12FsWwt6CG5hFeedWT2tV2AWL1gn8y5HsOybMeiREjxDmr9Ewl
	 NuiN9RKexgPu6+5R6Lhu4r8iyVxMyhBLnmk28DfKjJv3jBGZnAOwNtByYHDAicjAi4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tHlWMfT2Vn1jhxwuk47U/QSe3Sx/Rh/6scTTXAvnAJ4=;
	b=BZG8ocVPziSUmoJRaHScXzngXfS7KSLiYlItve8juVumnYp0IojmqZ03P2I8nvuSIQKN
	 AmsIHkAHaKmZDGj5b0WkqWNY/o9Qclfn8kFXmPH3ZUTjWwr9ItCpR0bTfHZkFlbH4sdx5
	 BtY9QL1EjTwh2HL2v0CjXmlVVEdPsBNSKFRe4hxF4tsMfvyMvRNIxwguhbZ9IZkfpBTgg
	 029726EA/nCk3scpu1OXCpYTux7+uyHJtytL9QWLerIPctrGkHGwwVgqFCf2iHJkzlA8I
	 kGOgtmjN4nTfjz0V1SSr5jpNPv0Ofw89/Rh8a1uQdkzF/Scf6pZPI5BLx+TxWzTElMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=raspberrypi.com;
	spf=pass smtp.mailfrom=raspberrypi.com;
	dkim=pass header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=bWm0dQkz;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239DF60A381E
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 239DF60A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.a=rsa-sha256 header.s=google header.b=bWm0dQkz
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so20760885e9.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1793283525; x=1793888325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHlWMfT2Vn1jhxwuk47U/QSe3Sx/Rh/6scTTXAvnAJ4=;
        b=bWm0dQkztkYizwWCP34VIfP1DON5PvhHEyCQatuotCAcG+azmFpZdBMZTGIYQ5fc7P
         0iEx18wENBbiDwBfY/zYvdy8/Wa4Tvkkse0kL71/K4HC1cmUysHdMIXtczIh/pmaLub2
         nWIVHUwMKFVmEV0+NClbfKESCXh/4kFQOOtU7gj3gs6xUK+GL/Mc8WfOq9Ness1cWRIH
         jVPGpGEuCAY/7gc5hTvZq/2YwccMq+noBCbfmtWmavp/hmZYyrv0Lc23mmIIeEWAeYHY
         ELNX5An6absThM2aEiXDXCzCqmDqtaHlzeprqmqHTyeywocs76/WICTqCyPTk60rxI3w
         8xow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283525; x=1793888325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHlWMfT2Vn1jhxwuk47U/QSe3Sx/Rh/6scTTXAvnAJ4=;
        b=YhvaDRTADRABcoldTO2W7jnX2yILeGhXXwKSFz3fnOD81gvr22Ul2Lq1IdXHBgtk0I
         /lswVXdLDndNGjdfSmEcPF+Kd1R7JKhnw8U2ESuw4nyRMALpoysaMI26TSKxY3Tuik+s
         OUT8Vz17yoIr6s2dg9Yyw//E1iWZVlsvtvOtZisDt2PPxOHmXFFYCrl4bmUMmtjNlK12
         N66ytZnzXE0Vtjo/n1UI+wtV44Z1Jv16jc/h7nLqXMvl06yM1k23Osabgx1QwuGjMeEG
         rfNVZx1AlrlYSOfXIl0MUjf7O2BVKit4W+T9kJdSGaikXBmEwWWDUCHHRoA2dvBTP46p
         tvHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzr0UZmFaykb6COt+B9XW/dsG3pf11ViCu+Md9jhiJm80p9NvQ2l+pT/rfc5elyBQALxhN2UzTTDq6j@vger.kernel.org
X-Gm-Message-State: AFq9FYJhrkUuZH7iScHMYttr2aGofAU4yT6KFMiphAJRBWaHJmj6N7BL
	j9eVvS6tvvLsnuLd8TlAPWgd59/30AnsIxOA+F5RmczD+8QAvQ4XRP9NO4YxyLXjpAudqZEmEFg
	vm/g2lUc=
X-Gm-Gg: AYBFou3uT1GMKv3d5xk4b3ewXgIDuAx/g2bKDJKwFQchdvxUj7DTjq5ECBosXbdD3K9
	OeG8cKSWTOs0/KBwToK7r5LMbxz+o6PlHd5BuflJqTimuBpYpX78OBg86BwyKRMx+Ea7C2W1kzP
	jhYvXNEk/Ot7vB7Jz+rHAdxsBTLuCutbUqRvFZYRcH2SX14NfOItFOSIo1WwEp32z75tVFIsczm
	gxnNI6krKf+Pu7i8dm/LXk7kLnGNV90x/zfRn6Y6tazVOYSj83u5ScBcJzWiwkftporRItK23m8
	9VoazTV8TUz12FtsvW6s4AVQsVXv/Ex/34F8LLPKQftJJqH1ytUjx85T09pYaLcCN36WD5sybia
	QuibFiKU7tf4mLfE97fqjH7FOcr12hUfczo+kOesG8J2ugPeGBoHg+WXCV+zZoz0ciYSY+U1AMR
	zFUv65qiKFWIJ4gU1Z4o3MQkCXgT0ERFFeU5Wdvvx0PVg3X5g5EZ1Ye6+gkDxAQfUruwy+bupbX
	bHnd5zVRgTHBhnGoTRVxATWC1DhnYMx0nMqG3Sgke7ySLpQz7kNNr5A6AmJE/5yBkUKJzrtxSUM
	RfJ06v7Xl/ID/LBTOmHZFtKU5m519usJx1+CLne/U7sQM3lPawW3BNOV2XCqFqDm0E2vdTJF8fT
	7Z+e7
X-Received: by 2002:a05:600c:810c:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4a967e8d6e2mr126926415e9.28.1793283525362;
        Thu, 29 Oct 2026 07:18:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7fdb7691sm66702755e9.11.2026.10.29.07.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:18:44 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 29 Oct 2026 14:18:28 +0000
Subject: [PATCH v7 07/18] media: sony-starvis2: Correct the exposure range
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
Message-Id: <20261029-media-starvis2-v7-7-b33a1332fdfc@raspberrypi.com>
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
index 340f2ff0ef87..84f3978e1eda 100644
--- a/drivers/media/i2c/sony-starvis2.c
+++ b/drivers/media/i2c/sony-starvis2.c
@@ -62,10 +62,10 @@
 
 /* SHR internal */
 #define STARVIS2_REG_SHR		CCI_REG24_LE(0x3050)
-#define STARVIS2_SHR_MIN		8
+#define STARVIS2_SHR_MIN		4
 
 /* Exposure control */
-#define STARVIS2_EXPOSURE_MIN		2
+#define STARVIS2_EXPOSURE_MIN		1
 #define STARVIS2_EXPOSURE_STEP		1
 #define STARVIS2_EXPOSURE_DEFAULT	1000
 

-- 
2.34.1


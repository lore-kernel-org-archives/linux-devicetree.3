Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282017;
	b=ADwnkar4oFz/dC/A28lAhCR0T7NsHHdiVVhqtLiG/zTuHAyt3F6VAPsMmhRBzN7P9iNF
	 0ZWEovLBZpllwK6NzfghnEH5VGVtumNxQzQi6YpADYxMpvIUUZvQasEF7faDUC0vwSG+4
	 FILP0wmcUpDfoFVWitYcT2nOKST9WlyAq2G12sEOHZcibyGcyN1wEIAsRb67MK9MunyZd
	 muHWWNuFqq/jSlwwhXXlESn75kKYWR+v8OBmW40E3rGtDG+t802qjsT3YGlZ11ohomqYb
	 Ww1eKrzNryAqhlvN+WFURCBllSB5fC2+4wKzgjM0Q6Oa01QKLX+ZXra1mRjNxRnlZiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hjD6VzzjtnD3e9erzE1FqqRgAbYyuZXKrgqZLwMhAKA=;
	b=PpVczUT8F+WFoV7i8Xuuva/EGyrV+e6H1dK7NpKtYdbaD4EXfZiUXrKHMm+j0ucbdhoO
	 JhUGm7dMQgo5DVRvncbxK9WExpnN3hjCunHHIvXh7lJ/SZPbMetxV5DRVPDt1imAILsjG
	 /iK2cRPb1JEDU5E0eGUZ3vKadXaouAUabXxySlTB8TmZkQ2JcNeMsRgTDBL2s0Yitkbsp
	 3NZyk4iwW4Pb1ZmlFeqpfPy2+XcFWjO8SYEeY7CiFDmdOlJZUxu3eccDeXBZjIJ3Mnx/c
	 dv+qwAKPp9ufHAlarTTs1uxhED97tuhL9LIiw5YaG0ZfruwCQPdQKkiEC4csD+sgw2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hld8WdFU;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807E0606A832
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 13:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 807E0606A832
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hld8WdFU
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1626258f8f.3
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 06:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793282016; x=1793886816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hjD6VzzjtnD3e9erzE1FqqRgAbYyuZXKrgqZLwMhAKA=;
        b=hld8WdFU8iJeyCtWh3V2Ho7fyvq2bd03nxb3Nx3hWjyDrA6+5fRApkMZc6Uct2VfyX
         f70kgogI9V+CHfRJ1i16vKgQ+RmwJ4bwULneAe59C4t+etSmEk1JX5IBD5arLxiu4yvs
         kLcG4jH4XkqeJBpodUgbE9xnrb2fwwBBFxpKnm1Uv0P4P1x9wC0a7mm4R8N1rWI4oszC
         c0pYM7NN0sVZP37MD2AQ3hAlklOonTajnsGRh2rqD4VZNXczAr8jBovQZfuawAH1+i+T
         H4KgDlPghGW5iWJrZrAE9I24pysLb5rGZwkYdwKZkdVXdAyTsLi7BtkdAUQgw/h4FRdz
         clBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793282016; x=1793886816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hjD6VzzjtnD3e9erzE1FqqRgAbYyuZXKrgqZLwMhAKA=;
        b=WrYfaMDvnTqeH8S+r48FJBK7ocSgmV4uSOXloIcwvXUyPtcjh7+P2VAlVSNMzTMnp0
         QN2KDdC5dMv04zjRYAy7mAx+hc7lql1wMlMxB3kXTQRx9safBXSn/y+JIBRnkagFmqy1
         aNvLb0hZGI93xQJTjKP++yP/nHZlGvseK412CqjiHC31VxDCiYq5ifB2gcZoPGxJHdzb
         eXyBq8L0IujTRuln9U/Ey4ooD2m1WroFNIwYAxzMw6c7gGRPlNY/rz2qJKbJ1Icl/5kQ
         9I5HaveQnh3y0AwGThOOPKSuGjqkuCIK8vVKqmbHxmKDjqXIynqCkHd1KmlULb/bvrL1
         fCeg==
X-Forwarded-Encrypted: i=1; AKwUvBy7Ni0aJGSxG88ZqXdZ4npKM9r3UXc3xp0BvPucfHQtBYjfJKpBoVfcZ1sKFrnDtRMNnppFyvp2+hDy@vger.kernel.org
X-Gm-Message-State: AFq9FYJwwHspvOPudtPF3DuLiWCaPGPcmhorZ7k79dip9TcFGqjmdLX1
	CAGQT/QGstPcv3AJ/ZsrOlYQKm/ACwrOREGDe+364EaBUCpRTT60u3Y=
X-Gm-Gg: AYBFou0UoDNhhU6GPj5Mep6SGBJpaa4i4vbz5ZME4QPOk4nZerJSyGScYiWYBlNKPvm
	73/7QpFF663M/YjtbrylHP4sYTvQwDL3eJpf3aL/mwViYDYoGhJf8nGeTeKK6A1CXpsvjLwVbKi
	lrQMGRqDbWMYgooe/3rc5lxRzV/XTXz2a6C/fBSNVs0xIa82tUVSTwAgcQQuE650VtPgXrbU7lQ
	7pQGcNgvNBGBSiIV8jABB+8B3bgvKRSuWsL8WQVT0J5G95L0GGjqJqW8c2vDPRXR1RAILve3Aun
	8TVfPPpCsqqNMv9/AuM6WqP7ghSU/vRrTmjyNi4MRxOiVLM+ZPxEHzv8HkijT15/3hPgDqqfAzM
	gdoS62eUsllIf2N4lN1rWH8g4TLFkhFaMcpkGamqTdYClCPmasBXhq1deIXG3/ofHIQQgd4t0Y+
	hvMPghLM+lOWseRlE9bwndEC6cB125mwfWZXnUF7+x4TA2PXbMU+l+JfSvUY7XUe9+r0XX6qS2w
	QxQI8m1N0IuIJbrjy3yF8VUVPmkNzg8Y8u50SGHNHfQpqhwFlc8eS7QtHeRGr56I/W+tyNCotFC
	XYuXzAMy+3K3z5qBmfd6Hx4t/zGM5zS6+JxGe4Xrv9cQjLScHc/VxCcGvHuA3pvBj2I=
X-Received: by 2002:a05:6000:178a:b0:48e:56fa:9645 with SMTP id ffacd0b85a97d-48e5d5cf38fmr12439039f8f.29.1793282015845;
        Thu, 29 Oct 2026 06:53:35 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm33456468f8f.14.2026.10.29.06.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:53:35 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Thu, 29 Oct 2026 14:52:51 +0100
Subject: [PATCH RFC v2 14/14] drm/msm: enable LPAC on gen70900
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
Message-Id: <20261029-descriptive-name-lpac-upstream-v2-14-a21a5c850961@gmail.com>
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793281977; l=982;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=zftBrxFOdArPW4SDW/zPbLM/dW8N0ZZjr0f9slsMd44=;
 b=drJK44c9MU6MO0yKK3/YNJmZlff0GX8bkfJNHj78s+gEdYZMo0J9ar0ZFCpDUnU9s9p/mTv9U
 QEVDlUzSQ7wDLCQ28Hd4GN503IJPB36U2UQmXnTQDK6NcMLz/o9Mfkc
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=

When the enable_lpac mod param is left on auto (-1) LPAC will be enabled
for targets that are known to support it and are known to work.

gen70900 (Adreno 750) is one such target.

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 5ee00eead14c..cd1bdb54429d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1591,7 +1591,8 @@ static const struct adreno_info a7xx_gpus[] = {
 		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
 			  ADRENO_QUIRK_HAS_HW_APRIV |
 			  ADRENO_QUIRK_PREEMPTION |
-			  ADRENO_QUIRK_IFPC,
+			  ADRENO_QUIRK_IFPC |
+			  ADRENO_QUIRK_LPAC,
 		.funcs = &a7xx_gpu_funcs,
 		.zapfw = "gen70900_zap.mbn",
 		.a6xx = &(const struct a6xx_info) {

-- 
2.56.0


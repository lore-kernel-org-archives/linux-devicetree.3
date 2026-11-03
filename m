Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691628;
	b=OWsjgHupdsj3UGrXNmggREp5VlWbdWrtzqTdGvB8wwM/7vu6CWW9Nb76X5q4BY0GblgG
	 C3oW1WKtxE5lTrKjtsSxmzMin5UkySMuwJ+khvXEh5AR37HKr2FGlyR5aLo+E3hEcwplT
	 +gXtwAdR66GqcJX7y2DquAYkfdSlCIn5NovO4NGFiQsjvWLrU+ZNAFVYzMq3s6xJ6tDuc
	 SVfN/akKnrCECb5q7+65fc6peWZEF6alfZrQSvKubwTau+czE1bhLhxaWK6SjcErdtGV/
	 BlYBr6O3o9yW/udxRGxqPUlfFSLVR/hpaH7S2IFgTlniBy/jkrsPA+gO9xKxiUFWv7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=mmtXF2bSbpoZgrl8MkDJGo7FkTgbo/JQpKGhnhw9Z4U=;
	b=WYPZGLQkrUC4NKsxO0H421fAnqgxmM8idU2d08d7hP4YFkYFbTKLR0OWyZ3zc2a8IVJZ
	 SsVzM0I+qnYSnuaJVAXMJXRGDwciITIkB2rECluDC2Etm+cwhQhdrUWT3ZIsi3AiAGfne
	 imhWH5c+Lo9cTJAwke8eft9oDih8lhrruWvhPyfhnUmxU1aM6vRbs6PT4wLI+/CMk1fAt
	 pKGJ/7fH+MkovOx7jvt/RC3aPHQTlPDtfUbcm4rRcsFvjeqcBRn0In4OMdIbA6HZ8PIMv
	 tQt1xpHu5+JEnUqAV7bwNa1nFO9Jx672nf/hFfvRZ0zoz8ipVw4N1EibhM6rZRqBQfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XeOkfA/f";
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD84606A32C
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 07:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABD84606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XeOkfA/f
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso1381201a12.3
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 23:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691627; x=1794296427; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmtXF2bSbpoZgrl8MkDJGo7FkTgbo/JQpKGhnhw9Z4U=;
        b=XeOkfA/fAqBzSShYzfpOx39UkrurJiIO01aK5E0axVU09Uw0vtTuHat0FCX5ROsS6q
         fC61WHrFE8JCGkUpvA4ha+nId/wpUuoWt5M33bt+2cIqx8MrR8jjnBIuuDjgg25wjmTU
         aKJY6MBupUMNKWywpotET5/x7QQJgMddPY0iXL4+2paricA5YZLpnpi1PjLBkSmO/UlD
         hOqrhbaR7uxCSrTZw83e7TZ3Vyp1vfBR+6RBRGx1f90++1z5g4xe7GxG9PhDttohWgyn
         XtjYWmWscF2Cdz+NZXpGe/v0MkgLri9UVnD9/hXoxh0mkTN7kuygZnB/4FuVILfsfdPO
         MR7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691627; x=1794296427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmtXF2bSbpoZgrl8MkDJGo7FkTgbo/JQpKGhnhw9Z4U=;
        b=T3v7VQACX/b+s57rWNaMnTkrzZ0nc7Fds1CSdVm3EcLEG3QCFmCcelCa441ylM7zLk
         swyeRkCASpCbmdyKEuT0jwilhOalvtuNyGTj0PceVTvuYJOPkmn0zYDF1JObDhaD1/Fl
         RM9Oypyx00mxZe4vJQFU3ELomMWACSR+5/M9ACbK7B5x/VwYsyM69g8w21lRdS53dl5C
         Zn7JxgFfgoCj5p/zAgvsijkhsF2J/qOCqHBcu/tTUPsDWftA/ePZIbVIBPiNMr6R/63a
         b9mpttEvwUb+5Ljt/IoPdse77KpICghEBr/iCkftJJG516h+l1Pusx2IHrvDHvOlZjKp
         e1Xg==
X-Forwarded-Encrypted: i=1; AKwUvBxXzz6Kpdz+uz+LjUENCZc9eThgEYu+xf50teM9IXIz4YnGVpuq2Q5rXy1GtYfhH0klZ3TGXnuea4ZK@vger.kernel.org
X-Gm-Message-State: APuU4Z/K9hWPR11bq0GurAYtTPQ9d5xXt3aME3UJgM54Rz7hsStzLY9a
	wqaHe+YoE4nw7UWSRxe3QpQTRd/BYexV88KH7I/AFwkx4R/L50KF6Shr
X-Gm-Gg: AYBFou2UhXc6390yoYQ2kWfHkrqAF5kwWzg+l9mUJ0m2Zg5kxcIA5OkdyPqtsANPmeP
	lZmT2u2tQPfAwJRJDNC7DJ+WepL40kOd0nrm+6jIvP1IwTfEdnK8XEJrAat+Lad7RVYjm3jrep6
	l2w09JTELUBmmp888uepSMK2xHCS1SK+kb63IQPpbNz4wwwTYDV79motr/ZCZ3rWd5NuRa/tA4t
	23RyZl3fRnsJggA44P9WVru5oVbCmfpl+n3zhWW10tRSeQFJn6gXRbuhfwXF8GcsuvlSBacnVNy
	mVsSmsDgxVSx5/iCmxmBosjR8jdAAjfDG4HuflMfEoJCFpIf/jRche9tCtInBYXJzN4t6qvcO03
	Y9jW7Fxeok5SYPV47TORPgHWWek14DlYa+JHmikh9L+IB2arnsysvLV13geI5JETkExo9uur6SP
	H43015o3wcDCfjzLpSMN/lhei1ewuF+TFNdonvyJ2XQUeyDkS9r42Kw/JePM0f1k9KJOzDFK4ig
	/M7yjWj7ckWRBiMZEsyxOZ62yXbbrIcmheVwlErDrUU/DG9PmLDeDDDnXq7NB4zwHT/j6kbyAdY
	Fi93d9tcnrHLQGSfnuraAvaD1+kFt0MBb4VCcSH/U9/B+/bHD33gPXVeWr/GaxN7HiVdaNIZnol
	zUZpQLmKUKcL4kPaWI+80BBuv/BSLbEcbKG2PLApZHCODfr9PLVc/2OFuV5Wkz22Rt76mwVdB0e
	ctlWQ=
X-Received: by 2002:a17:90b:35c6:b0:39d:efa9:cd1a with SMTP id 98e67ed59e1d1-3ae89536bdbmr10927084a91.4.1793691627024;
        Mon, 02 Nov 2026 23:40:27 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:26 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:50 +1000
Subject: [PATCH v4 02/22] ASoC: dt-bindings: cs42l42: Allow referenced
 dai-common properties
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
Message-Id: <20261103-macaudio-v4-2-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
In-Reply-To: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
To: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1199;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ryTg7qu92xHmjo1HEk78arPtD12ewJvnTCmnNMpKI2c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+GpzjrzeRvYWVum1gj5HNzyuvK1hVdiudFLu8N0
 n3S1ebdMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOoLSxgZrl/hNrrKf2TVhzo7z237FA8e3jH3Nf/qtR/St39hfNBQ0sHwV3TNTE5
 f7x852/mjXWfWXk/xiHl+5AhnQ2rTYwn9Iv0OLgA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

We may need to define both #sound-dai-cells and sound-name-prefix on some
machines where this codec is part of a simple DAI. Allow this by refrencing
dai-common.yaml and allowing its properties to be used.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index ab4c7d22dc0e..4ac0af34c464 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
@@ -9,6 +9,9 @@ title: Cirrus Logic CS42L42 audio CODEC
 maintainers:
   - patches@opensource.cirrus.com
 
+allOf:
+  - $ref: dai-common.yaml#
+
 description:
   The CS42L42 is a low-power audio codec designed for portable applications.
   It provides a high-dynamic range, stereo DAC for audio playback and a mono
@@ -193,7 +196,7 @@ required:
   - VL-supply
   - VA-supply
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.56.0


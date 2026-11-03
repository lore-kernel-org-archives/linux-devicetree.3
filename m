Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691619;
	b=YAL9eFvguOSFztSyYr6eiXpJAGVSLMpuGV+MVu2vh4wo1VgdMzIItU8LSauDO5bn9KJE
	 C7lTGoV2f81yiHUy7rifOJy72Z74AMLAkiXd2DkrniUaaMUY+gbMGsi4I+o9yVp0/5K9z
	 vRjI47fFZGlLT329wG4mf9D2AcXHwGvXQg2596988TsGLxWdh7UvXiflUoKMrzUKqC5u0
	 pViuGQDkxyZWOAckphbNEvKSJH1TJPBCkd7X9vAnflrPW7uPJ0rTTnJUVzxi0y17bojOX
	 TTmZ/wYM6efM/HeCjDqXmaLmxISgYxXBAo1MWc1Ky3zL18kHrasNaGlMQeg02qigLWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=it6m8qrTkEtz+4nXGTr5C/zZdhn9ou1DiPXIBD5lLbQ=;
	b=BMfDURcSAfvINmHEtluXDVVe9mCDMpF16G47jQZkP5QR7TSF2n/+xvhB1HJ+ddr4vzj7
	 vvNGykPRPllVhH4W+7zhZ25l4bQT3Fw/Sj4i2dqA9aNBmDAGM8W0FkGHGKOgzEybAS6LL
	 lFxby3Bu23rJQvF0wuLz9GM14YpAT2XrdvU9BFWKwhQ3GIQfXMkCpfHtJilKOV8SOxyZU
	 0CvGPl+h50UsxSEN3c4zVEYu+bYWXMNhDmRKTVJ6/Yn8+nsDxl9nWPCQg02zaqZar8tJV
	 /4trtiRK+6BJfw5vK6YRLZIXvMm1iRzdDxi8BcgTI/MPK2WXPykjw0dp82k82Ihbzhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Fcs/g6dF";
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD0C606A339
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 07:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CD0C606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fcs/g6dF
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so2311632a91.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 23:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793691618; x=1794296418; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=it6m8qrTkEtz+4nXGTr5C/zZdhn9ou1DiPXIBD5lLbQ=;
        b=Fcs/g6dFSc0b11V8fn/wq7r2uXy0D38y3byPrfbxvZGznF7twrxZGCSCRURY5NAujW
         HOsD6jLAkwaH1TDt1pjOlY2U/S61MxsqgnN3o6T4YsjX4S/J+azOIsHazafqMTcMSAah
         vrsTyf3MiQUJPa8phLQ2SU5sRoFih+/ZCfM4xuNh9n1i+/L5Q3WMi/dYztiPMsMK1Y+H
         IMrv5dFGa12oXDoljzQVpc2Q9DR8ca4+mif3roiAK7aqILRF2VsBGuF0p0A7KmE4Bnaq
         cZRcH7YcrwBHYUBGhCylpkfFGxar7McVGJF4Q73D5655It1mqbUIoKN0G5fsda93ugJY
         y83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793691618; x=1794296418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=it6m8qrTkEtz+4nXGTr5C/zZdhn9ou1DiPXIBD5lLbQ=;
        b=cCfX0kMq5GKYfOcgBoTdRQGl0oWVTeoGSgv2yY9RzNi4z60DJLbaur9mgs7PHDGZiP
         9IQS8tHEjs4OtBQz3hV7hVN/6Io5XX7GAvR4FRtCs1wg/klhxptrksdGcOFrqMOo8KLJ
         zioYfzulW/DycJ17QE37xnD8EEOAChQlxI6Vp+fods0Dkf1bs9VGZ38DF1JLw8rjkAU8
         dLSe63UHOziNt00fcwMrzrSUdFFDhwmbdBk+sSGBECfXDEq5EZS75s7cvqq7Mq5a43RE
         ty4ESTo4NxnIRNlaD4eA5J/i3QSPwqjKAz8d1b4jo9cbUY9R9ElhSWvXYNEPVBDJI8fG
         f4lA==
X-Forwarded-Encrypted: i=1; AKwUvBybCa9BY96HhfsLZWfRmd0dbICyyCl+U7IQeLfbIPxzdbc3KwFNl/PDZlEIwR5W+U+d47inqO4nPXKI@vger.kernel.org
X-Gm-Message-State: APuU4Z+kEZaymnRJOv+S3ao9cn4yAUB68uIOyS+4o/4eMInmwXbzofwy
	sj+1VVoyUZQrUi/X2cfTciwf/SmzMTtcJELTlVwdPWVE/1QfLhZexfp+
X-Gm-Gg: AYBFou36IDzOwY0n8QsagxBqKMVJtUnJIMxR6/E6TOPdC6UeFed1JQ05SMqzN/Xqd/5
	g3h4hjj2VmjxZIvSWZ9EOW55EghSAC04/YlQ0DCNM8K9JPCgDwtqrayBP1vc3qbdd3yr5IsMIl5
	PrGNaXBSPI3N9TvZLQc70UC4OEdU2GCghHoUqSe4rXNfCD/gXzIzRCHgFBGILHRqgkLhD75L1sI
	FHW81Jm7xUdsFxMY+0ph1hx8UBMxE3dupV6Qu+N/emsIA5/JGNHIio3kOOLTXLdZkco2CQ8NOSW
	GUcRkugQANVsWrVbs5yAWvIaa8MnlrPTrlQ7a0R7EH4ASQK3qnY7AJVmofrAkO9HwlokQHOpCa9
	obwAThmGDT+mXhrZioQf4XSJ/x/wI7Bx3Mz+5SDa9WBa9kw/A5cHTnyM7heHuWwylXwzxk9vnrZ
	8Nb7ej4LRMRFCNNlTIfyFj5C2Gmnk40MjHSTGZTb72gQ2z+ZDhlN3alANWKjO8ttM62ZhcADEPF
	t/LqEKjl++FQglJqaqMf8+TDHDwn2MfnlkPn/LUrVE/38KyGInxeDTP4cVNoovHNOuV0dC5dj8T
	ZzWW+r4EFU/YUTD65Qn6AcDU3ksVomph8zn+EpfNJ8Eh0lnPQsPh6wTYwuphsL9/9irVxRuRq52
	INVMGK4jSc1A80ZFuMLJOlNJKeUUXy91j39fEse//JwWaLvHrzl7P5fNVBnNw6hY2hGlK8T7S2V
	N1BtU=
X-Received: by 2002:a17:90b:380c:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3ae89749415mr9681387a91.29.1793691618392;
        Mon, 02 Nov 2026 23:40:18 -0800 (PST)
Received: from [192.168.2.34] ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm2956769a91.12.2026.11.02.23.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 23:40:18 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 03 Nov 2026 17:39:49 +1000
Subject: [PATCH v4 01/22] ASoC: dt-bindings: cs42l84: Allow referenced
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-macaudio-v4-1-637484efe46d@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1294;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=fSXLE44RdgYerdaSvSI97z5S0Urixj0efXODzvWnMbw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFkv+8+uzimxE9rIuctleWOHd6XpBtbrKs2M2dzt87ke7
 DI/p5jTMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmOr3DQz/02ICznJcm/+k9ciposevG2vm7L/yXF3ud8sENTubx31fbBkZVsRWc1z
 fEHvLY2916xEr702FD3vrZ8gFMXfwbnqoa3eJHQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some consumers may wish to prepend the codec's name with a known value
to identify a specific codec among many and set #sound-dai-cells. Allow
this by allowing referenced properties from dai-common.yaml.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
index 94062c1d9d45..66cae8b7db5d 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
@@ -9,6 +9,9 @@ title: Cirrus Logic CS42L84 audio CODEC
 maintainers:
   - Martin Povišer <povik+lin@cutebit.org>
 
+allOf:
+  - $ref: dai-common.yaml#
+
 description: |
   The CS42L84 is a headphone jack codec made by Cirrus Logic and embedded
   in personal computers sold by Apple. It was first seen in 2021 Macbook
@@ -29,14 +32,11 @@ properties:
   interrupts:
     maxItems: 1
 
-  '#sound-dai-cells':
-    const: 0
-
 required:
   - compatible
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.56.0


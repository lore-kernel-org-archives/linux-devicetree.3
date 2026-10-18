Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E682D39EF0B
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 05:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302884; cv=none; b=ecMNgIhM3aQS5I39FMSIDhkeOA3IMGWLljKoQCD557yBELxFhnTMyAz1PlwJvfmZSCkuk33R38GoU1hK9BCY5sG6d2Nk56EsDRrjBYUebbmxaOtjwP8E+UQC4pVdUyL5nRFTXeHRq2g+N70+gttNbRPYURzU6mJ2O+HzpVgnewA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302884; c=relaxed/simple;
	bh=vyIYXeTvpK7D1QV50HT+GFALOmTzN0QImSyZ/l8Csqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OIzNzdrOK2WCD5zRk+5R8gJsIqkzMfTUO2WZj2Z7QmCsP/ApBNViI8R9vu38Z5txHLcaTjcC2XaHXcJNyWvA/mFE52fwZl52cc8vYaJZxfoyo7+fquG6X5hmmd3+jWKpv3pLazQl6ph3tCe18o9zxg9qsrq71wfCjVCh+xghfRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dK9P1nZ9; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dK9P1nZ9"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ace9e6e1a5so787162a91.0
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 22:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302882; x=1792907682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pWsmmNgQyuC4nITyeMHO2zX1yCotQ/f74LykMNCcqF4=;
        b=dK9P1nZ9qsE0cYr2YcaJBGmEL39LHzBLfhUcxMXL7QJVJ+HMHmtHnpfduKhXJQjoiF
         H3tpOCfxr/Ob4xG8P2HtlAWC9oxp29n8J22MRjq5ZO5SPot+1PjUVeyTgoGUPc6MeWKi
         2u1HQE02gOTb7Zsv4jmJtEIFr4TOMgRGi1+yC18pu4DMP3edBbBHFnahTnycafPHaxfw
         wQcfv4xg50XM2aIEEFFDYJ8GtQvH0n4dRp26UKMkp/LkNt7C7orjXNvzKuCjOQPZOdTo
         llcDFbiNrvyRH8UgYOKrJykxqrImdj+g7QztPNQr/Gf2IXl6RB1QGZXak31OZzuso4N5
         U71A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302882; x=1792907682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pWsmmNgQyuC4nITyeMHO2zX1yCotQ/f74LykMNCcqF4=;
        b=14ATPRit2KiXJZECg/pfVuWsNDYhNGcB8M76bKLl97n0v/EFSh0Tzti4jVJSNZ1Bzn
         +wBnN37grFV7vB8/rNbUjkPRDmdMPJrpOR3PSGTo5uhepV/rSJZolag/pSFtL5n9dUUO
         RvNBMJQMDLUHlfYKmFI1SFsaRl2VE3dyC78OjyQowkN6mUpY9I8L9uWhpUL/7+WzcFwP
         pCQHEKCeEnqMlnVc2knW4wNClnYiUMGbtujggd7luJvamaic8Ln9Cb2AfeH1dD5A7vDb
         psCr3PsHuCoGkTx3CWRIP5+tSYhWdEifZBbxpBmoVXySO4DtIH/YAc12REfdtDgGK9MU
         JGWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQt5WsY81nlIVvJjxk7ih7hrD+X4u0vGrG+R6gzMd+fc6We0KZ5DdTtd7Z/nJurwWXVxZJsYoMjLn2@vger.kernel.org
X-Gm-Message-State: AFq9FYLgB+K1Ztp1DdhtYonYOSJb+zWix2U/+JMucyQceODWcTtqIrzm
	HmKMyfpQw0JIgDqrHXyelxah7FGh3sIlBxM0L2CQvg2IpQuj3k6fiDAk
X-Gm-Gg: AYBFou3MxH0wZjexHsMqJAtaahswWoH3IAd5IJVNGfouGITUiNDF08NKcBzvwcHtH3G
	ToYWfqzyQwiLn3BAchE7bNG4YREX5dt10jK1gLukz6zGex4cUg46hsxXfXx2yQ/V4xXAta/v/cA
	u1q6atY9exH+eUluHONnnjRxbpBDIhbWOlYC0drxGHb0kd1xnK1wH24bTFCNgp3/CXGIOgo0A+G
	CpDjClxLYwvivu3LzSGsMC4PioznpjgrNKGYuBJhvQsuCDtlMWTaWBtHmMRFesg+6WOzSzD1B7S
	x/wcH4L4dK+JUzyqInJSq8btLoIFSW2L7JTAyUnYky9CRKuuBKU2cjvcJSQvVEGmyRBHcv8qVUG
	mVJhN8uKyRMpkLkkH4CvK2QnUBTU2hgwUMMejlxHSnHiXMppy0WUncTuLPowztzgbzYBNZzEo2j
	zViOt/7DjwRyaNavo6+cWzxiCiBCicn8jJsGd0rl7WWErxneHiX3JSve3wnKvailoQDWLka4avz
	qWGq5qQob5mTqnUFKPESeVrL6UuBSiZW1ByY7zjyc30Y+F3OMr/SP4z4gnRlYup7Jc9SYDHZrm4
	ZptuGFLIuzjUyV6NuW7gI8iIe9g+ryCFrNdHOmv7mMr3fw==
X-Received: by 2002:a17:90b:4a45:b0:3ac:b6eb:e0cf with SMTP id 98e67ed59e1d1-3acef5dcc94mr2797709a91.40.1792302882329;
        Sat, 17 Oct 2026 22:54:42 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:54:41 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:53:55 +1000
Subject: [PATCH v3 01/21] ASoC: dt-bindings: cs42l84: Document
 sound-name-prefix property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261018-macaudio-v3-1-abdff7741dea@gmail.com>
References: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
In-Reply-To: <20261018-macaudio-v3-0-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=vyIYXeTvpK7D1QV50HT+GFALOmTzN0QImSyZ/l8Csqw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4rn9v1rM2RbwXkbirPLsz4fsNjM/kRQz5nGODOYKc
 ej5qWHaMZGFQYyLwVJMkWVDk5DHbCO2m/0ilXth5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix1jHSMGLk4BmGpbf4b/fiY1H4ybv6Rw7+vrXbuf+8/0fd9/cvhsW23Edk9s36MfTAx/RXP0Cq1
 6awsZZE4+mdUmqcF7qnS9vuaD7RLe2eslDgmwAwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Some consumers may wish to prepend the codec's name with a known value
to identify a specific codec among many. Enable this with the common
sound-name-prefix property.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l84.yaml   | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
index 94062c1d9d45..ca137aa57461 100644
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
@@ -32,6 +35,8 @@ properties:
   '#sound-dai-cells':
     const: 0
 
+  sound-name-prefix: true
+
 required:
   - compatible
   - reg

-- 
2.56.0


Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9FC37BE64
	for <devicetree@vger.kernel.org>; Sun, 18 Oct 2026 05:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792302893; cv=none; b=bMN3wFkC9g5E2CyIoA/jf4ebD0v/pqESpTvexzJYBwVMIuieoZZNgZ2PxlMwu9trwFMt2Kui0WlXcUJ378p5IF1gEHjx0ejh9Ak3fTJiVV6nKRIhEqQQKMCp53U72PWFL454mlQo26epvcFrdRtZdKnlSgR6S9hwNdz9/aotA+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792302893; c=relaxed/simple;
	bh=5IK2m6ZAqwOkwCJ6kC825xvIJPDhLKuUDHcpYolWipk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rqYuALo/iXJFY3AdVS9f/J+Uv9l6w4Txv2FZjX5BcC2K52j4YfHDEa0OKNMPnn0yMpS6rzrJTOfue31GMxOUjDofy+qQrVUo+J21Q2Or2mh4/4iSaC9z9EpLbEpEdZmpg3LKze3KqV8h8AfiZN9v38a8tJIBRPeUfU1dkAKeQGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sneIZi1X; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sneIZi1X"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so709016a91.2
        for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 22:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792302891; x=1792907691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0cHPjo/FatMXlsf97zuv28872kDRqNq1vxWPR3qNxVw=;
        b=sneIZi1XLP0BZyNRCFuhpdzruf0kyXZoVJoHbRBhA/wicwUobh2FH/7DbMS/KaCoNw
         IUiwYtMQSkMhbQFAlDrPfiXjeFl3Yjui+0dhRBiKvWL6JXOYip/Rmtae5YUnlbmtMTaC
         EOfSpUgmt6ufIetLb3lVdEDvHvkj9uLyn6k9RZH90I9DjNClC+iJVrbRZ/ocKd3eH/PM
         t59/56wmDtdfHeoRtljKQTzl+yFtTzGFeSiLmreWMQrcW6eEAlLLWkdYTbjRn2RViVmy
         hBKah6kFnAqhrPsDjioH23f7LHRgtBE5GjUNg9jT/CZ0yILvZ6kXRe5GsTsIA+bmWo9k
         MJWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792302891; x=1792907691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cHPjo/FatMXlsf97zuv28872kDRqNq1vxWPR3qNxVw=;
        b=1E+eKiOXnOS3eL5JaViPftzlPrhMAvgBhg52r/8h8jdLpmXiPyyutOBtNlcEyY4HuL
         72Pbpn1dN6qalscR9+2aQ9DhSK4DQmzhdzKErTcM3lXzM7Zm6JZvIsK9wlICFcvLI4Us
         aH43xaPGJK1riftxv+rtB2zCIxKtkXyoJwFpyWkCA8xa/mh6IshsmWsE1lMc21TYQTmg
         DE+nmZr4PGyxG2ESkDHuKm2BSbOedgI96ceN0Q19qC2Ji+D6tPmGQxTPFIdp2IfH76NQ
         ULgv3Svqmeb5+RqnVRitu6Frg575Xax5Wi2mIeTQQ6whMpkK5z/Ul1KgyE5vNqRe1HIs
         WocA==
X-Forwarded-Encrypted: i=1; AKwUvBxNJ/8b5zc0RKujLkEFArg98ngY1rhLK8VrGOcrSMGn9a498/cirTeDw0CerXPcSzJRJib4goxCyXCZ@vger.kernel.org
X-Gm-Message-State: AFq9FYIoCucAMWkpukhGhz8rwcwcczlCFRnuyr4VJsvHf2g1D0VK11GF
	A1Dly+d2X1w4DBShbbORJyoLXqeGyfCF0fnhDDCQNCQlRS8ZDyw/iosm
X-Gm-Gg: AYBFou1SD+uLlp/BIKMVYYztkcFIRhT5MrYyZfYhyr2nqPv5JUAYEq3kRcZat0s+ebt
	JJcDTh+CgRJkdanQM7okHzVaPMa6CPAXBYsnVpM7QOaB6FtPnNWMAn/6iGEOsm3Cub2koUwPtyi
	JM1sbFs+HKPu9mP0V255CgpJ8kEdl+MAdsNUBSkSJYkeczygW8uh8sc1k6yHpywUhiL/fqMCFxC
	80F6DjtxwW7YQguLuVUKV9DVQES+j7ofYJYJoifP2QH2zpdi7aP8sqft4NfClPBJkeIVb4j/R8a
	EReGb7f5FTg0CKJ2CKLfQk15Sy78syKaMRzrdnVTzHry6g+HkAF8gf9a5e1oEENuB+HgRiheUSx
	XuTwaAVrDb4HzvFCqjFxeREfqtEq1DWaTKwLZZ5Vnmm5jxsWMPSUyz2F+yc79om2G68TrGQ7R99
	Cz671jI40ow2JMQUZG2HPMexeSu8n82LSR2U8GxzPZpBUNDC7AWqcs15G9nCRa41m9g93IBdnR5
	o7mcaj+gb1mWv4dWlpGQfSs1iul2Y8la5p9cCv1cKKlCwG+ZLSYjU96SLmH4Ou0cveLzF+VkxGl
	CVeCAA+hbHap2n+1/8rdjkW9wwrnFN6LOeTI3BJzdEVMMw==
X-Received: by 2002:a17:90b:58d0:b0:3ac:7749:2f0 with SMTP id 98e67ed59e1d1-3acef4fecf6mr3732599a91.44.1792302891525;
        Sat, 17 Oct 2026 22:54:51 -0700 (PDT)
Received: from [10.0.70.21] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd0cde4fdsm5511292a91.4.2026.10.17.22.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 22:54:51 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 Oct 2026 15:53:56 +1000
Subject: [PATCH v3 02/21] ASoC: dt-bindings: cs42l42: Document additional
 dai-common properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-macaudio-v3-2-abdff7741dea@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=5IK2m6ZAqwOkwCJ6kC825xvIJPDhLKuUDHcpYolWipk=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlX4rlTeKpVfv6wUL6uLDBT3M/t/rxVmzZdc+bY0etwM
 WGyWP2BjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFTvjGFkOC4T3xDivMi+Xp+N9cutX7f53geaWFz59lmMK0t9j0zUWoZ/Ju+z2xn
 DitQ87ulqlx/71RBsrtutrMOfZxNj/tP5rzQHAA==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

We may need to define both #sound-dai-cells and sound-name-prefix on some
machines where this codec is part of a simple DAI. Document them with
reference to dai-common to keep the style checker happy.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/cirrus,cs42l42.yaml   | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
index ab4c7d22dc0e..aba2121ac64a 100644
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
@@ -26,6 +29,10 @@ properties:
       The I2C address of the CS42L42.
     maxItems: 1
 
+  '#sound-dai-cells': true
+
+  sound-name-prefix: true
+
   VP-supply:
     description:
       VP power supply.

-- 
2.56.0


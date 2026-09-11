Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2C5470EA9
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 22:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789164915; cv=none; b=MA1MgeRdjpB5QRMs3lYSHrrNToKFM5N95w3zzaptUWSFVzwnZ7gNJiP0F7RwZylnIJD4uuNJfLD8WGSl9xTf92t2XR3oKZ3nKRQlBqQV1730OmUKty4br6WnfRZqo9pQX/Q2oQBmO3ujdijW0w4S9+lMF4MhuPfZikGg/CLI30M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789164915; c=relaxed/simple;
	bh=PWDc5RQ3INoxq0fo7alWh++0I6W5IGuIRf0MFpXSV8s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=h1MXQE+4mqEgBaaKruebnQ8vr2oS3Y0r4PH1Jkb/gN7Xvm5thFiAe+7s3eGrbaopd8Ptqfbap8mNTO4rDkrAszqqQikuQsVSf2Z1s7jXIqQUoiBcLZoxbQ4bWdwCINx12VNJH6lbnz3EVhG4hcFlGWTyVVypRp4SHRhTD+NmqUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KXrunn0H; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KXrunn0H"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso2894685e9.3
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 15:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789164911; x=1789769711; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=srhabopEjDrPGbNiaixTBBq3q3UYUb7b5seSM2Uisn8=;
        b=KXrunn0H++rtxAT5P89YqtdLALsAOg8nnkfM8BxbgeoKsKxtQYW/sPRA3FAc4i1fen
         OkQzihu837mwuEEaFR5K1oNKzt5cujjsaVqfZz15zjviGJuuZomtdY/Z2nlpxAlDyyjj
         BVIiDmA/1k3JyObs3Z8FLdV7TVeRXkFvUcc6OZpzE4x1WpX1wgdU8dYWLAN0WfoYUPIK
         7EM2h6n7Mo7/bhwmPzMQgq/aaMB2tWUE4/D5yFFrT1J3dH0Ok7TvbIBzgyuCFblcXgwn
         TLWe5o07XJVC9fpqGS1eP63B002ue+ZULQi5HCemHoupFqgwRfv9/4cFCt14OeuUrqtx
         ccSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164911; x=1789769711;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=srhabopEjDrPGbNiaixTBBq3q3UYUb7b5seSM2Uisn8=;
        b=CnoES1pJat9mBtEznW5zH9sLtFWJb3/xrt0RalDi/97SLx90hmEfEKiJbdPq1dRGLF
         ofYY/sIzYQZE0ISaBIlvouqtCn9TwrcwYPzrpv4L9RSsQTMowebEnD4ziltPsV1X3oJB
         5wmpPtiDqgAcJs2CceJI9ODmmKmqY/2XlOYG/yFixc3nlGRNQOCVSI8oNxyIgqJGOjPS
         hOouzVGaOJ63MkTpo8vGVxW5JGAWkklsf0c1QRFNLdrcwPAipNIiFIf2k8aU/3wXCssu
         k0cmM0H3H8HV+DjhxnU6R/aBKGEkZIcMO4uT9KvsGf03s4BbOMJe1nC5MJojiycXam+T
         ZmPg==
X-Forwarded-Encrypted: i=1; AKwUvBxIrxl7SUGrUPRwzSoGFQx1dLOMmFn5LghaOhiDVkWCkqr9ivOZeM8Ue46KSpjpNdbTWm3f6pLKMGry@vger.kernel.org
X-Gm-Message-State: AFuF++mA2fKlG1rLoF4WhH/TeslJalsaOGghv0Cid2Inl2Zvbyqc7PHb
	PUV7HZPuBC4MA38+sn7vO/V+9D5snAqsNE1zzJ+c6FK0IyDx6Z9uEcYnsVIU8/RxLWA=
X-Gm-Gg: AYBFou0WskOo5AtQfcNh3BknJ6f//L1EcS6+5fvZIafmLHbdrTOv7/CVl8pnZC1bLVk
	/5Zp4xO5p6UBALDoULdASpLul2SAhMZTZtrPirPra7G0QOPdtpx400GsmJPY53wdH3uSCPKKGvA
	E6CgU339dehGqLlqe2otQhp5ajdiiEvOe5YR0fya1t7KWKktL4oer7egc8DghOkeUROQQqr34oJ
	bE4k/aW6j6TzzpzzLbmyfODKKVW5FtZu0WsPQ/ENLu/2X4qEpj83CsldR1hTKe93vBAmA3l7Cib
	gbiTPeCzEekZ7I71yfNKDVDQJp2mRClzYSztVbzltl0TU50E0KG1a4gir/EZwiOzGavRNkwc8tR
	VZcunKOGc5IUEbYOXfu2XalSAM7XDkmRGe1HzgjmJojf4OoAf73UEBWSEWlrX+bYpDCbygMTjUv
	5nnfI4wh21o/Gu8t4tdhonq4NU6oqwy2m56dVdpx9RGUvLYUCsoI2dSfCgQms6WtaVxFa77Faq7
	UTj
X-Received: by 2002:a05:600c:3513:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49e619c0357mr123658065e9.7.1789164911027;
        Fri, 11 Sep 2026 15:15:11 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm202882745e9.7.2026.09.11.15.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:10 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH 0/6] ASoC: meson: gx: add base support for I2S audio input
Date: Sat, 12 Sep 2026 00:14:30 +0200
Message-Id: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEZ9pGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDC2ND3cTSlMw8XcvkxKQkE1OD5GRLEyWg2oKi1LTMCrA50bEQfnFpUlZ
 qcglIs1JtLQAVIgntaQAAAA==
X-Change-ID: 20260831-audin-9cabb450cc94
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3226; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=PWDc5RQ3INoxq0fo7alWh++0I6W5IGuIRf0MFpXSV8s=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlLanOaRdZMWiury/nzTfOTv99ijh7ZIG6rNWFa9b6ZK
 3/UeT+M6ChlYRDjYpAVU2RhmX7vd0Gp2kPjhJMFMHNYmUCGMHBxCsBEAo8x/A/Z9ERcTLvnivwC
 h9+mV8XKT96fcuzu+WOqXI3LGX5Jh01m+J9+cd8XMRsXcV1mrd9NDN5LohSW15geuMURO3uHM5d
 TDjcA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

This series is the 2nd part of the initial RFC [1] proposed to add audio
input support to the Meson GX SoCs. After the AIU reshaping series [2] that
has recently been merged, this one adds the audio input path itself.

The biggest change from the RFC concerns the I2S data formatter. Previously
it was a DT node owning a single register, which was deemed an invalid
binding. There is now a single audin node owning the whole audio input
register range; it instantiates the widget for the I2S data formatter,
following the solution already used by AIU, and then probes its DT child
nodes implementing the FIFOs. This lets the three FIFO instances share
one driver.

Resulting capture topology is:
  pads --> AIU I2S Encoder -> AUDIN I2S Formatter -> AUDIN FIFO -> RAM

This series includes all the changes related to this work (dt-bindings,
drivers and device-tree) in order to give the full picture in one single
place.

Unfortunately, since no Meson GXBB/GXL board available in the tree feature
an I2S capture capable codec, this work cannot be directly tested out of
the box. To test it an external codec must be connected to the SoC.
When working on this series, a custom hat board with an NXP SGTL5000 codec
has been plugged on top of an Odroid-C2 (GXBB). The last commit of this
series fully details all the device-tree changes which are required to
finalize the support for this scenario.
With this hardware configuration it has been possible to succeffully
validate the implementation with:
- alsa tools (arecord)
- pcm-tests

[1]: https://lore.kernel.org/linux-sound/20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com/
[2]: https://lore.kernel.org/linux-sound/20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com/

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
Valerio Setti (6):
      dt-bindings: sound: amlogic: add schemas for audin components
      ASoC: meson: add audin main module and I2S formatter
      ASoC: meson: add audin FIFO driver
      ASoC: meson: aiu: add I2S Capture DAI
      ASoC: meson: gx-card: add support for audin FIFO
      arm64: dts: amlogic: gx: add nodes for audin and its FIFOs

 .../sound/amlogic,meson-gx-audin-fifo.yaml         |  52 +++
 .../bindings/sound/amlogic,meson-gx-audin.yaml     |  96 +++++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |  35 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  22 +
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |  22 +
 sound/soc/meson/Kconfig                            |  14 +
 sound/soc/meson/Makefile                           |   5 +
 sound/soc/meson/aiu.c                              |   7 +
 sound/soc/meson/audin-fifo.c                       | 466 +++++++++++++++++++++
 sound/soc/meson/audin-formatter-i2s.c              | 174 ++++++++
 sound/soc/meson/audin.c                            | 109 +++++
 sound/soc/meson/audin.h                            |  14 +
 sound/soc/meson/gx-card.c                          |  16 +-
 13 files changed, 1025 insertions(+), 7 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260831-audin-9cabb450cc94

Best regards,
--  
Valerio Setti <vsetti@baylibre.com>


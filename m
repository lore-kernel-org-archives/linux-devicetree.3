Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793543439;
	b=fyaaZahRH1eNEun8V4+yuc4QL5IVEXhL17c4vXSy97vV/lrdcHH2/QpBxbWirlnFGOYT
	 C1TUmAH5eJy8AEV3n8BOfLUZbBgGzRBU4C15juGDkfNV0utH63G4camp/AtG29ZdjEnRb
	 KuMZ5hEc/qLJo49qkyNsYqhm/2BIRCn/qKMmDz/yyxjqzz8+WVMpkQozl91+axgBdg0Hh
	 d2/rXSJBzgg6HlsaOORkESi83MhSC5u0uzjQC5vuRNFPQCPdowqaSCsZaAagbWCYXDTnd
	 OhaZ95QaZ9syPJdRbdpwfJ0tM8BBUHlOXyD8JBmuDB++irY7WljREqZSr/ZLdweEjgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793543439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=beFOhHM7NoueVRBXy1T35SISL4UnsCDbE1h6tUqY/wA=;
	b=I6+5BG3X85CbZdzcYVmlNfYvTK489nmgpnto+1VQ8gUy5pEy7THdSXyyf7iLqqzsZz+D
	 2Jakj0qFESEe0K6PZmaVSgRe92InjFIMr8n3EMvQ++ZQGZTXy7awjSlVz0pntiHzxlDPt
	 pTyNTrJvBzv0BawC/yZavoJu8oWdrqqpA1COUVoKpvQrKTMCTWC8tny418swJJbsqRehm
	 XVXja3qu973DTbk6v5Vxg8BqRCFmkdn16VO/JVork4OaVvASkxOO10POw23QJqWxkqr4f
	 ZG8Xvpgc567NW0dQttHrL3fyhdIOLgsa3N6Dwujgwj3KPrQUHyWLDuIeGj8hdE/h3pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="axrKvV5/";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027D5606A326
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 14:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 027D5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axrKvV5/
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so13808125e9.2
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 06:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793543437; x=1794148237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=beFOhHM7NoueVRBXy1T35SISL4UnsCDbE1h6tUqY/wA=;
        b=axrKvV5/sycBk82+6Nt8gbseFSxoBPJM35iGjjREg3AlOkRUPtjV0bkauhgc3l76Ns
         uvwYudrYsSijF7O4AvU63k6xhpZobOwKxE2/qguQofve7K6aFBYk0HsX7zBnIzSgs1KQ
         u+BPOJbCj3E46YyqH7mTr2yCLdwZe6mazzmvWbHxnIjDJDcEiLasYasbX6a5Af+9Pkfg
         r8dufV8lZA2m888lkjrjpTnzodE0g+gQAnD6mamUiFsLXnZBobWTPKF14OPjd11ixwjJ
         xqwiFyDn3nitgx7zggVDT6fH9ZiNhBU/q8cLwysv7LPCLfI/7eHLdNS9c/FRC8FUxTzv
         EVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793543437; x=1794148237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=beFOhHM7NoueVRBXy1T35SISL4UnsCDbE1h6tUqY/wA=;
        b=lrDFzOkBpjrKOBdgeOM03FV+XTWTWiHQ/sUs7+5jLorqrMw6S8b0yAp8gN3n0Drurl
         U89pNceZM5vP6d7S6qzOPypZtyYTNQtgnZOkkDXUjjiWYDir+3ofBNa+dxYAPrXudcX1
         cTnnFyAgDNwVd4lA8vulASymnJ7yBf+eVBKDHPeCFar/YtEsxY3/303CT87Ud4QSwsEI
         as7zWM2d1hWtYeK6D1TIyqxHsd2gX9LnqMMIIkVJ80rvgxPPdShlOuxx6ZT3Yx1Opaeb
         hvo2TmmU1pUZbn71Rv49oH4DfQgBvS9h3ZDpQFf5ftVPT22rNJwEWaP6CUCBcvWrlDjn
         zPyQ==
X-Forwarded-Encrypted: i=1; AKwUvBypdK09GFM6MkCs/oFOaEpVcRCp0fMI7tuMlfveT5P/uU6ZCLvokOEB3FeFykB0Puf+wPjkgeDFd8s/@vger.kernel.org
X-Gm-Message-State: AFq9FYKdlebk1FGQbirU5JvYQdgGSJtA8/oi5utCV6391r0olKbMmxXf
	D9HUkvbLEfQXIc+aplaxAvHdL/GtSkZYSZ5NCPa4stP98TE3PE5RpoLp
X-Gm-Gg: AYBFou2hqkEn5p3kmtkyu+TVtYaWf+pra1BTLRjvTzPYiQwkTPKRNK97Xya1kVxcGLl
	Bz4y2DSQxi6/DpEOjICAxaRePmDYobBaa5MBaVupMVNYKfsgGqyHxDaUZNGt/y3X5n3MhmF9BXh
	mGXv7QL98p1fS3FmSSsdYEe8JXlNHgq6Twm2HvV3zuL05xZYBDKke01PLsMDGl6djD9wD3K+J8R
	1Bb/r6qX9Rw7FMKxiCbL3caBy/hGSVbeCQtO90uUJBRPNcsnpvxMuZ05eDGBFt9KbrTeH5pmy6o
	L/UpzVU5TDkcmUH3ZGkL34BSFSV2bq+RzxqsI2MXc2oZkVbVO8C8IU7FTOXcfbAjpAcZ8+TUC/W
	vyXatAECxzQFhlkzKYtC+IeKY+vdtgQRK3zhkn8oaTMVe6ckYLbVIQQfjSTjmXcdj313u1zR3mB
	mivUmKZ5YEEh47nPrA/e0bbxX6qXMq9dud3W5NfKeaDTgcYuyYs6vFylqGKtytDMkJGeW1AVTSv
	YNVsl0joo3ikt3NkNPqbH9yW3XTX+mfdy9twoZAoBRJzHUS6ttqPyxjsqf0wiY4RYqud9qJTmGd
	L9IkYDXS7cCWfwQK0Z4NrcLtGiBtiYZlSl8cj8moIdWENWPJwiclAENW9NEE+ImdKC+uMH9XKPX
	rIsAgtaqY5BVEPO+7YWiq9O+Q3xcrXR0bBsge0x9g8/P8OQ==
X-Received: by 2002:a05:600c:8b85:b0:4a2:392:9de2 with SMTP id 5b1f17b1804b1-4ac1932b550mr152423265e9.28.1793543437168;
        Sun, 01 Nov 2026 06:30:37 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:849f:a468:4121:a85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm138430595e9.0.2026.11.01.06.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:30:36 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v2 0/2] ASoC: rt5631: Support an MCLK clock from the SoC
Date: Sun,  1 Nov 2026 15:30:33 +0100
Message-ID: <20261101143035.880469-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RT5631 driver doesn't take a master clock, so when MCLK comes from a
SoC clock output, that clock is turned off at boot as unused. This
series adds an optional "mclk" clock to the binding and enables it in
the driver while the codec is active, as rt5616 does.

The board that needs it is the GPD XD (RK3288), whose device tree is not
upstream yet. Its MCLK is i2s0_clkout: handed to simple-audio-card, the
mux picked the 12 MHz oscillator for 12.288 MHz (wrong pitch); held by
the codec, it follows the I2S clock, as on the RK3288 boards with ES8388
and MAX98090 codecs.

Changes in v2:
- Patch 2: get the clock in the I2C probe, as rt5616 does since
  b5c9df40ca56: from the component probe a deferral was lost and a rebind
  leaked the clock (reported by Sashiko).
- Patch 1: unchanged; picked up Krzysztof's Reviewed-by.
- v1: https://lore.kernel.org/all/20261025145354.3476371-1-romain.tisserand@gmail.com/

Testing: dt_binding_check for realtek,rt5631.yaml; W=1 builds for arm
(multi_v7) and arm64 (defconfig) with SND_SOC_RT5631=y and =m, no
warnings. Tested live on the GPD XD (RT5631 on simple-audio-card,
mclk-fs 256) on 6.18.54 with this change backported (the bias level read
uses snd_soc_component_get_bias_level() there): i2s0_clkout stays on the
I2S clock at 11.2896 MHz for 44.1 kHz and 12.288 MHz for 48 kHz, and
both play at the right pitch; v2 tested the same way, with the clock
taken in the I2C probe. Boards without an "mclk" clock are not affected
(clk_prepare_enable() on a NULL clock does nothing); not tested on other
boards.

Tool disclosure: this series was prepared with Claude Opus 5.5
(Anthropic) as a coding assistant, in an interactive session where I
asked it to fix the pitch problem without the RK3288 clock change that
was refused in 2014. It traced the clock ordering in simple-audio-card,
proposed taking the clock in the codec driver following rt5616, and
drafted the patches and the messages; v2 follows the Sashiko review. I
reviewed and understand them, and tested them on the GPD XD as described
above.

Romain TISSERAND (2):
  ASoC: dt-bindings: realtek,rt5631: Add the optional MCLK
  ASoC: codecs: rt5631: Enable the optional MCLK

 .../bindings/sound/realtek,rt5631.yaml         |  8 ++++++++
 sound/soc/codecs/rt5631.c                      | 18 +++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)


base-commit: cc3fc99f1bce93c3ae3771ef98cb91a566da857e
-- 
2.43.0


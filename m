Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792940038;
	b=PgEolDoxX1T62FPcwvAAAss87OSArEm5/RxAQolPqeOhdvvX8jfNVwbEIg5WgljaMHps
	 MMjsaKp03v2ppZyccfIR5Ee+xDhu6suFDAiTmudigS542i/qHL62qoEhQIr8jmC4w9heh
	 t79x+pAkQ8roqMLeexxsVaslliWV8NNqZYFVIsZuRSAgOWTbm6qgHQdSEZszK7Gnm0yZv
	 S9asXlO1tr85Ww30aE/JKDDJfzUV7cZwPjX/TYDtJC14/rlTdIYgH40++PI19e2QCDx3P
	 0epJhY0euWpBDIFtvryE1AXggXl74wvfBuw5GXgM9UmSD3+Xxg+p8BlLnRG+71WJ5Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792940038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m4kAH8DCfpe22OkmCb4iXEvhigID4lmHLEwsjbr3sm0=;
	b=O/xKH4949U6fVUIkBlGWqYdrRvPPFJPary8iUM7FoF1Au3mGSHORvZrKkf9qFcqUTIAe
	 wVKlljQX6QbhrhQ4bOMuCP9IJ7cI1g90X5KkUiY41HC6+hgp11UpmyR5CSBrP9fz4zyrX
	 UNLJcNDbAjnXybvGvERXQy3wsRhZCXhzB/SBcSxtProbwkoqlTQ3T6venMVyhUK5Oq0EQ
	 P44Frgk9oen8+D71DoSkJrFSqgm7u1aSZJBBf5gBMiQK2DmmAFCtrm87T/34JJY3JRWA+
	 6JRzaZTLQzRTVeKtwlcOjqPDXcynwKl+3dt42NK325OtQDjBoXNkplU9FhLr0wW0zBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WIHJ5XAH;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E99606A31E
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 14:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38E99606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WIHJ5XAH
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1104979f8f.3
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 07:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792940036; x=1793544836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m4kAH8DCfpe22OkmCb4iXEvhigID4lmHLEwsjbr3sm0=;
        b=WIHJ5XAH8wgyHoq1C/naLVLPt+y80xFDDGNa+UkjOww70HePVeg3yChQ7FXqcZSOvI
         MUa8cdxJtMxKYuOkdaJGnVl0ec4XE70euxMXCkjxAECFZOlUt3r/r/yOOb7vMk4aWiFx
         Qbv/7+aZkOPppaH8z0TlLvnVk1FrXWDt57Kn2WEmxgB485igiHHwkdVmO9eM8vXa3jzH
         e0Zug3sVA7L5miKMQubaV9fO3o+FzxWNlypujkbEf0DE5rHP9j0BXOKSYghd5TF4+rVn
         rgwugEYuZbsuGnS7BSWxA1Vvtoze1MzwlOIUYmelqoG2M5EnB3A1tqKUwCe1cRSInDMM
         G3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792940036; x=1793544836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m4kAH8DCfpe22OkmCb4iXEvhigID4lmHLEwsjbr3sm0=;
        b=bRaCS9p2CJKM6DOUCrwq8SZzM1qTEQIM44ohZNav+mINOpjHDii0d+GA2+lbF8MiiX
         xyjlRZmY5a72qVbU+ItzxvmlZV6Y6m1dASYGAE4UEXHkn98dyitry8mTfkKQKRr8SdPA
         A3b386uJImhuZ3FjoFgyk9pqIWFKgmtK0Kf3cl2asa1MMOC10EHcd00JCbxTqLGhY8NG
         KSUFU5eLrQZbbFG/5YWy9epijbDPqm9GaR8TGzxfb6Siob/zyJ9gYg0xIywicbpvCJaP
         vdHqvZGHsjjJ2FR/6EyWwS1Y6rxzxLXJSrCii5JmS1uijfp+GZ3dVgdLMdQrMMUi0g9T
         LASA==
X-Forwarded-Encrypted: i=1; AKwUvBwxRG4VtvOMsSlMYHsfle6E4QqdLVdPtCyUmPyp3pyIgr2oTOpOhcMdnxnTfAmUXcg618LylBAUo9lD@vger.kernel.org
X-Gm-Message-State: AFq9FYJVYYHWieVZa0tfqO7H0Z0QvptuilkcQfLmKBc1HKpdC8k84QYW
	OXmLsLP/iCZKrxwN8u3XwuhDXyP4qYJ19WGXsX3hVakgfiRSq+sb9hQ5
X-Gm-Gg: AYBFou03g0g/hraF8fb7SI2W6qlfoyglZ1lUkEsEd96kWh1SrlFZWzNB5jkmvMjVizE
	bytYXg1roi6msihabdMu03gqq658v+C5/rnvES4TOdgXqINSAN4nlNYwtpnG+m3h7ZPxn4dTtj2
	6c0PeKv+yaCYJ7GMDLFrHm9s/n8FCZhTQyxmHIGyi5t+dp0Qwn570HnyU9TACeuM5vQucP7Mu/H
	iYNcnwEr4bBUMIvRWj4jGj8FC3MLYz3F5FSTZK6C4fFsXjjCp5JtGUjuXNmfGGuQD1ySIYAjNC9
	S5U40RyYm+TLLZsn6kCJtCmDs6cKy/91WHuI8Ru26sXaVSfwgyFjPRH/SAbSefZO+yKFEqrzwq/
	XVny81i6Ub5S999s6QV123jm88CL3onMjt3x02iu+gfYc5S5b7++wSCdInK7/6kG+4/a8buLEh4
	HUhFXqDGSuJ0HLcvRchXcDDZxu87RzSoaAQoGyKKOgy4th26tS3tE9pwD4rWy8BP2eYaeCrk0fj
	hMlEFPGbvXBhJw+v7YGJZuq5Znf0CjdQ9Wu9bH1P2MoPPY/ZFwW43QaNOqWqmXuURkyNf8yM9i9
	AMJ3QEUGnNEiXsmOSKD4ftlW+GHstQDizuwoNzOFMjdqORUs2hLGfouG7ch7iCDzLfmcOvkdh87
	gpLeSBfxZ45ejq6p4
X-Received: by 2002:a05:6000:260c:b0:48b:116d:56fb with SMTP id ffacd0b85a97d-48e3eb2b643mr8140142f8f.1.1792940035370;
        Sun, 25 Oct 2026 07:53:55 -0700 (PDT)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:4c3:3a00:d533:9d50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb9cesm10986471f8f.27.2026.10.25.07.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:53:55 -0700 (PDT)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Animesh Agarwal <animeshagarwal28@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: rt5631: Support an MCLK clock from the SoC
Date: Sun, 25 Oct 2026 15:53:52 +0100
Message-ID: <20261025145354.3476371-1-romain.tisserand@gmail.com>
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

Testing: dt_binding_check for realtek,rt5631.yaml; W=1 builds for arm
(multi_v7) and arm64 (defconfig) with SND_SOC_RT5631=y and =m, no
warnings. Tested live on the GPD XD (RT5631 on simple-audio-card, mclk-fs
256) on 6.18.54 with this change backported (the bias level read uses
snd_soc_component_get_bias_level() there): i2s0_clkout stays on the I2S
clock at 11.2896 MHz for 44.1 kHz and 12.288 MHz for 48 kHz, and both
play at the right pitch. Boards without an "mclk" clock are not affected
(clk_prepare_enable() on a NULL clock does nothing); not tested on other
boards.

Tool disclosure: this series was prepared with Claude Opus 5.5
(Anthropic) as a coding assistant, in an interactive session where I
asked it to fix the pitch problem without the RK3288 clock change that
was refused in 2014. It traced the clock ordering in simple-audio-card,
proposed taking the clock in the codec driver following rt5616, and
drafted the patches and the messages. I reviewed and understand them,
and tested them on the GPD XD as described above.


Romain TISSERAND (2):
  ASoC: dt-bindings: realtek,rt5631: Add the optional MCLK
  ASoC: codecs: rt5631: Enable the optional MCLK

 .../bindings/sound/realtek,rt5631.yaml          |  8 ++++++++
 sound/soc/codecs/rt5631.c                       | 17 ++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)


base-commit: cc3fc99f1bce93c3ae3771ef98cb91a566da857e
-- 
2.43.0


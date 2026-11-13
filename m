Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595118;
	b=U4M8b/aX6/JrKHc3dUNGhmTuLP5cCuxP4GU+FqnS6jrGM3nyQjRnwaeZZIN2DXSMYd/e
	 g0ywUAzXnSDcBSoWxvBDdwdgsYdPomIsHDjHac4avhZaJYcGgbSHJsO+/S75BzeKgf5nh
	 y7rRlH0mq6eLOkKzfc5fn8Jajsr4Bu80dQNwLaV1G3eI6p5Cxhm/O5oMIth+PTgwboXmu
	 I+/s2CDGYhQERYML9zaM5bNgw2o94i8xB8x2bb7XXbsoqPOQYa90SpMRXjImiTvvjfZW8
	 u6/TljkmD1AbwkcKJt2tGLgz1jhHn/GBMGO+6iBlHi/Qec7Y3J0RN71N00kERlzHhxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=w2uTsZDSakSIiYfZCZm4T/XmbPQKfvOaN5W1vDGvmkk=;
	b=J3AswW4FnGLXtJb5/qlsl8ia5jZOhNUvVhBLgLladynYfFjDPtEUtUMtPPb4VI4XtcfC
	 dG/FUn5g0SIW6mlW9PL4T0E95opmz+M3olNi9Vu5BwplswhGTqPaS68stkIhmaaHjsLNA
	 5s4NFoLOxr1XjX5M70RCjaI846k6o9vqVnY7GZhK9sB5da0i4ipFvax55XkML8kySrj4T
	 y2PMHXU3soRrOOBFgVc14me5hnSGbknwHWegjbJ9qJTdstDIZj5pxFHUflc5ER7HroyZR
	 LF/HD2cymKTyXz6upHgp+WbBlwS60c3GGwGMjfy/fp2aDMUvx6SgSM6/qdQ4aUd2KAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BxjxiFJr;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D0B606A658
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 18:38:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13D0B606A658
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BxjxiFJr
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-49412eb1474so643489f8f.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 10:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595115; x=1795199915; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w2uTsZDSakSIiYfZCZm4T/XmbPQKfvOaN5W1vDGvmkk=;
        b=BxjxiFJrM+M5Fan2rzxhw8amdOeFldpsV6DZ/IqNYozeMs26pNhTUj/YiYfbcQg8Ib
         MRpWEWwoEYOE1pCY/0smk6YXReJWHtI2r0lBvX1Dk+JHpW/Jrk6353E+gC4j07ku6k30
         F0HqHzeO9rqzBvRFq1eUR4gDM7M/U8lGaaOeI5+FXTbPBanMMxpZ2H60gmxJV2nNkD+o
         SC+jA1h5YnEBEReCxRHCYXUGDxWMx+1YteqgHtpWPCkFpwpcCKIfvaRAuqJtTqJlQsD5
         G0RQUPWGpigtC2esCR5zGE95T2V2/CnozL42iBKdsys/Yy+ccpzZKet/cYfoyC8pggDV
         BKMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595115; x=1795199915;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w2uTsZDSakSIiYfZCZm4T/XmbPQKfvOaN5W1vDGvmkk=;
        b=cczDW+dougv0GykW5wH32inIxbwGlhuqPcD8dunJAw4z1FCmvhSS4D8tGd2FnLwh6u
         qMiFlarbyxBiHxBPERcmvRb6VJdZuEyX0KQrHvo5w5j8hAhab9QIniCX005q8yIGaF3S
         69BVB5nlpLVYM892oS92zphYK1kWABakESZW2U4xirX7JCiqjUvgg/vpBpRdgiTootQ9
         S7G3AgriwQZnEhpisgMUoLEHb0kpbCgNFV7wqEZMQaDGU9Tubo5yqgyF39Vxcrc6Q5uS
         rhJxeQQClZrq+x2L0EqCPTuS0TSlu5MNdEUtlWrbKjPXgUYw1TUSLGEMiXDenwu4z4tU
         3jSQ==
X-Forwarded-Encrypted: i=1; AL+hErFiJ7MG1D7Hki0csVgPZWSz5HCvoBf5IYhpF9IT/FOJnnUo9vv/H3UWKVq5pooZfMCkL/Q4zIdcFBYi@vger.kernel.org
X-Gm-Message-State: APuU4Z/brp8y1O7xsdYNc4F9v09LECqCUqZfVigSLF4Onzxur4YCu8/L
	cZeBvv+Hf6owFAxPn842SLZ+jNS2bWS+0t/7eeypukXV0QhD0alnKPMPr1Spi7G80J0=
X-Gm-Gg: AYBFou0lhfFSL4JYafOqBf9qkw7C2QEK/waQi1P+uxoXmuY2sW7+lYO/I8DX0qPkr3n
	flr6YC1IXN0hFNimG6emOV4fDMKXmOZfX1Gex8+lDHBuwcb+RUSfoh4j8GhKUheVj/sK8gAaVQz
	dCTToZBhpOSN5hm6L0oi/G3CTC6vVaCx7eNuEtKrKLwOypo0lnOd8H1yHcdr8/wbW1HZrg6xSUM
	69AILhWwCzxl0J887TAYuEHmn8ylMg6OT2TaFBUdycXckzbNrW/cXjmwqNrcwCs/GdBnrscbzIk
	4QqFCBW3b2u/pyOZdeVsGEGsSQcg1h4FzsSppZAJOvP8fVstRxsn1ZtUQ2oldZqvoe03OhC0YKT
	+LcVUKM09RpGvBPqQzE3zZzOTpvpv4HJXUmlR80rCHxv6w2Gn8U7TR5nin2wbn7yVjqdxiGwFLf
	bDUjE4IbdcLUazOpV9BA8j4+AUrVbLwpo+mBNbsK1NLH4o1U/aofNu3p3roRfxILoSX8XGaILX7
	/0c2fxwuVxDh11qCNIo9EwhRPDCrHzKNyKECm4bz2OwP5h2TlA0GuqvX7mbmrY0Vc9W3qz4ORSZ
	WOWwqA6giKEY0qKXuBIV0K2+K3YVqJB06gTO7Bh+Uh66wPV2EZMQDMYI5aoby0hy
X-Received: by 2002:adf:e008:0:20b0:48e:6f76:de98 with SMTP id ffacd0b85a97d-49c71e3e1c0mr5943328f8f.9.1794595115227;
        Fri, 13 Nov 2026 10:38:35 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:38:34 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RFC 00/23] arm64: qcom: enable SM8650 audio without ADSP
 firmware
Date: Fri, 13 Nov 2026 19:38:14 +0100
Message-Id: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIABZZ92oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Nj3ZL8gsxk3eJcCzNTA93UHCPdZLPkxDQTI2Pz5ERzJaC2gqLUtMw
 KsJHRSkFuzkqxEMHi0qSs1OQSkGFKtbUAxccrKHkAAAA=
X-Change-ID: 20261113-topic-sm8650-el2-c6caf4237ca7
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5790;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=nNsA+r5juXKjiRcSwoHtRAKZZ9Tqefl8bh/M49w5Yxs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91kct6ILQiiCLBdkeOYZBX88DapotPq1jQSJmYtF
 TxO++kKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZHAAKCRB33NvayMhJ0Qt3D/
 4ypug2YvyBD2m7gomADVISy/gSHyEitoz0M8hnoOG086qtlX7QAs3zWxhG9WDSNbqImwU0LbZFHgo7
 Uiyk5KZ7aUvHg7L8sW0OUiFWbTDDmx8ihF6GJiJm4cPsrO3PaBMQcjca4eaR29JjQafpKE9u8rSPbR
 UaxgAiGGeAEqEXcK8muyQuUGBJOdCL6o9o2yNo7ckfQDg9K5HI3mDkcdD0er4ax+pJ7aRN1ZpB993R
 nZx15WZ01xd8vtp0jCd91qCzL/B832FQnwygf6Lp2zwbYElCarQ5d7wxTWFMuJOLJ1vHhFavnXJxb1
 FFZW3luqvZAREglP+Q1o05SO1N/H3Y3aRFyf/ob9+KPVt83xNSk77jrcSyx0stAJhRndbnMNZOFyPs
 zbr6V5N0zL4BMFw/ye18a8UpedA93NeohI80VDEfnYwjTHNC5H9GDc0UKBNHK7lJxoMyc3zvDgDNmd
 OYvbRhzSbVZFWbcNpWVVo3SXFEPolkQBQd8+1ZRnZ/j/XyoN/8F7HyPTYw2K7vAdh9NclY2fbo34Ma
 /N9qBQqqVvf93PL9mXQgWMNwuGPM1y8Ki/YKzcaYHBhB+wLBuT+nyeajeJj7X5CGI8KVIzCI9CsV6V
 QiS7q0nqc4VDLj8TiY/mLqSNNFgCPGexp5j6CQi58uspXjJgw38SaaYve4Ww==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

This patchset adds the necessary plumbing to drive the SM8650 audio
interfaces directly from Linux. This is required for boards like the
Valve Deckard that boot Linux at EL2 without the ADSP audio firmware,
meaning the audio interfaces must be driven directly by the application
processor through lpass-cpu.

Without the ADSP firmware, the LPASS clocks (MI2S bit clocks,
codec macro MCLKs, LPM memory clocks) and memory zones must be
controlled by Linux.

To support this, the series introduces the following changes:
- Bindings: Adds dt-bindings for the SM8650 LPASS core & audio clock
  controllers, LPASS CPU, WSA RX/TX channel ids, and Senary/Septenary MI2S ids.
- Clocks: Adds drivers for the SM8650 LPASS HM, core, audio, and
  AON clock controllers.
- ASoC LPASS core: Prepares the lpass and lpass-cdc-dma drivers to
  handle multiple LPAIFs for I2S ports, allocates and maps LPM buffer
  memory for DAIs, and adds support for the optional WSA interface
  and Senary/Septenary MI2S ports.
- ASoC SM8650: Introduces the SM8650 lpass-cpu variant and allows the
  sc8280xp machine driver to be used with lpass-cpu to keep sound card
  bindings working.
- Device Tree: Refactors the SM8650 dts to move EL1-specific Gunyah nodes
  to a dedicated sm8650-el1.dtsi. Introduces sm8650-lpass-cpu.dtsi for
  boards booting at EL2, and wires up the speakers (Senary MI2S) and
  DMICs (VA macro) on the sm8650-valve-deckard board.
- Defconfig: Enables the SM8650 LPASS CPU driver as a module in arm64 defconfig

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (23):
      dt-bindings: clock: qcom: add SM8650 LPASS core & audio clock controllers
      clk: qcom: add SM8650 LPASS core & audio clock controllers
      dt-bindings: pinctrl: qcom,sm8650-lpass-lpi-pinctrl: document clocks and power domaines when ADSP is not used
      ASoC: dt-bindings: qcom,lpass: add Senary & Septenary MI2S ids
      ASoC: dt-bindings: qcom,lpass: add WSA RX and TX channels ids
      ASoC: dt-bindings: qcom,lpass-*-macro: document less clock when ADSP is not used
      ASoC: dt-bindings: qcom,lpass-cpu: document the SM8650 LPASS
      ASoC: qcom: lpass-cpu: get the optional codec_mem3 clock
      ASoC: qcom: lpass: add support for optional WSA interface
      ASoC: qcom: lpass-cdc-dma: add support for WSA codec DMA
      ASoC: qcom: lpass: prepare to handle multiple lpaifs for i2s
      ASoC: qcom: lpass: add support for MI2S_SENARY & MI2S_SEPTENARY
      ASoC: qcom: lpass: support mapping I2S ports to multiple LPAIFs
      ASoC: qcom: lpass: support LPM memory type for I2S LPAIFs
      ASoC: qcom: lpass: allocate LPM buffer memory to DAIs
      ASoC: qcom: lpass: enable the right codec_mem clock when usin LPM memory
      ASoC: qcom: add SM8650 LPASS CPU driver
      ASoC: qcom: swd: allow LPASS_CDC_DMA_WSA_RX0 as soundwire dai
      ASoC: qcom: sc8280xp: allow using the sc8280xp card with lpass-cpu
      arm64: dts: qcom: sm8650: move EL1 Gunyah nodes to sm8650-el1.dtsi
      arm64: dts: qcom: add SM8650 LPASS CPU dtsi
      arm64: dts: qcom: sm8650-valve-deckard: enable audio
      arm64: defconfig: enable the SM8650 LPASS CPU driver

 .../bindings/clock/qcom,sm8650-lpasscorecc.yaml    | 179 +++++
 .../pinctrl/qcom,sm8650-lpass-lpi-pinctrl.yaml     |  20 +-
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  74 +-
 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  17 +-
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  20 +-
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  13 +-
 .../bindings/sound/qcom,lpass-wsa-macro.yaml       |  21 +-
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      |   1 +
 arch/arm64/boot/dts/qcom/sm8650-el1.dtsi           | 775 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |   1 +
 arch/arm64/boot/dts/qcom/sm8650-lpass-cpu.dtsi     | 222 ++++++
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |   1 +
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |   1 +
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts  |  85 ++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 799 ++-------------------
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/qcom/Kconfig                           |  12 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/lpassaudiocc-sm8650.c             | 777 ++++++++++++++++++++
 drivers/clk/qcom/lpasscorecc-sm8650.c              | 509 +++++++++++++
 .../dt-bindings/clock/qcom,lpassaudiocc-sm8650.h   |  47 ++
 .../dt-bindings/clock/qcom,lpasscorecc-sm8650.h    |  30 +
 include/dt-bindings/sound/qcom,lpass.h             |  24 +
 sound/soc/qcom/Kconfig                             |  12 +
 sound/soc/qcom/Makefile                            |   2 +
 sound/soc/qcom/lpass-apq8016.c                     |   9 +-
 sound/soc/qcom/lpass-cdc-dma.c                     |  47 +-
 sound/soc/qcom/lpass-cpu.c                         | 344 ++++++---
 sound/soc/qcom/lpass-lpaif-reg.h                   |  51 +-
 sound/soc/qcom/lpass-platform.c                    | 482 +++++++++++--
 sound/soc/qcom/lpass-sc7180.c                      |  10 +-
 sound/soc/qcom/lpass-sc7280.c                      |  10 +-
 sound/soc/qcom/lpass-sm8650.c                      | 651 +++++++++++++++++
 sound/soc/qcom/lpass.h                             | 198 ++++-
 sound/soc/qcom/sc8280xp.c                          |  16 +-
 sound/soc/qcom/sdw.c                               |   1 +
 36 files changed, 4471 insertions(+), 992 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261113-topic-sm8650-el2-c6caf4237ca7

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896B0385510
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 14:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775919482; cv=none; b=n4ePqznIzNupptpX9F0Y+NPBV6OwO0H2mf89CRx/nmxyIoQG1clPVZeZZDMS9xLkHVnvh78s9dBk8EnrifHds4f0k1Vk2NoWPZLZMYWUZF3gPW+JUfSWgh3jxMCfaVRbfVa9TkvDhDUZ5eazvVCxcSGkL5SRBOZwcMKMtOkf1zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775919482; c=relaxed/simple;
	bh=3L+gTDPXvRqyUGB8yEtL8RbSZ9xTZaawwb3B9aSZ2Eo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SztR8UlnFITCae3a885xuQ4PJeM/o+SUVUQGa23gqHdjVRtZY65bVjg46w7OEdV95r29eJwfQPUrmjKFg3R8Iam+npPCERfirSKgfZIyaXIFoLAObA+vluR189bJFnRog12VqqQnlTD9Dx8sSGXpptnS3DZGAOFonJO9nWx++NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=f2S34j0m; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="f2S34j0m"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b0046078so29493585e9.1
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 07:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919478; x=1776524278; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sXiZV9+jNfCTqb1kpRrOCPDhkoywHHddqhZQJ9yG43Y=;
        b=f2S34j0mmw/cZPgim9+kkecOVPJ2q/BjSumltlOwlRruv5uiZgEhQ5f9eZryzImhRg
         G2ENxK+7OPVANs+dH0OE60lGznpkdPQdZeTFWEBYigHxtqePvn/oaRfurfD/IJkHC4Rg
         SvtW68i3ASXVC4qDtdSNRyuEvGr082ZKFtYwJT3+KKt9XYkOSZN31h/pjiWiLv21gyc+
         ahXoJfBTtV0w/DgnNhgdv9Q7pqquduoKCAwt3Y0HLlF+9Q3h4OakXFt4XNTo0yrvzFpG
         HKqxsKVxpeDXOzysesItsLO79wEmNXZYjLYXGTWu/ieQT9VRTa/6MtMLDWKlUSKDcwUO
         5xXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919479; x=1776524279;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXiZV9+jNfCTqb1kpRrOCPDhkoywHHddqhZQJ9yG43Y=;
        b=JLa4XQ4PEDuT0SfUfYPg/AeWc8PYBt1tO3FsyqE9bnPECJoXAxYMuUwQncri3VDGoy
         yZIdmMtcJfchQsQD9TE6+Zhvd+Q78nnBWtcm2eDIw/+TfcecqTiAtZZInuiGwuvxXP42
         dBqZtWWYXkxEcI2R+ucTP5kzdvJw5vP0axXI8DaqPPNUA+Fv8PbHZLJ9nCCWQm+jgYur
         sKQJirGMRWEnPhDlQfb8dzr5IJe+jsgEzRPgj85JIp8D7rLapErBkbTvxVMzu/2gB84e
         lU/E5ZEuCsjd585qsB22Vhwow4lfYbhakIdTopHI8hj1pG5cUt/Mht2SP3e6aKwBlC92
         okeA==
X-Forwarded-Encrypted: i=1; AJvYcCXSbm39FTETAs/c4XD8D+T1mdULUmfBzy042TZH3MwaaR85VDO1n2R+LWAfBjI9a10lnPNfxvwnhJ9n@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgk3ynELG45if18x2kHxMg+R7vwmD2Ndw72yjrf0lGbhX/EE+u
	//m16GXO8V41gpOlucYqGu+GW7wGUJC39tcFHekLq8j+ke/WG/UboKXtADEjVmIFVdo=
X-Gm-Gg: AeBDiesOGlzzZrbc8YpPpg7cG4xW+RyFYRmmvVnH0DsFPe5MKIPP7RNeCK+ltI13MxO
	H0DaMvO2MOFFw9nvD6LzP35Vuos8+g+UBr0voqITCPQnTXWpvkLXJZx1L/tlGFrc+ifwoVUN7L4
	jx/982nuxCSDrjucsKjQn+JsAzwugmCW5/t05cVa7QqzrbqzkS9Y+8WneELydE9CjhHn1/PMlif
	0/Ig8cL0BOCsjTWkD6QVcJljBN3IGoGgECEWkAfltajOvjCCF8uXrUcgOTL7PsqXRgu0rF4BmHb
	4+GOjbLlhgpS2UAHiNQ+FfjYp+iR8kIt7vmd77fP5BHhWMYCz4p0Ns7GJUasywPVHx0prmX3P41
	LrbSBgnPeoGSlT/nPa1SS9YRXeXe526vNn06i1gfZMG/OXEzk8HvrE3LQOLjUGPtj6CaGf7vKyb
	X7F1FW6AoFjwgngRr8Xjos
X-Received: by 2002:a05:600c:5303:b0:488:b196:d249 with SMTP id 5b1f17b1804b1-488d67bf74fmr94580245e9.5.1775919478531;
        Sat, 11 Apr 2026 07:57:58 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:57:58 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH RFC v2 00/11] Add support for AUDIN driver in Amlogic GXBB
Date: Sat, 11 Apr 2026 16:57:25 +0200
Message-Id: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFVh2mkC/zWMQQrCMBAAv1L2bMomTcV6Kgg+wKt4SNKNXbCtb
 GpRSv9uEDzOMMwKiYQpwbFYQWjhxNOYwewKCL0b76S4ywwGzR6tRuVeHY9KYlDGVj742NRkK8j
 9Uyjy+/e6wuV8gluWUaZBzb2Q+29qNBp1jdo0pUVjD0qrJdE8c+vd58FeqAzTANv2BYV9E0GdA
 AAA
X-Change-ID: 20260410-audin-rfc-243bcbf95e43
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4155; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=3L+gTDPXvRqyUGB8yEtL8RbSZ9xTZaawwb3B9aSZ2Eo=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3EvMrp3xIYrqlk9QyY03Z7YcCk2RnTMt/5L3ztJD16
 VYB7eczOkpZGMQ4GGTFFFlYpt/7XVCq9tA44WQBzBxWJpAhDFycAjARgRpGhrvchk/fnHOIk1ri
 yDjFt/HV32ob1/Wp05Mt9ect9rr904+R4UTGHruHeRNEnj0r+DB3uXUYl6LVwqV9ARlRjcKspdp
 HGAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

This series adds support for I2S audio input (AUDIN) on the Amlogic GXBB
platform.

It has been largely reshaped compared to what proposed in v1. Instead of
adding an HACK commit to allow AIU to export its clock so that also
AUDIN can control it, now the design closely follows what was implemented
in the Meson AXG platform. "aiu-encoder-i2s" becomes the shared interface
for playback/capture and it controls pins and clocks; data formatting
is implemented in formatters which are named "aiu-formatter-i2s" and
"audin-decoder-i2s" [1].
Formatters are DAPM widgets which are dynamically attached/detached to
the streams when the latters starts/stop, respectively.

As of now only I2S input is supported, because it's the only one
I could physically test in my setup, but other input sources (ex: SPDIF)
are also allowed according to the SOC's manual and can be added in the
future.
This series was tested on an OdroidC2 board (Amlogic S905 SOC) with an
NXP SGTL5000 codec connected to its I2S input port.

Since this work brings GX platform very close to the AXG one, once this
series is accepted, follow up work will be done in order to unify
GX and AXG formatters so as to minimize the number of implementations.

The series a bit long and it includes changes to drivers, dt-bindings and
device-tree. Of course this only happens because this is an RFC and I
wanted to give a full overview of what will be the final design. If no
objection is raised, this patch series will be split into 3: one for
reshaping AIU and introducing formatters, one to add AUDIN driver and its
dt-bindings, one for the device-tree changes.

[1]: Different naming for the aiu part is related to the fact that
"aiu-encoder-i2s" is already used for the interface and the goal
of this series was to introduce the minimum amount of changes that allow
I2S capture to work. Renaming can be implemented in the future as follow up
activity.

v1 -> v2:
- Reshaped design so that GX platforms will use the same design
  pattern of AXG ones. This helped removing the need for an HACK commit.

--
2.39.5

---
Valerio Setti (11):
      ASoC: meson: gx: add gx-formatter and gx-interface
      ASoC: meson: aiu-encoder-i2s: use gx_iface and gx_stream structures
      ASoC: meson: aiu: introduce I2S output formatter
      ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data
      ASoC: dt-bindings: amlogic: add schema for audin-formatter and audin-toddr
      ASoC: meson: gx: add AUDIN I2S Decoder driver
      ASoC: meson: gx: add AUDIN FIFO driver
      ASoC: meson: aiu: add I2S Capture DAI
      ASoC: meson: gx-card: add support for AUDIN FIFO
      arm64: dts: amlogic: gx: add nodes for AUDIN decoder and FIFO
      arm64: dts: amlogic: odroid-c2: add support for I2S audio input

 .../sound/amlogic,meson-gx-audin-decoder-i2s.yaml  |  49 +++
 .../sound/amlogic,meson-gx-audin-fifo.yaml         |  63 +++
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi          |  32 ++
 .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  34 ++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        |  26 ++
 sound/soc/meson/Kconfig                            |  17 +
 sound/soc/meson/Makefile                           |   6 +
 sound/soc/meson/aiu-encoder-i2s.c                  | 219 +++++++----
 sound/soc/meson/aiu-formatter-i2s.c                | 106 +++++
 sound/soc/meson/aiu.c                              |  37 +-
 sound/soc/meson/aiu.h                              |   4 +
 sound/soc/meson/audin-decoder-i2s.c                | 218 +++++++++++
 sound/soc/meson/audin-fifo.c                       | 432 +++++++++++++++++++++
 sound/soc/meson/gx-card.c                          |  14 +-
 sound/soc/meson/gx-formatter.c                     | 304 +++++++++++++++
 sound/soc/meson/gx-formatter.h                     |  47 +++
 sound/soc/meson/gx-interface.h                     |  50 +++
 17 files changed, 1567 insertions(+), 91 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260410-audin-rfc-243bcbf95e43

Best regards,
-- 
Valerio Setti <vsetti@baylibre.com>


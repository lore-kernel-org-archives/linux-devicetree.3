Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA192EAB61
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 08:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784365068; cv=none; b=s6SXbNvUvGjotEo0IgPwdSnC+66OAsjLaK2FX6ijPqfBBNBDxbtmrdgaej4f58bwzDqRtPM9vpj3uWhsJSblgw92s0yJ5xRbu1xe9xxArlX5uC06Ful9oYPLLWNI+S0WQrnZfWB79Binwq0r06eU4sGO0MX9uGxfj1bJ2tCn0SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784365068; c=relaxed/simple;
	bh=fspTt8j9QiyODB3Ss0ezGfihmQ+Hda0Z/BB5cuslkfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mZVJNXjlx8NsEGSx6UmjCI1UYqmcWcSS75MuV7FBRbze0tXU5RwO4OakEPt3i2QoEuLQAq1BpvfEuM3YHTLwuv0UuZskKtBOAzBcFMrLndMXsOny888nxaEjfMxMwg8mK8/YrKTLtmzdv7msruKJAqfG8bk62e1m7CAcS2RUeQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rW5NCwz0; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rW5NCwz0"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954c08a7c8so1376645e9.3
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 01:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784365063; x=1784969863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BJFiBGt3rnsgbEqpBZLJArMrhdkhs48oNDcrYNrzXaM=;
        b=rW5NCwz0OE7Vf3wToZ1ewC8bLlb8gTAU+lgTBOwU4XOSPq/tqdWvYvIhRqTuXxlK5Z
         SO/+nGe54AdRK78g2Ws/7WQYr8LsWrAQLQlmgbb1lPVuV3vsIjv4DgF7Cb9n6nvSt8xn
         LUut/y9lqbhO0YHYM3GS6sven+C+TqiQo9xGHIjSwOkcP9dTsjB2sWPef+EvbUkDxAx0
         veJdEOtF67livuNyry6Qg0cEJNGLHXOfZj03sw/1XHnzOl0EmTTaH4efmwm+3eht5qd5
         cHO/NijniQnH5bMPzdzkhfGF9V1sag/tClCBnXDPcQu6tQarH3rOVakm7I3lrqXh6Hee
         Kj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784365063; x=1784969863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJFiBGt3rnsgbEqpBZLJArMrhdkhs48oNDcrYNrzXaM=;
        b=YC0KJcJx05LGOIcE6PxGF2DKRXpaWvGN6Eh6wvDxcxbI6t5sAfKpY7mGhzcnw2/32g
         MadCVMF2rGmtJtPRcKEDFzT1woG5GauRFPce0m0+DzuVLsC5/4XTi9K4LSCum6eSEjFo
         K6l7HXyy3qOdPqZUD+EFdMHwvmGnR2kEBNoajA4lkHuAOnrfFvKx8o3ChQKdojoJtNJh
         IzbBt/x0PlI9saaKmQb/0XHV3LkLzwYQMo5SNLqOyrvVGX4naBlK0BSs1jykaQL5B3mx
         4qgJG/kVhfxWiqhGaykCyIUZV0L1027vciK1/0DUnl3TuO1eAQQ7kHLkUsJrBGlbJ3tB
         RoGw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0Q7G3KdeetSRaz8KKzvFb/MW+CcQ3OLzaeNpcAJS/aY9uWA+TK0AtQ1ieMUNGuJ0+s8rNY6yDgV9h@vger.kernel.org
X-Gm-Message-State: AOJu0YxKzPpMuRwaFr9Y5xZAZU6DaCi7p4LoS8ZBaM4e5+CIObydKcKy
	hMLgUzDPiLZd5BSDx8UUiKoUBLdfy4mZA6VpTmw9nhAdrM7vqJt9U9Gf
X-Gm-Gg: AfdE7clTl2dhfgz8YokKk/tia2FCrZz8Fr4WEAf9Lb0eWGMB8I2dECh1aiS8TiwSkOt
	xJsM9bCDm0tYGfEicHALwDHK8QmVVpBCKiQgke5Wyp+soDpe8tosRddRK27vsGDsicK0YWIfegd
	0kmvjcafRl9eQIntpEq2mUAMBHJotn5cx11Oe2xx2nDkH1JjgO3h/g/dfp9LyJPpez62iHX5bYH
	HJ22vYHRQvYORhREstovLPLbrq95pn9RVv6fR1ooFr8A/ctmxgtxV9xdv2/os/vQmsw5+36ZvNv
	Ha4JHePXMkxSSNtSZBESA9MJil8Rc+39tFYnFaT3Z4dJn809avqoHjROaWMpCsR9COz3Pus/1m3
	aVgMlpJmH8MMgTqHSoaNnU4kaX/8OGFBVKowC0ZbaPLZ0QpL9UMM1yZPrI7571gpqFMY5ujGIN7
	OSdcQt7oROw8y9aPisTl/MaSGeTjO5sDOAuJvk1TuTkrNwX1YlDFcJMTOZJDf/ybvRd+keP1QXp
	bWMMOQjxQ==
X-Received: by 2002:a05:600c:4f4f:b0:495:4856:4308 with SMTP id 5b1f17b1804b1-4954a513fd8mr52027345e9.8.1784365063203;
        Sat, 18 Jul 2026 01:57:43 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8D1600206D23E70680CBAA.dsl.pool.telekom.hu. [2001:4c4e:1b8d:1600:206d:23e7:680:cbaa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954834edc3sm91477455e9.0.2026.07.18.01.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:57:42 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Igor Paunovic <royalnet026@gmail.com>
Subject: [PATCH v3 0/4] media: synopsys: hdmirx: add HDMI audio capture support
Date: Sat, 18 Jul 2026 10:57:24 +0200
Message-ID: <20260718085728.6797-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds audio capture support to the Synopsys DesignWare HDMI
RX controller used on the Rockchip RK3588: the controller's audio FIFO
is exposed through an ASoC hdmi-codec device, with a periodic worker
that keeps the local audio clock locked to the incoming stream by
tracking the FIFO fill level. Together with the two new dts patches
this yields a capture-only ALSA card fed by the HDMI input.

Validated on the Orange Pi 5 Plus against multiple HDMI sources:
capture follows the source sample rate (44.1/48 kHz switches
included), survives repeated stream start/stop cycles and SIGKILL of
the capturing process, and stays free of FIFO under/overruns via the
clock tracking.

Changes in v3:
- Restored the v1 audio teardown in remove(): the worker is only
  armed while a capture stream is active and audio_shutdown() already
  stops it, so the extra flag clear and trailing cancel added in v2
  were redundant (Dmitry Osipenko's review; the v2 change came from
  an incorrect automated-review finding)
- Renamed the ACR read locals and added a comment documenting the
  register byte packing that makes the swap correct
- Dropped the get_dai_id stub so OF-graph cards resolve the DAI index
  from the reg property naturally
- New patches 3 and 4: dts enablement, so the series is testable end
  to end (requested by Dmitry). Patch 3 adds #sound-dai-cells to the
  RK3588 hdmi_receiver node, patch 4 wires up the Orange Pi 5 Plus
  hdmiin sound card. Both can go through the rockchip tree instead if
  preferred.

Link to v2: https://lore.kernel.org/linux-media/20260715200834.8486-1-royalnet026@gmail.com/
Link to v1 (RFC): https://lore.kernel.org/linux-media/20260715051939.64652-1-royalnet026@gmail.com/

Igor Paunovic (4):
  dt-bindings: media: snps,dw-hdmi-rx: add #sound-dai-cells
  media: synopsys: hdmirx: add HDMI audio capture support
  arm64: dts: rockchip: add #sound-dai-cells to the RK3588 HDMI receiver
  arm64: dts: rockchip: enable HDMI RX audio capture on Orange Pi 5 Plus

 .../bindings/media/snps,dw-hdmi-rx.yaml       |   9 +
 .../arm64/boot/dts/rockchip/rk3588-extra.dtsi |   1 +
 .../dts/rockchip/rk3588-orangepi-5-plus.dts   |  20 ++
 .../platform/synopsys/hdmirx/snps_hdmirx.c    | 271 ++++++++++++++++++
 .../platform/synopsys/hdmirx/snps_hdmirx.h    |   8 +
 5 files changed, 309 insertions(+)

-- 
2.53.0


Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE00B368D52
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789945; cv=none; b=KIwQc3Qsmom6lQmFvzXRviXD6CBObF2cbnDf5NZF5itKgLhWFQA0T7HhUtFRk78cmdQbozRW2+Y9AnVDplCs4O64Y6Ym2e3mmdDAovPyJqisBqAGUdBIZw6RLgXMcBTN0A7j9MIO96UScSpuhdPgd1MC3vmdXPUN8xsp0RHLyHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789945; c=relaxed/simple;
	bh=oIehZcPpAbqiwfIqG1W31kjdUe0imO5csyH1FVDoC4g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=t0B05nt0ug6iXMUPMtUsfLcKYNkG9NXSzCNYrxZBWjMfS5422Xte58nNGJ0KhfUD6uVMEtrOWbvPlRv1TLsTgTCY9Fy6LyyK2R8qAPauvrQIrYFgf9IuyqaFEFNe9CJDg0sj6Emb0k8y7fl4GZDK2jpRLx02Iwq/IwYhx84STDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ElobqAhm; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ElobqAhm"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso10169045e9.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 00:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791789942; x=1792394742; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d1QWTDb/oOVddYpnAN188VwUYCPxgfGwS1G3xLd3LyU=;
        b=ElobqAhm/Ku/mIUc0obARxzK/Cp86S4UzicGfxSurKj1nDtKJMB2bAsApPszueXA0O
         xOF47FRn1v6iBqOYbpQBz7EnQmvZlOmy0KKgOdZtPH9CYsUtF4A/ckCsJ/3ZbouA/812
         VjNyxvG86VScZ1dZ0kntjSY7ab9hfSJwloBXJwXX2IurY0+VUtCCM6V5oM/cEnMbrh2D
         STbSVUG7TrECyYsA3WdblqB5JNUW8hzpcjRZugxVcusw2npOJTti13GYTM0a6y5/gtHd
         qiDW49T1JnLIt6RZH+NaOclFEk2HBsdXV9kITdJXUMMUe1xFLw56ktKYZ5+Ut1mwawu0
         X48Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789942; x=1792394742;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d1QWTDb/oOVddYpnAN188VwUYCPxgfGwS1G3xLd3LyU=;
        b=QZ0d6UNlz02dMZHNaPkFRqJ+Yr7UDAckTVJIiVXsz+VtVEUPGGcMeYniDhD3Hskz7e
         mTA13MdVHSZ6A4DWWCmiaZZhQtas5mZ3GxPkrPVMx8IG/SH394rAMGhzgEQ8LKokmNEq
         aKhIocs1/61KZ42YjoMcAo19uv+W17yEK7GSBGOEGpn1M0Nu9AboIY/iU+803cS1zhE3
         /XYz0TXRpMBM76T9Fxs+HBM2Onw3Lr0k7y9bPrmlOcJGvnX1Cv2wweKWQ13i15xuGGhE
         CC+MRQ/kSse33UVLBwE8v3TcNE57J1wLB/f/g+pU1kBd0PgAHFJ5Emj6kZBpakdYyEHM
         a69w==
X-Forwarded-Encrypted: i=1; AKwUvBzApbzZZy1BU5dXNvV7g1mnafJAxdCPe82a620w85xydCLbdOcZsG5//1/neQT8HJM3X4DPFar3WujB@vger.kernel.org
X-Gm-Message-State: AFq9FYJklxN18/isdFRUlhrJPdsdjuACKv0JAb5awOanKcxsQiXrY8Ep
	O9pglk7jN6ZIBEz1mxYAQJUtb1ON6PW4fm1fOHVmwymAtJ3DFOB895w9PcrEwTqSKTw=
X-Gm-Gg: AYBFou3j3Qu55SJkjUpXiwoz5Ro5aAs949V0XhA7IHYwL5dBiBtNkTkHYVovFTFhn4A
	VopPewitgmTgOUbiQr55K6TW6LoMkgtHAjcrPr1Gm5d9L87ePmv9iTu/kJr8A8kgNjAjKfokeB8
	384OwpR+kYdoXhj3GHSzhqwfENHrMz5EWaE8k+MGi4MsfcIdImJ3QGeCLc6uFOLCU1vqm3e200U
	9rQosHTukeOX6TxT2Ay6yS9eMfBIRK26Kd/QsqofVKjh/hzAhrh1JTJ6Sj8kOoR8D554gQESHN0
	N7k7qmUAOIbKM61uElzK8moHsf8iKypYa7lPlrVQ+gBa8BhLIi+j0k1zCi5YpBn+1HbGlPPh5N/
	TOxyWASHCDooW4L0tvso458NSULW1mkh2+XkqkVr4uEOxRl8xA6zYlI6maUbWfKREJMWOnEBQKW
	oeTtyKR87gxfQhqlxYOdNSsWwcVfe05M/11x/BPbjry08b0Y7bWrPiuqAFZTY7HhvDEZVBRYbvh
	9BP709F+G551TGAWUMSjH0120N96SPC8vJomTDHeX4/JoB2SVzzyC5kSwqddsos
X-Received: by 2002:a05:600c:19ca:b0:4a1:7e76:d02f with SMTP id 5b1f17b1804b1-4a18e4ac650mr158677175e9.14.1791789941611;
        Mon, 12 Oct 2026 00:25:41 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aadf9bsm17523377f8f.29.2026.10.12.00.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:25:41 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Subject: [PATCH 0/3] Add VGA support for Apalis iMX6
Date: Mon, 12 Oct 2026 04:25:22 -0300
Message-Id: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGKLzGoC/x3MTQqAIBBA4avErBtII/u5SrQYa6oBs1CQILp70
 vJbvPdA5CAcYSgeCJwkyukzVFnAvJPfGGXJBl1pU/W6w6SQLnISUY7bIHuyjjFthM3cWjK2brq
 VIfdX4FXu/z1O7/sBKq18SGsAAAA=
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791789940; l=1908;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=oIehZcPpAbqiwfIqG1W31kjdUe0imO5csyH1FVDoC4g=;
 b=6Na6Gpe9E1PvitnwV+dpCDK0x8whlxg3tt6LUG+45ePWH6KHyR7uTPCZpXJvoHbTKeZQq5b6z
 YhrD1XfpN2gDC54bNXQKOrMjPmqjFju0acH+K48bnab3b0Eu3MBtE5u
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

This series adds a device tree overlay that enables the VGA output on Apalis
iMX6, which is driven from a parallel RGB interface passing through a
non-programmable video DAC.

The video DAC is a simple resistor network gated by an active-low
data-enable signal. For the bridge to work properly, this series also
changes the following in the dt-bindings and simple-bridge driver:

- dt-bindings: Add a new compatible for the bridge in the simple-bridge
  binding. This is necessary because the existing dumb-vga-dac compatible
  doesn't describe a data-enable signal polarity.

- simple-bridge: Add the VGA bridge match-table entry and timings
  struct, setting the DRM_BUS_FLAG_DE_LOW flag for the bridge.

This change depends on another patch, and should be applied after it:

- https://lore.kernel.org/all/20261002-v1-simple-bridge-atomic-check-v1-1-ef5d8332b078@toradex.com/T/#u

  Adds the atomic_check function to the simple-bridge driver, which
  allows the data-enable bus flag to be propagated through the DRM
  pipeline. This is necessary for the VGA to work correctly on the
  Apalis iMX6.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
Leonardo Costa (3):
      dt-bindings: display: bridge: simple: Add the Toradex Apalis iMX6 VGA DAC bridge
      drm/bridge: simple-bridge: Add Toradex RGB to VGA DAC bridge
      ARM: dts: imx6q-apalis: Add VGA overlay

 .../bindings/display/bridge/simple-bridge.yaml     |  1 +
 arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
 .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 79 ++++++++++++++++++++++
 drivers/gpu/drm/bridge/simple-bridge.c             | 10 +++
 4 files changed, 111 insertions(+)
---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260928-v1-apalis-imx6-enable-vga-5c7ba6b358fe

Best regards,
-- 
Leonardo Costa <leonardo.costa@toradex.com>


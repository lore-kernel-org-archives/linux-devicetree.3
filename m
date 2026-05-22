Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD1F2E0B5C
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 16:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466303; cv=none; b=ZmHjF3kIdEsScSJqr6Ot8kGtkEJ0F3zzKr6B5rJ0qMLM0cxHKzZkocgyA3bfqbiGhcEcUmAjxtC57umBsO9w5pyuUbSXVu+JYxN7iNLXxn4s2qghga4bI9w65KEVvl4IeVenm/1VHWvTbXjqfvowMAiSXP6zWDA+aSjNKxuxcL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466303; c=relaxed/simple;
	bh=Q0piT9wV2DARExCTZUIEMPOKXTz7h/HQugD3Y50M72g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rSIkbV0jfPOlfZvkTDnAFtbnIEZL6tdJdWbphf/9tSmCIaJM2qyWZCBaVZj8O40KpZNvbGy2SmqBfGj1W1tg0l7r4cvc4oNcWNfaby7debtU5/bPj44Rlc2kX9QcARYyov8YGfR5pWgNowsu1MuGRShil7VNY2OfAp6ddGx8dEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DZpwqerC; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DZpwqerC"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4891b0786beso51626075e9.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779466300; x=1780071100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QPGVYKqn3FQ80LKzOq7xEivdqWu7ECBxaeXMtXQgpig=;
        b=DZpwqerCtlLofI2RVrpPVG6z95FTRxcmPwK/Rh7m+vmIvLPG/LllT9rFbRvWZ/p9mP
         nGoaVLGsuHeOY6wvJLVaiM4mNGk/TL3dKtdjPfuXdoJwdEhDgVmXf9truOUwG6EbmTWe
         /NNiAZ6hv2DYrDgaXl9p1MGgGfZeF4TWIbsqbuVFr8h5RB7xUidX6fL7YxvmcVu56xc+
         hG33GnLrV/frLtxryGHLoZGeuxGn0cO1OJl4FNGaTEkHYjEcAWA7ASLRnHR+AgNmG5mI
         s5RF9gOU9e72kyzNosOZ7O7RWIkg23KqwfR01KuqqqkhE4lYd+FmIPfMz0i4uy/ZTf0c
         wLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466300; x=1780071100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPGVYKqn3FQ80LKzOq7xEivdqWu7ECBxaeXMtXQgpig=;
        b=fxEwzJu8Yz/Ha45NNb5FHnrMbzXa6n3HmFABYvK9tJQZC2PMjItfj9n4HheNpC+7Am
         1YeLxxGcpnCD685Wkjjzd4MrNslhSNBqmJl0sXR1sZfv+0EVTZhw64jRK3ANRUqWoY2z
         2c9B9GqgXws/rIRCL4GpQVY+0beuozvlt8WLZHb2QDVVudyo4wRMMaFE/NVljWZEK431
         UfQGW2Tzdkg39L7HKskGvNs9reoPBLej/2t1tDd61hkYNkUD4yHgOZYLFLMbE4HnE0On
         2TnVT+P6p7ZyW7IP2MwmahA43jcGXu2hUORG69vB+OghYA8sQpdzsBIzTVfteodKZP4b
         2IgA==
X-Forwarded-Encrypted: i=1; AFNElJ+TvnvS1R6pLZa3iE74hZtTokYQsWx9zwqIPwNMv3Bo4SonoFKuifkfyv09QRDXF2N4dYF/BFzXcCwI@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqg2dUorNjPIwGcCl0XGyxF/+fLXg+SL6hqpHYFXwmvraOLUVg
	Gl5LypBcImUIPiPuy4zeDen/+pGavB33etB/pkDw8tDDTnyLX5fs4WM+
X-Gm-Gg: Acq92OGpfi/pgc5axOrknNjsvqOEBYTw0f6D07UrYUvSmwW3laVAc/qDSe2kgRp7IZz
	QcvEH0DI5WtFgx/DaVBpcSLy5msx6QKB1XpczYL/Qz3MalYE7iUX1RbUxZjlIVYlOumy8XuXj0N
	jLM5gG3gI/yL9+Ama+3v2rGlwKkNNroz9DgF2xV4xOVPtBZiETtku2QjZs8Kagd+GplIDB6BQ/6
	xBfPH6SQUzs3BgCry4eN+xXQaddHHOmqRqJG/cufpZtmUN78RYx3sYoxTDxpxkAG7TxoFmwZzTM
	HC7Uly7nH8vMqZh6LnlmwsmLDhVVEOrD3WLzgAteeJohdvjJgwHikyPFOEx/q/mNa+22GU60bqD
	CD+S3BSAnSeEivpb0mhnreG/WQvLf/qzgPzWiFPTd4MQ/WPsic+wn67jOgRSkt/hnn/MOCGYiA3
	rA0KrMJXRjJ9tG/VOmQTp+2uwGP/e2YMJN6QCTvvnMIQ==
X-Received: by 2002:a05:600c:1c0a:b0:490:402f:324d with SMTP id 5b1f17b1804b1-490428e03admr60430125e9.29.1779466299935;
        Fri, 22 May 2026 09:11:39 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm51042755e9.11.2026.05.22.09.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 09:11:39 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 00/11] arm64: dts: ti: k3-am62-verdin: Add display and peripheral overlays
Date: Fri, 22 May 2026 17:11:04 +0100
Message-ID: <20260522161105.277519-13-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

This series adds device tree overlays, expanding the hardware support for
the Toradex Verdin AM62 SoM. The overlays target displays, cameras, audio,
and peripherals available through Toradex carrier boards and the accessory
ecosystem.

Display additions cover three interface types:
- native OLDI (LVDS) with Toradex Capacitive Touch Display 10.1" LVDS
- DSI-to-LVDS adapter based on the SN65DSI84 with Toradex Capacitive Touch
  Display 10.1" LVDS
- DSI driving Toradex Capacitive Touch Display 7" and 10.1" DSI.

The Riverdi vendor prefix and panel bindings required by the DSI overlay
patches are also added.

Non-display additions include OV5640 CSI camera support in 24 MHz and
27 MHz oscillator variants, NAU8822 Bridge Tied Load mode on the
Development Board, MCU_MCAN1 on the Mezzanine board low-speed header,
and MCU_UART0 reservation for the Cortex-M4F debug UART.

TI maintainers: patches adding the Riverdi vendor prefix and panel-lvds
bindings are required by the DTS patches.
Are you fine picking up the full series once those patches are acked by
the DT/display maintainers?

---
Changes in v3:
- Add missing regulator-name property on fixed regulators
- Simplify regulator labels (reg_3v3_lvds_native -> reg_3v3_lvds,
  reg_3v3_lvds_bridge -> reg_3v3_dsi)
- Rename touch@ nodes to touchscreen@
- Link v2: https://lore.kernel.org/all/20260522132014.226721-13-ivitro@gmail.com/

Changes in v2:
- Add Ab tags
- Drop introduction of the LG LP156WF1 15.6" FHD dual-channel LVDS panel
- Drop migration of "logictechno,lt170410-2whc" to panel-lvds.yaml
- Link v1: https://lore.kernel.org/all/20260521150038.103538-17-ivitro@gmail.com/
---

Vitor Soares (11):
  arm64: dts: ti: k3-am62-verdin: Add Toradex DSI to LVDS adapter with
    10.1" display
  arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display
    10.1" LVDS
  dt-bindings: vendor-prefixes: Add Riverdi
  dt-bindings: display: panel-lvds: Add Riverdi RVT70HSLNWCA0 and
    RVT101HVLNWC00
  arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display
    10.1" DSI
  arm64: dts: ti: k3-am62-verdin: Add Toradex Capacitive Touch Display
    7" DSI
  arm64: dts: ti: k3-am62-verdin: Add NAU8822 Bridge Tied Load
  arm64: dts: ti: k3-am62-verdin: Reserve UART_4 for Cortex-M4F
  arm64: dts: ti: k3-am62-verdin: Add Toradex OV5640 CSI Cameras
  arm64: dts: ti: k3-am62-verdin: Add Toradex Verdin Mezzanine CAN
  arm64: dts: ti: k3-am62-verdin: Add Mezzanine with Toradex Display
    10.1" LVDS

 .../bindings/display/panel/panel-lvds.yaml    |   4 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/ti/Makefile               |  49 +++++++
 .../ti/k3-am625-verdin-dev-mezzanine-can.dtso |  28 ++++
 ...mezzanine-panel-cap-touch-10inch-lvds.dtso |  98 +++++++++++++
 .../ti/k3-am625-verdin-dev-nau8822-btl.dtso   |  14 ++
 ...in-dsi-to-lvds-panel-cap-touch-10inch.dtso | 124 ++++++++++++++++
 .../dts/ti/k3-am625-verdin-ov5640-24mhz.dtso  |  17 +++
 .../boot/dts/ti/k3-am625-verdin-ov5640.dtsi   |  71 ++++++++++
 .../boot/dts/ti/k3-am625-verdin-ov5640.dtso   |  18 +++
 ...625-verdin-panel-cap-touch-10inch-dsi.dtso | 132 ++++++++++++++++++
 ...25-verdin-panel-cap-touch-10inch-lvds.dtso | 120 ++++++++++++++++
 ...m625-verdin-panel-cap-touch-7inch-dsi.dtso | 132 ++++++++++++++++++
 .../dts/ti/k3-am625-verdin-uart4-mcu.dtso     |  13 ++
 14 files changed, 822 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-can.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-panel-cap-touch-10inch-lvds.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-nau8822-btl.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-ov5640.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-10inch-lvds.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-panel-cap-touch-7inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso

-- 
2.54.0


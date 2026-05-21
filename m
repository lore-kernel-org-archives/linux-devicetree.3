Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FFA1EB9F2
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779375662; cv=none; b=hRv82J7FN7FoL29J7Fbn0wkcBhpMreXyAO4cXP19L6lxFbErKZZbrivU9B4dP9kh/L7wtTcCU7j9ABIbHFdYDKkn9xee/QfmpyPgupmz9Lzl1CZ2ZvyIHcdGFuMwb5w15cUUYcw/JUD3fDDIucvLg41DmwLxYHVZtt9I6jbzV0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779375662; c=relaxed/simple;
	bh=xKBmXH1GQfyNN14UMIt9QKe06GzSEoeNc+icEo0Fn1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cccgcxzbpV6tOkbk8zgaSA/uZFx60Ay9Sz1LARMvfAWRDLLpuFC3bSBRthZWuP+vto0UlV65D1XckjrR8mk2erSbzroQdQp7VGLN0nxCA3vk/OaRw0IfekmZcj5OkIl7x5f6BmpA7QXvPojFYNhSKx5O7u4jyH22hWfNlq/kxlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uk9TPZzk; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uk9TPZzk"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48d146705b4so69123445e9.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375660; x=1779980460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OH7BCjjdxq2DLB6fo/wyUar0j55aA2dc57uz4YwkDi4=;
        b=Uk9TPZzkncUV8xACp4fLYXKKvem23QH2Tp7j8uc8zeKEEk2njX3nsmmItoweAYfXGO
         nD8LVER/NuFqyA/NWYljJE9frJqhaLfEn8cr8u1tQ5LcADCcbpVZcfDTZiyi4mKWqnZb
         ZDB6Si1kVn5YeZwe0X6XnLaHbnt2kP4pcZdHV7qisSW4eZHo3rKoyl9wkPCbp+NmK6yT
         57NDCXrNZSNYKwU7getb9I/WV5bC6Tdk4WO5sl8i1BLn2oMWF3MV+WjnRq2eD2pO/+PM
         HVh75C0TlQTsj/GObTWiJ/S7QN7IOv3StI/zA74hCcmyfkAW5F+Ei6ou70vgOsY2CQJa
         Dr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375660; x=1779980460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OH7BCjjdxq2DLB6fo/wyUar0j55aA2dc57uz4YwkDi4=;
        b=kWvU9xFW/SOw+eO7HIC2uhRXH+tEtGcy3HEORsz8stABBReKzfL3ip8SWBigYHIkc0
         TnwihtQ9T2n7gjmqT91X3P+fyeEzIuDWGM1t41tcYamWp56Q7WAF0eHGHUegV62ztPlz
         IHb0YAS+1EHuzBPKb5azwwyn0emBcNsbEbBXnN1gZkSaAb355b4tdLeI86ZBsHnetr61
         zitxvJp+FfHBO7AOC4cNNxunhUrQXKK6IjaqESPUfu21ZzeGByWSGlL6B5MlDHlZHefv
         5+EUXfB0aWumeGGUWogPSxupDPXCwbS+BSbmth4qpXlUrSfzvfXt4Xo5KCXVlIwEQyOp
         g/PQ==
X-Forwarded-Encrypted: i=1; AFNElJ8H08njRooZt1V7vF5spB3fnFKXoVwLsXgio+NB62v9holz2a+JYvLcYNh+rveAlc6GCFZIIaGEcHv5@vger.kernel.org
X-Gm-Message-State: AOJu0YxbjtLwLdmvDsYK/MqB4OxCNcqdgFPHZWOZwLQWu5jm8xfEYIO9
	9HTh3QADn4h/Ez52ylruRWilrEX88vcF1tm1APRN5J50D/Vszi5K2nPx
X-Gm-Gg: Acq92OEi/lAPz3OXhAm8TzFxF2iLovgomPhb8FwZvjS+B9XA1CYf+7GS9Vc/N3BIfMI
	DAugIGjQCFaGn+AtaZCj2FMc4cOhEGiFTOnxvKnQl4tID3ESlDFcWECXUlrguQI/E39TVF4GpsX
	1yYgj9yas2KCLoCxSHJIzjMVBfnMOxJpxH4r4qtPhLwVA0+H1ja1igjcqlIQgPk8seV+X0o2MRe
	HP/FksQHOCjKYYkguEOapQMLck4jDynMWh4mnhEsl7xRpxy8RrLA39NIYbqATkDqLkSb+sp6K5v
	OJm/hxpyeuMEL8PkTnkxhWbIMiigc0jCyJBPtLQff2h3+Y12/xkwqNDSCzIfp0mUrHfZdeNxSKL
	kwGDbkixVqWEbYOfIgsxRncNQmsWIN0vBQfcNtrre8DRcWoWuf65uiEVbswJJiq4YsncUF3+iYD
	QobbP7Gw8vjDZkmj1pbA+bwwqWtS897/8gjiCNqWd4hQ==
X-Received: by 2002:a05:600c:32af:b0:488:9ed3:1492 with SMTP id 5b1f17b1804b1-4903605e3damr32117115e9.10.1779375659006;
        Thu, 21 May 2026 08:00:59 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:00:58 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 00/15] arm64: dts: ti: k3-am62-verdin: Add display and peripheral overlays
Date: Thu, 21 May 2026 16:00:36 +0100
Message-ID: <20260521150038.103538-17-ivitro@gmail.com>
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
- native OLDI (LVDS) with Toradex Capacitive Touch Display 10.1" LVDS and
  LG LP156WF1 15.6" FHD dual-channel panels
- DSI-to-LVDS adapter based on the SN65DSI84 with Toradex Capacitive Touch
  Display 10.1" LVDS
- DSI driving Toradex Capacitive Touch Display 7" and 10.1" DSI.

The Riverdi vendor prefix and panel bindings required by the DSI overlay
patches are also added, along with an extension to the panel-lvds binding
to support lvds-dual-ports for dual-channel LVDS.

Non-display additions include OV5640 CSI camera support in 24 MHz and
27 MHz oscillator variants, NAU8822 Bridge Tied Load mode on the
Development Board, MCU_MCAN1 on the Mezzanine board low-speed header,
and MCU_UART0 reservation for the Cortex-M4F debug UART.

TI maintainers: patches adding the Riverdi vendor prefix, panel-lvds
bindings, and dual-channel LVDS support are required by the DTS patches.
Are you fine picking up the full series once those patches are acked by
the DT/display maintainers?

Vitor Soares (15):
  dt-bindings: display: panel: Move Logic Technologies LT170410-2WHC to
    LVDS
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
  dt-bindings: display: panel-lvds: Add dual-channel LVDS support
  dt-bindings: display: panel-lvds: Add LG LP156WF1
  arm64: dts: ti: k3-am62-verdin: Add Mezzanine with LG LP156WF1 LVDS
    panel

 .../bindings/display/panel/panel-lvds.yaml    |  21 ++-
 .../bindings/display/panel/panel-simple.yaml  |   2 -
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/ti/Makefile               |  54 +++++++
 .../ti/k3-am625-verdin-dev-mezzanine-can.dtso |  28 ++++
 ...verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso | 129 +++++++++++++++++
 ...mezzanine-panel-cap-touch-10inch-lvds.dtso | 109 ++++++++++++++
 .../ti/k3-am625-verdin-dev-nau8822-btl.dtso   |  14 ++
 ...in-dsi-to-lvds-panel-cap-touch-10inch.dtso | 135 ++++++++++++++++++
 .../dts/ti/k3-am625-verdin-ov5640-24mhz.dtso  |  17 +++
 .../boot/dts/ti/k3-am625-verdin-ov5640.dtsi   |  71 +++++++++
 .../boot/dts/ti/k3-am625-verdin-ov5640.dtso   |  18 +++
 ...625-verdin-panel-cap-touch-10inch-dsi.dtso | 132 +++++++++++++++++
 ...25-verdin-panel-cap-touch-10inch-lvds.dtso | 131 +++++++++++++++++
 ...m625-verdin-panel-cap-touch-7inch-dsi.dtso | 132 +++++++++++++++++
 .../dts/ti/k3-am625-verdin-uart4-mcu.dtso     |  13 ++
 16 files changed, 1005 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-can.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-lvds-lg-lp156wf1.dtso
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

